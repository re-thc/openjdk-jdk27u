00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f853a1d0000                   jne        0x7fc00be68558
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00049 44891c24                       mov        dword ptr [rsp], r11d
0004d 413beb                         cmp        ebp, r11d
00050 0f83c3180000                   jae        0x7fc00be68119
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84d5180000                   je         0x7fc00be68138
00063 448bc2                         mov        r8d, edx
00066 442b442408                     sub        r8d, dword ptr [rsp + 8]
0006b 8b3c24                         mov        edi, dword ptr [rsp]
0006e 83c7f9                         add        edi, -7
00071 448d6af8                       lea        r13d, [rdx - 8]
00075 468d1cc500000000               lea        r11d, [r8*8]
0007d f3440fbdc9                     lzcnt      r9d, ecx
00082 be1f000000                     mov        esi, 0x1f
00087 412bf1                         sub        esi, r9d
0008a b908000000                     mov        ecx, 8
0008f 2bce                           sub        ecx, esi
00091 418bd3                         mov        edx, r11d
00094 2bd1                           sub        edx, ecx
00096 4183f808                       cmp        r8d, 8
0009a 0f8cfc160000                   jl         0x7fc00be67f9c
000a0 85ff                           test       edi, edi
000a2 0f8c3c1a0000                   jl         0x7fc00be682e4
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f8331190000                   jae        0x7fc00be681e8
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8c70170000                   jl         0x7fc00be68051
000e1 85ff                           test       edi, edi
000e3 0f8c471a0000                   jl         0x7fc00be68330
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f8330190000                   jae        0x7fc00be68228
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00111 4585db                         test       r11d, r11d
00114 0f8432180000                   je         0x7fc00be6814c
0011a 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
0011e 458b4104                       mov        r8d, dword ptr [r9 + 4]
00122 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00125 85db                           test       ebx, ebx
00127 0f8433180000                   je         0x7fc00be68160
0012d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00132 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
0013a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0013f 4889442428                     mov        qword ptr [rsp + 0x28], rax
00144 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
0014b 8974240c                       mov        dword ptr [rsp + 0xc], esi
0014f 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00153 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
00158 897c2404                       mov        dword ptr [rsp + 4], edi
0015c 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00164 45034304                       add        r8d, dword ptr [r11 + 4]
00168 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0016d 44034304                       add        r8d, dword ptr [rbx + 4]
00171 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00175 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0017a 4c8bd3                         mov        r10, rbx
0017d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00182 4d8bd3                         mov        r10, r11
00185 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0018a 4d8bd1                         mov        r10, r9
0018d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00192 4585c0                         test       r8d, r8d
00195 0f84bf080000                   je         0x7fc00be6725a
0019b be40000000                     mov        esi, 0x40
001a0 2bf1                           sub        esi, ecx
001a2 443bc6                         cmp        r8d, esi
001a5 0f8f1a020000                   jg         0x7fc00be66bc5
001ab 412bf0                         sub        esi, r8d
001ae c4e2cbf7e8                     shrx       rbp, rax, rsi
001b3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b8 4183f840                       cmp        r8d, 0x40
001bc 0f8d761a0000                   jge        0x7fc00be68438
001c2 41ba01000000                   mov        r10d, 1
001c8 c4c2b9f7ea                     shlx       rbp, r10, r8
001cd 48ffcd                         dec        rbp
001d0 48236c2460                     and        rbp, qword ptr [rsp + 0x60]
001d5 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001da 458bd0                         mov        r10d, r8d
001dd 458bca                         mov        r9d, r10d
001e0 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e5 458d4108                       lea        r8d, [r9 + 8]
001e9 4183f840                       cmp        r8d, 0x40
001ed 7c34                           jl         0x7fc00be66a23
001ef 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f4 4183c1c8                       add        r9d, -0x38
001f8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fd 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00205 8b542408                       mov        edx, dword ptr [rsp + 8]
00209 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020d 6690                           nop        
0020f e84c4ea9ff                     call       0x7fc00b8fb860
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7fc00be66a54
00223 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00228 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00230 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00235 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0023a 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00242 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0024a 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00254 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00259 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0025d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00262 4183fb20                       cmp        r11d, 0x20
00266 0f8d14190000                   jge        0x7fc00be68380
0026c c462a3f7542460                 shrx       r10, qword ptr [rsp + 0x60], r11
00273 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00278 41bb01000000                   mov        r11d, 1
0027e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00283 c44229f7d3                     shlx       r10d, r11d, r10d
00288 41ffca                         dec        r10d
0028b 4d63d2                         movsxd     r10, r10d
0028e 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00293 458bd2                         mov        r10d, r10d
00296 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0029b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002a0 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002a4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
002a9 4183fb20                       cmp        r11d, 0x20
002ad 0f8d11190000                   jge        0x7fc00be683c4
002b3 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002bb 458b5204                       mov        r10d, dword ptr [r10 + 4]
002bf 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002c7 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002cc 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002d0 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002d9 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002dd 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002e1 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002e6 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
002ea 458b4104                       mov        r8d, dword ptr [r9 + 4]
002ee 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
002f3 4585c9                         test       r9d, r9d
002f6 0f8e15160000                   jle        0x7fc00be68111
002fc 41ffca                         dec        r10d
002ff 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00304 41ffcb                         dec        r11d
00307 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0030c 41ffc8                         dec        r8d
0030f 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00314 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00319 c462a3f7542468                 shrx       r10, qword ptr [rsp + 0x68], r11
00320 41bb01000000                   mov        r11d, 1
00326 8b6c2460                       mov        ebp, dword ptr [rsp + 0x60]
0032a c44251f7db                     shlx       r11d, r11d, ebp
0032f 458bc2                         mov        r8d, r10d
00332 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00337 41ffcb                         dec        r11d
0033a 4d63d3                         movsxd     r10, r11d
0033d 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00342 458bd2                         mov        r10d, r10d
00345 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0034a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00352 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00359 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00361 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00368 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00370 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00374 4585db                         test       r11d, r11d
00377 0f86f7150000                   jbe        0x7fc00be68174
0037d 4d63d3                         movsxd     r10, r11d
00380 4d63d9                         movsxd     r11, r9d
00383 49ffcb                         dec        r11
00386 4d3bda                         cmp        r11, r10
00389 0f83e5150000                   jae        0x7fc00be68174
0038f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00394 4585db                         test       r11d, r11d
00397 0f8cd3160000                   jl         0x7fc00be68270
0039d 8b2c24                         mov        ebp, dword ptr [rsp]
003a0 83c5f9                         add        ebp, -7
003a3 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003aa 4533db                         xor        r11d, r11d
003ad 4533d2                         xor        r10d, r10d
003b0 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b8 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003c0 e977020000                     jmp        0x7fc00be66e3c
003c5 418be8                         mov        ebp, r8d
003c8 2bee                           sub        ebp, esi
003ca 90                             nop        
003cb e8904ca9ff                     call       0x7fc00b8fb860
003d0 0f1f8400c8040001               nop        dword ptr [rax + rax + 0x10004c8]
003d8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003dd 41bb40000000                   mov        r11d, 0x40
003e3 442bdd                         sub        r11d, ebp
003e6 c462d1f7c0                     shlx       r8, rax, rbp
003eb c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003f5 4d0bc2                         or         r8, r10
003f8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003fd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00402 e9d6fdffff                     jmp        0x7fc00be669dd
00407 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0040f 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00414 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00419 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00421 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00426 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0042a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042e 6690                           nop        
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8dec090000                   jge        0x7fc00be6762c
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bda                         mov        r11d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d990a0000                   jge        0x7fc00be6770c
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bda                         mov        ebx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d700b0000                   jge        0x7fc00be6780c
0049c c4e2d3f7cf                     shrx       rcx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d4b0c0000                   jge        0x7fc00be67910
004c5 41b801000000                   mov        r8d, 1
004cb c442d1f7c0                     shlx       r8, r8, rbp
004d0 49ffc8                         dec        r8
004d3 4c23c1                         and        r8, rcx
004d6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004de 418bc9                         mov        ecx, r9d
004e1 4103ca                         add        ecx, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d3                         add        r10d, ebx
004ef 4c63c9                         movsxd     r9, ecx
004f2 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
004fa 8bdb                           mov        ebx, ebx
004fc 4c03c3                         add        r8, rbx
004ff 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
00507 4903d9                         add        rbx, r9
0050a 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
00512 4d85c0                         test       r8, r8
00515 0f8e19070000                   jle        0x7fc00be67434
0051b 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00522 0f8fd80c0000                   jg         0x7fc00be67a00
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fc30d0000                   jg         0x7fc00be67af8
00535 81f9ffff0300                   cmp        ecx, 0x3ffff
0053b 0f8f8b0e0000                   jg         0x7fc00be67bcc
00541 418bf8                         mov        edi, r8d
00544 81ff00000010                   cmp        edi, 0x10000000
0054a 0f83500f0000                   jae        0x7fc00be67ca0
00550 4d63d2                         movsxd     r10, r10d
00553 4c63c7                         movsxd     r8, edi
00556 49c1e112                       shl        r9, 0x12
0055a 49c1e024                       shl        r8, 0x24
0055e 4d0bc1                         or         r8, r9
00561 4d0bc2                         or         r8, r10
00564 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0056c 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00574 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
00579 8b2c24                         mov        ebp, dword ptr [rsp]
0057c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00580 0f8da5000000                   jge        0x7fc00be66e2b
00586 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0058e 49c1e830                       shr        r8, 0x30
00592 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00597 49c1ea30                       shr        r10, 0x30
0059b 418bc8                         mov        ecx, r8d
0059e 418bda                         mov        ebx, r10d
005a1 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005a9 c4422bf7cb                     shrx       r9d, r11d, r10d
005ae 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005b6 c4422bf7d3                     shrx       r10d, r11d, r10d
005bb 4103da                         add        ebx, r10d
005be 895c2460                       mov        dword ptr [rsp + 0x60], ebx
005c2 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005ca 4183fa20                       cmp        r10d, 0x20
005ce 0f8dc80f0000                   jge        0x7fc00be67d9c
005d4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005dc 49c1ea30                       shr        r10, 0x30
005e0 458bc2                         mov        r8d, r10d
005e3 bb01000000                     mov        ebx, 1
005e8 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005f0 c4e229f7db                     shlx       ebx, ebx, r10d
005f5 ffcb                           dec        ebx
005f7 4123d9                         and        ebx, r9d
005fa 03d9                           add        ebx, ecx
005fc 895c2448                       mov        dword ptr [rsp + 0x48], ebx
00600 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
00608 4183f920                       cmp        r9d, 0x20
0060c 0f8d1a100000                   jge        0x7fc00be67e2c
00612 41ba01000000                   mov        r10d, 1
00618 c44231f7d2                     shlx       r10d, r10d, r9d
0061d 41ffca                         dec        r10d
00620 4523d3                         and        r10d, r11d
00623 4503d0                         add        r10d, r8d
00626 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0062b 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0062f 0f8dac030000                   jge        0x7fc00be671e1
00635 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
0063c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00641 44235c2460                     and        r11d, dword ptr [rsp + 0x60]
00646 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0064b 458b5014                       mov        r10d, dword ptr [r8 + 0x14]
0064f 458b4204                       mov        r8d, dword ptr [r10 + 4]
00653 453bd8                         cmp        r11d, r8d
00656 0f830e040000                   jae        0x7fc00be6726a
0065c 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00661 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00666 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0066b 418b5914                       mov        ebx, dword ptr [r9 + 0x14]
0066f 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00672 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00677 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0067c 443bc1                         cmp        r8d, ecx
0067f 0f836f040000                   jae        0x7fc00be672f4
00685 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0068a 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
0068f 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00694 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
00698 458b5104                       mov        r10d, dword ptr [r9 + 4]
0069c 4e8b44c308                     mov        r8, qword ptr [rbx + r8*8 + 8]
006a1 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
006a9 453bda                         cmp        r11d, r10d
006ac 0f83da040000                   jae        0x7fc00be6738c
006b2 4f8b54d908                     mov        r10, qword ptr [r9 + r11*8 + 8]
006b7 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006bf 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006c6 ffc5                           inc        ebp
006c8 892c24                         mov        dword ptr [rsp], ebp
006cb 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006cf 0f8ddd020000                   jge        0x7fc00be671b2
006d5 49c1ea28                       shr        r10, 0x28
006d9 458bd2                         mov        r10d, r10d
006dc 450fb6da                       movzx      r11d, r10b
006e0 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006e8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006ed 49c1ea28                       shr        r10, 0x28
006f1 458bda                         mov        r11d, r10d
006f4 410fb6eb                       movzx      ebp, r11b
006f8 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006ff 4d8bd0                         mov        r10, r8
00702 49c1ea28                       shr        r10, 0x28
00706 458bda                         mov        r11d, r10d
00709 450fb6db                       movzx      r11d, r11b
0070d 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00715 4103eb                         add        ebp, r11d
00718 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0071f 41bb01000000                   mov        r11d, 1
00725 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0072d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00735 49c1ea20                       shr        r10, 0x20
00739 458bd2                         mov        r10d, r10d
0073c 410fb6ea                       movzx      ebp, r10b
00740 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00747 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0074c 49c1ea20                       shr        r10, 0x20
00750 458bda                         mov        r11d, r10d
00753 410fb6eb                       movzx      ebp, r11b
00757 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0075e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00766 49c1ea20                       shr        r10, 0x20
0076a 458bd2                         mov        r10d, r10d
0076d 410fb6ea                       movzx      ebp, r10b
00771 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00778 448bcd                         mov        r9d, ebp
0077b 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
00783 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
0078b 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
00793 4585c9                         test       r9d, r9d
00796 0f848c050000                   je         0x7fc00be67528
0079c 4183f93f                       cmp        r9d, 0x3f
007a0 0f8f5e060000                   jg         0x7fc00be67604
007a6 41b840000000                   mov        r8d, 0x40
007ac 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007b1 453bc8                         cmp        r9d, r8d
007b4 7e48                           jle        0x7fc00be66ffe
007b6 418bd9                         mov        ebx, r9d
007b9 412bd8                         sub        ebx, r8d
007bc 4183f840                       cmp        r8d, 0x40
007c0 0f8dea0e0000                   jge        0x7fc00be67eb0
007c6 41ba01000000                   mov        r10d, 1
007cc c442b9f7d2                     shlx       r10, r10, r8
007d1 49ffca                         dec        r10
007d4 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007dc c4c2e1f7ea                     shlx       rbp, r10, rbx
007e1 41bb40000000                   mov        r11d, 0x40
007e7 442bdb                         sub        r11d, ebx
007ea c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007f1 490bea                         or         rbp, r10
007f4 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007fc eb26                           jmp        0x7fc00be67024
007fe 41ba01000000                   mov        r10d, 1
00804 c442b1f7d2                     shlx       r10, r10, r9
00809 452bc1                         sub        r8d, r9d
0080c c4e2bbf7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], r8
00816 49ffca                         dec        r10
00819 4923ea                         and        rbp, r10
0081c 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00824 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00829 4503d1                         add        r10d, r9d
0082c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00831 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00836 4503d9                         add        r11d, r9d
00839 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0083e 4183fa40                       cmp        r10d, 0x40
00842 0f8ce8fbffff                   jl         0x7fc00be66c30
00848 4183c2c0                       add        r10d, -0x40
0084c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00851 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00855 83c5f8                         add        ebp, -8
00858 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085c 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00860 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00864 83c1f0                         add        ecx, -0x10
00867 83f908                         cmp        ecx, 8
0086a 0f8cf4000000                   jl         0x7fc00be67164
00870 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00875 4183c0e8                       add        r8d, -0x18
00879 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00881 0f8280fbffff                   jb         0x7fc00be66c07
00887 bee4ffffff                     mov        esi, 0xffffffe4
0088c 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00894 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00899 44891c24                       mov        dword ptr [rsp], r11d
0089d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a2 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a7 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ac 44895c2408                     mov        dword ptr [rsp + 8], r11d
008b1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008bb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008c0 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008c5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008ca 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008cf 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008d4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008d9 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008de 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008e3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008e8 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008ed 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008f2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008f7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fc 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00901 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00906 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0090b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00910 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00915 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0091a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0091f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00924 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00929 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0092e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00933 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0093b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00940 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00948 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0094d 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00955 6690                           nop        
00957 e804c5b5ff                     call       0x7fc00b9c3660
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 85c9                           test       ecx, ecx
00966 7f08                           jg         0x7fc00be67170
00968 4533d2                         xor        r10d, r10d
0096b e9a4faffff                     jmp        0x7fc00be66c14
00970 8be9                           mov        ebp, ecx
00972 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0097a 8b542408                       mov        edx, dword ptr [rsp + 8]
0097e 90                             nop        
0097f e8dc46a9ff                     call       0x7fc00b8fb860
00984 0f1f84007c0a0003               nop        dword ptr [rax + rax + 0x3000a7c]
0098c 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00991 41c1e303                       shl        r11d, 3
00995 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0099a 41c1e203                       shl        r10d, 3
0099e 452bda                         sub        r11d, r10d
009a1 4181c3c0000000                 add        r11d, 0xc0
009a8 c462a1f7d0                     shlx       r10, rax, r11
009ad e962faffff                     jmp        0x7fc00be66c14
009b2 4533d2                         xor        r10d, r10d
009b5 33ed                           xor        ebp, ebp
009b7 4533c0                         xor        r8d, r8d
009ba 4533db                         xor        r11d, r11d
009bd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009c5 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009cc 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
009d4 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
009dc e94cfdffff                     jmp        0x7fc00be66f2d
009e1 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009e9 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f1 4d03c2                         add        r8, r10
009f4 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009fc 4d3bc2                         cmp        r8, r10
009ff 7e30                           jle        0x7fc00be67231
00a01 48bed85429e300000000           movabs     rsi, 0xe32954d8
00a0b e85046a9ff                     call       0x7fc00b8fb860
00a10 0f1f8400080b0004               nop        dword ptr [rax + rax + 0x4000b08]
00a18 4885c0                         test       rax, rax
00a1b 0f84ef110000                   je         0x7fc00be68410
00a21 488bf0                         mov        rsi, rax
00a24 4881c410010000                 add        rsp, 0x110
00a2b 5d                             pop        rbp
00a2c e92f43b6ff                     jmp        0x7fc00b9cb560
00a31 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a36 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a3e 0f85e0110000                   jne        0x7fc00be68424
00a44 418bc0                         mov        eax, r8d
00a47 4881c410010000                 add        rsp, 0x110
00a4e 5d                             pop        rbp
00a4f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a53 0f87e9120000                   ja         0x7fc00be68542
00a59 c3                             ret        
00a5a 4533d2                         xor        r10d, r10d
00a5d 4533db                         xor        r11d, r11d
00a60 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a65 e973f7ffff                     jmp        0x7fc00be669dd
00a6a bee4ffffff                     mov        esi, 0xffffffe4
00a6f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a77 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a7c 44890c24                       mov        dword ptr [rsp], r9d
00a80 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a85 4489442404                     mov        dword ptr [rsp + 4], r8d
00a8a 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00a8f 44894c2408                     mov        dword ptr [rsp + 8], r9d
00a94 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00a99 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00a9e 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00aa3 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00aa8 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00aad 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ab2 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ab7 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00abc 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ac1 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ac6 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00acb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ad0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ad5 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00ada 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00adf 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00ae4 666690                         nop        
00ae7 e874c3b5ff                     call       0x7fc00b9c3660
00aec 0f1f8400e40b0005               nop        dword ptr [rax + rax + 0x5000be4]
00af4 bee4ffffff                     mov        esi, 0xffffffe4
00af9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b01 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b06 44891c24                       mov        dword ptr [rsp], r11d
00b0a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b0f 4489542404                     mov        dword ptr [rsp + 4], r10d
00b14 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b19 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b1e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b23 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b28 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b2d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b32 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b37 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b3c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b41 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b46 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b4b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b50 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b55 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b5a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b5f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b64 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b69 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b6e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b73 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00b77 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b7c 666690                         nop        
00b7f e8dcc2b5ff                     call       0x7fc00b9c3660
00b84 0f1f84007c0c0006               nop        dword ptr [rax + rax + 0x6000c7c]
00b8c bee4ffffff                     mov        esi, 0xffffffe4
00b91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b99 448b442408                     mov        r8d, dword ptr [rsp + 8]
00b9e 44890424                       mov        dword ptr [rsp], r8d
00ba2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ba7 4489542404                     mov        dword ptr [rsp + 4], r10d
00bac 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00bb1 4489442408                     mov        dword ptr [rsp + 8], r8d
00bb6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bbb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bc0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00bc5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00bca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bcf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00bd4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00bd9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00bde 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00be3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00be8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00bed 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00bf2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00bf7 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00bfc 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c01 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c06 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c0b 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00c10 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c15 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c1a 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c1f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c24 666690                         nop        
00c27 e834c2b5ff                     call       0x7fc00b9c3660
00c2c 0f1f8400240d0007               nop        dword ptr [rax + rax + 0x7000d24]
00c34 4533c9                         xor        r9d, r9d
00c37 4d3bc1                         cmp        r8, r9
00c3a bdffffffff                     mov        ebp, 0xffffffff
00c3f 7c08                           jl         0x7fc00be67449
00c41 400f95c5                       setne      bpl
00c45 400fb6ed                       movzx      ebp, bpl
00c49 be45ffffff                     mov        esi, 0xffffff45
00c4e 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c56 4c890c24                       mov        qword ptr [rsp], r9
00c5a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c5f 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c64 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c6c 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c71 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00c75 895c2414                       mov        dword ptr [rsp + 0x14], ebx
00c79 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c7e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c83 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
00c87 895c2430                       mov        dword ptr [rsp + 0x30], ebx
00c8b 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c90 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c95 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00c99 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00c9d 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00ca2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00ca7 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00cab 895c2440                       mov        dword ptr [rsp + 0x40], ebx
00caf 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cb7 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cbc 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00cc0 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00cc4 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00cc9 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cce 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
00cd2 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00cd6 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00cdb 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00ce0 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00ce8 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00ced 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00cf5 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00cfa 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d02 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d09 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d11 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d19 6690                           nop        
00d1b e840c1b5ff                     call       0x7fc00b9c3660
00d20 0f1f8400180e0008               nop        dword ptr [rax + rax + 0x8000e18]
00d28 be45ffffff                     mov        esi, 0xffffff45
00d2d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d35 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d3a 44891424                       mov        dword ptr [rsp], r10d
00d3e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d43 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d48 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d4d 4489542408                     mov        dword ptr [rsp + 8], r10d
00d52 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d57 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d5c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d61 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d66 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d6b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00d70 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d75 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d7a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00d7f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00d84 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d89 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d8e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d93 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00d98 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00d9d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00da2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00da7 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00dac 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00db1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00db6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00dbb 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00dc0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00dc5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00dca 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dcf 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00dd4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ddc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00de1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00de9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00dee 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00df6 90                             nop        
00df7 e864c0b5ff                     call       0x7fc00b9c3660
00dfc 0f1f8400f40e0009               nop        dword ptr [rax + rax + 0x9000ef4]
00e04 be45ffffff                     mov        esi, 0xffffff45
00e09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e11 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e16 44891424                       mov        dword ptr [rsp], r10d
00e1a 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e1f e83cc0b5ff                     call       0x7fc00b9c3660
00e24 0f1f84001c0f000a               nop        dword ptr [rax + rax + 0xa000f1c]
00e2c be45ffffff                     mov        esi, 0xffffff45
00e31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e39 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e3e 44891424                       mov        dword ptr [rsp], r10d
00e42 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00e47 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e4c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e51 4489542408                     mov        dword ptr [rsp + 8], r10d
00e56 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e5e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e6d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e72 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e77 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e7c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e81 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e86 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e8b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e90 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e95 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e9a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e9f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ea4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ea9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00eae 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00eb3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00eb8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ebd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ec2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ec7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ecc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ed1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00ed6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00edb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ee0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ee5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00eed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ef2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00efa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eff e85cbfb5ff                     call       0x7fc00b9c3660
00f04 0f1f8400fc0f000b               nop        dword ptr [rax + rax + 0xb000ffc]
00f0c be45ffffff                     mov        esi, 0xffffff45
00f11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f19 448b442408                     mov        r8d, dword ptr [rsp + 8]
00f1e 44890424                       mov        dword ptr [rsp], r8d
00f22 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f27 4489542404                     mov        dword ptr [rsp + 4], r10d
00f2c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f31 4489442408                     mov        dword ptr [rsp + 8], r8d
00f36 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f3e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f48 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f4d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f52 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f57 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f5c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00f61 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f66 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f6b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00f70 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00f75 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f7a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f7f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f84 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f89 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f8e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f93 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00f98 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00f9d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00fa2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00fa7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fb1 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00fb6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00fbb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fc5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fcd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fd2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fda 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fdf 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
00fe7 4489442478                     mov        dword ptr [rsp + 0x78], r8d
00fec 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00ff4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00ffc 666690                         nop        
00fff e85cbeb5ff                     call       0x7fc00b9c3660
01004 0f1f8400fc10000c               nop        dword ptr [rax + rax + 0xc0010fc]
0100c be45ffffff                     mov        esi, 0xffffff45
01011 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01019 448b542408                     mov        r10d, dword ptr [rsp + 8]
0101e 44891424                       mov        dword ptr [rsp], r10d
01022 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01027 4489442404                     mov        dword ptr [rsp + 4], r8d
0102c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01031 4489542408                     mov        dword ptr [rsp + 8], r10d
01036 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0103e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01043 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01048 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0104d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01052 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01057 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0105c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01061 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01066 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0106b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01070 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01075 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0107a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0107f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01084 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01089 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0108e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01093 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01098 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0109d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
010a2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
010a7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
010ac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
010b1 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
010b6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
010bb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010c0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010c5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010cd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010d2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010da 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010df 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
010e7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
010ec 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
010f4 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
010fb 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01103 e858bdb5ff                     call       0x7fc00b9c3660
01108 0f1f84000012000d               nop        dword ptr [rax + rax + 0xd001200]
01110 be45ffffff                     mov        esi, 0xffffff45
01115 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0111d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01122 44890c24                       mov        dword ptr [rsp], r9d
01126 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0112b 4489442404                     mov        dword ptr [rsp + 4], r8d
01130 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01135 44894c2408                     mov        dword ptr [rsp + 8], r9d
0113a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0113f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01144 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01149 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0114e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01153 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01158 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0115d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01162 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01167 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0116c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01171 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01176 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0117b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01180 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01185 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0118a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0118f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01194 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01199 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0119e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
011a3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
011a8 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
011ad 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
011b2 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
011b7 4c89442458                     mov        qword ptr [rsp + 0x58], r8
011bc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
011c4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
011c9 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
011d1 4c89442468                     mov        qword ptr [rsp + 0x68], r8
011d6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011db 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
011e2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011ea 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
011f2 90                             nop        
011f3 e868bcb5ff                     call       0x7fc00b9c3660
011f8 0f1f8400f012000e               nop        dword ptr [rax + rax + 0xe0012f0]
01200 41b9ffffff7f                   mov        r9d, 0x7fffffff
01206 4d3bc1                         cmp        r8, r9
01209 bdffffffff                     mov        ebp, 0xffffffff
0120e 7c08                           jl         0x7fc00be67a18
01210 400f95c5                       setne      bpl
01214 400fb6ed                       movzx      ebp, bpl
01218 be45ffffff                     mov        esi, 0xffffff45
0121d 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01225 4c890c24                       mov        qword ptr [rsp], r9
01229 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
0122d 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01231 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01239 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0123e 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01243 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01248 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
0124c 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01250 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01255 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0125a 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
0125e 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01262 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01267 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0126c 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
01270 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01274 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01279 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0127e 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01285 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01289 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0128e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01293 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01297 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0129b 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
012a0 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
012a5 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
012aa 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
012af 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
012b7 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
012bc 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
012c4 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
012c9 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
012d1 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
012d8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012e0 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
012e8 666690                         nop        
012eb e870bbb5ff                     call       0x7fc00b9c3660
012f0 0f1f8400e813000f               nop        dword ptr [rax + rax + 0xf0013e8]
012f8 be45ffffff                     mov        esi, 0xffffff45
012fd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01305 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0130a 44890c24                       mov        dword ptr [rsp], r9d
0130e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01313 44894c2404                     mov        dword ptr [rsp + 4], r9d
01318 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0131d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01322 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01327 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0132c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01331 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01336 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0133b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01340 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01345 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0134a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0134f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01354 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01359 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0135e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01363 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01368 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0136d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01372 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01377 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0137c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01381 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01386 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0138b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01390 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01395 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0139a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0139f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
013a4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
013ac 4c89442460                     mov        qword ptr [rsp + 0x60], r8
013b1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
013b6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013be 90                             nop        
013bf e89cbab5ff                     call       0x7fc00b9c3660
013c4 0f1f8400bc140010               nop        dword ptr [rax + rax + 0x100014bc]
013cc be45ffffff                     mov        esi, 0xffffff45
013d1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013d9 448b542408                     mov        r10d, dword ptr [rsp + 8]
013de 44891424                       mov        dword ptr [rsp], r10d
013e2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013e7 4489542404                     mov        dword ptr [rsp + 4], r10d
013ec 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013f1 4489542408                     mov        dword ptr [rsp + 8], r10d
013f6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013fb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01400 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01405 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0140a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0140f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01414 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01419 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0141e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01423 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01428 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0142d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01432 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01437 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0143c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01441 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01446 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0144b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01450 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01455 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0145a 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0145f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01464 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01469 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0146e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01473 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01478 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01480 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01485 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0148a 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01491 6690                           nop        
01493 e8c8b9b5ff                     call       0x7fc00b9c3660
01498 0f1f840090150011               nop        dword ptr [rax + rax + 0x11001590]
014a0 be3dffffff                     mov        esi, 0xffffff3d
014a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014ad 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
014b2 44890c24                       mov        dword ptr [rsp], r9d
014b6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
014bb 4489442404                     mov        dword ptr [rsp + 4], r8d
014c0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
014c5 44894c2408                     mov        dword ptr [rsp + 8], r9d
014ca 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014cf 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014d4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014d9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014de 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014e3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014e8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
014ed 4489442424                     mov        dword ptr [rsp + 0x24], r8d
014f2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
014f7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
014fc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01501 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01506 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0150b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01510 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01515 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0151a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0151f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01524 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0152c 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01531 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01536 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0153b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01540 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01545 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0154a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0154f 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01554 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01559 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01561 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01566 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0156e 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01573 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01578 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01580 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01587 89bc2494000000                 mov        dword ptr [rsp + 0x94], edi
0158e 90                             nop        
0158f e8ccb8b5ff                     call       0x7fc00b9c3660
01594 0f1f84008c160012               nop        dword ptr [rax + rax + 0x1200168c]
0159c be45ffffff                     mov        esi, 0xffffff45
015a1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015a9 448b442408                     mov        r8d, dword ptr [rsp + 8]
015ae 44890424                       mov        dword ptr [rsp], r8d
015b2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
015b7 4489442404                     mov        dword ptr [rsp + 4], r8d
015bc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015c1 4489542408                     mov        dword ptr [rsp + 8], r10d
015c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015d0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015d5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015da 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015df 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015e4 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
015e9 4489442424                     mov        dword ptr [rsp + 0x24], r8d
015ee 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
015f3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
015f8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015fd 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01602 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01606 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0160b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01610 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01615 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01619 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0161e 90                             nop        
0161f e83cb8b5ff                     call       0x7fc00b9c3660
01624 0f1f84001c170013               nop        dword ptr [rax + rax + 0x1300171c]
0162c be45ffffff                     mov        esi, 0xffffff45
01631 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01639 448b542408                     mov        r10d, dword ptr [rsp + 8]
0163e 44891424                       mov        dword ptr [rsp], r10d
01642 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01647 4489542404                     mov        dword ptr [rsp + 4], r10d
0164c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01651 44894c2408                     mov        dword ptr [rsp + 8], r9d
01656 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0165b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01660 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01665 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0166a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0166f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01674 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01679 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0167e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01683 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01688 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0168d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01692 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01696 4489442454                     mov        dword ptr [rsp + 0x54], r8d
0169b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016a0 666690                         nop        
016a3 e8b8b7b5ff                     call       0x7fc00b9c3660
016a8 0f1f8400a0170014               nop        dword ptr [rax + rax + 0x140017a0]
016b0 be45ffffff                     mov        esi, 0xffffff45
016b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016bd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016c2 44891c24                       mov        dword ptr [rsp], r11d
016c6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016cb 4489542404                     mov        dword ptr [rsp + 4], r10d
016d0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016d5 44895c2408                     mov        dword ptr [rsp + 8], r11d
016da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016e9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016ee 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016f3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016f8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
016fd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01702 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01707 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0170c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01711 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01716 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0171b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01720 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01725 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0172a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0172f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01734 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01739 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0173e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01743 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01748 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0174d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01752 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01757 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0175c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01764 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01769 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01771 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01776 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
0177e 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01785 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0178d 6690                           nop        
0178f e8ccb6b5ff                     call       0x7fc00b9c3660
01794 0f1f84008c180015               nop        dword ptr [rax + rax + 0x1500188c]
0179c 4585c0                         test       r8d, r8d
0179f 7f07                           jg         0x7fc00be67fa8
017a1 33c0                           xor        eax, eax
017a3 e91fe9ffff                     jmp        0x7fc00be668c7
017a8 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017ac 89742428                       mov        dword ptr [rsp + 0x28], esi
017b0 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
017b4 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017b9 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
017be 897c2410                       mov        dword ptr [rsp + 0x10], edi
017c2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017c7 48894424f8                     mov        qword ptr [rsp - 8], rax
017cc 8b0424                         mov        eax, dword ptr [rsp]
017cf 89442404                       mov        dword ptr [rsp + 4], eax
017d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d8 48894424f8                     mov        qword ptr [rsp - 8], rax
017dd 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017e4 890424                         mov        dword ptr [rsp], eax
017e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ec 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017f4 488bf5                         mov        rsi, rbp
017f7 8b542408                       mov        edx, dword ptr [rsp + 8]
017fb 418bc8                         mov        ecx, r8d
017fe 90                             nop        
017ff e85c38a9ff                     call       0x7fc00b8fb860
01804 0f1f8400fc180016               nop        dword ptr [rax + rax + 0x160018fc]
0180c 41ba40000000                   mov        r10d, 0x40
01812 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01817 c4e2a9f7c0                     shlx       rax, rax, r10
0181c 48894424f8                     mov        qword ptr [rsp - 8], rax
01821 8b442404                       mov        eax, dword ptr [rsp + 4]
01825 890424                         mov        dword ptr [rsp], eax
01828 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182d 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01832 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01836 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0183b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01840 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01844 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01848 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
0184c e976e8ffff                     jmp        0x7fc00be668c7
01851 4585c0                         test       r8d, r8d
01854 7f08                           jg         0x7fc00be6805e
01856 4533f6                         xor        r14d, r14d
01859 e9aae8ffff                     jmp        0x7fc00be66908
0185e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01863 4889442430                     mov        qword ptr [rsp + 0x30], rax
01868 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0186c 89742428                       mov        dword ptr [rsp + 0x28], esi
01870 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01874 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01879 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0187e 897c2410                       mov        dword ptr [rsp + 0x10], edi
01882 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01887 48894424f8                     mov        qword ptr [rsp - 8], rax
0188c 8b0424                         mov        eax, dword ptr [rsp]
0188f 89442404                       mov        dword ptr [rsp + 4], eax
01893 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01898 48894424f8                     mov        qword ptr [rsp - 8], rax
0189d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018a4 890424                         mov        dword ptr [rsp], eax
018a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ac 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018b4 488bf5                         mov        rsi, rbp
018b7 8b542408                       mov        edx, dword ptr [rsp + 8]
018bb 418bc8                         mov        ecx, r8d
018be 90                             nop        
018bf e89c37a9ff                     call       0x7fc00b8fb860
018c4 0f1f8400bc190017               nop        dword ptr [rax + rax + 0x170019bc]
018cc 41ba80000000                   mov        r10d, 0x80
018d2 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
018d7 c462a9f7f0                     shlx       r14, rax, r10
018dc 48894424f8                     mov        qword ptr [rsp - 8], rax
018e1 8b442404                       mov        eax, dword ptr [rsp + 4]
018e5 890424                         mov        dword ptr [rsp], eax
018e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ed 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
018f1 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
018f6 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
018fa 8b742428                       mov        esi, dword ptr [rsp + 0x28]
018fe 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01902 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01907 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0190c e9f7e7ffff                     jmp        0x7fc00be66908
01911 4533c0                         xor        r8d, r8d
01914 e9d0f0ffff                     jmp        0x7fc00be671e9
01919 bee4ffffff                     mov        esi, 0xffffffe4
0191e 48ffb42490000000               push       qword ptr [rsp + 0x90]
01926 488f0424                       pop        qword ptr [rsp]
0192a 90                             nop        
0192b e830b5b5ff                     call       0x7fc00b9c3660
01930 0f1f8400281a0018               nop        dword ptr [rax + rax + 0x18001a28]
01938 be5d000000                     mov        esi, 0x5d
0193d 6690                           nop        
0193f e81cb5b5ff                     call       0x7fc00b9c3660
01944 0f1f84003c1a0019               nop        dword ptr [rax + rax + 0x19001a3c]
0194c bef6ffffff                     mov        esi, 0xfffffff6
01951 6690                           nop        
01953 e808b5b5ff                     call       0x7fc00b9c3660
01958 0f1f8400501a001a               nop        dword ptr [rax + rax + 0x1a001a50]
01960 bef6ffffff                     mov        esi, 0xfffffff6
01965 6690                           nop        
01967 e8f4b4b5ff                     call       0x7fc00b9c3660
0196c 0f1f8400641a001b               nop        dword ptr [rax + rax + 0x1b001a64]
01974 be6effffff                     mov        esi, 0xffffff6e
01979 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01981 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01986 44891c24                       mov        dword ptr [rsp], r11d
0198a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0198f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01994 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01999 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0199e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
019a3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019a8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019ad 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019b2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
019b7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019bc 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
019c1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019c6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019cb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
019d0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019d5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
019da 90                             nop        
019db e880b4b5ff                     call       0x7fc00b9c3660
019e0 0f1f8400d81a001c               nop        dword ptr [rax + rax + 0x1c001ad8]
019e8 bee4ffffff                     mov        esi, 0xffffffe4
019ed 48ffb42490000000               push       qword ptr [rsp + 0x90]
019f5 488f0424                       pop        qword ptr [rsp]
019f9 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
019fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01a03 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a0a 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a13 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01a17 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a1b e840b4b5ff                     call       0x7fc00b9c3660
01a20 0f1f8400181b001d               nop        dword ptr [rax + rax + 0x1d001b18]
01a28 bee4ffffff                     mov        esi, 0xffffffe4
01a2d 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a35 488f0424                       pop        qword ptr [rsp]
01a39 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a45 89442418                       mov        dword ptr [rsp + 0x18], eax
01a49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4e 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01a52 89542428                       mov        dword ptr [rsp + 0x28], edx
01a56 4889442430                     mov        qword ptr [rsp + 0x30], rax
01a5b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a60 666690                         nop        
01a63 e8f8b3b5ff                     call       0x7fc00b9c3660
01a68 0f1f8400601b001e               nop        dword ptr [rax + rax + 0x1e001b60]
01a70 bebeffffff                     mov        esi, 0xffffffbe
01a75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a7d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a82 44891c24                       mov        dword ptr [rsp], r11d
01a86 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a8b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a90 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a95 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a9a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a9f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01aa4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01aa9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01aae 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ab3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ab8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01abd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ac2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ac7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01acc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ad1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ad6 90                             nop        
01ad7 e884b3b5ff                     call       0x7fc00b9c3660
01adc 0f1f8400d41b001f               nop        dword ptr [rax + rax + 0x1f001bd4]
01ae4 beccffffff                     mov        esi, 0xffffffcc
01ae9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01af1 448b542408                     mov        r10d, dword ptr [rsp + 8]
01af6 44891424                       mov        dword ptr [rsp], r10d
01afa 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01aff 48894424f8                     mov        qword ptr [rsp - 8], rax
01b04 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b0b 89442414                       mov        dword ptr [rsp + 0x14], eax
01b0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b14 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01b18 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b1c 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01b20 666690                         nop        
01b23 e838b3b5ff                     call       0x7fc00b9c3660
01b28 0f1f8400201c0020               nop        dword ptr [rax + rax + 0x20001c20]
01b30 beccffffff                     mov        esi, 0xffffffcc
01b35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b3d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b42 44890424                       mov        dword ptr [rsp], r8d
01b46 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b52 89442410                       mov        dword ptr [rsp + 0x10], eax
01b56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5b 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01b5f 89542418                       mov        dword ptr [rsp + 0x18], edx
01b63 4889442428                     mov        qword ptr [rsp + 0x28], rax
01b68 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b6d 897c2434                       mov        dword ptr [rsp + 0x34], edi
01b71 6690                           nop        
01b73 e8e8b2b5ff                     call       0x7fc00b9c3660
01b78 0f1f8400701c0021               nop        dword ptr [rax + rax + 0x21001c70]
01b80 be45ffffff                     mov        esi, 0xffffff45
01b85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b8d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b92 44891424                       mov        dword ptr [rsp], r10d
01b96 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b9b 4489542408                     mov        dword ptr [rsp + 8], r10d
01ba0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ba5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01baa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01baf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bb4 666690                         nop        
01bb7 e8a4b2b5ff                     call       0x7fc00b9c3660
01bbc 0f1f8400b41c0022               nop        dword ptr [rax + rax + 0x22001cb4]
01bc4 be45ffffff                     mov        esi, 0xffffff45
01bc9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bd1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01bd6 44891c24                       mov        dword ptr [rsp], r11d
01bda 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bdf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01be4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01be9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bf3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bf8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bfd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c02 90                             nop        
01c03 e858b2b5ff                     call       0x7fc00b9c3660
01c08 0f1f8400001d0023               nop        dword ptr [rax + rax + 0x23001d00]
01c10 bef6ffffff                     mov        esi, 0xfffffff6
01c15 6690                           nop        
01c17 e844b2b5ff                     call       0x7fc00b9c3660
01c1c 0f1f8400141d0024               nop        dword ptr [rax + rax + 0x24001d14]
01c24 be5d000000                     mov        esi, 0x5d
01c29 6690                           nop        
01c2b e830b2b5ff                     call       0x7fc00b9c3660
01c30 0f1f8400281d0025               nop        dword ptr [rax + rax + 0x25001d28]
01c38 be45ffffff                     mov        esi, 0xffffff45
01c3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c45 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c4a 44891c24                       mov        dword ptr [rsp], r11d
01c4e 90                             nop        
01c4f e80cb2b5ff                     call       0x7fc00b9c3660
01c54 0f1f84004c1d0026               nop        dword ptr [rax + rax + 0x26001d4c]
01c5c bef6ffffff                     mov        esi, 0xfffffff6
01c61 418beb                         mov        ebp, r11d
01c64 666690                         nop        
01c67 e8f4b1b5ff                     call       0x7fc00b9c3660
01c6c 0f1f8400641d0027               nop        dword ptr [rax + rax + 0x27001d64]
01c74 bef6ffffff                     mov        esi, 0xfffffff6
01c79 418be8                         mov        ebp, r8d
01c7c 666690                         nop        
01c7f e8dcb1b5ff                     call       0x7fc00b9c3660
01c84 0f1f84007c1d0028               nop        dword ptr [rax + rax + 0x28001d7c]
01c8c bef6ffffff                     mov        esi, 0xfffffff6
01c91 418beb                         mov        ebp, r11d
01c94 666690                         nop        
01c97 e8c4b1b5ff                     call       0x7fc00b9c3660
01c9c 0f1f8400941d0029               nop        dword ptr [rax + rax + 0x29001d94]
01ca4 bef6ffffff                     mov        esi, 0xfffffff6
01ca9 6690                           nop        
01cab e8b0b1b5ff                     call       0x7fc00b9c3660
01cb0 0f1f8400a81d002a               nop        dword ptr [rax + rax + 0x2a001da8]
01cb8 bef6ffffff                     mov        esi, 0xfffffff6
01cbd 6690                           nop        
01cbf e89cb1b5ff                     call       0x7fc00b9c3660
01cc4 0f1f8400bc1d002b               nop        dword ptr [rax + rax + 0x2b001dbc]
01ccc bef6ffffff                     mov        esi, 0xfffffff6
01cd1 6690                           nop        
01cd3 e888b1b5ff                     call       0x7fc00b9c3660
01cd8 0f1f8400d01d002c               nop        dword ptr [rax + rax + 0x2c001dd0]
01ce0 bef6ffffff                     mov        esi, 0xfffffff6
01ce5 6690                           nop        
01ce7 e874b1b5ff                     call       0x7fc00b9c3660
01cec 0f1f8400e41d002d               nop        dword ptr [rax + rax + 0x2d001de4]
01cf4 bef6ffffff                     mov        esi, 0xfffffff6
01cf9 6690                           nop        
01cfb e860b1b5ff                     call       0x7fc00b9c3660
01d00 0f1f8400f81d002e               nop        dword ptr [rax + rax + 0x2e001df8]
01d08 bef6ffffff                     mov        esi, 0xfffffff6
01d0d 6690                           nop        
01d0f e84cb1b5ff                     call       0x7fc00b9c3660
01d14 0f1f84000c1e002f               nop        dword ptr [rax + rax + 0x2f001e0c]
01d1c bef6ffffff                     mov        esi, 0xfffffff6
01d21 6690                           nop        
01d23 e838b1b5ff                     call       0x7fc00b9c3660
01d28 0f1f8400201e0030               nop        dword ptr [rax + rax + 0x30001e20]
01d30 eb08                           jmp        0x7fc00be6853a
01d32 eb06                           jmp        0x7fc00be6853a
01d34 eb04                           jmp        0x7fc00be6853a
01d36 eb02                           jmp        0x7fc00be6853a
01d38 eb00                           jmp        0x7fc00be6853a
01d3a 488bf0                         mov        rsi, rax
01d3d e9e2ecffff                     jmp        0x7fc00be67224
01d42 49ba4f72e60bc07f0000           movabs     r10, 0x7fc00be6724f
01d4c 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d53 e98859a9ff                     jmp        0x7fc00b8fdee0
01d58 e84325a8ff                     call       0x7fc00b8eaaa0
01d5d e9bce2ffff                     jmp        0x7fc00be6681e
01d62 f4                             hlt        
01d63 f4                             hlt        
01d64 f4                             hlt        
01d65 f4                             hlt        
01d66 f4                             hlt        
01d67 f4                             hlt        
