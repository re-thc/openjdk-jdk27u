00000 e83b114219                     call       0x7fd1dd29b740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8500280000                   jne        0x7fd1c3e7ce2e
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
00035 4c8bb638010000                 mov        r14, qword ptr [rsi + 0x138]
0003c 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
00040 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00045 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
0004c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00051 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00058 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0005d 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00064 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00069 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00070 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00075 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
0007c 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00081 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
00088 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0008d 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
00094 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
0009b 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
000a3 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000aa 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
000af 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b6 4c89542460                     mov        qword ptr [rsp + 0x60], r10
000bb 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000c2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
000c7 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000ce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000d3 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d7 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000dc 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e0 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000e5 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000ec 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000f4 488bfe                         mov        rdi, rsi
000f7 c5f877                         vzeroupper 
000fa 49ba00a737ddd17f0000           movabs     r10, 0x7fd1dd37a700
00104 41ffd2                         call       r10
00107 0f1f840000000000               nop        dword ptr [rax + rax]
0010f 4885db                         test       rbx, rbx
00112 0f84f4170000                   je         0x7fd1c3e7bf0c
00118 448b5b04                       mov        r11d, dword ptr [rbx + 4]
0011c 41c1eb0a                       shr        r11d, 0xa
00120 4181fb0c080000                 cmp        r11d, 0x80c
00127 0f85371b0000                   jne        0x7fd1c3e7c264
0012d 4c8bd3                         mov        r10, rbx
00130 4c89542408                     mov        qword ptr [rsp + 8], r10
00135 4d85f6                         test       r14, r14
00138 0f84db170000                   je         0x7fd1c3e7bf19
0013e 458b5604                       mov        r10d, dword ptr [r14 + 4]
00142 41c1ea0a                       shr        r10d, 0xa
00146 4181fa05020000                 cmp        r10d, 0x205
0014d 0f85111b0000                   jne        0x7fd1c3e7c264
00153 4d8bd6                         mov        r10, r14
00156 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0015e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00163 4d85d2                         test       r10, r10
00166 0f84bd170000                   je         0x7fd1c3e7bf29
0016c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00170 41c1eb0a                       shr        r11d, 0xa
00174 4181fb08020000                 cmp        r11d, 0x208
0017b 0f85e31a0000                   jne        0x7fd1c3e7c264
00181 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00189 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0018e 4d85d2                         test       r10, r10
00191 0f84a2170000                   je         0x7fd1c3e7bf39
00197 458b5204                       mov        r10d, dword ptr [r10 + 4]
0019b 41c1ea0a                       shr        r10d, 0xa
0019f 4181fa07020000                 cmp        r10d, 0x207
001a6 0f85b81a0000                   jne        0x7fd1c3e7c264
001ac 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
001b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001bb 4d85d2                         test       r10, r10
001be 0f8482170000                   je         0x7fd1c3e7bf46
001c4 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001c8 41c1eb0a                       shr        r11d, 0xa
001cc 4181fb07020000                 cmp        r11d, 0x207
001d3 0f858b1a0000                   jne        0x7fd1c3e7c264
001d9 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001e1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001e6 4d85d2                         test       r10, r10
001e9 0f8467170000                   je         0x7fd1c3e7bf56
001ef 458b5204                       mov        r10d, dword ptr [r10 + 4]
001f3 41c1ea0a                       shr        r10d, 0xa
001f7 4181fa05020000                 cmp        r10d, 0x205
001fe 0f85601a0000                   jne        0x7fd1c3e7c264
00204 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00209 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
00211 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00219 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021d 44895c2404                     mov        dword ptr [rsp + 4], r11d
00222 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00227 4585d2                         test       r10d, r10d
0022a 0f84d8190000                   je         0x7fd1c3e7c208
00230 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00238 458b5208                       mov        r10d, dword ptr [r10 + 8]
0023c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00241 4585d2                         test       r10d, r10d
00244 0f86be190000                   jbe        0x7fd1c3e7c208
0024a 4183fa01                       cmp        r10d, 1
0024e 0f86b4190000                   jbe        0x7fd1c3e7c208
00254 4183fa02                       cmp        r10d, 2
00258 0f86aa190000                   jbe        0x7fd1c3e7c208
0025e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00266 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0026a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0026f 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00277 458b5208                       mov        r10d, dword ptr [r10 + 8]
0027b 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00280 4183c3f1                       add        r11d, -0xf
00284 4585db                         test       r11d, r11d
00287 0f8c7b190000                   jl         0x7fd1c3e7c208
0028d 4183c2f1                       add        r10d, -0xf
00291 4585d2                         test       r10d, r10d
00294 0f8c6e190000                   jl         0x7fd1c3e7c208
0029a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0029f 4183c3f9                       add        r11d, -7
002a3 4585db                         test       r11d, r11d
002a6 0f8c5c190000                   jl         0x7fd1c3e7c208
002ac 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
002b1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
002b6 4d63d2                         movsxd     r10, r10d
002b9 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002be 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
002c3 4183c2f1                       add        r10d, -0xf
002c7 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
002cf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
002d4 4983c2f1                       add        r10, -0xf
002d8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002dd 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002e2 458d5af1                       lea        r11d, [r10 - 0xf]
002e6 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
002ee 4d63d2                         movsxd     r10, r10d
002f1 4983c2f1                       add        r10, -0xf
002f5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
002fa e9f5010000                     jmp        0x7fd1c3e7aaf4
002ff 33db                           xor        ebx, ebx
00301 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
00308 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00310 458b4a10                       mov        r9d, dword ptr [r10 + 0x10]
00314 4183fb03                       cmp        r11d, 3
00318 0f8ec2030000                   jle        0x7fd1c3e7ace0
0031e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00326 45894a14                       mov        dword ptr [r10 + 0x14], r9d
0032a 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0032e 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00336 45895310                       mov        dword ptr [r11 + 0x10], r10d
0033a 448d52fd                       lea        r10d, [rdx - 3]
0033e 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00343 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00347 4c6354247c                     movsxd     r10, dword ptr [rsp + 0x7c]
0034c 4d63c5                         movsxd     r8, r13d
0034f 4c03442460                     add        r8, qword ptr [rsp + 0x60]
00354 4c639c24ac000000               movsxd     r11, dword ptr [rsp + 0xac]
0035c 4d8bcb                         mov        r9, r11
0035f 4d03c3                         add        r8, r11
00362 4d3bd0                         cmp        r10, r8
00365 0f8f11140000                   jg         0x7fd1c3e7bd7c
0036b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00370 4585d2                         test       r10d, r10d
00373 0f8e77130000                   jle        0x7fd1c3e7bcf0
00379 418bdd                         mov        ebx, r13d
0037c 039c24ac000000                 add        ebx, dword ptr [rsp + 0xac]
00383 4863ac24a8000000               movsxd     rbp, dword ptr [rsp + 0xa8]
0038b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00393 4403d3                         add        r10d, ebx
00396 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
0039e 44038424ac000000               add        r8d, dword ptr [rsp + 0xac]
003a6 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
003ae 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
003b3 0f8f950c0000                   jg         0x7fd1c3e7b64e
003b9 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
003be 0f8f4c140000                   jg         0x7fd1c3e7be10
003c4 448bb424ac000000               mov        r14d, dword ptr [rsp + 0xac]
003cc 4183fe10                       cmp        r14d, 0x10
003d0 0f8fde010000                   jg         0x7fd1c3e7abb4
003d6 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
003dd 3b9c24a4000000                 cmp        ebx, dword ptr [rsp + 0xa4]
003e4 0f83ca110000                   jae        0x7fd1c3e7bbb4
003ea 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
003f2 c4c17a6f441b0c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xc]
003f9 443bac24a0000000               cmp        r13d, dword ptr [rsp + 0xa0]
00401 0f833d120000                   jae        0x7fd1c3e7bc44
00407 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0040f 4403d3                         add        r10d, ebx
00412 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0041a 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00422 c4817a7f442a0c                 vmovdqu    xmmword ptr [r10 + r13 + 0xc], xmm0
00429 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
00430 4103dd                         add        ebx, r13d
00433 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
0043a 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00442 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
00447 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
0044f 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00457 4183fa10                       cmp        r10d, 0x10
0045b 0f8f33140000                   jg         0x7fd1c3e7be94
00461 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00466 4183fb10                       cmp        r11d, 0x10
0046a 0f8ca0030000                   jl         0x7fd1c3e7ae10
00470 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00478 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00480 0f8322100000                   jae        0x7fd1c3e7baa8
00486 458bda                         mov        r11d, r10d
00489 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00491 c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
00498 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
004a0 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
004a8 0f836e100000                   jae        0x7fd1c3e7bb1c
004ae 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
004b6 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
004bd 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
004c5 4503ea                         add        r13d, r10d
004c8 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004cc 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
004d1 41ffc3                         inc        r11d
004d4 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
004d9 418502                         test       dword ptr [r10], eax
004dc 48894424f8                     mov        qword ptr [rsp - 8], rax
004e1 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
004e8 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
004ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004f4 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
004fc 4b8d742a0c                     lea        rsi, [r10 + r13 + 0xc]
00501 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00506 442b9424b8000000               sub        r10d, dword ptr [rsp + 0xb8]
0050e 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00516 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
0051d 498d7c1b0c                     lea        rdi, [r11 + rbx + 0xc]
00522 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00527 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0052c 0f8d670a0000                   jge        0x7fd1c3e7b599
00532 443b442404                     cmp        r8d, dword ptr [rsp + 4]
00537 0f83040f0000                   jae        0x7fd1c3e7ba41
0053d 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00545 4f8b5cc310                     mov        r11, qword ptr [r11 + r8*8 + 0x10]
0054a 4d8bc3                         mov        r8, r11
0054d 49c1e812                       shr        r8, 0x12
00551 458bc0                         mov        r8d, r8d
00554 4181e0ffff0300                 and        r8d, 0x3ffff
0055b 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00563 418bdb                         mov        ebx, r11d
00566 49c1fb24                       sar        r11, 0x24
0056a 81e3ffff0100                   and        ebx, 0x1ffff
00570 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
00577 458bdb                         mov        r11d, r11d
0057a 418bd3                         mov        edx, r11d
0057d 4585db                         test       r11d, r11d
00580 0f8c8a110000                   jl         0x7fd1c3e7bd10
00586 85db                           test       ebx, ebx
00588 0f8471fdffff                   je         0x7fd1c3e7a8ff
0058e 413bda                         cmp        ebx, r10d
00591 0f8e71fdffff                   jle        0x7fd1c3e7a908
00597 be45ffffff                     mov        esi, 0xffffff45
0059c 8beb                           mov        ebp, ebx
0059e 44891424                       mov        dword ptr [rsp], r10d
005a2 6690                           nop        
005a4 c5f877                         vzeroupper 
005a7 e8b48bacff                     call       0x7fd1c3943760
005ac 0f1f8400a4060001               nop        dword ptr [rax + rax + 0x10006a4]
005b4 4183fe30                       cmp        r14d, 0x30
005b8 0f8f32080000                   jg         0x7fd1c3e7b3f0
005be 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
005c6 443bb424a4000000               cmp        r14d, dword ptr [rsp + 0xa4]
005ce 0f8392130000                   jae        0x7fd1c3e7bf66
005d4 418bce                         mov        ecx, r14d
005d7 4d63c6                         movsxd     r8, r14d
005da 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005e2 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
005e9 443bac24a0000000               cmp        r13d, dword ptr [rsp + 0xa0]
005f1 0f830d140000                   jae        0x7fd1c3e7c004
005f7 458d5510                       lea        r10d, [r13 + 0x10]
005fb 458bca                         mov        r9d, r10d
005fe 4d63dd                         movsxd     r11, r13d
00601 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00609 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00610 458bd1                         mov        r10d, r9d
00613 443bd3                         cmp        r10d, ebx
00616 0f8da5000000                   jge        0x7fd1c3e7acc1
0061c 4d2bc3                         sub        r8, r11
0061f 4d63da                         movsxd     r11, r10d
00622 4f8d1403                       lea        r10, [r11 + r8]
00626 4c3b542440                     cmp        r10, qword ptr [rsp + 0x40]
0062b 0f839f140000                   jae        0x7fd1c3e7c0d0
00631 4c63d3                         movsxd     r10, ebx
00634 4d2bd3                         sub        r10, r11
00637 4983c20f                       add        r10, 0xf
0063b 4983e2f0                       and        r10, 0xfffffffffffffff0
0063f 458bd2                         mov        r10d, r10d
00642 478d5c2a10                     lea        r11d, [r10 + r13 + 0x10]
00647 4d63db                         movsxd     r11, r11d
0064a 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
0064f 4c3b542440                     cmp        r10, qword ptr [rsp + 0x40]
00654 0f8376140000                   jae        0x7fd1c3e7c0d0
0065a 458bd1                         mov        r10d, r9d
0065d 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00665 0f8365140000                   jae        0x7fd1c3e7c0d0
0066b 4983c3f0                       add        r11, -0x10
0066f 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00674 0f8356140000                   jae        0x7fd1c3e7c0d0
0067a 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00680 0f8fe6140000                   jg         0x7fd1c3e7c16c
00686 458bde                         mov        r11d, r14d
00689 452bdd                         sub        r11d, r13d
0068c 0f1f4000                       nop        dword ptr [rax]
00690 478d140b                       lea        r10d, [r11 + r9]
00694 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0069c c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
006a3 458bc1                         mov        r8d, r9d
006a6 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
006ae c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
006b5 458d5110                       lea        r10d, [r9 + 0x10]
006b9 458bca                         mov        r9d, r10d
006bc 443bd3                         cmp        r10d, ebx
006bf 7ccf                           jl         0x7fd1c3e7ac90
006c1 448bac24ac000000               mov        r13d, dword ptr [rsp + 0xac]
006c9 4403e9                         add        r13d, ecx
006cc 4489ac24b0000000               mov        dword ptr [rsp + 0xb0], r13d
006d4 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
006db e95afdffff                     jmp        0x7fd1c3e7aa3a
006e0 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
006e7 85db                           test       ebx, ebx
006e9 7407                           je         0x7fd1c3e7acf2
006eb 458d53ff                       lea        r10d, [r11 - 1]
006ef 418bd2                         mov        edx, r10d
006f2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
006fa 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
006fe 85d2                           test       edx, edx
00700 0f8481000000                   je         0x7fd1c3e7ad87
00706 83fa03                         cmp        edx, 3
00709 0f84710b0000                   je         0x7fd1c3e7b880
0070f 83fa02                         cmp        edx, 2
00712 777d                           ja         0x7fd1c3e7ad91
00714 3b542414                       cmp        edx, dword ptr [rsp + 0x14]
00718 0f8396150000                   jae        0x7fd1c3e7c2b4
0071e 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00726 458b44930c                     mov        r8d, dword ptr [r11 + rdx*4 + 0xc]
0072b 85d2                           test       edx, edx
0072d 7e4c                           jle        0x7fd1c3e7ad7b
0072f 448d5aff                       lea        r11d, [rdx - 1]
00733 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00738 0f83ba180000                   jae        0x7fd1c3e7c5f8
0073e 33c9                           xor        ecx, ecx
00740 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00748 458bda                         mov        r11d, r10d
0074b 4183c3d0                       add        r11d, -0x30
0074f 41c1eb02                       shr        r11d, 2
00753 458d5413ff                     lea        r10d, [r11 + rdx - 1]
00758 4c63da                         movsxd     r11, edx
0075b 41b904000000                   mov        r9d, 4
00761 c442b0f5d2                     bzhi       r10, r10, r9
00766 4d2bda                         sub        r11, r10
00769 49ffcb                         dec        r11
0076c 4d85db                         test       r11, r11
0076f 4c0f4cd9                       cmovl      r11, rcx
00773 458bd3                         mov        r10d, r11d
00776 e9e8060000                     jmp        0x7fd1c3e7b463
0077b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00783 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00787 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0078c e9b6fbffff                     jmp        0x7fd1c3e7a947
00791 48be48387ce200000000           movabs     rsi, 0xe27c3848
0079b 4c8b542408                     mov        r10, qword ptr [rsp + 8]
007a0 4c891424                       mov        qword ptr [rsp], r10
007a4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
007a9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
007ae 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
007b3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
007b8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007bd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
007c2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
007c7 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
007cc 4489542444                     mov        dword ptr [rsp + 0x44], r10d
007d1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007d6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
007db 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
007e2 6690                           nop        
007e4 c5f877                         vzeroupper 
007e7 e8745aa9ff                     call       0x7fd1c3910860
007ec 0f1f8400e4080002               nop        dword ptr [rax + rax + 0x20008e4]
007f4 4885c0                         test       rax, rax
007f7 0f844f150000                   je         0x7fd1c3e7c34c
007fd 488bf0                         mov        rsi, rax
00800 c5f877                         vzeroupper 
00803 4881c4f0000000                 add        rsp, 0xf0
0080a 5d                             pop        rbp
0080b e950dcacff                     jmp        0x7fd1c3948a60
00810 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00818 4503da                         add        r11d, r10d
0081b 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00823 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00828 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00830 0f8dd2020000                   jge        0x7fd1c3e7b108
00836 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0083e 4183c208                       add        r10d, 8
00842 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0084a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0084f 4183fb08                       cmp        r11d, 8
00853 0f8dd0010000                   jge        0x7fd1c3e7b029
00859 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00861 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00866 0f83241a0000                   jae        0x7fd1c3e7c890
0086c 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00874 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
0087c 430fbe6c020c                   movsx      ebp, byte ptr [r10 + r8 + 0xc]
00882 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0088a 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
0088f 0f83ab1a0000                   jae        0x7fd1c3e7c940
00895 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
0089d 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
008a5 43886c020c                     mov        byte ptr [r10 + r8 + 0xc], bpl
008aa 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
008b2 4183c303                       add        r11d, 3
008b6 448b8c24ac000000               mov        r9d, dword ptr [rsp + 0xac]
008be 41ffc1                         inc        r9d
008c1 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008c6 0f83081b0000                   jae        0x7fd1c3e7c9d4
008cc 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
008d4 4183c303                       add        r11d, 3
008d8 4c639424b4000000               movsxd     r10, dword ptr [rsp + 0xb4]
008e0 4c8b8424d0000000               mov        r8, qword ptr [rsp + 0xd0]
008e8 430fbe6c100d                   movsx      ebp, byte ptr [r8 + r10 + 0xd]
008ee 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008f3 0f838b1b0000                   jae        0x7fd1c3e7ca84
008f9 4c639c24ac000000               movsxd     r11, dword ptr [rsp + 0xac]
00901 43886c180d                     mov        byte ptr [r8 + r11 + 0xd], bpl
00906 470fbe44100e                   movsx      r8d, byte ptr [r8 + r10 + 0xe]
0090c 4c8b8c24d0000000               mov        r9, qword ptr [rsp + 0xd0]
00914 478844190e                     mov        byte ptr [r9 + r11 + 0xe], r8b
00919 470fbe44110f                   movsx      r8d, byte ptr [r9 + r10 + 0xf]
0091f 478844190f                     mov        byte ptr [r9 + r11 + 0xf], r8b
00924 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00929 4183fa08                       cmp        r10d, 8
0092d 0f83ed1b0000                   jae        0x7fd1c3e7cb20
00933 49bab08c79e200000000           movabs     r10, 0xe2798cb0
0093d 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00945 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0094a 47035c820c                     add        r11d, dword ptr [r10 + r8*4 + 0xc]
0094f 44891c24                       mov        dword ptr [rsp], r11d
00953 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0095b 4183fb04                       cmp        r11d, 4
0095f 7e43                           jle        0x7fd1c3e7afa4
00961 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
00968 83c504                         add        ebp, 4
0096b 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00973 8b1424                         mov        edx, dword ptr [rsp]
00976 6690                           nop        
00978 c5f877                         vzeroupper 
0097b e8e058a9ff                     call       0x7fd1c3910860
00980 0f1f8400780a0003               nop        dword ptr [rax + rax + 0x3000a78]
00988 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00990 8bd5                           mov        edx, ebp
00992 8bc8                           mov        ecx, eax
00994 c5f877                         vzeroupper 
00997 e8c458a9ff                     call       0x7fd1c3910860
0099c 0f1f8400940a0004               nop        dword ptr [rax + rax + 0x4000a94]
009a4 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
009ac 4183fa08                       cmp        r10d, 8
009b0 7e6a                           jle        0x7fd1c3e7b01c
009b2 49bae08c79e200000000           movabs     r10, 0xe2798ce0
009bc 8b1424                         mov        edx, dword ptr [rsp]
009bf 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
009c4 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
009c9 83c208                         add        edx, 8
009cc 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
009d4 c5f877                         vzeroupper 
009d7 e88458a9ff                     call       0x7fd1c3910860
009dc 0f1f8400d40a0005               nop        dword ptr [rax + rax + 0x5000ad4]
009e4 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
009eb 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
009f3 44890424                       mov        dword ptr [rsp], r8d
009f7 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
009ff 8b9424bc000000                 mov        edx, dword ptr [rsp + 0xbc]
00a06 488bc8                         mov        rcx, rax
00a09 666690                         nop        
00a0c c5f877                         vzeroupper 
00a0f e84c58a9ff                     call       0x7fd1c3910860
00a14 0f1f84000c0b0006               nop        dword ptr [rax + rax + 0x6000b0c]
00a1c 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
00a24 e99ffaffff                     jmp        0x7fd1c3e7aac8
00a29 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00a31 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
00a38 c5f877                         vzeroupper 
00a3b e82058a9ff                     call       0x7fd1c3910860
00a40 0f1f8400380b0007               nop        dword ptr [rax + rax + 0x7000b38]
00a48 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00a50 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
00a57 488bc8                         mov        rcx, rax
00a5a 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00a61 666690                         nop        
00a64 c5f877                         vzeroupper 
00a67 e8f457a9ff                     call       0x7fd1c3910860
00a6c 0f1f8400640b0008               nop        dword ptr [rax + rax + 0x8000b64]
00a74 448d5d08                       lea        r11d, [rbp + 8]
00a78 458bc3                         mov        r8d, r11d
00a7b be95ffffff                     mov        esi, 0xffffff95
00a80 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00a85 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a8a 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a8f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a99 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a9e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00aa3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00aa8 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00aad 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00ab2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00ab7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00abc 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ac1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00ac6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00acb 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ad0 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00ad5 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00add 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00ae2 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ae7 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00aef 458bd3                         mov        r10d, r11d
00af2 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00af7 90                             nop        
00af8 c5f877                         vzeroupper 
00afb e86086acff                     call       0x7fd1c3943760
00b00 0f1f8400f80b0009               nop        dword ptr [rax + rax + 0x9000bf8]
00b08 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00b10 4183fb30                       cmp        r11d, 0x30
00b14 0f8f0f020000                   jg         0x7fd1c3e7b329
00b1a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b1f 4183c2f9                       add        r10d, -7
00b23 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00b2b 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00b33 453bda                         cmp        r11d, r10d
00b36 0f83d0120000                   jae        0x7fd1c3e7c40c
00b3c 458bd3                         mov        r10d, r11d
00b3f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00b44 4d63d2                         movsxd     r10, r10d
00b47 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00b4c 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00b54 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00b59 4f8b441a0c                     mov        r8, qword ptr [r10 + r11 + 0xc]
00b5e 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00b66 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00b6e 0f8340130000                   jae        0x7fd1c3e7c4b4
00b74 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00b7c 4d63d3                         movsxd     r10, r11d
00b7f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00b84 498d4a0c                       lea        rcx, [r10 + 0xc]
00b88 48be00b722e200000000           movabs     rsi, 0xe222b700
00b92 488b9424d0000000               mov        rdx, qword ptr [rsp + 0xd0]
00b9a 4533c9                         xor        r9d, r9d
00b9d 666690                         nop        
00ba0 c5f877                         vzeroupper 
00ba3 e8b84ca9ff                     call       0x7fd1c390fe60
00ba8 0f1f8400a00c000a               nop        dword ptr [rax + rax + 0xa000ca0]
00bb0 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00bb8 4183c208                       add        r10d, 8
00bbc 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00bc4 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00bcc 0f8d42010000                   jge        0x7fd1c3e7b314
00bd2 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
00bd7 4c2b4c2450                     sub        r9, qword ptr [rsp + 0x50]
00bdc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00be1 4983c2f9                       add        r10, -7
00be5 4c639c24c0000000               movsxd     r11, dword ptr [rsp + 0xc0]
00bed 4f8d040b                       lea        r8, [r11 + r9]
00bf1 4d3bc2                         cmp        r8, r10
00bf4 0f8392140000                   jae        0x7fd1c3e7c68c
00bfa 4c638424b8000000               movsxd     r8, dword ptr [rsp + 0xb8]
00c02 4d2bc3                         sub        r8, r11
00c05 4983c007                       add        r8, 7
00c09 4983e0f8                       and        r8, 0xfffffffffffffff8
00c0d 458bc0                         mov        r8d, r8d
00c10 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00c18 478d5c1808                     lea        r11d, [r8 + r11 + 8]
00c1d 4d63db                         movsxd     r11, r11d
00c20 4f8d440bf8                     lea        r8, [r11 + r9 - 8]
00c25 4d3bc2                         cmp        r8, r10
00c28 0f835e140000                   jae        0x7fd1c3e7c68c
00c2e 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00c36 443b8c24bc000000               cmp        r9d, dword ptr [rsp + 0xbc]
00c3e 0f8348140000                   jae        0x7fd1c3e7c68c
00c44 4983c3f8                       add        r11, -8
00c48 4d3bda                         cmp        r11, r10
00c4b 0f833b140000                   jae        0x7fd1c3e7c68c
00c51 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c59 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c60 0f8fd2140000                   jg         0x7fd1c3e7c738
00c66 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c6b 442b9c24b4000000               sub        r11d, dword ptr [rsp + 0xb4]
00c73 44891c24                       mov        dword ptr [rsp], r11d
00c77 660f1f840000000000             nop        word ptr [rax + rax]
00c80 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00c88 4963cb                         movsxd     rcx, r11d
00c8b 4883c10c                       add        rcx, 0xc
00c8f 8b2c24                         mov        ebp, dword ptr [rsp]
00c92 03ac24c0000000                 add        ebp, dword ptr [rsp + 0xc0]
00c99 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00ca1 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00ca6 48be00b722e200000000           movabs     rsi, 0xe222b700
00cb0 488b9424d0000000               mov        rdx, qword ptr [rsp + 0xd0]
00cb8 4533c9                         xor        r9d, r9d
00cbb 90                             nop        
00cbc c5f877                         vzeroupper 
00cbf e89c4ba9ff                     call       0x7fd1c390fe60
00cc4 0f1f8400bc0d000b               nop        dword ptr [rax + rax + 0xb000dbc]
00ccc 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00cd4 4183c308                       add        r11d, 8
00cd8 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00ce0 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00ce8 7c96                           jl         0x7fd1c3e7b280
00cea eb28                           jmp        0x7fd1c3e7b314
00cec 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00cf4 4d63d2                         movsxd     r10, r10d
00cf7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cfe c442a8f5db                     bzhi       r11, r11, r10
00d03 c4c1fb92fb                     kmovq      k7, r11
00d08 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d0e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d14 448bac24ac000000               mov        r13d, dword ptr [rsp + 0xac]
00d1c 4403ac24a8000000               add        r13d, dword ptr [rsp + 0xa8]
00d24 e99ff7ffff                     jmp        0x7fd1c3e7aac8
00d29 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00d31 4585db                         test       r11d, r11d
00d34 0f8c26120000                   jl         0x7fd1c3e7c560
00d3a 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00d42 4585d2                         test       r10d, r10d
00d45 0f8c15120000                   jl         0x7fd1c3e7c560
00d4b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00d53 4503d3                         add        r10d, r11d
00d56 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
00d5b 453bc2                         cmp        r8d, r10d
00d5e 0f82fc110000                   jb         0x7fd1c3e7c560
00d64 458bd0                         mov        r10d, r8d
00d67 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00d6f 0f82eb110000                   jb         0x7fd1c3e7c560
00d75 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00d7d 4585db                         test       r11d, r11d
00d80 7492                           je         0x7fd1c3e7b314
00d82 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00d8a 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00d92 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
00d97 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
00d9f 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00da4 4883fd20                       cmp        rbp, 0x20
00da8 0f863effffff                   jbe        0x7fd1c3e7b2ec
00dae 488bd5                         mov        rdx, rbp
00db1 c5f877                         vzeroupper 
00db4 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00dbe 41ffd2                         call       r10
00dc1 0f1f840000000000               nop        dword ptr [rax + rax]
00dc9 e946ffffff                     jmp        0x7fd1c3e7b314
00dce 4d63d5                         movsxd     r10, r13d
00dd1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dd8 c442a8f5db                     bzhi       r11, r11, r10
00ddd c4c1fb92fb                     kmovq      k7, r11
00de2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00de8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00dee eb64                           jmp        0x7fd1c3e7b454
00df0 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
00df8 4585f6                         test       r14d, r14d
00dfb 0f8c630f0000                   jl         0x7fd1c3e7c364
00e01 4585ed                         test       r13d, r13d
00e04 0f8c5a0f0000                   jl         0x7fd1c3e7c364
00e0a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e0f 453bd8                         cmp        r11d, r8d
00e12 0f824c0f0000                   jb         0x7fd1c3e7c364
00e18 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00e1d 443bd3                         cmp        r10d, ebx
00e20 0f823e0f0000                   jb         0x7fd1c3e7c364
00e26 448bac24ac000000               mov        r13d, dword ptr [rsp + 0xac]
00e2e 4585ed                         test       r13d, r13d
00e31 7421                           je         0x7fd1c3e7b454
00e33 4983f920                       cmp        r9, 0x20
00e37 7695                           jbe        0x7fd1c3e7b3ce
00e39 498bd1                         mov        rdx, r9
00e3c c5f877                         vzeroupper 
00e3f 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00e49 41ffd2                         call       r10
00e4c 0f1f840000000000               nop        dword ptr [rax + rax]
00e54 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
00e5b e9daf5ffff                     jmp        0x7fd1c3e7aa3a
00e60 418bd3                         mov        edx, r11d
00e63 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00e6b 458b4c9108                     mov        r9d, dword ptr [r9 + rdx*4 + 8]
00e70 488b8c2498000000               mov        rcx, qword ptr [rsp + 0x98]
00e78 44894c910c                     mov        dword ptr [rcx + rdx*4 + 0xc], r9d
00e7d 448d5aff                       lea        r11d, [rdx - 1]
00e81 453bda                         cmp        r11d, r10d
00e84 7fda                           jg         0x7fd1c3e7b460
00e86 4183fb3f                       cmp        r11d, 0x3f
00e8a 0f8ef4110000                   jle        0x7fd1c3e7c684
00e90 448bd2                         mov        r10d, edx
00e93 41ffca                         dec        r10d
00e96 418bca                         mov        ecx, r10d
00e99 eb08                           jmp        0x7fd1c3e7b4a3
00e9b 0f1f440000                     nop        dword ptr [rax + rax]
00ea0 418bca                         mov        ecx, r10d
00ea3 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00eab 62d17e486f848bccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x34]
00eb6 62d17e487f848bd0ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x30], zmm0
00ec1 62d17e486f848b8cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x74]
00ecc 62d17e487f848b90ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x70], zmm0
00ed7 62d17e486f848b4cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb4]
00ee2 62d17e487f848b50ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb0], zmm0
00eed 62d17e486f848b0cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf4]
00ef8 62d17e487f848b10ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf0], zmm0
00f03 448d51c0                       lea        r10d, [rcx - 0x40]
00f07 4183fa3f                       cmp        r10d, 0x3f
00f0b 7f93                           jg         0x7fd1c3e7b4a0
00f0d 4183fa0f                       cmp        r10d, 0xf
00f11 7e31                           jle        0x7fd1c3e7b544
00f13 448bd1                         mov        r10d, ecx
00f16 4183c2c0                       add        r10d, -0x40
00f1a 6690                           nop        
00f1c 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f24 62917e486f8493ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x34]
00f2f 62917e487f8493d0ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x30], zmm0
00f3a 4183c2f0                       add        r10d, -0x10
00f3e 4183fa0f                       cmp        r10d, 0xf
00f42 7fd8                           jg         0x7fd1c3e7b51c
00f44 4585d2                         test       r10d, r10d
00f47 0f8e2ef8ffff                   jle        0x7fd1c3e7ad7b
00f4d 666690                         nop        
00f50 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f58 478b5c9308                     mov        r11d, dword ptr [r11 + r10*4 + 8]
00f5d 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00f65 47895c910c                     mov        dword ptr [r9 + r10*4 + 0xc], r11d
00f6a 41ffca                         dec        r10d
00f6d 4585d2                         test       r10d, r10d
00f70 7fde                           jg         0x7fd1c3e7b550
00f72 e904f8ffff                     jmp        0x7fd1c3e7ad7b
00f77 4d63d2                         movsxd     r10, r10d
00f7a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f81 c442a8f5db                     bzhi       r11, r11, r10
00f86 c4c1fb92fb                     kmovq      k7, r11
00f8b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f91 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f97 eb6c                           jmp        0x7fd1c3e7b605
00f99 85db                           test       ebx, ebx
00f9b 0f8cff150000                   jl         0x7fd1c3e7cba0
00fa1 4585ed                         test       r13d, r13d
00fa4 0f8cf6150000                   jl         0x7fd1c3e7cba0
00faa 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00faf 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00fb4 0f82e6150000                   jb         0x7fd1c3e7cba0
00fba 438d2c2a                       lea        ebp, [r10 + r13]
00fbe 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00fc3 443bdd                         cmp        r11d, ebp
00fc6 0f82d4150000                   jb         0x7fd1c3e7cba0
00fcc 4585d2                         test       r10d, r10d
00fcf 0f8ccb150000                   jl         0x7fd1c3e7cba0
00fd5 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00fda 443b8c24b8000000               cmp        r9d, dword ptr [rsp + 0xb8]
00fe2 7421                           je         0x7fd1c3e7b605
00fe4 4963d2                         movsxd     rdx, r10d
00fe7 4883fa20                       cmp        rdx, 0x20
00feb 768a                           jbe        0x7fd1c3e7b577
00fed c5f877                         vzeroupper 
00ff0 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00ffa 41ffd2                         call       r10
00ffd 0f1f840000000000               nop        dword ptr [rax + rax]
01005 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0100a 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
0100e c5f877                         vzeroupper 
01011 4881c4f0000000                 add        rsp, 0xf0
01018 5d                             pop        rbp
01019 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0101d 0f87f5170000                   ja         0x7fd1c3e7ce18
01023 c3                             ret        
01024 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0102c 4d63d2                         movsxd     r10, r10d
0102f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01036 c442a8f5db                     bzhi       r11, r11, r10
0103b c4c1fb92fb                     kmovq      k7, r11
01040 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01046 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0104c eb79                           jmp        0x7fd1c3e7b6c7
0104e 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
01056 4585d2                         test       r10d, r10d
01059 0f84da030000                   je         0x7fd1c3e7ba39
0105f 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
01067 4585db                         test       r11d, r11d
0106a 0f8c54150000                   jl         0x7fd1c3e7cbc4
01070 4585ed                         test       r13d, r13d
01073 0f8c4b150000                   jl         0x7fd1c3e7cbc4
01079 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0107e 453bd8                         cmp        r11d, r8d
01081 0f823d150000                   jb         0x7fd1c3e7cbc4
01087 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0108c 443bd3                         cmp        r10d, ebx
0108f 0f822f150000                   jb         0x7fd1c3e7cbc4
01095 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
0109d 4585db                         test       r11d, r11d
010a0 7425                           je         0x7fd1c3e7b6c7
010a2 4983f920                       cmp        r9, 0x20
010a6 0f8678ffffff                   jbe        0x7fd1c3e7b624
010ac 498bd1                         mov        rdx, r9
010af c5f877                         vzeroupper 
010b2 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
010bc 41ffd2                         call       r10
010bf 0f1f840000000000               nop        dword ptr [rax + rax]
010c7 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
010cf 4585d2                         test       r10d, r10d
010d2 0f8e9d010000                   jle        0x7fd1c3e7b875
010d8 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
010e0 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
010e5 448bb424a8000000               mov        r14d, dword ptr [rsp + 0xa8]
010ed 4403f3                         add        r14d, ebx
010f0 448bc3                         mov        r8d, ebx
010f3 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
010f8 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
010fd 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01102 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
0110a 0f8dd8000000                   jge        0x7fd1c3e7b7e8
01110 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01118 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0111d 458bda                         mov        r11d, r10d
01120 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01125 450f4fda                       cmovg      r11d, r10d
01129 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
01131 4585c0                         test       r8d, r8d
01134 0f8c46150000                   jl         0x7fd1c3e7cc80
0113a 85db                           test       ebx, ebx
0113c 0f8c3e150000                   jl         0x7fd1c3e7cc80
01142 458bd8                         mov        r11d, r8d
01145 44039c24b4000000               add        r11d, dword ptr [rsp + 0xb4]
0114d 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01152 453bd3                         cmp        r10d, r11d
01155 0f8225150000                   jb         0x7fd1c3e7cc80
0115b 448bdb                         mov        r11d, ebx
0115e 44039c24b4000000               add        r11d, dword ptr [rsp + 0xb4]
01166 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0116b 453bd3                         cmp        r10d, r11d
0116e 0f820c150000                   jb         0x7fd1c3e7cc80
01174 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0117c 4585db                         test       r11d, r11d
0117f 0f8cfb140000                   jl         0x7fd1c3e7cc80
01185 4585db                         test       r11d, r11d
01188 7429                           je         0x7fd1c3e7b7b3
0118a 4963d3                         movsxd     rdx, r11d
0118d 4883fa20                       cmp        rdx, 0x20
01191 773b                           ja         0x7fd1c3e7b7ce
01193 4d63d3                         movsxd     r10, r11d
01196 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0119d c442a8f5db                     bzhi       r11, r11, r10
011a2 c4c1fb92fb                     kmovq      k7, r11
011a7 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
011ad 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
011b3 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
011bb 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
011c3 0f8cb7010000                   jl         0x7fd1c3e7b980
011c9 e9aa000000                     jmp        0x7fd1c3e7b878
011ce c5f877                         vzeroupper 
011d1 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
011db 41ffd2                         call       r10
011de 0f1f840000000000               nop        dword ptr [rax + rax]
011e6 ebcb                           jmp        0x7fd1c3e7b7b3
011e8 4585c0                         test       r8d, r8d
011eb 0f8c4f150000                   jl         0x7fd1c3e7cd40
011f1 85db                           test       ebx, ebx
011f3 0f8c47150000                   jl         0x7fd1c3e7cd40
011f9 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01201 4503d0                         add        r10d, r8d
01204 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01209 453bda                         cmp        r11d, r10d
0120c 0f822e150000                   jb         0x7fd1c3e7cd40
01212 453bde                         cmp        r11d, r14d
01215 0f8225150000                   jb         0x7fd1c3e7cd40
0121b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01223 4585d2                         test       r10d, r10d
01226 7450                           je         0x7fd1c3e7b878
01228 4883fd20                       cmp        rbp, 0x20
0122c 772a                           ja         0x7fd1c3e7b858
0122e 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01236 4d63d3                         movsxd     r10, r11d
01239 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01240 c442a8f5db                     bzhi       r11, r11, r10
01245 c4c1fb92fb                     kmovq      k7, r11
0124a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01250 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01256 eb20                           jmp        0x7fd1c3e7b878
01258 488bd5                         mov        rdx, rbp
0125b c5f877                         vzeroupper 
0125e 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
01268 41ffd2                         call       r10
0126b 0f1f840000000000               nop        dword ptr [rax + rax]
01273 eb03                           jmp        0x7fd1c3e7b878
01275 448bf3                         mov        r14d, ebx
01278 458bee                         mov        r13d, r14d
0127b e948f2ffff                     jmp        0x7fd1c3e7aac8
01280 41ffc8                         dec        r8d
01283 4585c0                         test       r8d, r8d
01286 7e25                           jle        0x7fd1c3e7b8ad
01288 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01290 45894a14                       mov        dword ptr [r10 + 0x14], r9d
01294 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
01298 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
012a0 45895310                       mov        dword ptr [r11 + 0x10], r10d
012a4 4589430c                       mov        dword ptr [r11 + 0xc], r8d
012a8 e9daf4ffff                     jmp        0x7fd1c3e7ad87
012ad 48be08387ce200000000           movabs     rsi, 0xe27c3808
012b7 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012bc 4c891424                       mov        qword ptr [rsp], r10
012c0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
012c5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
012ca 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
012cf 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
012d4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
012d9 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
012de 4c89542448                     mov        qword ptr [rsp + 0x48], r10
012e3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
012e8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
012ed 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
012f2 4c89542458                     mov        qword ptr [rsp + 0x58], r10
012f7 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
012fe 6690                           nop        
01300 c5f877                         vzeroupper 
01303 e8584fa9ff                     call       0x7fd1c3910860
01308 0f1f84000014000c               nop        dword ptr [rax + rax + 0xc001400]
01310 4885c0                         test       rax, rax
01313 0f85e4f4ffff                   jne        0x7fd1c3e7adfd
01319 bef6ffffff                     mov        esi, 0xfffffff6
0131e 6690                           nop        
01320 c5f877                         vzeroupper 
01323 e8387eacff                     call       0x7fd1c3943760
01328 0f1f84002014000d               nop        dword ptr [rax + rax + 0xd001420]
01330 448bdd                         mov        r11d, ebp
01333 4d63d3                         movsxd     r10, r11d
01336 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0133d c442a8f5db                     bzhi       r11, r11, r10
01342 c4c1fb92fb                     kmovq      k7, r11
01347 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0134d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01353 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0135b 4403dd                         add        r11d, ebp
0135e 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
01366 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0136a 418502                         test       dword ptr [r10], eax
0136d 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
01375 0f8dfdfeffff                   jge        0x7fd1c3e7b878
0137b 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01380 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01385 442b8424b4000000               sub        r8d, dword ptr [rsp + 0xb4]
0138d 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
01394 2bac24b4000000                 sub        ebp, dword ptr [rsp + 0xb4]
0139b 3bac24b4000000                 cmp        ebp, dword ptr [rsp + 0xb4]
013a2 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
013aa 410f4fea                       cmovg      ebp, r10d
013ae 4585c0                         test       r8d, r8d
013b1 0f8c290e0000                   jl         0x7fd1c3e7c7e0
013b7 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
013bc 4585db                         test       r11d, r11d
013bf 0f8c1b0e0000                   jl         0x7fd1c3e7c7e0
013c5 458d1c28                       lea        r11d, [r8 + rbp]
013c9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
013ce 453bd3                         cmp        r10d, r11d
013d1 0f82090e0000                   jb         0x7fd1c3e7c7e0
013d7 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
013dc 4403ed                         add        r13d, ebp
013df 453bd5                         cmp        r10d, r13d
013e2 0f82f80d0000                   jb         0x7fd1c3e7c7e0
013e8 85ed                           test       ebp, ebp
013ea 0f8cf00d0000                   jl         0x7fd1c3e7c7e0
013f0 85ed                           test       ebp, ebp
013f2 0f845bffffff                   je         0x7fd1c3e7b953
013f8 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
01400 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01405 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
0140a 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
0140f 4863d5                         movsxd     rdx, ebp
01412 4883fa20                       cmp        rdx, 0x20
01416 0f8614ffffff                   jbe        0x7fd1c3e7b930
0141c c5f877                         vzeroupper 
0141f 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
01429 41ffd2                         call       r10
0142c 0f1f840000000000               nop        dword ptr [rax + rax]
01434 e91affffff                     jmp        0x7fd1c3e7b953
01439 418bdd                         mov        ebx, r13d
0143c e986fcffff                     jmp        0x7fd1c3e7b6c7
01441 bee4ffffff                     mov        esi, 0xffffffe4
01446 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0144b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01450 44895c2408                     mov        dword ptr [rsp + 8], r11d
01455 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0145a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0145f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01464 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01469 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0146e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01473 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01478 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0147d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01482 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01487 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0148c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01491 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01496 6690                           nop        
01498 c5f877                         vzeroupper 
0149b e8c07cacff                     call       0x7fd1c3943760
014a0 0f1f84009815000f               nop        dword ptr [rax + rax + 0xf001598]
014a8 bee4ffffff                     mov        esi, 0xffffffe4
014ad 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014b7 4489542408                     mov        dword ptr [rsp + 8], r10d
014bc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014c1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014c6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014cb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014d0 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
014d5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
014da 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
014df 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014e4 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
014e9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
014ee 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
014f3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
014f8 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
014fd 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01502 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01507 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0150c c5f877                         vzeroupper 
0150f e84c7cacff                     call       0x7fd1c3943760
01514 0f1f84000c160010               nop        dword ptr [rax + rax + 0x1000160c]
0151c bee4ffffff                     mov        esi, 0xffffffe4
01521 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01526 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0152e 4c891424                       mov        qword ptr [rsp], r10
01532 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01537 44895c2408                     mov        dword ptr [rsp + 8], r11d
0153c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01541 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01546 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0154b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01550 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01555 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0155a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0155f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01564 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01569 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0156e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01576 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0157b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01580 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01585 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0158a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0158f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01594 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01599 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
015a2 6690                           nop        
015a4 c5f877                         vzeroupper 
015a7 e8b47bacff                     call       0x7fd1c3943760
015ac 0f1f8400a4160011               nop        dword ptr [rax + rax + 0x110016a4]
015b4 bee4ffffff                     mov        esi, 0xffffffe4
015b9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015be 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015c3 44895c2408                     mov        dword ptr [rsp + 8], r11d
015c8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015cd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015d2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015d7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015dc 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
015e1 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
015e6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
015eb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
015f0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015f5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
015fa 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
015ff 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01604 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01609 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0160e 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01613 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01618 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0161d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01622 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01627 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0162c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01631 666690                         nop        
01634 c5f877                         vzeroupper 
01637 e8247bacff                     call       0x7fd1c3943760
0163c 0f1f840034170012               nop        dword ptr [rax + rax + 0x12001734]
01644 bee4ffffff                     mov        esi, 0xffffffe4
01649 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0164e 4c891c24                       mov        qword ptr [rsp], r11
01652 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01657 4489542408                     mov        dword ptr [rsp + 8], r10d
0165c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01661 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01666 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0166b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01670 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01674 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01679 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0167e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01683 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01688 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0168d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01692 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0169a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0169f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
016a4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
016a9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
016ae 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016b3 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
016b8 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
016bd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
016c2 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
016c7 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
016cc 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
016d1 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
016d6 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016df 90                             nop        
016e0 c5f877                         vzeroupper 
016e3 e8787aacff                     call       0x7fd1c3943760
016e8 0f1f8400e0170013               nop        dword ptr [rax + rax + 0x130017e0]
016f0 be45ffffff                     mov        esi, 0xffffff45
016f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016fa 4c89442408                     mov        qword ptr [rsp + 8], r8
016ff 90                             nop        
01700 c5f877                         vzeroupper 
01703 e8587aacff                     call       0x7fd1c3943760
01708 0f1f840000180014               nop        dword ptr [rax + rax + 0x14001800]
01710 be45ffffff                     mov        esi, 0xffffff45
01715 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0171a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0171f 4489542408                     mov        dword ptr [rsp + 8], r10d
01724 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01729 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0172e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01733 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01738 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0173d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01742 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01747 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0174c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01751 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01756 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0175b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01760 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01765 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01769 666690                         nop        
0176c c5f877                         vzeroupper 
0176f e8ec79acff                     call       0x7fd1c3943760
01774 0f1f84006c180015               nop        dword ptr [rax + rax + 0x1500186c]
0177c 4d3bd0                         cmp        r10, r8
0177f bdffffffff                     mov        ebp, 0xffffffff
01784 7c08                           jl         0x7fd1c3e7bd8e
01786 400f95c5                       setne      bpl
0178a 400fb6ed                       movzx      ebp, bpl
0178e be45ffffff                     mov        esi, 0xffffff45
01793 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01798 4c891424                       mov        qword ptr [rsp], r10
0179c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017a1 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017a6 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
017ab 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
017b0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
017b5 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
017ba 4c89542448                     mov        qword ptr [rsp + 0x48], r10
017bf 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
017c4 4489542444                     mov        dword ptr [rsp + 0x44], r10d
017c9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
017ce 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017d3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
017d8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
017dd 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
017e2 4489542464                     mov        dword ptr [rsp + 0x64], r10d
017e7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
017ec 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
017f1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
017f6 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
017fb 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01800 c5f877                         vzeroupper 
01803 e85879acff                     call       0x7fd1c3943760
01808 0f1f840000190016               nop        dword ptr [rax + rax + 0x16001900]
01810 be45ffffff                     mov        esi, 0xffffff45
01815 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0181a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0181f 4489542408                     mov        dword ptr [rsp + 8], r10d
01824 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01829 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0182e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01833 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01838 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0183d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01842 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01847 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0184c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01851 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01856 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0185b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01860 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01865 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0186a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0186f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01874 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01879 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0187e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01883 90                             nop        
01884 c5f877                         vzeroupper 
01887 e8d478acff                     call       0x7fd1c3943760
0188c 0f1f840084190017               nop        dword ptr [rax + rax + 0x17001984]
01894 be45ffffff                     mov        esi, 0xffffff45
01899 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0189e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018a3 44895c2408                     mov        dword ptr [rsp + 8], r11d
018a8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018ad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018b2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018b7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018bc 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
018c1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018c6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
018cb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018d0 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
018d5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018da 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018df 4c89542450                     mov        qword ptr [rsp + 0x50], r10
018e4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018e9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
018ee 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
018f6 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
018fb 90                             nop        
018fc c5f877                         vzeroupper 
018ff e85c78acff                     call       0x7fd1c3943760
01904 0f1f8400fc190018               nop        dword ptr [rax + rax + 0x180019fc]
0190c 4533d2                         xor        r10d, r10d
0190f 4c89542408                     mov        qword ptr [rsp + 8], r10
01914 e91ce8ffff                     jmp        0x7fd1c3e7a735
01919 4533d2                         xor        r10d, r10d
0191c 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
01924 e935e8ffff                     jmp        0x7fd1c3e7a75e
01929 4533d2                         xor        r10d, r10d
0192c 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01934 e950e8ffff                     jmp        0x7fd1c3e7a789
01939 4533d2                         xor        r10d, r10d
0193c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01941 e970e8ffff                     jmp        0x7fd1c3e7a7b6
01946 4533d2                         xor        r10d, r10d
01949 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01951 e98be8ffff                     jmp        0x7fd1c3e7a7e1
01956 4533d2                         xor        r10d, r10d
01959 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01961 e9abe8ffff                     jmp        0x7fd1c3e7a811
01966 bee4ffffff                     mov        esi, 0xffffffe4
0196b 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01970 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01975 4489542408                     mov        dword ptr [rsp + 8], r10d
0197a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0197f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01984 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01989 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0198e 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01993 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01998 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0199d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019a2 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
019a7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
019ac 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
019b4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
019b9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
019be 4c89542450                     mov        qword ptr [rsp + 0x50], r10
019c3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
019c8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
019cd 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
019d2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
019d7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
019dc 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
019e1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
019e6 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
019eb 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
019ef 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
019f4 c5f877                         vzeroupper 
019f7 e86477acff                     call       0x7fd1c3943760
019fc 0f1f8400f41a0019               nop        dword ptr [rax + rax + 0x19001af4]
01a04 bee4ffffff                     mov        esi, 0xffffffe4
01a09 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a0e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a13 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a18 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
01a20 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a25 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a2a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a2f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a34 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a39 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01a41 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a46 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01a4b 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a50 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a55 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a5a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a5f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a64 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01a6c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a71 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a76 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a7b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a80 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a85 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01a8a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01a8f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a94 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01a99 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01a9e 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01aa3 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01aa7 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01aac 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01ab4 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
01abd 666690                         nop        
01ac0 c5f877                         vzeroupper 
01ac3 e89876acff                     call       0x7fd1c3943760
01ac8 0f1f8400c01b001a               nop        dword ptr [rax + rax + 0x1a001bc0]
01ad0 418bee                         mov        ebp, r14d
01ad3 83c510                         add        ebp, 0x10
01ad6 be6effffff                     mov        esi, 0xffffff6e
01adb 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ae0 4c891424                       mov        qword ptr [rsp], r10
01ae4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ae9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01aee 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01af3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01af8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01afd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b02 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b07 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01b0c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01b11 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01b19 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b1e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b23 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b28 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01b2d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01b32 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01b37 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b3c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b41 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01b46 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01b4b 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01b50 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01b54 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
01b5c c5f877                         vzeroupper 
01b5f e8fc75acff                     call       0x7fd1c3943760
01b64 0f1f84005c1c001b               nop        dword ptr [rax + rax + 0x1b001c5c]
01b6c 418bee                         mov        ebp, r14d
01b6f 83c510                         add        ebp, 0x10
01b72 be66ffffff                     mov        esi, 0xffffff66
01b77 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b7c 4c891424                       mov        qword ptr [rsp], r10
01b80 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b85 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b8a 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01b8f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01b94 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b99 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b9e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ba3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01ba8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01bad 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01bb5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01bba 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01bbf 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01bc4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01bc9 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01bce 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01bd3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01bd8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01bdd 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01be2 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01be7 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01bec 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01bf0 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
01bf8 c5f877                         vzeroupper 
01bfb e86075acff                     call       0x7fd1c3943760
01c00 0f1f8400f81c001c               nop        dword ptr [rax + rax + 0x1c001cf8]
01c08 bebeffffff                     mov        esi, 0xffffffbe
01c0d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c12 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c17 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c1c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c21 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c26 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c2b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c30 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01c35 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01c3a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c3f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01c44 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c49 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01c4e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01c53 90                             nop        
01c54 c5f877                         vzeroupper 
01c57 e80475acff                     call       0x7fd1c3943760
01c5c 0f1f8400541d001d               nop        dword ptr [rax + rax + 0x1d001d54]
01c64 be85ffffff                     mov        esi, 0xffffff85
01c69 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01c6d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c72 44891c24                       mov        dword ptr [rsp], r11d
01c76 44896c2404                     mov        dword ptr [rsp + 4], r13d
01c7b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01c80 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c85 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01c8a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c8f 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01c94 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01c99 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
01c9e 4c89742460                     mov        qword ptr [rsp + 0x60], r14
01ca3 90                             nop        
01ca4 c5f877                         vzeroupper 
01ca7 e8b474acff                     call       0x7fd1c3943760
01cac 0f1f8400a41d001e               nop        dword ptr [rax + rax + 0x1e001da4]
01cb4 bee4ffffff                     mov        esi, 0xffffffe4
01cb9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01cbe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01cc3 4489542408                     mov        dword ptr [rsp + 8], r10d
01cc8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ccd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cd2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cd7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cdc 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01ce1 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01ce6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ceb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01cf0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cf5 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01cfa 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01cff 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01d07 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d0c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01d11 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01d16 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01d1b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01d20 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01d25 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01d2a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d2f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d34 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01d3b 90                             nop        
01d3c c5f877                         vzeroupper 
01d3f e81c74acff                     call       0x7fd1c3943760
01d44 0f1f84003c1e001f               nop        dword ptr [rax + rax + 0x1f001e3c]
01d4c bef6ffffff                     mov        esi, 0xfffffff6
01d51 666690                         nop        
01d54 c5f877                         vzeroupper 
01d57 e80474acff                     call       0x7fd1c3943760
01d5c 0f1f8400541e0020               nop        dword ptr [rax + rax + 0x20001e54]
01d64 beccffffff                     mov        esi, 0xffffffcc
01d69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d6e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d73 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d78 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d7d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d82 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d87 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d8c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01d91 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d96 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d9b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01da0 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01da5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01daa 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01db2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01db7 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01dbc 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01dc1 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01dc6 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01dcb 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01dd0 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01dd5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01dda 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ddf 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01de4 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01de9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01df1 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01df6 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01dfb 90                             nop        
01dfc c5f877                         vzeroupper 
01dff e85c73acff                     call       0x7fd1c3943760
01e04 0f1f8400fc1e0021               nop        dword ptr [rax + rax + 0x21001efc]
01e0c bee4ffffff                     mov        esi, 0xffffffe4
01e11 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e16 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e1e 4c891424                       mov        qword ptr [rsp], r10
01e22 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e27 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e2c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e31 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e36 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e3b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e40 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01e45 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e4a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e4f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e54 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01e59 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e5e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e66 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01e6b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e70 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e75 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e7a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01e7f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01e84 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01e89 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e8e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e93 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01e9b 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
01ea3 90                             nop        
01ea4 c5f877                         vzeroupper 
01ea7 e8b472acff                     call       0x7fd1c3943760
01eac 0f1f8400a41f0022               nop        dword ptr [rax + rax + 0x22001fa4]
01eb4 bee4ffffff                     mov        esi, 0xffffffe4
01eb9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ebe 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ec6 4c891424                       mov        qword ptr [rsp], r10
01eca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ecf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ed4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ed9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ede 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ee3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ee8 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01eed 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ef2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01ef7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01efc 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01f01 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01f06 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01f0e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01f13 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01f18 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f1d 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01f22 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01f27 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01f2c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01f31 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f36 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f3b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01f40 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01f45 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
01f4d 666690                         nop        
01f50 c5f877                         vzeroupper 
01f53 e80872acff                     call       0x7fd1c3943760
01f58 0f1f840050200023               nop        dword ptr [rax + rax + 0x23002050]
01f60 beccffffff                     mov        esi, 0xffffffcc
01f65 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f6a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f6f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f74 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f7e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f83 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f88 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01f8d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f92 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f97 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f9c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01fa1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01fa6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01fae 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01fb3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01fb8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01fbd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01fc2 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01fc7 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01fcc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01fd1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01fd6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01fdb 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01fe3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01fe8 c5f877                         vzeroupper 
01feb e87071acff                     call       0x7fd1c3943760
01ff0 0f1f8400e8200024               nop        dword ptr [rax + rax + 0x240020e8]
01ff8 be6effffff                     mov        esi, 0xffffff6e
01ffd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02002 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02007 4489542408                     mov        dword ptr [rsp + 8], r10d
0200c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02011 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02016 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0201b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02020 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02025 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0202a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0202f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02034 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02039 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0203e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02043 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02048 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0204d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02052 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02057 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0205c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02061 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02066 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0206b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02070 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02074 c5f877                         vzeroupper 
02077 e8e470acff                     call       0x7fd1c3943760
0207c 0f1f840074210025               nop        dword ptr [rax + rax + 0x25002174]
02084 458bd3                         mov        r10d, r11d
02087 e9b8eeffff                     jmp        0x7fd1c3e7b544
0208c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
02091 458d5308                       lea        r10d, [r11 + 8]
02095 458bca                         mov        r9d, r10d
02098 be6effffff                     mov        esi, 0xffffff6e
0209d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020a2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020a7 44895c2408                     mov        dword ptr [rsp + 8], r11d
020ac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020b1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020b6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020bb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020c0 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
020c5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
020ca 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
020cf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020d4 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
020d9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
020de 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
020e3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020e8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
020ed 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
020f2 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
020f7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
020fc 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02101 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02106 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0210e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02113 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02118 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
02120 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02125 666690                         nop        
02128 c5f877                         vzeroupper 
0212b e83070acff                     call       0x7fd1c3943760
02130 0f1f840028220026               nop        dword ptr [rax + rax + 0x26002228]
02138 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0213d 458d5308                       lea        r10d, [r11 + 8]
02141 458bc2                         mov        r8d, r10d
02144 be66ffffff                     mov        esi, 0xffffff66
02149 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0214e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02153 44895c2408                     mov        dword ptr [rsp + 8], r11d
02158 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0215d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02162 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02167 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0216c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02171 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02176 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0217b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02180 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02185 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0218a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0218f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02194 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02199 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0219e 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
021a3 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
021a8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021ad 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
021b2 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
021ba 4489442468                     mov        dword ptr [rsp + 0x68], r8d
021bf 458bda                         mov        r11d, r10d
021c2 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
021c7 458bd1                         mov        r10d, r9d
021ca 4489542478                     mov        dword ptr [rsp + 0x78], r10d
021cf 90                             nop        
021d0 c5f877                         vzeroupper 
021d3 e8886facff                     call       0x7fd1c3943760
021d8 0f1f8400d0220027               nop        dword ptr [rax + rax + 0x270022d0]
021e0 beccffffff                     mov        esi, 0xffffffcc
021e5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021ea 4c891424                       mov        qword ptr [rsp], r10
021ee 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
021f6 4c89542408                     mov        qword ptr [rsp + 8], r10
021fb 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02203 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02208 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0220d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02212 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0221a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0221f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02224 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02229 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0222e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02233 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02238 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0223d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02245 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0224a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0224f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02254 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02259 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0225e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02263 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02268 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0226d 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02272 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02276 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0227e 6690                           nop        
02280 c5f877                         vzeroupper 
02283 e8d86eacff                     call       0x7fd1c3943760
02288 0f1f840080230028               nop        dword ptr [rax + rax + 0x28002380]
02290 bee4ffffff                     mov        esi, 0xffffffe4
02295 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0229a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
022a2 4c891424                       mov        qword ptr [rsp], r10
022a6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
022ab 44895c2408                     mov        dword ptr [rsp + 8], r11d
022b0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022b5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022ba 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022bf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
022c4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
022c9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
022ce 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
022d3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022d8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
022dd 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022e2 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
022ea 4c89542448                     mov        qword ptr [rsp + 0x48], r10
022ef 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022f4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
022f9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
022fe 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02303 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02308 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0230d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02312 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02317 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0231f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02324 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02329 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0232e 6690                           nop        
02330 c5f877                         vzeroupper 
02333 e8286eacff                     call       0x7fd1c3943760
02338 0f1f840030240029               nop        dword ptr [rax + rax + 0x29002430]
02340 bee4ffffff                     mov        esi, 0xffffffe4
02345 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0234a 4c891424                       mov        qword ptr [rsp], r10
0234e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02356 4c89542408                     mov        qword ptr [rsp + 8], r10
0235b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02360 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02365 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0236a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0236f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02374 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02379 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0237e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02383 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0238b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02390 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02395 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0239a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0239f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
023a4 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
023a9 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
023ae 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023b3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
023b8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
023bd 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
023c2 6690                           nop        
023c4 c5f877                         vzeroupper 
023c7 e8946dacff                     call       0x7fd1c3943760
023cc 0f1f8400c424002a               nop        dword ptr [rax + rax + 0x2a0024c4]
023d4 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
023db ffc5                           inc        ebp
023dd bee4ffffff                     mov        esi, 0xffffffe4
023e2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
023e7 4c891424                       mov        qword ptr [rsp], r10
023eb 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
023f3 4c89542408                     mov        qword ptr [rsp + 8], r10
023f8 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02400 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02405 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0240a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0240f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02414 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02419 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0241e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02423 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02428 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0242d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02435 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0243a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0243f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02444 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02449 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0244e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02453 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02458 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0245d 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02462 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02467 4489542478                     mov        dword ptr [rsp + 0x78], r10d
0246c 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02474 c5f877                         vzeroupper 
02477 e8e46cacff                     call       0x7fd1c3943760
0247c 0f1f84007425002b               nop        dword ptr [rax + rax + 0x2b002574]
02484 bee4ffffff                     mov        esi, 0xffffffe4
02489 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0248e 4c891424                       mov        qword ptr [rsp], r10
02492 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0249a 4c89542408                     mov        qword ptr [rsp + 8], r10
0249f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024a4 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
024a9 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
024ae 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
024b3 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
024b8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
024bd 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
024c2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
024c7 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
024cf 4c89542450                     mov        qword ptr [rsp + 0x50], r10
024d4 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
024d9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
024de 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
024e3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
024e8 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
024ed 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
024f2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
024f7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
024fc 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
02501 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02506 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
0250e 6690                           nop        
02510 c5f877                         vzeroupper 
02513 e8486cacff                     call       0x7fd1c3943760
02518 0f1f84001026002c               nop        dword ptr [rax + rax + 0x2c002610]
02520 bee4ffffff                     mov        esi, 0xffffffe4
02525 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0252a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0252f 4489542408                     mov        dword ptr [rsp + 8], r10d
02534 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02539 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0253e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02543 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02548 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0254d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02552 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02557 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0255c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02561 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02566 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0256b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02570 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02575 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0257a 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0257f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02584 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02589 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0258e 6690                           nop        
02590 c5f877                         vzeroupper 
02593 e8c86bacff                     call       0x7fd1c3943760
02598 0f1f84009026002d               nop        dword ptr [rax + rax + 0x2d002690]
025a0 beccffffff                     mov        esi, 0xffffffcc
025a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025aa 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
025af 4489542420                     mov        dword ptr [rsp + 0x20], r10d
025b4 c5f877                         vzeroupper 
025b7 e8a46bacff                     call       0x7fd1c3943760
025bc 0f1f8400b426002e               nop        dword ptr [rax + rax + 0x2e0026b4]
025c4 beccffffff                     mov        esi, 0xffffffcc
025c9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025ce 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025d3 44895c2408                     mov        dword ptr [rsp + 8], r11d
025d8 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
025e0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
025e5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025ea 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025ef 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025f4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025f9 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
025fe 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02603 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02608 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0260d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02612 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02617 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0261f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02624 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02629 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0262e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02633 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02638 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0263d 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02642 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02647 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0264c 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02651 4489542474                     mov        dword ptr [rsp + 0x74], r10d
02656 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0265e 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
02666 4489ac2490000000               mov        dword ptr [rsp + 0x90], r13d
0266e 6690                           nop        
02670 c5f877                         vzeroupper 
02673 e8e86aacff                     call       0x7fd1c3943760
02678 0f1f84007027002f               nop        dword ptr [rax + rax + 0x2f002770]
02680 beccffffff                     mov        esi, 0xffffffcc
02685 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0268a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02692 4c891424                       mov        qword ptr [rsp], r10
02696 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0269b 4489542408                     mov        dword ptr [rsp + 8], r10d
026a0 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
026a8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026ad 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
026b2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026b7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
026bc 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
026c1 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
026c6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
026cb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
026d0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
026d5 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
026da 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
026df 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
026e7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026ec 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026f1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
026f6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
026fb 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02700 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02705 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0270a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0270f 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02714 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02718 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
02720 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02728 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
02730 c5f877                         vzeroupper 
02733 e8286aacff                     call       0x7fd1c3943760
02738 0f1f840030280030               nop        dword ptr [rax + rax + 0x30002830]
02740 beccffffff                     mov        esi, 0xffffffcc
02745 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0274a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0274f 44895c2408                     mov        dword ptr [rsp + 8], r11d
02754 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02759 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0275e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02763 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02768 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0276d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02772 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02777 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0277c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02781 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02786 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0278e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02793 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02798 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0279d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
027a2 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
027a7 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
027ac 4489542458                     mov        dword ptr [rsp + 0x58], r10d
027b1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
027b6 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
027bb 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
027c3 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
027c7 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
027cf 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
027d7 90                             nop        
027d8 c5f877                         vzeroupper 
027db e88069acff                     call       0x7fd1c3943760
027e0 0f1f8400d8280031               nop        dword ptr [rax + rax + 0x310028d8]
027e8 eb10                           jmp        0x7fd1c3e7cdfa
027ea eb0e                           jmp        0x7fd1c3e7cdfa
027ec eb0c                           jmp        0x7fd1c3e7cdfa
027ee eb0a                           jmp        0x7fd1c3e7cdfa
027f0 eb08                           jmp        0x7fd1c3e7cdfa
027f2 eb06                           jmp        0x7fd1c3e7cdfa
027f4 eb04                           jmp        0x7fd1c3e7cdfa
027f6 eb02                           jmp        0x7fd1c3e7cdfa
027f8 eb00                           jmp        0x7fd1c3e7cdfa
027fa 488bf0                         mov        rsi, rax
027fd e9fedfffff                     jmp        0x7fd1c3e7ae00
02802 bef6ffffff                     mov        esi, 0xfffffff6
02807 90                             nop        
02808 c5f877                         vzeroupper 
0280b e85069acff                     call       0x7fd1c3943760
02810 0f1f840008290032               nop        dword ptr [rax + rax + 0x32002908]
02818 49ba19b6e7c3d17f0000           movabs     r10, 0x7fd1c3e7b619
02822 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02829 e9b260a9ff                     jmp        0x7fd1c3912ee0
0282e e86d2ca8ff                     call       0x7fd1c38ffaa0
02833 e9f6d7ffff                     jmp        0x7fd1c3e7a62e
