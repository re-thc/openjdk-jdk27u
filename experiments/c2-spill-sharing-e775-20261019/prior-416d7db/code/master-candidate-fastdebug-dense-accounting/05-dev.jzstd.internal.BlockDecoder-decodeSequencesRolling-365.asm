00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f854a210000                   jne        0x7f56afbd3968
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5604                       mov        r10d, dword ptr [rsi + 4]
00049 44891424                       mov        dword ptr [rsp], r10d
0004d 413bea                         cmp        ebp, r10d
00050 0f832b1b0000                   jae        0x7f56afbd3381
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f844f1b0000                   je         0x7f56afbd33b4
00065 448bda                         mov        r11d, edx
00068 442bd9                         sub        r11d, ecx
0006b 8b3c24                         mov        edi, dword ptr [rsp]
0006e 83c7f9                         add        edi, -7
00071 448d6af8                       lea        r13d, [rdx - 8]
00075 468d0cdd00000000               lea        r9d, [r11*8]
0007d f3450fbdd0                     lzcnt      r10d, r8d
00082 be1f000000                     mov        esi, 0x1f
00087 412bf2                         sub        esi, r10d
0008a bb08000000                     mov        ebx, 8
0008f 2bde                           sub        ebx, esi
00091 418bd1                         mov        edx, r9d
00094 2bd3                           sub        edx, ebx
00096 4183fb08                       cmp        r11d, 8
0009a 0f8c64190000                   jl         0x7f56afbd3204
000a0 85ff                           test       edi, edi
000a2 0f8c3c1d0000                   jl         0x7f56afbd35e4
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83f91b0000                   jae        0x7f56afbd34b0
000b7 458bc5                         mov        r8d, r13d
000ba 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
000c2 4b8b440208                     mov        rax, qword ptr [r10 + r8 + 8]
000c7 4183c3f8                       add        r11d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183fb08                       cmp        r11d, 8
000db 0f8cd8190000                   jl         0x7f56afbd32b9
000e1 85ff                           test       edi, edi
000e3 0f8c531d0000                   jl         0x7f56afbd363c
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f830c1c0000                   jae        0x7f56afbd3504
000f8 458bda                         mov        r11d, r10d
000fb 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00103 4f8b741808                     mov        r14, qword ptr [r8 + r11 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f84c21a0000                   je         0x7f56afbd33dc
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f84d51a0000                   je         0x7f56afbd3404
0012f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00134 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
0013c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00141 4889442428                     mov        qword ptr [rsp + 0x28], rax
00146 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
0014d 8974240c                       mov        dword ptr [rsp + 0xc], esi
00151 895c2424                       mov        dword ptr [rsp + 0x24], ebx
00155 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
0015a 897c2404                       mov        dword ptr [rsp + 4], edi
0015e 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00166 41034804                       add        ecx, dword ptr [r8 + 4]
0016a 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0016f 41034904                       add        ecx, dword ptr [r9 + 4]
00173 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00178 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
0017c 4d8bd1                         mov        r10, r9
0017f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00184 4d8bd0                         mov        r10, r8
00187 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0018c 4d8bd3                         mov        r10, r11
0018f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00194 85c9                           test       ecx, ecx
00196 0f84d5080000                   je         0x7f56afbd2271
0019c be40000000                     mov        esi, 0x40
001a1 2bf3                           sub        esi, ebx
001a3 3bce                           cmp        ecx, esi
001a5 0f8ffd010000                   jg         0x7f56afbd1ba8
001ab 2bf1                           sub        esi, ecx
001ad c4e2cbf7e8                     shrx       rbp, rax, rsi
001b2 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b7 83f940                         cmp        ecx, 0x40
001ba 0f8db01d0000                   jge        0x7f56afbd3770
001c0 41ba01000000                   mov        r10d, 1
001c6 c442f1f7d2                     shlx       r10, r10, rcx
001cb 49ffca                         dec        r10
001ce 4c23d5                         and        r10, rbp
001d1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d6 448bd9                         mov        r11d, ecx
001d9 458bcb                         mov        r9d, r11d
001dc 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e1 458d4108                       lea        r8d, [r9 + 8]
001e5 4183f840                       cmp        r8d, 0x40
001e9 7c34                           jl         0x7f56afbd1a1f
001eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001f0 4183c1c8                       add        r9d, -0x38
001f4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f9 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00201 8b542408                       mov        edx, dword ptr [rsp + 8]
00205 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00209 90                             nop        
0020a 90                             nop        
0020b e850e2b5ff                     call       0x7f56af72fc60
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7f56afbd1a50
0021f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00224 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0022c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00231 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00236 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0023e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00246 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00250 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00255 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00259 83fd20                         cmp        ebp, 0x20
0025c 0f8d3e1c0000                   jge        0x7f56afbd36a0
00262 c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00269 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026e 41bb01000000                   mov        r11d, 1
00274 c44251f7d3                     shlx       r10d, r11d, ebp
00279 41ffca                         dec        r10d
0027c 4d63d2                         movsxd     r10, r10d
0027f 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00284 458bda                         mov        r11d, r10d
00287 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0028c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00291 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00295 83fd20                         cmp        ebp, 0x20
00298 0f8d3e1c0000                   jge        0x7f56afbd36dc
0029e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a6 458b5204                       mov        r10d, dword ptr [r10 + 4]
002aa 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002b2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b7 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002bb 458b4204                       mov        r8d, dword ptr [r10 + 4]
002bf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c4 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002c8 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002cc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002d1 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
002d5 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d9 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002dd 85c9                           test       ecx, ecx
002df 0f8e94180000                   jle        0x7f56afbd3379
002e5 41ffc8                         dec        r8d
002e8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002ed 41ffcb                         dec        r11d
002f0 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
002f5 41ffca                         dec        r10d
002f8 4489542470                     mov        dword ptr [rsp + 0x70], r10d
002fd c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00304 41bb01000000                   mov        r11d, 1
0030a c44251f7c3                     shlx       r8d, r11d, ebp
0030f 458bda                         mov        r11d, r10d
00312 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00317 41ffc8                         dec        r8d
0031a 4d63d0                         movsxd     r10, r8d
0031d 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00322 458bd2                         mov        r10d, r10d
00325 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0032a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00332 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00339 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00341 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00348 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00350 458b5204                       mov        r10d, dword ptr [r10 + 4]
00354 4585d2                         test       r10d, r10d
00357 0f86cf180000                   jbe        0x7f56afbd342c
0035d 4d63d2                         movsxd     r10, r10d
00360 4c63d9                         movsxd     r11, ecx
00363 49ffcb                         dec        r11
00366 4d3bda                         cmp        r11, r10
00369 0f83bd180000                   jae        0x7f56afbd342c
0036f 448b542404                     mov        r10d, dword ptr [rsp + 4]
00374 4585d2                         test       r10d, r10d
00377 0f8ce3190000                   jl         0x7f56afbd3560
0037d 448b1c24                       mov        r11d, dword ptr [rsp]
00381 4183c3f9                       add        r11d, -7
00385 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0038d 4533db                         xor        r11d, r11d
00390 4533d2                         xor        r10d, r10d
00393 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0039b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003a3 e98e020000                     jmp        0x7f56afbd1e36
003a8 8be9                           mov        ebp, ecx
003aa 2bee                           sub        ebp, esi
003ac 90                             nop        
003ad 90                             nop        
003ae 90                             nop        
003af e8ace0b5ff                     call       0x7f56af72fc60
003b4 0f1f8400ac040001               nop        dword ptr [rax + rax + 0x10004ac]
003bc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003c1 41bb40000000                   mov        r11d, 0x40
003c7 442bdd                         sub        r11d, ebp
003ca c462d1f7c0                     shlx       r8, rax, rbp
003cf c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003d9 4d0bc2                         or         r8, r10
003dc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003e1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003e6 e9eefdffff                     jmp        0x7f56afbd19d9
003eb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003f3 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
003f8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003fd 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00405 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0040a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00412 90                             nop        
00413 90                             nop        
00414 90                             nop        
00415 90                             nop        
00416 90                             nop        
00417 90                             nop        
00418 90                             nop        
00419 90                             nop        
0041a 90                             nop        
0041b 90                             nop        
0041c 90                             nop        
0041d 90                             nop        
0041e 90                             nop        
0041f 90                             nop        
00420 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00427 83fd40                         cmp        ebp, 0x40
0042a 0f8d880a0000                   jge        0x7f56afbd26b8
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bda                         mov        r11d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8d490b0000                   jge        0x7f56afbd27ac
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bda                         mov        ebx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d340c0000                   jge        0x7f56afbd28c0
0048c c4e2d3f7cf                     shrx       rcx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d230d0000                   jge        0x7f56afbd29d8
004b5 41b801000000                   mov        r8d, 1
004bb c442d1f7c0                     shlx       r8, r8, rbp
004c0 49ffc8                         dec        r8
004c3 4c23c1                         and        r8, rcx
004c6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004ce 418bc9                         mov        ecx, r9d
004d1 4103ca                         add        ecx, r10d
004d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004d9 458bd2                         mov        r10d, r10d
004dc 4403d3                         add        r10d, ebx
004df 4863d9                         movsxd     rbx, ecx
004e2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
004ea 458bc9                         mov        r9d, r9d
004ed 4d03c1                         add        r8, r9
004f0 4c8b8c24e8000000               mov        r9, qword ptr [rsp + 0xe8]
004f8 4c03cb                         add        r9, rbx
004fb 4c898c24e8000000               mov        qword ptr [rsp + 0xe8], r9
00503 4d85c0                         test       r8, r8
00506 0f8e7c070000                   jle        0x7f56afbd2488
0050c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00513 0f8fc30d0000                   jg         0x7f56afbd2adc
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fc20e0000                   jg         0x7f56afbd2be8
00526 81f9ffff0300                   cmp        ecx, 0x3ffff
0052c 0f8f9e0f0000                   jg         0x7f56afbd2cd0
00532 458bc8                         mov        r9d, r8d
00535 4181f900000010                 cmp        r9d, 0x10000000
0053c 0f8376100000                   jae        0x7f56afbd2db8
00542 4d63d2                         movsxd     r10, r10d
00545 4d63c1                         movsxd     r8, r9d
00548 48c1e312                       shl        rbx, 0x12
0054c 49c1e024                       shl        r8, 0x24
00550 4c0bc3                         or         r8, rbx
00553 4d0bc2                         or         r8, r10
00556 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0055e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00566 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
0056b 8b2c24                         mov        ebp, dword ptr [rsp]
0056e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00572 0f8dad000000                   jge        0x7f56afbd1e25
00578 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00580 49c1ea30                       shr        r10, 0x30
00584 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00589 49c1e830                       shr        r8, 0x30
0058d 418bca                         mov        ecx, r10d
00590 418bd8                         mov        ebx, r8d
00593 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0059b c4422bf7cb                     shrx       r9d, r11d, r10d
005a0 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005a8 c4422bf7c3                     shrx       r8d, r11d, r10d
005ad 4103d8                         add        ebx, r8d
005b0 895c2474                       mov        dword ptr [rsp + 0x74], ebx
005b4 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005bc 4183fa20                       cmp        r10d, 0x20
005c0 0f8df6100000                   jge        0x7f56afbd2ebc
005c6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005ce 49c1ea30                       shr        r10, 0x30
005d2 458bd2                         mov        r10d, r10d
005d5 41b801000000                   mov        r8d, 1
005db 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005e2 c4c241f7d8                     shlx       ebx, r8d, edi
005e7 ffcb                           dec        ebx
005e9 4123d9                         and        ebx, r9d
005ec 03d9                           add        ebx, ecx
005ee 895c2448                       mov        dword ptr [rsp + 0x48], ebx
005f2 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
005fa 4183f920                       cmp        r9d, 0x20
005fe 0f8d64110000                   jge        0x7f56afbd2f68
00604 41b901000000                   mov        r9d, 1
0060a 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00612 c44239f7c1                     shlx       r8d, r9d, r8d
00617 41ffc8                         dec        r8d
0061a 4523c3                         and        r8d, r11d
0061d 4503c2                         add        r8d, r10d
00620 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00625 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00629 0f8dc8030000                   jge        0x7f56afbd21f7
0062f 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00636 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0063b 4423442474                     and        r8d, dword ptr [rsp + 0x74]
00640 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00645 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00649 458b5304                       mov        r10d, dword ptr [r11 + 4]
0064d 453bc2                         cmp        r8d, r10d
00650 0f832b040000                   jae        0x7f56afbd2281
00656 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0065a 234c2468                       and        ecx, dword ptr [rsp + 0x68]
0065e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00663 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00667 458b4a04                       mov        r9d, dword ptr [r10 + 4]
0066b 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00670 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00675 413bc9                         cmp        ecx, r9d
00678 0f839e040000                   jae        0x7f56afbd231c
0067e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00683 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00688 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0068d 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
00691 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00695 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0069a 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006a2 443bc3                         cmp        r8d, ebx
006a5 0f8321050000                   jae        0x7f56afbd23cc
006ab 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
006b0 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b8 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006bf ffc5                           inc        ebp
006c1 892c24                         mov        dword ptr [rsp], ebp
006c4 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c8 0f8df8020000                   jge        0x7f56afbd21c6
006ce 49c1ea28                       shr        r10, 0x28
006d2 458bda                         mov        r11d, r10d
006d5 450fb6db                       movzx      r11d, r11b
006d9 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006e1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006e6 49c1ea28                       shr        r10, 0x28
006ea 458bd2                         mov        r10d, r10d
006ed 410fb6ea                       movzx      ebp, r10b
006f1 4103eb                         add        ebp, r11d
006f4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006fc 49c1ea28                       shr        r10, 0x28
00700 458bda                         mov        r11d, r10d
00703 450fb6db                       movzx      r11d, r11b
00707 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0070f 4103eb                         add        ebp, r11d
00712 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00719 41bb01000000                   mov        r11d, 1
0071f 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
00727 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0072f 49c1ea20                       shr        r10, 0x20
00733 458bda                         mov        r11d, r10d
00736 410fb6eb                       movzx      ebp, r11b
0073a 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00741 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00746 49c1ea20                       shr        r10, 0x20
0074a 458bd2                         mov        r10d, r10d
0074d 410fb6ea                       movzx      ebp, r10b
00751 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00758 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00760 49c1ea20                       shr        r10, 0x20
00764 458bda                         mov        r11d, r10d
00767 410fb6eb                       movzx      ebp, r11b
0076b 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00772 448bc5                         mov        r8d, ebp
00775 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
0077d 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
00785 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
0078d 4585c0                         test       r8d, r8d
00790 0f84f6050000                   je         0x7f56afbd258c
00796 4183f83f                       cmp        r8d, 0x3f
0079a 0f8fdc060000                   jg         0x7f56afbd267c
007a0 bb40000000                     mov        ebx, 0x40
007a5 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007a9 443bc3                         cmp        r8d, ebx
007ac 7e47                           jle        0x7f56afbd1ff5
007ae 458bc8                         mov        r9d, r8d
007b1 442bcb                         sub        r9d, ebx
007b4 83fb40                         cmp        ebx, 0x40
007b7 0f8d47110000                   jge        0x7f56afbd3104
007bd 41ba01000000                   mov        r10d, 1
007c3 c442e1f7d2                     shlx       r10, r10, rbx
007c8 49ffca                         dec        r10
007cb 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007d3 c4c2b1f7ea                     shlx       rbp, r10, r9
007d8 41ba40000000                   mov        r10d, 0x40
007de 452bd1                         sub        r10d, r9d
007e1 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007e8 490bea                         or         rbp, r10
007eb 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007f3 eb30                           jmp        0x7f56afbd2025
007f5 412bd8                         sub        ebx, r8d
007f8 c462e3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rbx
00802 4183f840                       cmp        r8d, 0x40
00806 0f8df40f0000                   jge        0x7f56afbd3000
0080c 41ba01000000                   mov        r10d, 1
00812 c4c2b9f7ea                     shlx       rbp, r10, r8
00817 48ffcd                         dec        rbp
0081a 4923e9                         and        rbp, r9
0081d 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00825 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0082a 4503d0                         add        r10d, r8d
0082d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00832 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00837 4503d8                         add        r11d, r8d
0083a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0083f 4183fa40                       cmp        r10d, 0x40
00843 0f8cd7fbffff                   jl         0x7f56afbd1c20
00849 458d5ac0                       lea        r11d, [r10 - 0x40]
0084d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00852 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00856 83c5f8                         add        ebp, -8
00859 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085d 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00861 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00865 83c1f0                         add        ecx, -0x10
00868 83f908                         cmp        ecx, 8
0086b 0f8c07010000                   jl         0x7f56afbd2178
00871 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00876 4183c2e8                       add        r10d, -0x18
0087a 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00882 0f8263fbffff                   jb         0x7f56afbd1beb
00888 bee4ffffff                     mov        esi, 0xffffffe4
0088d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00895 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0089a 44891c24                       mov        dword ptr [rsp], r11d
0089e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a3 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a8 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ad 44895c2408                     mov        dword ptr [rsp + 8], r11d
008b2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008b7 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008bc 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
008c1 448944240c                     mov        dword ptr [rsp + 0xc], r8d
008c6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008cb 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008d0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008d5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008da 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008df 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008e4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008e9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008ee 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008f3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
008f8 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00902 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00907 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0090c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00911 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00916 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0091b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00920 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00925 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0092a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0092f 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00934 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0093c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00941 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00949 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0094e 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00956 90                             nop        
00957 e804b9afff                     call       0x7f56af6cda60
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
0096e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00972 e869e3c417                     call       0x7f56c78204e0
00977 f4                             hlt        
00978 85c9                           test       ecx, ecx
0097a 7f08                           jg         0x7f56afbd2184
0097c 4533d2                         xor        r10d, r10d
0097f e974faffff                     jmp        0x7f56afbd1bf8
00984 8be9                           mov        ebp, ecx
00986 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098e 8b542408                       mov        edx, dword ptr [rsp + 8]
00992 90                             nop        
00993 e8c8dab5ff                     call       0x7f56af72fc60
00998 0f1f8400900a0003               nop        dword ptr [rax + rax + 0x3000a90]
009a0 448b542408                     mov        r10d, dword ptr [rsp + 8]
009a5 41c1e203                       shl        r10d, 3
009a9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009ae 41c1e303                       shl        r11d, 3
009b2 452bd3                         sub        r10d, r11d
009b5 4181c2c0000000                 add        r10d, 0xc0
009bc c462a9f7d0                     shlx       r10, rax, r10
009c1 e932faffff                     jmp        0x7f56afbd1bf8
009c6 4533db                         xor        r11d, r11d
009c9 4533d2                         xor        r10d, r10d
009cc 4533c9                         xor        r9d, r9d
009cf 4533c0                         xor        r8d, r8d
009d2 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009da 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
009e2 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
009ea 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
009f2 e930fdffff                     jmp        0x7f56afbd1f27
009f7 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009ff 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a07 4d03c2                         add        r8, r10
00a0a 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a12 4d3bc2                         cmp        r8, r10
00a15 7f29                           jg         0x7f56afbd2240
00a17 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a1c 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a24 0f851e150000                   jne        0x7f56afbd3748
00a2a 418bc0                         mov        eax, r8d
00a2d 4881c410010000                 add        rsp, 0x110
00a34 5d                             pop        rbp
00a35 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a39 0f8713170000                   ja         0x7f56afbd3952
00a3f c3                             ret        
00a40 48be302474e200000000           movabs     rsi, 0xe2742430
00a4a 90                             nop        
00a4b e810dab5ff                     call       0x7f56af72fc60
00a50 0f1f8400480b0004               nop        dword ptr [rax + rax + 0x4000b48]
00a58 4885c0                         test       rax, rax
00a5b 0f84bf140000                   je         0x7f56afbd3720
00a61 488bf0                         mov        rsi, rax
00a64 4881c410010000                 add        rsp, 0x110
00a6b 5d                             pop        rbp
00a6c e9ef70afff                     jmp        0x7f56af6c9360
00a71 4533db                         xor        r11d, r11d
00a74 4533d2                         xor        r10d, r10d
00a77 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a7c e958f7ffff                     jmp        0x7f56afbd19d9
00a81 bee4ffffff                     mov        esi, 0xffffffe4
00a86 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a8e 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a93 44891424                       mov        dword ptr [rsp], r10d
00a97 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a9c 44894c2404                     mov        dword ptr [rsp + 4], r9d
00aa1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00aa6 4489542408                     mov        dword ptr [rsp + 8], r10d
00aab 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ab0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ab5 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00aba 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00abf 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ac4 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ac9 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ace 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ad3 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ad8 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00add 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ae2 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ae7 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00aec 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00af1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00af6 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00afb e860b7afff                     call       0x7f56af6cda60
00b00 0f1f8400f80b0005               nop        dword ptr [rax + rax + 0x5000bf8]
00b08 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b16 e8c5e1c417                     call       0x7f56c78204e0
00b1b f4                             hlt        
00b1c bee4ffffff                     mov        esi, 0xffffffe4
00b21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b29 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b2e 44891c24                       mov        dword ptr [rsp], r11d
00b32 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b37 4489442404                     mov        dword ptr [rsp + 4], r8d
00b3c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b41 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b46 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b4b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b50 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b55 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b5a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b5f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b64 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b69 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b6e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b73 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b78 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b7d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b82 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b87 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b8c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b91 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b96 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b9b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00ba0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00ba5 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00ba9 90                             nop        
00baa 90                             nop        
00bab e8b0b6afff                     call       0x7f56af6cda60
00bb0 0f1f8400a80c0006               nop        dword ptr [rax + rax + 0x6000ca8]
00bb8 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00bc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bc6 e815e1c417                     call       0x7f56c78204e0
00bcb f4                             hlt        
00bcc bee4ffffff                     mov        esi, 0xffffffe4
00bd1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bd9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00bde 44891424                       mov        dword ptr [rsp], r10d
00be2 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00be7 44894c2404                     mov        dword ptr [rsp + 4], r9d
00bec 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00bf1 4489542408                     mov        dword ptr [rsp + 8], r10d
00bf6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bfb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c00 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00c05 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c0a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c0f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c14 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c19 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c1e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c23 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c28 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c2d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c32 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c37 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c3c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c41 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c46 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c4b 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c50 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c55 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c5a 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00c5f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c64 90                             nop        
00c65 90                             nop        
00c66 90                             nop        
00c67 e8f4b5afff                     call       0x7f56af6cda60
00c6c 0f1f8400640d0007               nop        dword ptr [rax + rax + 0x7000d64]
00c74 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00c7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c82 e859e0c417                     call       0x7f56c78204e0
00c87 f4                             hlt        
00c88 4533c9                         xor        r9d, r9d
00c8b 4d3bc1                         cmp        r8, r9
00c8e bdffffffff                     mov        ebp, 0xffffffff
00c93 7c08                           jl         0x7f56afbd249d
00c95 400f95c5                       setne      bpl
00c99 400fb6ed                       movzx      ebp, bpl
00c9d be45ffffff                     mov        esi, 0xffffff45
00ca2 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00caa 4c890c24                       mov        qword ptr [rsp], r9
00cae 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00cb2 895c240c                       mov        dword ptr [rsp + 0xc], ebx
00cb6 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00cbe 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00cc3 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00cc7 895c2414                       mov        dword ptr [rsp + 0x14], ebx
00ccb 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00cd0 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cd5 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
00cd9 895c2430                       mov        dword ptr [rsp + 0x30], ebx
00cdd 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00ce2 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00ce7 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00ceb 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00cef 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cf4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cf9 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
00cfd 895c2440                       mov        dword ptr [rsp + 0x40], ebx
00d01 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d09 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d0e 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00d12 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00d16 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00d1b 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d20 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00d24 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00d28 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d2d 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d32 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d3a 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d3f 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d47 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d4c 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d54 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d5b 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d63 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d6b e8f0b4afff                     call       0x7f56af6cda60
00d70 0f1f8400680e0008               nop        dword ptr [rax + rax + 0x8000e68]
00d78 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00d82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d86 e855dfc417                     call       0x7f56c78204e0
00d8b f4                             hlt        
00d8c be45ffffff                     mov        esi, 0xffffff45
00d91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d99 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d9e 44891c24                       mov        dword ptr [rsp], r11d
00da2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00da7 4489542404                     mov        dword ptr [rsp + 4], r10d
00dac 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00db1 44895c2408                     mov        dword ptr [rsp + 8], r11d
00db6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dbb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dc0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00dc5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00dca 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dcf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00dd4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00dd9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00dde 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00de3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00de8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ded 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00df2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00df7 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00dfc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e01 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e06 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e0b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e10 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e15 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e1a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e1f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e24 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e29 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e2e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e33 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e38 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e40 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e45 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e4d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e52 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e5a 90                             nop        
00e5b e800b4afff                     call       0x7f56af6cda60
00e60 0f1f8400580f0009               nop        dword ptr [rax + rax + 0x9000f58]
00e68 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00e72 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e76 e865dec417                     call       0x7f56c78204e0
00e7b f4                             hlt        
00e7c be45ffffff                     mov        esi, 0xffffff45
00e81 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e89 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e8e 44891c24                       mov        dword ptr [rsp], r11d
00e92 4489442408                     mov        dword ptr [rsp + 8], r8d
00e97 e8c4b3afff                     call       0x7f56af6cda60
00e9c 0f1f8400940f000a               nop        dword ptr [rax + rax + 0xa000f94]
00ea4 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00eae 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eb2 e829dec417                     call       0x7f56c78204e0
00eb7 f4                             hlt        
00eb8 be45ffffff                     mov        esi, 0xffffff45
00ebd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ec5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00eca 44891c24                       mov        dword ptr [rsp], r11d
00ece 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ed3 4489542404                     mov        dword ptr [rsp + 4], r10d
00ed8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00edd 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ee2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00eea 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00eef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ef4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ef9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00efe 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f03 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f08 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f0d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f12 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f17 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f1c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f21 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f26 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f2b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f30 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f35 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f3a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f3f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00f44 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00f49 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f4e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f53 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f58 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00f5d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f62 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00f67 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f6c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f71 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f79 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f7e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f86 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f8b e8d0b2afff                     call       0x7f56af6cda60
00f90 0f1f84008810000b               nop        dword ptr [rax + rax + 0xb001088]
00f98 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
00fa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fa6 e835ddc417                     call       0x7f56c78204e0
00fab f4                             hlt        
00fac be45ffffff                     mov        esi, 0xffffff45
00fb1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fb9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fbe 44891424                       mov        dword ptr [rsp], r10d
00fc2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00fc7 4489442404                     mov        dword ptr [rsp + 4], r8d
00fcc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fd1 4489542408                     mov        dword ptr [rsp + 8], r10d
00fd6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fde 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fe3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fe8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fed 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ff2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ff7 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00ffc 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01001 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01006 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0100b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01010 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01015 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0101a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0101f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01024 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01029 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0102e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01033 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01038 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0103d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01042 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01047 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0104c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01051 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01056 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0105b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01060 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01065 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0106d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01072 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0107a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0107f 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
01087 4489442478                     mov        dword ptr [rsp + 0x78], r8d
0108c 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
01094 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
0109c 90                             nop        
0109d 90                             nop        
0109e 90                             nop        
0109f e8bcb1afff                     call       0x7f56af6cda60
010a4 0f1f84009c11000c               nop        dword ptr [rax + rax + 0xc00119c]
010ac 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
010b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
010ba e821dcc417                     call       0x7f56c78204e0
010bf f4                             hlt        
010c0 be45ffffff                     mov        esi, 0xffffff45
010c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010cd 448b442408                     mov        r8d, dword ptr [rsp + 8]
010d2 44890424                       mov        dword ptr [rsp], r8d
010d6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
010db 4489542404                     mov        dword ptr [rsp + 4], r10d
010e0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010e5 4489442408                     mov        dword ptr [rsp + 8], r8d
010ea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010f2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010f7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01101 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01106 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0110b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01110 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01115 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0111a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0111f 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01124 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01129 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0112e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01133 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01138 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0113d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01142 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01147 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0114c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01151 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01156 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0115b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01160 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01165 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0116a 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0116f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01174 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01179 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01181 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01186 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0118e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01193 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
0119b 4489542474                     mov        dword ptr [rsp + 0x74], r10d
011a0 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011a8 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
011af 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011b7 e8a4b0afff                     call       0x7f56af6cda60
011bc 0f1f8400b412000d               nop        dword ptr [rax + rax + 0xd0012b4]
011c4 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
011ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
011d2 e809dbc417                     call       0x7f56c78204e0
011d7 f4                             hlt        
011d8 be45ffffff                     mov        esi, 0xffffff45
011dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011e5 448b442408                     mov        r8d, dword ptr [rsp + 8]
011ea 44890424                       mov        dword ptr [rsp], r8d
011ee 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
011f3 44894c2404                     mov        dword ptr [rsp + 4], r9d
011f8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
011fd 4489442408                     mov        dword ptr [rsp + 8], r8d
01202 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01207 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0120c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01211 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01216 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0121b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01220 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01225 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0122a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0122f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01234 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01239 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0123e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01243 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01248 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0124d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01252 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01257 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0125c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01261 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01266 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0126b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01270 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01275 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0127a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0127f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01284 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0128c 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01291 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01299 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0129e 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012a3 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
012aa 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012b2 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
012ba 90                             nop        
012bb e8a0afafff                     call       0x7f56af6cda60
012c0 0f1f8400b813000e               nop        dword ptr [rax + rax + 0xe0013b8]
012c8 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
012d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
012d6 e805dac417                     call       0x7f56c78204e0
012db f4                             hlt        
012dc 41b9ffffff7f                   mov        r9d, 0x7fffffff
012e2 4d3bc1                         cmp        r8, r9
012e5 bdffffffff                     mov        ebp, 0xffffffff
012ea 7c08                           jl         0x7f56afbd2af4
012ec 400f95c5                       setne      bpl
012f0 400fb6ed                       movzx      ebp, bpl
012f4 be45ffffff                     mov        esi, 0xffffff45
012f9 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01301 4c890c24                       mov        qword ptr [rsp], r9
01305 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
01309 895c240c                       mov        dword ptr [rsp + 0xc], ebx
0130d 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01315 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0131a 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0131f 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01324 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
01328 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
0132c 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01331 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01336 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
0133a 895c2434                       mov        dword ptr [rsp + 0x34], ebx
0133e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01343 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01348 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
0134c 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01350 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01355 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0135a 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01361 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01365 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0136a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0136f 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01373 895c2454                       mov        dword ptr [rsp + 0x54], ebx
01377 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0137c 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01381 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01386 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0138b 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01393 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01398 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
013a0 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
013a5 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013ad 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
013b4 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013bc 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
013c4 90                             nop        
013c5 90                             nop        
013c6 90                             nop        
013c7 e894aeafff                     call       0x7f56af6cda60
013cc 0f1f8400c414000f               nop        dword ptr [rax + rax + 0xf0014c4]
013d4 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
013de 4883e4f0                       and        rsp, 0xfffffffffffffff0
013e2 e8f9d8c417                     call       0x7f56c78204e0
013e7 f4                             hlt        
013e8 be45ffffff                     mov        esi, 0xffffff45
013ed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013f5 448b442408                     mov        r8d, dword ptr [rsp + 8]
013fa 44890424                       mov        dword ptr [rsp], r8d
013fe 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01403 4489442404                     mov        dword ptr [rsp + 4], r8d
01408 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0140d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01412 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01417 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0141c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01421 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01426 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0142b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01430 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01435 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0143a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0143f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01444 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01449 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0144e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01453 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01458 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0145d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01462 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01467 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0146c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01471 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01476 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0147b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01480 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01485 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0148a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0148f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01494 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0149c 4c89442460                     mov        qword ptr [rsp + 0x60], r8
014a1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
014a6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014ae 90                             nop        
014af e8acadafff                     call       0x7f56af6cda60
014b4 0f1f8400ac150010               nop        dword ptr [rax + rax + 0x100015ac]
014bc 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
014c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014ca e811d8c417                     call       0x7f56c78204e0
014cf f4                             hlt        
014d0 be45ffffff                     mov        esi, 0xffffff45
014d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014dd 448b442408                     mov        r8d, dword ptr [rsp + 8]
014e2 44890424                       mov        dword ptr [rsp], r8d
014e6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
014eb 4489442404                     mov        dword ptr [rsp + 4], r8d
014f0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014f5 4489542408                     mov        dword ptr [rsp + 8], r10d
014fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01504 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01509 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0150e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01513 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01518 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0151d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01522 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01527 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0152c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01531 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01536 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0153b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01540 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01545 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0154a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0154f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01554 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01559 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0155e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01563 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01568 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0156d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01572 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01577 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0157c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01584 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01589 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0158e 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01595 90                             nop        
01596 90                             nop        
01597 e8c4acafff                     call       0x7f56af6cda60
0159c 0f1f840094160011               nop        dword ptr [rax + rax + 0x11001694]
015a4 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
015ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
015b2 e829d7c417                     call       0x7f56c78204e0
015b7 f4                             hlt        
015b8 be3dffffff                     mov        esi, 0xffffff3d
015bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015c5 8b5c2408                       mov        ebx, dword ptr [rsp + 8]
015c9 891c24                         mov        dword ptr [rsp], ebx
015cc 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
015d1 4489442404                     mov        dword ptr [rsp + 4], r8d
015d6 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015db 4489442408                     mov        dword ptr [rsp + 8], r8d
015e0 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
015e5 4c89442418                     mov        qword ptr [rsp + 0x18], r8
015ea 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015ef 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015f4 8b5c2428                       mov        ebx, dword ptr [rsp + 0x28]
015f8 895c2420                       mov        dword ptr [rsp + 0x20], ebx
015fc 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01601 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01606 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
0160a 895c2428                       mov        dword ptr [rsp + 0x28], ebx
0160e 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01613 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01618 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
0161c 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01620 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01625 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0162a 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
0162e 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01632 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0163a 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0163f 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01643 895c2448                       mov        dword ptr [rsp + 0x48], ebx
01647 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0164c 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01651 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01655 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01659 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0165e 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01663 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0166b 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01670 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01678 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0167d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01682 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0168a 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01691 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01699 90                             nop        
0169a 90                             nop        
0169b e8c0abafff                     call       0x7f56af6cda60
016a0 0f1f840098170012               nop        dword ptr [rax + rax + 0x12001798]
016a8 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
016b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016b6 e825d6c417                     call       0x7f56c78204e0
016bb f4                             hlt        
016bc be45ffffff                     mov        esi, 0xffffff45
016c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016c9 448b542408                     mov        r10d, dword ptr [rsp + 8]
016ce 44891424                       mov        dword ptr [rsp], r10d
016d2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016d7 4489542404                     mov        dword ptr [rsp + 4], r10d
016dc 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
016e1 4489442408                     mov        dword ptr [rsp + 8], r8d
016e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016f5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016fa 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
016ff 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01704 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01709 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0170e 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01713 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01718 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0171d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01722 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01727 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0172c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01731 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01736 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0173b 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0173f 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01744 90                             nop        
01745 90                             nop        
01746 90                             nop        
01747 e814abafff                     call       0x7f56af6cda60
0174c 0f1f840044180013               nop        dword ptr [rax + rax + 0x13001844]
01754 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
0175e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01762 e879d5c417                     call       0x7f56c78204e0
01767 f4                             hlt        
01768 be45ffffff                     mov        esi, 0xffffff45
0176d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01775 448b442408                     mov        r8d, dword ptr [rsp + 8]
0177a 44890424                       mov        dword ptr [rsp], r8d
0177e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01783 44894c2404                     mov        dword ptr [rsp + 4], r9d
01788 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0178d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01792 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01797 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0179c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
017a1 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017a6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
017ab 4489442420                     mov        dword ptr [rsp + 0x20], r8d
017b0 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
017b5 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
017ba 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
017bf 4489442428                     mov        dword ptr [rsp + 0x28], r8d
017c4 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
017c9 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
017ce 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017d2 4489542454                     mov        dword ptr [rsp + 0x54], r10d
017d7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
017dc 90                             nop        
017dd 90                             nop        
017de 90                             nop        
017df e87caaafff                     call       0x7f56af6cda60
017e4 0f1f8400dc180014               nop        dword ptr [rax + rax + 0x140018dc]
017ec 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
017f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fa e8e1d4c417                     call       0x7f56c78204e0
017ff f4                             hlt        
01800 be45ffffff                     mov        esi, 0xffffff45
01805 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0180d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01812 44891c24                       mov        dword ptr [rsp], r11d
01816 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0181b 4489542404                     mov        dword ptr [rsp + 4], r10d
01820 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01825 4489542408                     mov        dword ptr [rsp + 8], r10d
0182a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01832 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01837 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0183c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01841 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01846 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0184b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01850 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01855 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0185a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0185f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01864 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01869 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0186e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01873 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01878 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0187d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01882 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01887 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0188c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01891 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01896 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0189b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
018a0 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
018a5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018aa 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
018af 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018b4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018b9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018c1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018c6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018ce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018d3 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
018db 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
018e3 e878a9afff                     call       0x7f56af6cda60
018e8 0f1f8400e0190015               nop        dword ptr [rax + rax + 0x150019e0]
018f0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
018fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018fe e8ddd3c417                     call       0x7f56c78204e0
01903 f4                             hlt        
01904 be45ffffff                     mov        esi, 0xffffff45
01909 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01911 448b542408                     mov        r10d, dword ptr [rsp + 8]
01916 44891424                       mov        dword ptr [rsp], r10d
0191a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0191f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01924 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01929 4489542408                     mov        dword ptr [rsp + 8], r10d
0192e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01933 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01938 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0193d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01942 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01947 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0194c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01951 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01956 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0195b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01960 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01965 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0196a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0196f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01974 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01979 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0197e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01983 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01988 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0198d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01992 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01997 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0199c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
019a1 4489542450                     mov        dword ptr [rsp + 0x50], r10d
019a6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019ab 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019b0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
019b8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
019bd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019c5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
019ca 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
019d2 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
019da 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
019e1 90                             nop        
019e2 90                             nop        
019e3 e878a8afff                     call       0x7f56af6cda60
019e8 0f1f8400e01a0016               nop        dword ptr [rax + rax + 0x16001ae0]
019f0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
019fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019fe e8ddd2c417                     call       0x7f56c78204e0
01a03 f4                             hlt        
01a04 4585db                         test       r11d, r11d
01a07 7f07                           jg         0x7f56afbd3210
01a09 33c0                           xor        eax, eax
01a0b e9b7e6ffff                     jmp        0x7f56afbd18c7
01a10 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a14 89742428                       mov        dword ptr [rsp + 0x28], esi
01a18 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01a1c 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01a21 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01a26 897c2410                       mov        dword ptr [rsp + 0x10], edi
01a2a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a34 8b0424                         mov        eax, dword ptr [rsp]
01a37 89442404                       mov        dword ptr [rsp + 4], eax
01a3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a40 48894424f8                     mov        qword ptr [rsp - 8], rax
01a45 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a4c 890424                         mov        dword ptr [rsp], eax
01a4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a54 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a5c 488bf5                         mov        rsi, rbp
01a5f 8bd1                           mov        edx, ecx
01a61 418bcb                         mov        ecx, r11d
01a64 90                             nop        
01a65 90                             nop        
01a66 90                             nop        
01a67 e8f4c9b5ff                     call       0x7f56af72fc60
01a6c 0f1f8400641b0017               nop        dword ptr [rax + rax + 0x17001b64]
01a74 41ba40000000                   mov        r10d, 0x40
01a7a 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01a7f c4e2a9f7c0                     shlx       rax, rax, r10
01a84 48894424f8                     mov        qword ptr [rsp - 8], rax
01a89 8b442404                       mov        eax, dword ptr [rsp + 4]
01a8d 890424                         mov        dword ptr [rsp], eax
01a90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a95 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01a9a 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01a9e 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01aa3 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01aa8 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01aac 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01ab0 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01ab4 e90ee6ffff                     jmp        0x7f56afbd18c7
01ab9 4585db                         test       r11d, r11d
01abc 7f08                           jg         0x7f56afbd32c6
01abe 4533f6                         xor        r14d, r14d
01ac1 e942e6ffff                     jmp        0x7f56afbd1908
01ac6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01acb 4889442430                     mov        qword ptr [rsp + 0x30], rax
01ad0 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ad4 89742428                       mov        dword ptr [rsp + 0x28], esi
01ad8 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01adc 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01ae1 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01ae6 897c2410                       mov        dword ptr [rsp + 0x10], edi
01aea 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01aef 48894424f8                     mov        qword ptr [rsp - 8], rax
01af4 8b0424                         mov        eax, dword ptr [rsp]
01af7 89442404                       mov        dword ptr [rsp + 4], eax
01afb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b00 48894424f8                     mov        qword ptr [rsp - 8], rax
01b05 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b0c 890424                         mov        dword ptr [rsp], eax
01b0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b14 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b1c 488bf5                         mov        rsi, rbp
01b1f 8b542408                       mov        edx, dword ptr [rsp + 8]
01b23 418bcb                         mov        ecx, r11d
01b26 90                             nop        
01b27 e834c9b5ff                     call       0x7f56af72fc60
01b2c 0f1f8400241c0018               nop        dword ptr [rax + rax + 0x18001c24]
01b34 41ba80000000                   mov        r10d, 0x80
01b3a 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01b3f c462a9f7f0                     shlx       r14, rax, r10
01b44 48894424f8                     mov        qword ptr [rsp - 8], rax
01b49 8b442404                       mov        eax, dword ptr [rsp + 4]
01b4d 890424                         mov        dword ptr [rsp], eax
01b50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b55 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01b59 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01b5e 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01b62 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01b66 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b6a 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01b6f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b74 e98fe5ffff                     jmp        0x7f56afbd1908
01b79 4533c0                         xor        r8d, r8d
01b7c e97eeeffff                     jmp        0x7f56afbd21ff
01b81 bee4ffffff                     mov        esi, 0xffffffe4
01b86 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b8e 488f0424                       pop        qword ptr [rsp]
01b92 90                             nop        
01b93 e8c8a6afff                     call       0x7f56af6cda60
01b98 0f1f8400901c0019               nop        dword ptr [rax + rax + 0x19001c90]
01ba0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bae e82dd1c417                     call       0x7f56c78204e0
01bb3 f4                             hlt        
01bb4 be5d000000                     mov        esi, 0x5d
01bb9 90                             nop        
01bba 90                             nop        
01bbb e8a0a6afff                     call       0x7f56af6cda60
01bc0 0f1f8400b81c001a               nop        dword ptr [rax + rax + 0x1a001cb8]
01bc8 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01bd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bd6 e805d1c417                     call       0x7f56c78204e0
01bdb f4                             hlt        
01bdc bef6ffffff                     mov        esi, 0xfffffff6
01be1 90                             nop        
01be2 90                             nop        
01be3 e878a6afff                     call       0x7f56af6cda60
01be8 0f1f8400e01c001b               nop        dword ptr [rax + rax + 0x1b001ce0]
01bf0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01bfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfe e8ddd0c417                     call       0x7f56c78204e0
01c03 f4                             hlt        
01c04 bef6ffffff                     mov        esi, 0xfffffff6
01c09 90                             nop        
01c0a 90                             nop        
01c0b e850a6afff                     call       0x7f56af6cda60
01c10 0f1f8400081d001c               nop        dword ptr [rax + rax + 0x1c001d08]
01c18 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01c22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c26 e8b5d0c417                     call       0x7f56c78204e0
01c2b f4                             hlt        
01c2c be6effffff                     mov        esi, 0xffffff6e
01c31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c39 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c3e 44891424                       mov        dword ptr [rsp], r10d
01c42 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c47 4489542408                     mov        dword ptr [rsp + 8], r10d
01c4c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c56 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c5b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c60 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c65 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c6a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c6f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c74 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01c79 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01c7e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01c83 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c88 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01c8d 90                             nop        
01c8e 90                             nop        
01c8f e8cca5afff                     call       0x7f56af6cda60
01c94 0f1f84008c1d001d               nop        dword ptr [rax + rax + 0x1d001d8c]
01c9c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01ca6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01caa e831d0c417                     call       0x7f56c78204e0
01caf f4                             hlt        
01cb0 bee4ffffff                     mov        esi, 0xffffffe4
01cb5 48ffb42490000000               push       qword ptr [rsp + 0x90]
01cbd 488f0424                       pop        qword ptr [rsp]
01cc1 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01cc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01ccb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01cd2 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01cd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cdb 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01cdf 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ce3 e878a5afff                     call       0x7f56af6cda60
01ce8 0f1f8400e01d001e               nop        dword ptr [rax + rax + 0x1e001de0]
01cf0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01cfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cfe e8ddcfc417                     call       0x7f56c78204e0
01d03 f4                             hlt        
01d04 bee4ffffff                     mov        esi, 0xffffffe4
01d09 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d11 488f0424                       pop        qword ptr [rsp]
01d15 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d21 89442418                       mov        dword ptr [rsp + 0x18], eax
01d25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2a 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01d2e 89542428                       mov        dword ptr [rsp + 0x28], edx
01d32 4889442430                     mov        qword ptr [rsp + 0x30], rax
01d37 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d3c 90                             nop        
01d3d 90                             nop        
01d3e 90                             nop        
01d3f e81ca5afff                     call       0x7f56af6cda60
01d44 0f1f84003c1e001f               nop        dword ptr [rax + rax + 0x1f001e3c]
01d4c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01d56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d5a e881cfc417                     call       0x7f56c78204e0
01d5f f4                             hlt        
01d60 bebeffffff                     mov        esi, 0xffffffbe
01d65 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d6d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d72 44891424                       mov        dword ptr [rsp], r10d
01d76 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d7b 4489542408                     mov        dword ptr [rsp + 8], r10d
01d80 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d85 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d8a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d8f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d94 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d99 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d9e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01da3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01da8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01dad 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01db2 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01db7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01dbc 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01dc1 90                             nop        
01dc2 90                             nop        
01dc3 e898a4afff                     call       0x7f56af6cda60
01dc8 0f1f8400c01e0020               nop        dword ptr [rax + rax + 0x20001ec0]
01dd0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01dda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dde e8fdcec417                     call       0x7f56c78204e0
01de3 f4                             hlt        
01de4 beccffffff                     mov        esi, 0xffffffcc
01de9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01df1 890c24                         mov        dword ptr [rsp], ecx
01df4 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01df9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfe 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e05 89442414                       mov        dword ptr [rsp + 0x14], eax
01e09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0e 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01e12 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01e16 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01e1a 90                             nop        
01e1b e840a4afff                     call       0x7f56af6cda60
01e20 0f1f8400181f0021               nop        dword ptr [rax + rax + 0x21001f18]
01e28 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01e32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e36 e8a5cec417                     call       0x7f56c78204e0
01e3b f4                             hlt        
01e3c beccffffff                     mov        esi, 0xffffffcc
01e41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e49 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e4e 44890424                       mov        dword ptr [rsp], r8d
01e52 48894424f8                     mov        qword ptr [rsp - 8], rax
01e57 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e5e 89442410                       mov        dword ptr [rsp + 0x10], eax
01e62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e67 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01e6b 89542418                       mov        dword ptr [rsp + 0x18], edx
01e6f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01e74 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01e79 897c2434                       mov        dword ptr [rsp + 0x34], edi
01e7d 90                             nop        
01e7e 90                             nop        
01e7f e8dca3afff                     call       0x7f56af6cda60
01e84 0f1f84007c1f0022               nop        dword ptr [rax + rax + 0x22001f7c]
01e8c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01e96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e9a e841cec417                     call       0x7f56c78204e0
01e9f f4                             hlt        
01ea0 be45ffffff                     mov        esi, 0xffffff45
01ea5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01eaa 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01eaf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01eb4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01eb9 90                             nop        
01eba 90                             nop        
01ebb e8a0a3afff                     call       0x7f56af6cda60
01ec0 0f1f8400b81f0023               nop        dword ptr [rax + rax + 0x23001fb8]
01ec8 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01ed2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ed6 e805cec417                     call       0x7f56c78204e0
01edb f4                             hlt        
01edc be45ffffff                     mov        esi, 0xffffff45
01ee1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ee6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01eeb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ef0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ef5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01efa 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01eff e85ca3afff                     call       0x7f56af6cda60
01f04 0f1f8400fc1f0024               nop        dword ptr [rax + rax + 0x24001ffc]
01f0c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01f16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f1a e8c1cdc417                     call       0x7f56c78204e0
01f1f f4                             hlt        
01f20 bef6ffffff                     mov        esi, 0xfffffff6
01f25 90                             nop        
01f26 90                             nop        
01f27 e834a3afff                     call       0x7f56af6cda60
01f2c 0f1f840024200025               nop        dword ptr [rax + rax + 0x25002024]
01f34 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01f3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f42 e899cdc417                     call       0x7f56c78204e0
01f47 f4                             hlt        
01f48 be5d000000                     mov        esi, 0x5d
01f4d 90                             nop        
01f4e 90                             nop        
01f4f e80ca3afff                     call       0x7f56af6cda60
01f54 0f1f84004c200026               nop        dword ptr [rax + rax + 0x2600204c]
01f5c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01f66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6a e871cdc417                     call       0x7f56c78204e0
01f6f f4                             hlt        
01f70 be45ffffff                     mov        esi, 0xffffff45
01f75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f7d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01f82 44891424                       mov        dword ptr [rsp], r10d
01f86 90                             nop        
01f87 e8d4a2afff                     call       0x7f56af6cda60
01f8c 0f1f840084200027               nop        dword ptr [rax + rax + 0x27002084]
01f94 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01f9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fa2 e839cdc417                     call       0x7f56c78204e0
01fa7 f4                             hlt        
01fa8 bef6ffffff                     mov        esi, 0xfffffff6
01fad 418be8                         mov        ebp, r8d
01fb0 90                             nop        
01fb1 90                             nop        
01fb2 90                             nop        
01fb3 e8a8a2afff                     call       0x7f56af6cda60
01fb8 0f1f8400b0200028               nop        dword ptr [rax + rax + 0x280020b0]
01fc0 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01fca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fce e80dcdc417                     call       0x7f56c78204e0
01fd3 f4                             hlt        
01fd4 bef6ffffff                     mov        esi, 0xfffffff6
01fd9 8be9                           mov        ebp, ecx
01fdb e880a2afff                     call       0x7f56af6cda60
01fe0 0f1f8400d8200029               nop        dword ptr [rax + rax + 0x290020d8]
01fe8 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
01ff2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff6 e8e5ccc417                     call       0x7f56c78204e0
01ffb f4                             hlt        
01ffc bef6ffffff                     mov        esi, 0xfffffff6
02001 418be8                         mov        ebp, r8d
02004 90                             nop        
02005 90                             nop        
02006 90                             nop        
02007 e854a2afff                     call       0x7f56af6cda60
0200c 0f1f84000421002a               nop        dword ptr [rax + rax + 0x2a002104]
02014 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
0201e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02022 e8b9ccc417                     call       0x7f56c78204e0
02027 f4                             hlt        
02028 bef6ffffff                     mov        esi, 0xfffffff6
0202d 90                             nop        
0202e 90                             nop        
0202f e82ca2afff                     call       0x7f56af6cda60
02034 0f1f84002c21002b               nop        dword ptr [rax + rax + 0x2b00212c]
0203c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
02046 4883e4f0                       and        rsp, 0xfffffffffffffff0
0204a e891ccc417                     call       0x7f56c78204e0
0204f f4                             hlt        
02050 bef6ffffff                     mov        esi, 0xfffffff6
02055 90                             nop        
02056 90                             nop        
02057 e804a2afff                     call       0x7f56af6cda60
0205c 0f1f84005421002c               nop        dword ptr [rax + rax + 0x2c002154]
02064 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
0206e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02072 e869ccc417                     call       0x7f56c78204e0
02077 f4                             hlt        
02078 bef6ffffff                     mov        esi, 0xfffffff6
0207d 90                             nop        
0207e 90                             nop        
0207f e8dca1afff                     call       0x7f56af6cda60
02084 0f1f84007c21002d               nop        dword ptr [rax + rax + 0x2d00217c]
0208c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
02096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209a e841ccc417                     call       0x7f56c78204e0
0209f f4                             hlt        
020a0 bef6ffffff                     mov        esi, 0xfffffff6
020a5 90                             nop        
020a6 90                             nop        
020a7 e8b4a1afff                     call       0x7f56af6cda60
020ac 0f1f8400a421002e               nop        dword ptr [rax + rax + 0x2e0021a4]
020b4 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
020be 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c2 e819ccc417                     call       0x7f56c78204e0
020c7 f4                             hlt        
020c8 bef6ffffff                     mov        esi, 0xfffffff6
020cd 90                             nop        
020ce 90                             nop        
020cf e88ca1afff                     call       0x7f56af6cda60
020d4 0f1f8400cc21002f               nop        dword ptr [rax + rax + 0x2f0021cc]
020dc 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
020e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ea e8f1cbc417                     call       0x7f56c78204e0
020ef f4                             hlt        
020f0 bef6ffffff                     mov        esi, 0xfffffff6
020f5 90                             nop        
020f6 90                             nop        
020f7 e864a1afff                     call       0x7f56af6cda60
020fc 0f1f8400f4210030               nop        dword ptr [rax + rax + 0x300021f4]
02104 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
0210e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02112 e8c9cbc417                     call       0x7f56c78204e0
02117 f4                             hlt        
02118 bef6ffffff                     mov        esi, 0xfffffff6
0211d 90                             nop        
0211e 90                             nop        
0211f e83ca1afff                     call       0x7f56af6cda60
02124 0f1f84001c220031               nop        dword ptr [rax + rax + 0x3100221c]
0212c 48bf30b92688567f0000           movabs     rdi, 0x7f568826b930
02136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213a e8a1cbc417                     call       0x7f56c78204e0
0213f f4                             hlt        
02140 eb08                           jmp        0x7f56afbd394a
02142 eb06                           jmp        0x7f56afbd394a
02144 eb04                           jmp        0x7f56afbd394a
02146 eb02                           jmp        0x7f56afbd394a
02148 eb00                           jmp        0x7f56afbd394a
0214a 488bf0                         mov        rsi, rax
0214d e912e9ffff                     jmp        0x7f56afbd2264
02152 49ba3522bdaf567f0000           movabs     r10, 0x7f56afbd2235
0215c 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02163 e9f8e9b5ff                     jmp        0x7f56af732360
02168 e873b8b4ff                     call       0x7f56af71f1e0
0216d e9acdeffff                     jmp        0x7f56afbd181e
02172 f4                             hlt        
02173 f4                             hlt        
02174 f4                             hlt        
02175 f4                             hlt        
02176 f4                             hlt        
02177 f4                             hlt        
