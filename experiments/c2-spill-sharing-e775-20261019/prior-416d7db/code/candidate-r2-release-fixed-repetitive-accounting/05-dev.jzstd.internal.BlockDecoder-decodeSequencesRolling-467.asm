00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ecd0000000                 sub        rsp, 0xd0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85841e0000                   jne        0x7fea6fe7a9a2
0001e c4e1f96ece                     vmovq      xmm1, rsi
00023 448d52ff                       lea        r10d, [rdx - 1]
00027 8b7608                         mov        esi, dword ptr [rsi + 8]
0002a 443bd6                         cmp        r10d, esi
0002d 0f83200b0000                   jae        0x7fea6fe79653
00033 c4c1f97eca                     vmovq      r10, xmm1
00038 450fb654120b                   movzx      r10d, byte ptr [r10 + rdx + 0xb]
0003e 4585d2                         test       r10d, r10d
00041 0f84dd0c0000                   je         0x7fea6fe79824
00047 8bda                           mov        ebx, edx
00049 2bd9                           sub        ebx, ecx
0004b f3410fbdc2                     lzcnt      eax, r10d
00050 448d1cdd00000000               lea        r11d, [rbx*8]
00058 bd1f000000                     mov        ebp, 0x1f
0005d 2be8                           sub        ebp, eax
0005f 41ba08000000                   mov        r10d, 8
00065 442bd5                         sub        r10d, ebp
00068 418bc3                         mov        eax, r11d
0006b 412bc2                         sub        eax, r10d
0006e 83fb08                         cmp        ebx, 8
00071 0f8dc50c0000                   jge        0x7fea6fe7983c
00077 89442428                       mov        dword ptr [rsp + 0x28], eax
0007b 89bc248c000000                 mov        dword ptr [rsp + 0x8c], edi
00082 c4c1f96ee1                     vmovq      xmm4, r9
00087 c4c1f96ec0                     vmovq      xmm0, r8
0008c c5f96eea                       vmovd      xmm5, edx
00090 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00094 4c63c9                         movsxd     r9, ecx
00097 4863d6                         movsxd     rdx, esi
0009a 85db                           test       ebx, ebx
0009c 0f8fc2090000                   jg         0x7fea6fe79564
000a2 4533c0                         xor        r8d, r8d
000a5 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000aa eb37                           jmp        0x7fea6fe78be3
000ac 49c1e508                       shl        r13, 8
000b0 8bcf                           mov        ecx, edi
000b2 034c2440                       add        ecx, dword ptr [rsp + 0x40]
000b6 c4c1f97ec8                     vmovq      r8, xmm1
000bb 490fb64c080c                   movzx      rcx, byte ptr [r8 + rcx + 0xc]
000c1 490bcd                         or         rcx, r13
000c4 ffcf                           dec        edi
000c6 83ffff                         cmp        edi, -1
000c9 7e05                           jle        0x7fea6fe78bd0
000cb 4c8be9                         mov        r13, rcx
000ce ebdc                           jmp        0x7fea6fe78bac
000d0 41b840000000                   mov        r8d, 0x40
000d6 452bc3                         sub        r8d, r11d
000d9 c462b9f7c1                     shlx       r8, rcx, r8
000de 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000e3 448d43f8                       lea        r8d, [rbx - 8]
000e7 4183f808                       cmp        r8d, 8
000eb 0f8d8b0c0000                   jge        0x7fea6fe7987c
000f1 4585c0                         test       r8d, r8d
000f4 0f8f96080000                   jg         0x7fea6fe79490
000fa 4533c0                         xor        r8d, r8d
000fd eb34                           jmp        0x7fea6fe78c33
000ff 48c1e208                       shl        rdx, 8
00103 448bcf                         mov        r9d, edi
00106 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
0010b c4c1f97ec8                     vmovq      r8, xmm1
00110 4f0fb64c080c                   movzx      r9, byte ptr [r8 + r9 + 0xc]
00116 4c0bca                         or         r9, rdx
00119 ffcf                           dec        edi
0011b 83ffff                         cmp        edi, -1
0011e 7e05                           jle        0x7fea6fe78c25
00120 498bd1                         mov        rdx, r9
00123 ebda                           jmp        0x7fea6fe78bff
00125 41b880000000                   mov        r8d, 0x80
0012b 452bc3                         sub        r8d, r11d
0012e c442b9f7c1                     shlx       r8, r9, r8
00133 c4c1f97ec1                     vmovq      r9, xmm0
00138 458b591c                       mov        r11d, dword ptr [r9 + 0x1c]
0013c c441796ecb                     vmovd      xmm9, r11d
00141 c4c1f96ef8                     vmovq      xmm7, r8
00146 c4c1f96ef1                     vmovq      xmm6, r9
0014b 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
0014f c441796ec3                     vmovd      xmm8, r11d
00154 458b5920                       mov        r11d, dword ptr [r9 + 0x20]
00158 c441796edb                     vmovd      xmm11, r11d
0015d 458b4308                       mov        r8d, dword ptr [r11 + 8]
00161 458b5924                       mov        r11d, dword ptr [r9 + 0x24]
00165 c441796ed3                     vmovd      xmm10, r11d
0016a 418b4b08                       mov        ecx, dword ptr [r11 + 8]
0016e bb40000000                     mov        ebx, 0x40
00173 412bda                         sub        ebx, r10d
00176 458bc8                         mov        r9d, r8d
00179 c441797ecb                     vmovd      r11d, xmm9
0017e 45034b08                       add        r9d, dword ptr [r11 + 8]
00182 4403c9                         add        r9d, ecx
00185 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0018a 4585c9                         test       r9d, r9d
0018d 0f84310c0000                   je         0x7fea6fe798c4
00193 443bcb                         cmp        r9d, ebx
00196 0f8f900c0000                   jg         0x7fea6fe7992c
0019c 412bd9                         sub        ebx, r9d
0019f c462e3f75c2430                 shrx       r11, qword ptr [rsp + 0x30], rbx
001a6 4183f940                       cmp        r9d, 0x40
001aa 0f8de40c0000                   jge        0x7fea6fe79994
001b0 458bd1                         mov        r10d, r9d
001b3 442bd5                         sub        r10d, ebp
001b6 4183c208                       add        r10d, 8
001ba 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001bf 41b901000000                   mov        r9d, 1
001c5 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
001ca c442a9f7c9                     shlx       r9, r9, r10
001cf 49ffc9                         dec        r9
001d2 4d23cb                         and        r9, r11
001d5 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
001da 4183fa40                       cmp        r10d, 0x40
001de 0f8d1c0d0000                   jge        0x7fea6fe79a00
001e4 83f920                         cmp        ecx, 0x20
001e7 0f8d830d0000                   jge        0x7fea6fe79a70
001ed c442f3f7d9                     shrx       r11, r9, rcx
001f2 ba01000000                     mov        edx, 1
001f7 c4e271f7ca                     shlx       ecx, edx, ecx
001fc ffc9                           dec        ecx
001fe 4c63d1                         movsxd     r10, ecx
00201 4d23d1                         and        r10, r9
00204 458bd2                         mov        r10d, r10d
00207 c441796eea                     vmovd      xmm13, r10d
0020c 4183f820                       cmp        r8d, 0x20
00210 0f8dce0d0000                   jge        0x7fea6fe79ae4
00216 c4c1f97ee2                     vmovq      r10, xmm4
0021b 458b5228                       mov        r10d, dword ptr [r10 + 0x28]
0021f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00224 c441797ec2                     vmovd      r10d, xmm8
00229 458b4a08                       mov        r9d, dword ptr [r10 + 8]
0022d c441797eda                     vmovd      r10d, xmm11
00232 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
00236 458bea                         mov        r13d, r10d
00239 418b5a08                       mov        ebx, dword ptr [r10 + 8]
0023d c441797ed2                     vmovd      r10d, xmm10
00242 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
00246 418bc2                         mov        eax, r10d
00249 418b4a08                       mov        ecx, dword ptr [r10 + 8]
0024d 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00255 4585d2                         test       r10d, r10d
00258 0f8ef0060000                   jle        0x7fea6fe7944e
0025e c46239f7d2                     shlx       r10d, edx, r8d
00263 c442bbf7c3                     shrx       r8, r11, r8
00268 41ffca                         dec        r10d
0026b 418bf8                         mov        edi, r8d
0026e c5f96ec7                       vmovd      xmm0, edi
00272 4d63d2                         movsxd     r10, r10d
00275 4d23d3                         and        r10, r11
00278 458bda                         mov        r11d, r10d
0027b c4c1796ed3                     vmovd      xmm2, r11d
00280 458d51ff                       lea        r10d, [r9 - 1]
00284 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0028c c4c1f97ee2                     vmovq      r10, xmm4
00291 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00298 c441796ef2                     vmovd      xmm14, r10d
0029d c4c1f97ee2                     vmovq      r10, xmm4
002a2 458b92f8000000                 mov        r10d, dword ptr [r10 + 0xf8]
002a9 c4c1796eda                     vmovd      xmm3, r10d
002ae 448d51ff                       lea        r10d, [rcx - 1]
002b2 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
002ba 448d5bff                       lea        r11d, [rbx - 1]
002be 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
002c6 4585c9                         test       r9d, r9d
002c9 0f86b5080000                   jbe        0x7fea6fe79684
002cf 85db                           test       ebx, ebx
002d1 0f86ad080000                   jbe        0x7fea6fe79684
002d7 85c9                           test       ecx, ecx
002d9 0f86a5080000                   jbe        0x7fea6fe79684
002df c441797ef2                     vmovd      r10d, xmm14
002e4 458b5208                       mov        r10d, dword ptr [r10 + 8]
002e8 4585d2                         test       r10d, r10d
002eb 0f8693080000                   jbe        0x7fea6fe79684
002f1 4d63d2                         movsxd     r10, r10d
002f4 4c639c248c000000               movsxd     r11, dword ptr [rsp + 0x8c]
002fc 49ffcb                         dec        r11
002ff 4d3bda                         cmp        r11, r10
00302 0f837c080000                   jae        0x7fea6fe79684
00308 4983fb01                       cmp        r11, 1
0030c 41ba01000000                   mov        r10d, 1
00312 4d0f4cda                       cmovl      r11, r10
00316 418bf3                         mov        esi, r11d
00319 3bb4248c000000                 cmp        esi, dword ptr [rsp + 0x8c]
00320 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00328 410f4ff2                       cmovg      esi, r10d
0032c c441797eea                     vmovd      r10d, xmm13
00331 44239424a0000000               and        r10d, dword ptr [rsp + 0xa0]
00339 418bca                         mov        ecx, r10d
0033c c4c1797ed2                     vmovd      r10d, xmm2
00341 44239424a4000000               and        r10d, dword ptr [rsp + 0xa4]
00349 418bd2                         mov        edx, r10d
0034c 448bd7                         mov        r10d, edi
0034f 442394249c000000               and        r10d, dword ptr [rsp + 0x9c]
00357 4533db                         xor        r11d, r11d
0035a 4533c0                         xor        r8d, r8d
0035d 62c17d086ee3                   vmovd      xmm20, r11d
00363 62c1fd086ed0                   vmovq      xmm18, r8
00369 c441796ee2                     vmovd      xmm12, r10d
0036e c441797ec2                     vmovd      r10d, xmm8
00373 c441797ee3                     vmovd      r11d, xmm12
00378 4f8b54da10                     mov        r10, qword ptr [r10 + r11*8 + 0x10]
0037d 62e17d087ee5                   vmovd      ebp, xmm20
00383 ffc5                           inc        ebp
00385 c441f96efa                     vmovq      xmm15, r10
0038a 49c1ea20                       shr        r10, 0x20
0038e 458bd2                         mov        r10d, r10d
00391 410fb6da                       movzx      ebx, r10b
00395 8bf8                           mov        edi, eax
00397 4c8b54c810                     mov        r10, qword ptr [rax + rcx*8 + 0x10]
0039c 62c1fd086ec2                   vmovq      xmm16, r10
003a2 458bdd                         mov        r11d, r13d
003a5 448bca                         mov        r9d, edx
003a8 4d8b54d510                     mov        r10, qword ptr [r13 + rdx*8 + 0x10]
003ad 62c1fd086eca                   vmovq      xmm17, r10
003b3 62c1fd087ec2                   vmovq      r10, xmm16
003b9 49c1ea20                       shr        r10, 0x20
003bd 458bc2                         mov        r8d, r10d
003c0 450fb6c0                       movzx      r8d, r8b
003c4 62c1fd087eca                   vmovq      r10, xmm17
003ca 49c1ea20                       shr        r10, 0x20
003ce 418bd2                         mov        edx, r10d
003d1 440fb6f2                       movzx      r14d, dl
003d5 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
003dc 0f8c7e0c0000                   jl         0x7fea6fe79b60
003e2 478d1430                       lea        r10d, [r8 + r14]
003e6 4403d3                         add        r10d, ebx
003e9 0f84410d0000                   je         0x7fea6fe79c30
003ef 4183fa3f                       cmp        r10d, 0x3f
003f3 0f8f370e0000                   jg         0x7fea6fe79d30
003f9 b840000000                     mov        eax, 0x40
003fe 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
00402 443bd0                         cmp        r10d, eax
00405 0f8f250f0000                   jg         0x7fea6fe79e30
0040b 412bc2                         sub        eax, r10d
0040e c462fbf76c2430                 shrx       r13, qword ptr [rsp + 0x30], rax
00415 4183fa40                       cmp        r10d, 0x40
00419 0f8d0d100000                   jge        0x7fea6fe79f2c
0041f ba01000000                     mov        edx, 1
00424 c4e2a9f7c2                     shlx       rax, rdx, r10
00429 48ffc8                         dec        rax
0042c 4923c5                         and        rax, r13
0042f 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00433 4103d2                         add        edx, r10d
00436 8954247c                       mov        dword ptr [rsp + 0x7c], edx
0043a 8b542444                       mov        edx, dword ptr [rsp + 0x44]
0043e 4103d2                         add        edx, r10d
00441 89542444                       mov        dword ptr [rsp + 0x44], edx
00445 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0044a 4183fa40                       cmp        r10d, 0x40
0044e 0f8dd0100000                   jge        0x7fea6fe7a024
00454 83fb40                         cmp        ebx, 0x40
00457 0f8db3110000                   jge        0x7fea6fe7a110
0045d c462e3f7d0                     shrx       r10, rax, rbx
00462 ba01000000                     mov        edx, 1
00467 c4e2e1f7da                     shlx       rbx, rdx, rbx
0046c 48ffcb                         dec        rbx
0046f 4823d8                         and        rbx, rax
00472 4183f840                       cmp        r8d, 0x40
00476 0f8d84120000                   jge        0x7fea6fe7a200
0047c c442bbf7ea                     shrx       r13, r10, r8
00481 c462b9f7c2                     shlx       r8, rdx, r8
00486 49ffc8                         dec        r8
00489 4d23c2                         and        r8, r10
0048c 4183fe40                       cmp        r14d, 0x40
00490 0f8d4a130000                   jge        0x7fea6fe7a2e0
00496 41ba01000000                   mov        r10d, 1
0049c c4c289f7c2                     shlx       rax, r10, r14
004a1 448bd3                         mov        r10d, ebx
004a4 48ffc8                         dec        rax
004a7 4923c5                         and        rax, r13
004aa 458bc0                         mov        r8d, r8d
004ad 62e1fd087ecb                   vmovq      rbx, xmm17
004b3 8bdb                           mov        ebx, ebx
004b5 4803c3                         add        rax, rbx
004b8 c461f97efb                     vmovq      rbx, xmm15
004bd 8bdb                           mov        ebx, ebx
004bf 4403d3                         add        r10d, ebx
004c2 62e1fd087ec3                   vmovq      rbx, xmm16
004c8 8bd3                           mov        edx, ebx
004ca 4403c2                         add        r8d, edx
004cd 4963d0                         movsxd     rdx, r8d
004d0 62e1fd087ed3                   vmovq      rbx, xmm18
004d6 4803da                         add        rbx, rdx
004d9 62e1fd086ed3                   vmovq      xmm18, rbx
004df 4885c0                         test       rax, rax
004e2 0f8e48070000                   jle        0x7fea6fe79730
004e8 483dffffff7f                   cmp        rax, 0x7fffffff
004ee 0f8ff0130000                   jg         0x7fea6fe7a3e4
004f4 4181faffff0100                 cmp        r10d, 0x1ffff
004fb 0f8fdb140000                   jg         0x7fea6fe7a4dc
00501 4181f8ffff0300                 cmp        r8d, 0x3ffff
00508 0f8faa150000                   jg         0x7fea6fe7a5b8
0050e 8bd8                           mov        ebx, eax
00510 81fb00000010                   cmp        ebx, 0x10000000
00516 0f8378160000                   jae        0x7fea6fe7a694
0051c 4d63d2                         movsxd     r10, r10d
0051f 48c1e212                       shl        rdx, 0x12
00523 4c63c3                         movsxd     r8, ebx
00526 49c1e024                       shl        r8, 0x24
0052a 490bd0                         or         rdx, r8
0052d 490bd2                         or         rdx, r10
00530 c441797ef2                     vmovd      r10d, xmm14
00535 62c17d087ee0                   vmovd      r8d, xmm20
0053b 4b8954c210                     mov        qword ptr [r10 + r8*8 + 0x10], rdx
00540 3bee                           cmp        ebp, esi
00542 7d18                           jge        0x7fea6fe7905c
00544 62e17d086ee5                   vmovd      xmm20, ebp
0054a 458beb                         mov        r13d, r11d
0054d 8bc7                           mov        eax, edi
0054f 418bd1                         mov        edx, r9d
00552 c441797ee2                     vmovd      r10d, xmm12
00557 e90dfeffff                     jmp        0x7fea6fe78e69
0055c 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
00563 0f8db7060000                   jge        0x7fea6fe79720
00569 41ffc0                         inc        r8d
0056c 418bd3                         mov        edx, r11d
0056f 62c17d086ee0                   vmovd      xmm20, r8d
00575 c441797ec2                     vmovd      r10d, xmm8
0057a c441797ee3                     vmovd      r11d, xmm12
0057f 4f8b5cda10                     mov        r11, qword ptr [r10 + r11*8 + 0x10]
00584 4c8b54cf10                     mov        r10, qword ptr [rdi + rcx*8 + 0x10]
00589 c441f96efb                     vmovq      xmm15, r11
0058e 49c1eb20                       shr        r11, 0x20
00592 458bdb                         mov        r11d, r11d
00595 410fb6db                       movzx      ebx, r11b
00599 62c1fd086ec2                   vmovq      xmm16, r10
0059f 49c1ea20                       shr        r10, 0x20
005a3 458bda                         mov        r11d, r10d
005a6 450fb6c3                       movzx      r8d, r11b
005aa 448bda                         mov        r11d, edx
005ad 4e8b54ca10                     mov        r10, qword ptr [rdx + r9*8 + 0x10]
005b2 62c1fd086eca                   vmovq      xmm17, r10
005b8 49c1ea20                       shr        r10, 0x20
005bc 458bd2                         mov        r10d, r10d
005bf 450fb6f2                       movzx      r14d, r10b
005c3 478d1406                       lea        r10d, [r14 + r8]
005c7 4403d3                         add        r10d, ebx
005ca 0f84600b0000                   je         0x7fea6fe79c30
005d0 4183fa3f                       cmp        r10d, 0x3f
005d4 0f8f560c0000                   jg         0x7fea6fe79d30
005da b840000000                     mov        eax, 0x40
005df 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
005e3 443bd0                         cmp        r10d, eax
005e6 0f8f440d0000                   jg         0x7fea6fe79e30
005ec 412bc2                         sub        eax, r10d
005ef c462fbf76c2430                 shrx       r13, qword ptr [rsp + 0x30], rax
005f6 4183fa40                       cmp        r10d, 0x40
005fa 0f8d2c0e0000                   jge        0x7fea6fe79f2c
00600 ba01000000                     mov        edx, 1
00605 c4e2a9f7c2                     shlx       rax, rdx, r10
0060a 48ffc8                         dec        rax
0060d 4923c5                         and        rax, r13
00610 8b542444                       mov        edx, dword ptr [rsp + 0x44]
00614 4103d2                         add        edx, r10d
00617 89542444                       mov        dword ptr [rsp + 0x44], edx
0061b 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
0061f 4103d2                         add        edx, r10d
00622 8954247c                       mov        dword ptr [rsp + 0x7c], edx
00626 83fa40                         cmp        edx, 0x40
00629 0f8df50e0000                   jge        0x7fea6fe7a024
0062f 83fb40                         cmp        ebx, 0x40
00632 0f8dd80f0000                   jge        0x7fea6fe7a110
00638 c462e3f7d0                     shrx       r10, rax, rbx
0063d ba01000000                     mov        edx, 1
00642 c4e2e1f7da                     shlx       rbx, rdx, rbx
00647 48ffcb                         dec        rbx
0064a 4823d8                         and        rbx, rax
0064d 4183f840                       cmp        r8d, 0x40
00651 0f8da9100000                   jge        0x7fea6fe7a200
00657 c442bbf7ea                     shrx       r13, r10, r8
0065c c462b9f7c2                     shlx       r8, rdx, r8
00661 49ffc8                         dec        r8
00664 4d23c2                         and        r8, r10
00667 4183fe40                       cmp        r14d, 0x40
0066b 0f8d6f110000                   jge        0x7fea6fe7a2e0
00671 41ba01000000                   mov        r10d, 1
00677 c4c289f7c2                     shlx       rax, r10, r14
0067c 448bd3                         mov        r10d, ebx
0067f 48ffc8                         dec        rax
00682 4923c5                         and        rax, r13
00685 458bc0                         mov        r8d, r8d
00688 c461f97efb                     vmovq      rbx, xmm15
0068d 8bdb                           mov        ebx, ebx
0068f 4403d3                         add        r10d, ebx
00692 62e1fd087ec3                   vmovq      rbx, xmm16
00698 8bd3                           mov        edx, ebx
0069a 4403c2                         add        r8d, edx
0069d 62e1fd087ecb                   vmovq      rbx, xmm17
006a3 8bdb                           mov        ebx, ebx
006a5 4803c3                         add        rax, rbx
006a8 4963d8                         movsxd     rbx, r8d
006ab 62e1fd087ed2                   vmovq      rdx, xmm18
006b1 4803d3                         add        rdx, rbx
006b4 62e1fd086ed2                   vmovq      xmm18, rdx
006ba 4885c0                         test       rax, rax
006bd 0f8e6d050000                   jle        0x7fea6fe79730
006c3 483dffffff7f                   cmp        rax, 0x7fffffff
006c9 0f8f15120000                   jg         0x7fea6fe7a3e4
006cf 4181faffff0100                 cmp        r10d, 0x1ffff
006d6 0f8f00130000                   jg         0x7fea6fe7a4dc
006dc 4181f8ffff0300                 cmp        r8d, 0x3ffff
006e3 0f8fcf130000                   jg         0x7fea6fe7a5b8
006e9 8bd0                           mov        edx, eax
006eb 81fa00000010                   cmp        edx, 0x10000000
006f1 0f839d140000                   jae        0x7fea6fe7a694
006f7 4d63d2                         movsxd     r10, r10d
006fa 48c1e312                       shl        rbx, 0x12
006fe 4c63c2                         movsxd     r8, edx
00701 49c1e024                       shl        r8, 0x24
00705 4c0bc3                         or         r8, rbx
00708 4d0bc2                         or         r8, r10
0070b c441797ef2                     vmovd      r10d, xmm14
00710 62e17d087ee3                   vmovd      ebx, xmm20
00716 4d8944da10                     mov        qword ptr [r10 + rbx*8 + 0x10], r8
0071b ffc3                           inc        ebx
0071d 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
00724 7d0e                           jge        0x7fea6fe79234
00726 418bd3                         mov        edx, r11d
00729 62e17d086ee3                   vmovd      xmm20, ebx
0072f e941feffff                     jmp        0x7fea6fe79075
00734 458beb                         mov        r13d, r11d
00737 448bd1                         mov        r10d, ecx
0073a 418bc1                         mov        eax, r9d
0073d 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
00744 0f8dfc010000                   jge        0x7fea6fe79446
0074a 62e17d086ee3                   vmovd      xmm20, ebx
00750 8bf7                           mov        esi, edi
00752 458bda                         mov        r11d, r10d
00755 4e8b54d710                     mov        r10, qword ptr [rdi + r10*8 + 0x10]
0075a 62e17d087ee5                   vmovd      ebp, xmm20
00760 ffc5                           inc        ebp
00762 62c1fd086ec2                   vmovq      xmm16, r10
00768 49c1ea20                       shr        r10, 0x20
0076c 458bd2                         mov        r10d, r10d
0076f 450fb6c2                       movzx      r8d, r10b
00773 458bcd                         mov        r9d, r13d
00776 8bc8                           mov        ecx, eax
00778 4d8b54c510                     mov        r10, qword ptr [r13 + rax*8 + 0x10]
0077d 62c1fd086eca                   vmovq      xmm17, r10
00783 c5797ec7                       vmovd      edi, xmm8
00787 c5797ee2                       vmovd      edx, xmm12
0078b 4c8b54d710                     mov        r10, qword ptr [rdi + rdx*8 + 0x10]
00790 c441f96efa                     vmovq      xmm15, r10
00795 62c1fd087eca                   vmovq      r10, xmm17
0079b 49c1ea20                       shr        r10, 0x20
0079f 458bd2                         mov        r10d, r10d
007a2 450fb6f2                       movzx      r14d, r10b
007a6 c441f97efa                     vmovq      r10, xmm15
007ab 49c1ea20                       shr        r10, 0x20
007af 418bda                         mov        ebx, r10d
007b2 0fb6db                         movzx      ebx, bl
007b5 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
007bc 0f8c9e080000                   jl         0x7fea6fe79b60
007c2 478d1430                       lea        r10d, [r8 + r14]
007c6 4403d3                         add        r10d, ebx
007c9 0f8461090000                   je         0x7fea6fe79c30
007cf 4183fa3f                       cmp        r10d, 0x3f
007d3 0f8f570a0000                   jg         0x7fea6fe79d30
007d9 b840000000                     mov        eax, 0x40
007de 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
007e2 443bd0                         cmp        r10d, eax
007e5 0f8f450b0000                   jg         0x7fea6fe79e30
007eb 412bc2                         sub        eax, r10d
007ee c462fbf76c2430                 shrx       r13, qword ptr [rsp + 0x30], rax
007f5 4183fa40                       cmp        r10d, 0x40
007f9 0f8d2d0c0000                   jge        0x7fea6fe79f2c
007ff b801000000                     mov        eax, 1
00804 c4e2a9f7c0                     shlx       rax, rax, r10
00809 48ffc8                         dec        rax
0080c 4923c5                         and        rax, r13
0080f 448b6c2444                     mov        r13d, dword ptr [rsp + 0x44]
00814 4503ea                         add        r13d, r10d
00817 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0081c 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00821 4503ea                         add        r13d, r10d
00824 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
00829 4183fd40                       cmp        r13d, 0x40
0082d 0f8df10c0000                   jge        0x7fea6fe7a024
00833 83fb40                         cmp        ebx, 0x40
00836 0f8dd40d0000                   jge        0x7fea6fe7a110
0083c c462e3f7d0                     shrx       r10, rax, rbx
00841 41bd01000000                   mov        r13d, 1
00847 c4c2e1f7dd                     shlx       rbx, r13, rbx
0084c 48ffcb                         dec        rbx
0084f 4823d8                         and        rbx, rax
00852 4183f840                       cmp        r8d, 0x40
00856 0f8da40e0000                   jge        0x7fea6fe7a200
0085c c442bbf7ea                     shrx       r13, r10, r8
00861 b801000000                     mov        eax, 1
00866 c462b9f7c0                     shlx       r8, rax, r8
0086b 49ffc8                         dec        r8
0086e 4d23c2                         and        r8, r10
00871 4183fe40                       cmp        r14d, 0x40
00875 0f8d650f0000                   jge        0x7fea6fe7a2e0
0087b 41ba01000000                   mov        r10d, 1
00881 c4c289f7c2                     shlx       rax, r10, r14
00886 448bd3                         mov        r10d, ebx
00889 48ffc8                         dec        rax
0088c 4923c5                         and        rax, r13
0088f 458bc0                         mov        r8d, r8d
00892 c461f97efb                     vmovq      rbx, xmm15
00897 448beb                         mov        r13d, ebx
0089a 4503d5                         add        r10d, r13d
0089d 62e1fd087ec3                   vmovq      rbx, xmm16
008a3 8bdb                           mov        ebx, ebx
008a5 4403c3                         add        r8d, ebx
008a8 62e1fd087ecb                   vmovq      rbx, xmm17
008ae 8bdb                           mov        ebx, ebx
008b0 4803c3                         add        rax, rbx
008b3 4963d8                         movsxd     rbx, r8d
008b6 62c1fd087ed5                   vmovq      r13, xmm18
008bc 4c03eb                         add        r13, rbx
008bf 62c1fd086ed5                   vmovq      xmm18, r13
008c5 4885c0                         test       rax, rax
008c8 0f8e62030000                   jle        0x7fea6fe79730
008ce 483dffffff7f                   cmp        rax, 0x7fffffff
008d4 0f8f0a100000                   jg         0x7fea6fe7a3e4
008da 4181faffff0100                 cmp        r10d, 0x1ffff
008e1 0f8ff5100000                   jg         0x7fea6fe7a4dc
008e7 4181f8ffff0300                 cmp        r8d, 0x3ffff
008ee 0f8fc4110000                   jg         0x7fea6fe7a5b8
008f4 448be8                         mov        r13d, eax
008f7 4181fd00000010                 cmp        r13d, 0x10000000
008fe 0f8390120000                   jae        0x7fea6fe7a694
00904 4d63d2                         movsxd     r10, r10d
00907 4d63c5                         movsxd     r8, r13d
0090a 48c1e312                       shl        rbx, 0x12
0090e 49c1e024                       shl        r8, 0x24
00912 490bd8                         or         rbx, r8
00915 490bda                         or         rbx, r10
00918 c441797ef2                     vmovd      r10d, xmm14
0091d 62c17d087ee0                   vmovd      r8d, xmm20
00923 4b895cc210                     mov        qword ptr [r10 + r8*8 + 0x10], rbx
00928 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
0092f 7d15                           jge        0x7fea6fe79446
00931 62e17d086ee5                   vmovd      xmm20, ebp
00937 458be9                         mov        r13d, r9d
0093a 8bfe                           mov        edi, esi
0093c 458bd3                         mov        r10d, r11d
0093f 8bc1                           mov        eax, ecx
00941 e90afeffff                     jmp        0x7fea6fe79250
00946 62c1fd087ed0                   vmovq      r8, xmm18
0094c eb03                           jmp        0x7fea6fe79451
0094e 4533c0                         xor        r8d, r8d
00951 4c63542460                     movsxd     r10, dword ptr [rsp + 0x60]
00956 4d03c2                         add        r8, r10
00959 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
00961 4d3bc2                         cmp        r8, r10
00964 0f8f02130000                   jg         0x7fea6fe7a76c
0096a 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0096f 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00974 0f8516130000                   jne        0x7fea6fe7a790
0097a 418bc0                         mov        eax, r8d
0097d 4881c4d0000000                 add        rsp, 0xd0
00984 5d                             pop        rbp
00985 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00989 0f87fd140000                   ja         0x7fea6fe7a98c
0098f c3                             ret        
00990 8d7bf7                         lea        edi, [rbx - 9]
00993 85ff                           test       edi, edi
00995 0f8cb0010000                   jl         0x7fea6fe7964b
0099b 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
0099f 3bce                           cmp        ecx, esi
009a1 0f833d130000                   jae        0x7fea6fe7a7e4
009a7 4863cf                         movsxd     rcx, edi
009aa 4903c9                         add        rcx, r9
009ad 483bca                         cmp        rcx, rdx
009b0 0f832e130000                   jae        0x7fea6fe7a7e4
009b6 85ff                           test       edi, edi
009b8 0f8ebe130000                   jle        0x7fea6fe7a87c
009be 83c3f6                         add        ebx, -0xa
009c1 4533c0                         xor        r8d, r8d
009c4 49c1e008                       shl        r8, 8
009c8 448bcf                         mov        r9d, edi
009cb 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
009d0 c4e1f97ec9                     vmovq      rcx, xmm1
009d5 4a0fb654090c                   movzx      rdx, byte ptr [rcx + r9 + 0xc]
009db 490bd0                         or         rdx, r8
009de ffcf                           dec        edi
009e0 3bfb                           cmp        edi, ebx
009e2 7e05                           jle        0x7fea6fe794e9
009e4 4c8bc2                         mov        r8, rdx
009e7 ebdb                           jmp        0x7fea6fe794c4
009e9 83ff02                         cmp        edi, 2
009ec 7e65                           jle        0x7fea6fe79553
009ee 6690                           nop        
009f0 48c1e208                       shl        rdx, 8
009f4 8bcf                           mov        ecx, edi
009f6 034c2440                       add        ecx, dword ptr [rsp + 0x40]
009fa 448bc7                         mov        r8d, edi
009fd 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00a02 4963d8                         movsxd     rbx, r8d
00a05 448d49fe                       lea        r9d, [rcx - 2]
00a09 c4c1f97ec8                     vmovq      r8, xmm1
00a0e 4f0fb64c080c                   movzx      r9, byte ptr [r8 + r9 + 0xc]
00a14 83c1fd                         add        ecx, -3
00a17 4d0fb644080c                   movzx      r8, byte ptr [r8 + rcx + 0xc]
00a1d c4e1f97ec9                     vmovq      rcx, xmm1
00a22 480fb64c190b                   movzx      rcx, byte ptr [rcx + rbx + 0xb]
00a28 c4e1f97ece                     vmovq      rsi, xmm1
00a2d 480fb65c1e0c                   movzx      rbx, byte ptr [rsi + rbx + 0xc]
00a33 480bd3                         or         rdx, rbx
00a36 48c1e208                       shl        rdx, 8
00a3a 480bd1                         or         rdx, rcx
00a3d 48c1e208                       shl        rdx, 8
00a41 490bd1                         or         rdx, r9
00a44 48c1e208                       shl        rdx, 8
00a48 490bd0                         or         rdx, r8
00a4b 83c7fc                         add        edi, -4
00a4e 83ff02                         cmp        edi, 2
00a51 7f9d                           jg         0x7fea6fe794f0
00a53 83ffff                         cmp        edi, -1
00a56 0f8fa3f6ffff                   jg         0x7fea6fe78bff
00a5c 4c8bca                         mov        r9, rdx
00a5f e9c1f6ffff                     jmp        0x7fea6fe78c25
00a64 8d7bff                         lea        edi, [rbx - 1]
00a67 85ff                           test       edi, edi
00a69 0f8cd5000000                   jl         0x7fea6fe79644
00a6f 3bce                           cmp        ecx, esi
00a71 0f832d120000                   jae        0x7fea6fe7a7a4
00a77 4c63c7                         movsxd     r8, edi
00a7a 4d03c1                         add        r8, r9
00a7d 4c3bc2                         cmp        r8, rdx
00a80 0f831e120000                   jae        0x7fea6fe7a7a4
00a86 85ff                           test       edi, edi
00a88 0f8eae120000                   jle        0x7fea6fe7a83c
00a8e 448d43fe                       lea        r8d, [rbx - 2]
00a92 33c0                           xor        eax, eax
00a94 8bcf                           mov        ecx, edi
00a96 034c2440                       add        ecx, dword ptr [rsp + 0x40]
00a9a c4c1f97ecd                     vmovq      r13, xmm1
00a9f 4d0fb66c0d0c                   movzx      r13, byte ptr [r13 + rcx + 0xc]
00aa5 48c1e008                       shl        rax, 8
00aa9 4c0be8                         or         r13, rax
00aac ffcf                           dec        edi
00aae 413bf8                         cmp        edi, r8d
00ab1 7e05                           jle        0x7fea6fe795b8
00ab3 498bc5                         mov        rax, r13
00ab6 ebdc                           jmp        0x7fea6fe79594
00ab8 83ff02                         cmp        edi, 2
00abb 7e76                           jle        0x7fea6fe79633
00abd c5f96edd                       vmovd      xmm3, ebp
00ac1 0f1f840000000000               nop        dword ptr [rax + rax]
00ac9 0f1f8000000000                 nop        dword ptr [rax]
00ad0 49c1e508                       shl        r13, 8
00ad4 448bc7                         mov        r8d, edi
00ad7 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00adc 8bc7                           mov        eax, edi
00ade 03442440                       add        eax, dword ptr [rsp + 0x40]
00ae2 4863c0                         movsxd     rax, eax
00ae5 418d48fe                       lea        ecx, [r8 - 2]
00ae9 c4e1f97ecd                     vmovq      rbp, xmm1
00aee 480fb64c0d0c                   movzx      rcx, byte ptr [rbp + rcx + 0xc]
00af4 4183c0fd                       add        r8d, -3
00af8 4e0fb644050c                   movzx      r8, byte ptr [rbp + r8 + 0xc]
00afe 480fb66c050b                   movzx      rbp, byte ptr [rbp + rax + 0xb]
00b04 c4c1f97ece                     vmovq      r14, xmm1
00b09 490fb644060c                   movzx      rax, byte ptr [r14 + rax + 0xc]
00b0f 4c0be8                         or         r13, rax
00b12 49c1e508                       shl        r13, 8
00b16 4c0bed                         or         r13, rbp
00b19 49c1e508                       shl        r13, 8
00b1d 4c0be9                         or         r13, rcx
00b20 49c1e508                       shl        r13, 8
00b24 4d0be8                         or         r13, r8
00b27 83c7fc                         add        edi, -4
00b2a 83ff02                         cmp        edi, 2
00b2d 7fa1                           jg         0x7fea6fe795d0
00b2f c5f97edd                       vmovd      ebp, xmm3
00b33 83ffff                         cmp        edi, -1
00b36 0f8f70f5ffff                   jg         0x7fea6fe78bac
00b3c 498bcd                         mov        rcx, r13
00b3f e98cf5ffff                     jmp        0x7fea6fe78bd0
00b44 33c9                           xor        ecx, ecx
00b46 e985f5ffff                     jmp        0x7fea6fe78bd0
00b4b 4533c9                         xor        r9d, r9d
00b4e e9d2f5ffff                     jmp        0x7fea6fe78c25
00b53 bee4ffffff                     mov        esi, 0xffffffe4
00b58 c4e1f97ecd                     vmovq      rbp, xmm1
00b5d 891424                         mov        dword ptr [rsp], edx
00b60 894c2404                       mov        dword ptr [rsp + 4], ecx
00b64 4c89442408                     mov        qword ptr [rsp + 8], r8
00b69 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00b6e 897c2418                       mov        dword ptr [rsp + 0x18], edi
00b72 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00b77 e8e4e6b5ff                     call       0x7fea6f9d7d60
00b7c 0f1f8400740c0000               nop        dword ptr [rax + rax + 0xc74]
00b84 be6effffff                     mov        esi, 0xffffff6e
00b89 c4e1f97ecd                     vmovq      rbp, xmm1
00b8e 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00b93 4489542404                     mov        dword ptr [rsp + 4], r10d
00b98 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
00b9e c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
00ba4 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00bac 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00bb1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bb6 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00bbb c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
00bc1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00bc6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00bcb c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
00bd1 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00bd6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00bdb c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
00be1 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
00be7 c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
00bed c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
00bf3 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
00bf9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00bfe 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00c03 c5fa11542458                   vmovss     dword ptr [rsp + 0x58], xmm2
00c09 897c245c                       mov        dword ptr [rsp + 0x5c], edi
00c0d c5fa115c2460                   vmovss     dword ptr [rsp + 0x60], xmm3
00c13 e848e6b5ff                     call       0x7fea6f9d7d60
00c18 0f1f8400100d0001               nop        dword ptr [rax + rax + 0x1000d10]
00c20 458beb                         mov        r13d, r11d
00c23 448bd1                         mov        r10d, ecx
00c26 418bc1                         mov        eax, r9d
00c29 8bdd                           mov        ebx, ebp
00c2b e90dfbffff                     jmp        0x7fea6fe7923d
00c30 4533db                         xor        r11d, r11d
00c33 493bc3                         cmp        rax, r11
00c36 bdffffffff                     mov        ebp, 0xffffffff
00c3b 7c08                           jl         0x7fea6fe79745
00c3d 400f95c5                       setne      bpl
00c41 400fb6ed                       movzx      ebp, bpl
00c45 be45ffffff                     mov        esi, 0xffffff45
00c4a c5fb110c24                     vmovsd     qword ptr [rsp], xmm1
00c4f 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00c54 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c59 c5fb11742410                   vmovsd     qword ptr [rsp + 0x10], xmm6
00c5f c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
00c65 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00c6d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c72 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c77 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00c7c c5fa116c2428                   vmovss     dword ptr [rsp + 0x28], xmm5
00c82 c5fb117c2438                   vmovsd     qword ptr [rsp + 0x38], xmm7
00c88 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c8d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00c92 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
00c97 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00c9c c57a114c2444                   vmovss     dword ptr [rsp + 0x44], xmm9
00ca2 c57a115c2448                   vmovss     dword ptr [rsp + 0x48], xmm11
00ca8 c57a1154244c                   vmovss     dword ptr [rsp + 0x4c], xmm10
00cae c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
00cb4 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
00cbc c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
00cc2 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
00cca 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
00cd2 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
00cda 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00ce2 c57a11b42488000000             vmovss     dword ptr [rsp + 0x88], xmm14
00ceb 62e17e0811642423               vmovss     dword ptr [rsp + 0x8c], xmm20
00cf3 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00cfb c5fa11942498000000             vmovss     dword ptr [rsp + 0x98], xmm2
00d04 c5fa118424a8000000             vmovss     dword ptr [rsp + 0xa8], xmm0
00d0d c5fa119c24b0000000             vmovss     dword ptr [rsp + 0xb0], xmm3
00d16 90                             nop        
00d17 e844e5b5ff                     call       0x7fea6f9d7d60
00d1c 0f1f8400140e0002               nop        dword ptr [rax + rax + 0x2000e14]
00d24 be45ffffff                     mov        esi, 0xffffff45
00d29 418bea                         mov        ebp, r10d
00d2c 666690                         nop        
00d2f e82ce5b5ff                     call       0x7fea6f9d7d60
00d34 0f1f84002c0e0003               nop        dword ptr [rax + rax + 0x3000e2c]
00d3c be45ffffff                     mov        esi, 0xffffff45
00d41 c4e1f97ecd                     vmovq      rbp, xmm1
00d46 894c2404                       mov        dword ptr [rsp + 4], ecx
00d4a 4c89442408                     mov        qword ptr [rsp + 8], r8
00d4f 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00d54 897c2418                       mov        dword ptr [rsp + 0x18], edi
00d58 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00d5d 89442420                       mov        dword ptr [rsp + 0x20], eax
00d61 89542424                       mov        dword ptr [rsp + 0x24], edx
00d65 89542430                       mov        dword ptr [rsp + 0x30], edx
00d69 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00d6d 6690                           nop        
00d6f e8ece4b5ff                     call       0x7fea6f9d7d60
00d74 0f1f84006c0e0004               nop        dword ptr [rax + rax + 0x4000e6c]
00d7c c5f97eed                       vmovd      ebp, xmm5
00d80 83c5f8                         add        ebp, -8
00d83 be45ffffff                     mov        esi, 0xffffff45
00d88 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00d8d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d92 c5fb11442410                   vmovsd     qword ptr [rsp + 0x10], xmm0
00d98 c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
00d9e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00da3 c5fa116c242c                   vmovss     dword ptr [rsp + 0x2c], xmm5
00da9 c5fb114c2438                   vmovsd     qword ptr [rsp + 0x38], xmm1
00daf 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00db4 666690                         nop        
00db7 e8a4e4b5ff                     call       0x7fea6f9d7d60
00dbc 0f1f8400b40e0005               nop        dword ptr [rax + rax + 0x5000eb4]
00dc4 be45ffffff                     mov        esi, 0xffffff45
00dc9 c4e1f97ecd                     vmovq      rbp, xmm1
00dce 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00dd3 44895c2404                     mov        dword ptr [rsp + 4], r11d
00dd8 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
00dde c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
00de4 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00de9 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00dee c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
00df4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00df9 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00dfe c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
00e04 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e09 c57a114c2438                   vmovss     dword ptr [rsp + 0x38], xmm9
00e0f c57a115c243c                   vmovss     dword ptr [rsp + 0x3c], xmm11
00e15 c57a11542440                   vmovss     dword ptr [rsp + 0x40], xmm10
00e1b 895c2448                       mov        dword ptr [rsp + 0x48], ebx
00e1f e83ce4b5ff                     call       0x7fea6f9d7d60
00e24 0f1f84001c0f0006               nop        dword ptr [rax + rax + 0x6000f1c]
00e2c be45ffffff                     mov        esi, 0xffffff45
00e31 c4e1f97ecd                     vmovq      rbp, xmm1
00e36 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00e3b 4489442404                     mov        dword ptr [rsp + 4], r8d
00e40 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
00e46 c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
00e4c 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00e51 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00e56 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
00e5c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00e61 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00e66 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
00e6c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e71 c57a114c2438                   vmovss     dword ptr [rsp + 0x38], xmm9
00e77 c57a115c243c                   vmovss     dword ptr [rsp + 0x3c], xmm11
00e7d c57a11542440                   vmovss     dword ptr [rsp + 0x40], xmm10
00e83 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00e87 e8d4e3b5ff                     call       0x7fea6f9d7d60
00e8c 0f1f8400840f0007               nop        dword ptr [rax + rax + 0x7000f84]
00e94 be45ffffff                     mov        esi, 0xffffff45
00e99 c4e1f97ecd                     vmovq      rbp, xmm1
00e9e 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00ea3 4489442404                     mov        dword ptr [rsp + 4], r8d
00ea8 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
00eae c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
00eb4 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00eb9 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
00ebe c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
00ec4 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00ec9 4c89442428                     mov        qword ptr [rsp + 0x28], r8
00ece c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
00ed4 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ed9 c57a114c2438                   vmovss     dword ptr [rsp + 0x38], xmm9
00edf c57a115c243c                   vmovss     dword ptr [rsp + 0x3c], xmm11
00ee5 c57a11542440                   vmovss     dword ptr [rsp + 0x40], xmm10
00eeb 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
00ef0 666690                         nop        
00ef3 e868e3b5ff                     call       0x7fea6f9d7d60
00ef8 0f1f8400f00f0008               nop        dword ptr [rax + rax + 0x8000ff0]
00f00 be45ffffff                     mov        esi, 0xffffff45
00f05 c4e1f97ecd                     vmovq      rbp, xmm1
00f0a 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f0f 4489542404                     mov        dword ptr [rsp + 4], r10d
00f14 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
00f1a c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
00f20 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f25 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00f2a c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
00f30 c5fb117c2428                   vmovsd     qword ptr [rsp + 0x28], xmm7
00f36 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00f3b 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00f40 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f45 c57a114c2434                   vmovss     dword ptr [rsp + 0x34], xmm9
00f4b c57a115c2438                   vmovss     dword ptr [rsp + 0x38], xmm11
00f51 c57a1154243c                   vmovss     dword ptr [rsp + 0x3c], xmm10
00f57 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
00f5c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f61 6690                           nop        
00f63 e8f8e2b5ff                     call       0x7fea6f9d7d60
00f68 0f1f840060100009               nop        dword ptr [rax + rax + 0x9001060]
00f70 be45ffffff                     mov        esi, 0xffffff45
00f75 c4e1f97ecd                     vmovq      rbp, xmm1
00f7a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f7f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f84 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
00f8a c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
00f90 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f95 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00f9a c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
00fa0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fa5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00faa c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
00fb0 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00fb5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fba c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
00fc0 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
00fc6 c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
00fcc 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00fd1 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00fd5 6690                           nop        
00fd7 e884e2b5ff                     call       0x7fea6f9d7d60
00fdc 0f1f8400d410000a               nop        dword ptr [rax + rax + 0xa0010d4]
00fe4 be45ffffff                     mov        esi, 0xffffff45
00fe9 c4e1f97ecd                     vmovq      rbp, xmm1
00fee 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ff3 4489542404                     mov        dword ptr [rsp + 4], r10d
00ff8 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
00ffe c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01004 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01009 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0100e c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
01014 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01019 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0101e c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
01024 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01029 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0102e c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01034 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
0103a c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
01040 c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
01046 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0104b 4489442454                     mov        dword ptr [rsp + 0x54], r8d
01050 666690                         nop        
01053 e808e2b5ff                     call       0x7fea6f9d7d60
01058 0f1f84005011000b               nop        dword ptr [rax + rax + 0xb001150]
01060 be45ffffff                     mov        esi, 0xffffff45
01065 c5fb110c24                     vmovsd     qword ptr [rsp], xmm1
0106a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0106f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01074 c5fb11742410                   vmovsd     qword ptr [rsp + 0x10], xmm6
0107a c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
01080 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01085 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0108a c5fa116c2428                   vmovss     dword ptr [rsp + 0x28], xmm5
01090 c5fb117c2438                   vmovsd     qword ptr [rsp + 0x38], xmm7
01096 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0109b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
010a0 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
010a5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
010aa c57a114c2444                   vmovss     dword ptr [rsp + 0x44], xmm9
010b0 c57a115c2448                   vmovss     dword ptr [rsp + 0x48], xmm11
010b6 c57a1154244c                   vmovss     dword ptr [rsp + 0x4c], xmm10
010bc c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
010c2 c57a11742454                   vmovss     dword ptr [rsp + 0x54], xmm14
010c8 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
010d0 62e17e0811642419               vmovss     dword ptr [rsp + 0x64], xmm20
010d8 c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
010de 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
010e6 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
010ee 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
010f6 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
010fe 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
01105 c5fa11942490000000             vmovss     dword ptr [rsp + 0x90], xmm2
0110e c5fa11842494000000             vmovss     dword ptr [rsp + 0x94], xmm0
01117 c5fa119c2498000000             vmovss     dword ptr [rsp + 0x98], xmm3
01120 666690                         nop        
01123 e838e1b5ff                     call       0x7fea6f9d7d60
01128 0f1f84002012000c               nop        dword ptr [rax + rax + 0xc001220]
01130 be45ffffff                     mov        esi, 0xffffff45
01135 c4e1f97ecd                     vmovq      rbp, xmm1
0113a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0113f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01144 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
0114a c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01150 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01158 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0115d 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01162 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01167 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
0116d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01172 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01177 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
0117d 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01182 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01187 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
0118c 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01191 c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01197 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
0119d c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
011a3 c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
011a9 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
011af 62e1ff081154240a               vmovsd     qword ptr [rsp + 0x50], xmm18
011b7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
011bc 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
011c1 62e17e0811642417               vmovss     dword ptr [rsp + 0x5c], xmm20
011c9 c57b117c2460                   vmovsd     qword ptr [rsp + 0x60], xmm15
011cf 62e1ff08114c240d               vmovsd     qword ptr [rsp + 0x68], xmm17
011d7 62e1ff081144240e               vmovsd     qword ptr [rsp + 0x70], xmm16
011df 4489742478                     mov        dword ptr [rsp + 0x78], r14d
011e4 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
011e9 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
011f0 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
011f8 c5fa1194248c000000             vmovss     dword ptr [rsp + 0x8c], xmm2
01201 c5fa11842490000000             vmovss     dword ptr [rsp + 0x90], xmm0
0120a c5fa119c2494000000             vmovss     dword ptr [rsp + 0x94], xmm3
01213 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0121b 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
01223 e838e0b5ff                     call       0x7fea6f9d7d60
01228 0f1f84002013000d               nop        dword ptr [rax + rax + 0xd001320]
01230 be45ffffff                     mov        esi, 0xffffff45
01235 c4e1f97ecd                     vmovq      rbp, xmm1
0123a 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0123f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01244 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
0124a c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01250 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
01258 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
0125d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01262 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01267 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
0126d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01272 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01277 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
0127d 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
01282 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01287 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0128c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01291 c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01297 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
0129d c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
012a3 c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
012a9 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
012af 62e1ff081154240a               vmovsd     qword ptr [rsp + 0x50], xmm18
012b7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
012bc 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
012c1 62e17e0811642417               vmovss     dword ptr [rsp + 0x5c], xmm20
012c9 c57b117c2460                   vmovsd     qword ptr [rsp + 0x60], xmm15
012cf 62e1ff08114c240d               vmovsd     qword ptr [rsp + 0x68], xmm17
012d7 62e1ff081144240e               vmovsd     qword ptr [rsp + 0x70], xmm16
012df 4489742478                     mov        dword ptr [rsp + 0x78], r14d
012e4 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012e9 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
012f0 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
012f8 c5fa1194248c000000             vmovss     dword ptr [rsp + 0x8c], xmm2
01301 c5fa11842490000000             vmovss     dword ptr [rsp + 0x90], xmm0
0130a c5fa119c2494000000             vmovss     dword ptr [rsp + 0x94], xmm3
01313 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0131b 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
01323 e838dfb5ff                     call       0x7fea6f9d7d60
01328 0f1f84002014000e               nop        dword ptr [rax + rax + 0xe001420]
01330 be45ffffff                     mov        esi, 0xffffff45
01335 c4e1f97ecd                     vmovq      rbp, xmm1
0133a 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0133f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01344 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
0134a c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01350 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
01358 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
0135d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01362 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01367 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
0136d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01372 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01377 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
0137d 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
01382 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01387 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0138c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01391 c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01397 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
0139d c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
013a3 c57a116c244c                   vmovss     dword ptr [rsp + 0x4c], xmm13
013a9 c57a11742450                   vmovss     dword ptr [rsp + 0x50], xmm14
013af 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
013b7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
013bc 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
013c1 62e17e0811642418               vmovss     dword ptr [rsp + 0x60], xmm20
013c9 c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
013cf 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
013d7 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
013df 4489742464                     mov        dword ptr [rsp + 0x64], r14d
013e4 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
013ec 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
013f3 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013fb 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01402 c5fa11942494000000             vmovss     dword ptr [rsp + 0x94], xmm2
0140b c5fa11842498000000             vmovss     dword ptr [rsp + 0x98], xmm0
01414 c5fa119c24a8000000             vmovss     dword ptr [rsp + 0xa8], xmm3
0141d 6690                           nop        
0141f e83cdeb5ff                     call       0x7fea6f9d7d60
01424 0f1f84001c15000f               nop        dword ptr [rax + rax + 0xf00151c]
0142c be45ffffff                     mov        esi, 0xffffff45
01431 c4e1f97ecd                     vmovq      rbp, xmm1
01436 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0143b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01440 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
01446 c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
0144c 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01454 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01459 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0145e 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01463 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
01469 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0146e 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01473 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
01479 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0147e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01483 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
01488 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0148d c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01493 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
01499 c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
0149f c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
014a5 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
014ab 62e1ff081154240a               vmovsd     qword ptr [rsp + 0x50], xmm18
014b3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
014b8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
014bd 62e17e0811642417               vmovss     dword ptr [rsp + 0x5c], xmm20
014c5 c57b117c2460                   vmovsd     qword ptr [rsp + 0x60], xmm15
014cb 62e1ff08114c240d               vmovsd     qword ptr [rsp + 0x68], xmm17
014d3 62e1ff081144240e               vmovsd     qword ptr [rsp + 0x70], xmm16
014db 4489742478                     mov        dword ptr [rsp + 0x78], r14d
014e0 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014e5 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
014ec 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
014f4 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
014fc c5fa11942494000000             vmovss     dword ptr [rsp + 0x94], xmm2
01505 c5fa11842498000000             vmovss     dword ptr [rsp + 0x98], xmm0
0150e c5fa119c24a8000000             vmovss     dword ptr [rsp + 0xa8], xmm3
01517 e844ddb5ff                     call       0x7fea6f9d7d60
0151c 0f1f840014160010               nop        dword ptr [rax + rax + 0x10001614]
01524 be45ffffff                     mov        esi, 0xffffff45
01529 c4e1f97ecd                     vmovq      rbp, xmm1
0152e 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01533 4489542404                     mov        dword ptr [rsp + 4], r10d
01538 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
0153e c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01544 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0154c 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01551 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01556 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0155b c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
01561 c5fb117c2428                   vmovsd     qword ptr [rsp + 0x28], xmm7
01567 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0156c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01571 c57a114c2434                   vmovss     dword ptr [rsp + 0x34], xmm9
01577 c57a115c2438                   vmovss     dword ptr [rsp + 0x38], xmm11
0157d c57a1154243c                   vmovss     dword ptr [rsp + 0x3c], xmm10
01583 c57a116c2440                   vmovss     dword ptr [rsp + 0x40], xmm13
01589 c57a11742444                   vmovss     dword ptr [rsp + 0x44], xmm14
0158f 62e1ff0811542409               vmovsd     qword ptr [rsp + 0x48], xmm18
01597 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0159c 4489542450                     mov        dword ptr [rsp + 0x50], r10d
015a1 62e17e0811642415               vmovss     dword ptr [rsp + 0x54], xmm20
015a9 c57b117c2458                   vmovsd     qword ptr [rsp + 0x58], xmm15
015af 62e1ff08114c240c               vmovsd     qword ptr [rsp + 0x60], xmm17
015b7 62e1ff081144240d               vmovsd     qword ptr [rsp + 0x68], xmm16
015bf 4489742470                     mov        dword ptr [rsp + 0x70], r14d
015c4 4489442474                     mov        dword ptr [rsp + 0x74], r8d
015c9 895c2478                       mov        dword ptr [rsp + 0x78], ebx
015cd 4889842480000000               mov        qword ptr [rsp + 0x80], rax
015d5 c5fa11942488000000             vmovss     dword ptr [rsp + 0x88], xmm2
015de c5fa1184248c000000             vmovss     dword ptr [rsp + 0x8c], xmm0
015e7 c5fa119c2490000000             vmovss     dword ptr [rsp + 0x90], xmm3
015f0 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
015f8 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01600 666690                         nop        
01603 e858dcb5ff                     call       0x7fea6f9d7d60
01608 0f1f840000170011               nop        dword ptr [rax + rax + 0x11001700]
01610 be45ffffff                     mov        esi, 0xffffff45
01615 c4e1f97ecd                     vmovq      rbp, xmm1
0161a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0161f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01624 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
0162a c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01630 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01638 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0163d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01642 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01647 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
0164d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01652 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01657 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
0165d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01662 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01667 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0166c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01671 c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01677 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
0167d c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
01683 c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
01689 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
0168f 62e1ff081154240a               vmovsd     qword ptr [rsp + 0x50], xmm18
01697 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0169c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
016a1 62e17e0811642417               vmovss     dword ptr [rsp + 0x5c], xmm20
016a9 c57b117c2460                   vmovsd     qword ptr [rsp + 0x60], xmm15
016af 62e1ff08114c240d               vmovsd     qword ptr [rsp + 0x68], xmm17
016b7 62e1ff081144240e               vmovsd     qword ptr [rsp + 0x70], xmm16
016bf 4489742478                     mov        dword ptr [rsp + 0x78], r14d
016c4 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016c9 4889842490000000               mov        qword ptr [rsp + 0x90], rax
016d1 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
016d8 c5fa11942498000000             vmovss     dword ptr [rsp + 0x98], xmm2
016e1 c5fa118424a8000000             vmovss     dword ptr [rsp + 0xa8], xmm0
016ea c5fa119c24ac000000             vmovss     dword ptr [rsp + 0xac], xmm3
016f3 e868dbb5ff                     call       0x7fea6f9d7d60
016f8 0f1f8400f0170012               nop        dword ptr [rax + rax + 0x120017f0]
01700 be45ffffff                     mov        esi, 0xffffff45
01705 8beb                           mov        ebp, ebx
01707 c5fb110c24                     vmovsd     qword ptr [rsp], xmm1
0170c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01711 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01716 c5fb11742410                   vmovsd     qword ptr [rsp + 0x10], xmm6
0171c c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
01722 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0172a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0172f 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01734 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01739 c5fa116c2428                   vmovss     dword ptr [rsp + 0x28], xmm5
0173f c5fb117c2438                   vmovsd     qword ptr [rsp + 0x38], xmm7
01745 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0174a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0174f 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
01754 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01759 c57a114c2444                   vmovss     dword ptr [rsp + 0x44], xmm9
0175f c57a115c2448                   vmovss     dword ptr [rsp + 0x48], xmm11
01765 c57a1154244c                   vmovss     dword ptr [rsp + 0x4c], xmm10
0176b c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
01771 c57a11742454                   vmovss     dword ptr [rsp + 0x54], xmm14
01777 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
0177f 62e17e0811642419               vmovss     dword ptr [rsp + 0x64], xmm20
01787 c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
0178d 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
01795 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
0179d 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
017a5 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
017ad 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
017b5 c5fa119424a8000000             vmovss     dword ptr [rsp + 0xa8], xmm2
017be c5fa118424ac000000             vmovss     dword ptr [rsp + 0xac], xmm0
017c7 c5fa119c24b0000000             vmovss     dword ptr [rsp + 0xb0], xmm3
017d0 666690                         nop        
017d3 e888dab5ff                     call       0x7fea6f9d7d60
017d8 0f1f8400d0180013               nop        dword ptr [rax + rax + 0x130018d0]
017e0 be45ffffff                     mov        esi, 0xffffff45
017e5 458bd8                         mov        r11d, r8d
017e8 458bcb                         mov        r9d, r11d
017eb 8beb                           mov        ebp, ebx
017ed c5fb110c24                     vmovsd     qword ptr [rsp], xmm1
017f2 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
017f7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017fc c5fb11742410                   vmovsd     qword ptr [rsp + 0x10], xmm6
01802 c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
01808 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01810 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01815 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0181a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0181f c5fa116c2428                   vmovss     dword ptr [rsp + 0x28], xmm5
01825 c5fb117c2438                   vmovsd     qword ptr [rsp + 0x38], xmm7
0182b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01830 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01835 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0183a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0183f c57a114c2444                   vmovss     dword ptr [rsp + 0x44], xmm9
01845 c57a115c2448                   vmovss     dword ptr [rsp + 0x48], xmm11
0184b c57a1154244c                   vmovss     dword ptr [rsp + 0x4c], xmm10
01851 c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
01857 c57a11742454                   vmovss     dword ptr [rsp + 0x54], xmm14
0185d 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
01865 62e17e0811642419               vmovss     dword ptr [rsp + 0x64], xmm20
0186d c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
01873 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
0187b 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
01883 4c89ac2480000000               mov        qword ptr [rsp + 0x80], r13
0188b 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
01893 c5fa1194248c000000             vmovss     dword ptr [rsp + 0x8c], xmm2
0189c c5fa11842490000000             vmovss     dword ptr [rsp + 0x90], xmm0
018a5 c5fa119c2494000000             vmovss     dword ptr [rsp + 0x94], xmm3
018ae 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
018b6 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
018be 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
018c6 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
018ce 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
018d6 90                             nop        
018d7 e884d9b5ff                     call       0x7fea6f9d7d60
018dc 0f1f8400d4190014               nop        dword ptr [rax + rax + 0x140019d4]
018e4 be45ffffff                     mov        esi, 0xffffff45
018e9 41bbffffff7f                   mov        r11d, 0x7fffffff
018ef 493bc3                         cmp        rax, r11
018f2 bdffffffff                     mov        ebp, 0xffffffff
018f7 7c08                           jl         0x7fea6fe7a401
018f9 400f95c5                       setne      bpl
018fd 400fb6ed                       movzx      ebp, bpl
01901 c5fb110c24                     vmovsd     qword ptr [rsp], xmm1
01906 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0190b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01910 c5fb11742410                   vmovsd     qword ptr [rsp + 0x10], xmm6
01916 c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
0191c 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01924 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01929 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0192e 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01933 c5fa116c2428                   vmovss     dword ptr [rsp + 0x28], xmm5
01939 c5fb117c2438                   vmovsd     qword ptr [rsp + 0x38], xmm7
0193f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01944 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01949 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
0194e 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01953 c57a114c2444                   vmovss     dword ptr [rsp + 0x44], xmm9
01959 c57a115c2448                   vmovss     dword ptr [rsp + 0x48], xmm11
0195f c57a1154244c                   vmovss     dword ptr [rsp + 0x4c], xmm10
01965 c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
0196b 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
01973 c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
01979 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
01981 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
01989 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
01991 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01999 c57a11b42488000000             vmovss     dword ptr [rsp + 0x88], xmm14
019a2 62e17e0811642423               vmovss     dword ptr [rsp + 0x8c], xmm20
019aa 4889842490000000               mov        qword ptr [rsp + 0x90], rax
019b2 c5fa11942498000000             vmovss     dword ptr [rsp + 0x98], xmm2
019bb c5fa118424a8000000             vmovss     dword ptr [rsp + 0xa8], xmm0
019c4 c5fa119c24b0000000             vmovss     dword ptr [rsp + 0xb0], xmm3
019cd 6690                           nop        
019cf e88cd8b5ff                     call       0x7fea6f9d7d60
019d4 0f1f8400cc1a0015               nop        dword ptr [rax + rax + 0x15001acc]
019dc be45ffffff                     mov        esi, 0xffffff45
019e1 c4e1f97ecd                     vmovq      rbp, xmm1
019e6 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
019eb 4489442404                     mov        dword ptr [rsp + 4], r8d
019f0 c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
019f6 c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
019fc 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01a04 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01a09 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01a0e 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01a13 c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
01a19 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a1e 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01a23 c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
01a29 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01a2e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01a33 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01a38 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a3d c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01a43 c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
01a49 c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
01a4f c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
01a55 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
01a5b 62e1ff081154240a               vmovsd     qword ptr [rsp + 0x50], xmm18
01a63 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01a68 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01a6d 62e17e0811642417               vmovss     dword ptr [rsp + 0x5c], xmm20
01a75 c57b117c2460                   vmovsd     qword ptr [rsp + 0x60], xmm15
01a7b 62e1ff08114c240d               vmovsd     qword ptr [rsp + 0x68], xmm17
01a83 62e1ff081144240e               vmovsd     qword ptr [rsp + 0x70], xmm16
01a8b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01a90 c5fa1154247c                   vmovss     dword ptr [rsp + 0x7c], xmm2
01a96 c5fa11842480000000             vmovss     dword ptr [rsp + 0x80], xmm0
01a9f c5fa119c2484000000             vmovss     dword ptr [rsp + 0x84], xmm3
01aa8 666690                         nop        
01aab e8b0d7b5ff                     call       0x7fea6f9d7d60
01ab0 0f1f8400a81b0016               nop        dword ptr [rax + rax + 0x16001ba8]
01ab8 be45ffffff                     mov        esi, 0xffffff45
01abd c4e1f97ecd                     vmovq      rbp, xmm1
01ac2 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ac7 4489542404                     mov        dword ptr [rsp + 4], r10d
01acc c5fb11742408                   vmovsd     qword ptr [rsp + 8], xmm6
01ad2 c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01ad8 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01ae0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01ae5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01aea 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01aef c5fa116c2420                   vmovss     dword ptr [rsp + 0x20], xmm5
01af5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01afa 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01aff c5fb117c2430                   vmovsd     qword ptr [rsp + 0x30], xmm7
01b05 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01b0a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b0f 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01b14 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b19 c57a114c243c                   vmovss     dword ptr [rsp + 0x3c], xmm9
01b1f c57a115c2440                   vmovss     dword ptr [rsp + 0x40], xmm11
01b25 c57a11542444                   vmovss     dword ptr [rsp + 0x44], xmm10
01b2b c57a116c2448                   vmovss     dword ptr [rsp + 0x48], xmm13
01b31 c57a1174244c                   vmovss     dword ptr [rsp + 0x4c], xmm14
01b37 62e1ff081154240a               vmovsd     qword ptr [rsp + 0x50], xmm18
01b3f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b44 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01b49 62e17e0811642417               vmovss     dword ptr [rsp + 0x5c], xmm20
01b51 c57b117c2460                   vmovsd     qword ptr [rsp + 0x60], xmm15
01b57 62e1ff08114c240d               vmovsd     qword ptr [rsp + 0x68], xmm17
01b5f 62e1ff081144240e               vmovsd     qword ptr [rsp + 0x70], xmm16
01b67 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01b6c c5fa1154247c                   vmovss     dword ptr [rsp + 0x7c], xmm2
01b72 c5fa11842480000000             vmovss     dword ptr [rsp + 0x80], xmm0
01b7b c5fa119c2484000000             vmovss     dword ptr [rsp + 0x84], xmm3
01b84 666690                         nop        
01b87 e8d4d6b5ff                     call       0x7fea6f9d7d60
01b8c 0f1f8400841c0017               nop        dword ptr [rax + rax + 0x17001c84]
01b94 be3dffffff                     mov        esi, 0xffffff3d
01b99 8be8                           mov        ebp, eax
01b9b c5fb110c24                     vmovsd     qword ptr [rsp], xmm1
01ba0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ba5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01baa c5fb11742410                   vmovsd     qword ptr [rsp + 0x10], xmm6
01bb0 c5fb11642418                   vmovsd     qword ptr [rsp + 0x18], xmm4
01bb6 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
01bbe 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01bc3 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01bc8 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01bcd c5fa116c2428                   vmovss     dword ptr [rsp + 0x28], xmm5
01bd3 c5fb117c2438                   vmovsd     qword ptr [rsp + 0x38], xmm7
01bd9 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01bde 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01be3 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
01be8 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01bed c57a114c2444                   vmovss     dword ptr [rsp + 0x44], xmm9
01bf3 c57a115c2448                   vmovss     dword ptr [rsp + 0x48], xmm11
01bf9 c57a1154244c                   vmovss     dword ptr [rsp + 0x4c], xmm10
01bff c57a116c2450                   vmovss     dword ptr [rsp + 0x50], xmm13
01c05 62e1ff081154240b               vmovsd     qword ptr [rsp + 0x58], xmm18
01c0d c57b117c2468                   vmovsd     qword ptr [rsp + 0x68], xmm15
01c13 62e1ff08114c240e               vmovsd     qword ptr [rsp + 0x70], xmm17
01c1b 62e1ff081144240f               vmovsd     qword ptr [rsp + 0x78], xmm16
01c23 c57a11b42480000000             vmovss     dword ptr [rsp + 0x80], xmm14
01c2c 62e17e0811642421               vmovss     dword ptr [rsp + 0x84], xmm20
01c34 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01c3c 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01c44 c5fa11942490000000             vmovss     dword ptr [rsp + 0x90], xmm2
01c4d c5fa11842494000000             vmovss     dword ptr [rsp + 0x94], xmm0
01c56 c5fa119c24a8000000             vmovss     dword ptr [rsp + 0xa8], xmm3
01c5f e8fcd5b5ff                     call       0x7fea6f9d7d60
01c64 0f1f84005c1d0018               nop        dword ptr [rax + rax + 0x18001d5c]
01c6c 4d3bc2                         cmp        r8, r10
01c6f bdffffffff                     mov        ebp, 0xffffffff
01c74 7c08                           jl         0x7fea6fe7a77e
01c76 400f95c5                       setne      bpl
01c7a 400fb6ed                       movzx      ebp, bpl
01c7e be45ffffff                     mov        esi, 0xffffff45
01c83 e8d8d5b5ff                     call       0x7fea6f9d7d60
01c88 0f1f8400801d0019               nop        dword ptr [rax + rax + 0x19001d80]
01c90 be45ffffff                     mov        esi, 0xffffff45
01c95 6690                           nop        
01c97 e8c4d5b5ff                     call       0x7fea6f9d7d60
01c9c 0f1f8400941d001a               nop        dword ptr [rax + rax + 0x1a001d94]
01ca4 be6effffff                     mov        esi, 0xffffff6e
01ca9 c4e1f97ecd                     vmovq      rbp, xmm1
01cae c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
01cb4 c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01cba 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01cbf 89442420                       mov        dword ptr [rsp + 0x20], eax
01cc3 c5fa116c2424                   vmovss     dword ptr [rsp + 0x24], xmm5
01cc9 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01ccd 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01cd1 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01cd5 6690                           nop        
01cd7 e884d5b5ff                     call       0x7fea6f9d7d60
01cdc 0f1f8400d41d001b               nop        dword ptr [rax + rax + 0x1b001dd4]
01ce4 be6effffff                     mov        esi, 0xffffff6e
01ce9 c4e1f97ecd                     vmovq      rbp, xmm1
01cee 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01cf3 44894c2404                     mov        dword ptr [rsp + 4], r9d
01cf8 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
01cfe c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01d04 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01d09 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d0e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d13 c5fa116c2424                   vmovss     dword ptr [rsp + 0x24], xmm5
01d19 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d1e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d23 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01d28 897c2444                       mov        dword ptr [rsp + 0x44], edi
01d2c 666690                         nop        
01d2f e82cd5b5ff                     call       0x7fea6f9d7d60
01d34 0f1f84002c1e001c               nop        dword ptr [rax + rax + 0x1c001e2c]
01d3c be66ffffff                     mov        esi, 0xffffff66
01d41 c4e1f97ecd                     vmovq      rbp, xmm1
01d46 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
01d4c c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01d52 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01d57 89442420                       mov        dword ptr [rsp + 0x20], eax
01d5b c5fa116c2424                   vmovss     dword ptr [rsp + 0x24], xmm5
01d61 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01d65 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01d69 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01d6d 6690                           nop        
01d6f e8ecd4b5ff                     call       0x7fea6f9d7d60
01d74 0f1f84006c1e001d               nop        dword ptr [rax + rax + 0x1d001e6c]
01d7c be66ffffff                     mov        esi, 0xffffff66
01d81 c4e1f97ecd                     vmovq      rbp, xmm1
01d86 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01d8b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01d90 c5fb11442408                   vmovsd     qword ptr [rsp + 8], xmm0
01d96 c5fb11642410                   vmovsd     qword ptr [rsp + 0x10], xmm4
01d9c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01da1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01da6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01dab c5fa116c2424                   vmovss     dword ptr [rsp + 0x24], xmm5
01db1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01db6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01dbb 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01dc0 897c2444                       mov        dword ptr [rsp + 0x44], edi
01dc4 666690                         nop        
01dc7 e894d4b5ff                     call       0x7fea6f9d7d60
01dcc 0f1f8400c41e001e               nop        dword ptr [rax + rax + 0x1e001ec4]
01dd4 bef6ffffff                     mov        esi, 0xfffffff6
01dd9 418bea                         mov        ebp, r10d
01ddc 666690                         nop        
01ddf e87cd4b5ff                     call       0x7fea6f9d7d60
01de4 0f1f8400dc1e001f               nop        dword ptr [rax + rax + 0x1f001edc]
01dec bef6ffffff                     mov        esi, 0xfffffff6
01df1 6690                           nop        
01df3 e868d4b5ff                     call       0x7fea6f9d7d60
01df8 0f1f8400f01e0020               nop        dword ptr [rax + rax + 0x20001ef0]
01e00 bef6ffffff                     mov        esi, 0xfffffff6
01e05 6690                           nop        
01e07 e854d4b5ff                     call       0x7fea6f9d7d60
01e0c 0f1f8400041f0021               nop        dword ptr [rax + rax + 0x21001f04]
01e14 bef6ffffff                     mov        esi, 0xfffffff6
01e19 6690                           nop        
01e1b e840d4b5ff                     call       0x7fea6f9d7d60
01e20 0f1f8400181f0022               nop        dword ptr [rax + rax + 0x22001f18]
01e28 bef6ffffff                     mov        esi, 0xfffffff6
01e2d 6690                           nop        
01e2f e82cd4b5ff                     call       0x7fea6f9d7d60
01e34 0f1f84002c1f0023               nop        dword ptr [rax + rax + 0x23001f2c]
01e3c bef6ffffff                     mov        esi, 0xfffffff6
01e41 6690                           nop        
01e43 e818d4b5ff                     call       0x7fea6f9d7d60
01e48 0f1f8400401f0024               nop        dword ptr [rax + rax + 0x24001f40]
01e50 bef6ffffff                     mov        esi, 0xfffffff6
01e55 6690                           nop        
01e57 e804d4b5ff                     call       0x7fea6f9d7d60
01e5c 0f1f8400541f0025               nop        dword ptr [rax + rax + 0x25001f54]
01e64 bef6ffffff                     mov        esi, 0xfffffff6
01e69 6690                           nop        
01e6b e8f0d3b5ff                     call       0x7fea6f9d7d60
01e70 0f1f8400681f0026               nop        dword ptr [rax + rax + 0x26001f68]
01e78 bef6ffffff                     mov        esi, 0xfffffff6
01e7d 6690                           nop        
01e7f e8dcd3b5ff                     call       0x7fea6f9d7d60
01e84 0f1f84007c1f0027               nop        dword ptr [rax + rax + 0x27001f7c]
01e8c 49ba8594e76fea7f0000           movabs     r10, 0x7fea6fe79485
01e96 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01e9d e93e85a9ff                     jmp        0x7fea6f912ee0
01ea2 e8f950a8ff                     call       0x7fea6f8ffaa0
01ea7 e972e1ffff                     jmp        0x7fea6fe78b1e
01eac f4                             hlt        
01ead f4                             hlt        
01eae f4                             hlt        
01eaf f4                             hlt        
