00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f857e230000                   jne        0x7f63dbbfd89c
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5e08                       mov        r11d, dword ptr [rsi + 8]
00049 44891c24                       mov        dword ptr [rsp], r11d
0004d 413beb                         cmp        ebp, r11d
00050 0f83391c0000                   jae        0x7f63dbbfd18f
00056 0fb65c160b                     movzx      ebx, byte ptr [rsi + rdx + 0xb]
0005b 85db                           test       ebx, ebx
0005d 0f84611c0000                   je         0x7f63dbbfd1c4
00063 448bca                         mov        r9d, edx
00066 442bc9                         sub        r9d, ecx
00069 448b1424                       mov        r10d, dword ptr [rsp]
0006d 4183c2f9                       add        r10d, -7
00071 448d42f8                       lea        r8d, [rdx - 8]
00075 428d0ccd00000000               lea        ecx, [r9*8]
0007d f30fbddb                       lzcnt      ebx, ebx
00081 41bd1f000000                   mov        r13d, 0x1f
00087 442beb                         sub        r13d, ebx
0008a bb08000000                     mov        ebx, 8
0008f 412bdd                         sub        ebx, r13d
00092 8bd1                           mov        edx, ecx
00094 2bd3                           sub        edx, ebx
00096 4183f908                       cmp        r9d, 8
0009a 0f8c741a0000                   jl         0x7f63dbbfd014
000a0 4585d2                         test       r10d, r10d
000a3 0f8c831e0000                   jl         0x7f63dbbfd42c
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 443bc5                         cmp        r8d, ebp
000b2 0f83241d0000                   jae        0x7f63dbbfd2dc
000b8 458bd8                         mov        r11d, r8d
000bb 4a8b441e0c                     mov        rax, qword ptr [rsi + r11 + 0xc]
000c0 4183c1f8                       add        r9d, -8
000c4 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
000cc 4183c3f0                       add        r11d, -0x10
000d0 4183f908                       cmp        r9d, 8
000d4 0f8ce81a0000                   jl         0x7f63dbbfd0c2
000da 4585d2                         test       r10d, r10d
000dd 0f8cb11e0000                   jl         0x7f63dbbfd494
000e3 8b2c24                         mov        ebp, dword ptr [rsp]
000e6 83c5f9                         add        ebp, -7
000e9 443bdd                         cmp        r11d, ebp
000ec 0f833e1d0000                   jae        0x7f63dbbfd330
000f2 418bcb                         mov        ecx, r11d
000f5 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000fd 4d8b74090c                     mov        r14, qword ptr [r9 + rcx + 0xc]
00102 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00107 8b4d1c                         mov        ecx, dword ptr [rbp + 0x1c]
0010a 85c9                           test       ecx, ecx
0010c 0f84da1b0000                   je         0x7f63dbbfd1ec
00112 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00116 418b7908                       mov        edi, dword ptr [r9 + 8]
0011a 8b7524                         mov        esi, dword ptr [rbp + 0x24]
0011d 85f6                           test       esi, esi
0011f 0f84ef1b0000                   je         0x7f63dbbfd214
00125 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0012a 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
00132 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00137 4889442428                     mov        qword ptr [rsp + 0x28], rax
0013c 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00143 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
00148 895c2424                       mov        dword ptr [rsp + 0x24], ebx
0014c 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00151 4489542404                     mov        dword ptr [rsp + 4], r10d
00156 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015e 037908                         add        edi, dword ptr [rcx + 8]
00161 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00165 037e08                         add        edi, dword ptr [rsi + 8]
00168 89742438                       mov        dword ptr [rsp + 0x38], esi
0016c 897c241c                       mov        dword ptr [rsp + 0x1c], edi
00170 4c8bd6                         mov        r10, rsi
00173 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00178 4c8bd1                         mov        r10, rcx
0017b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00180 4d8bd1                         mov        r10, r9
00183 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00188 85ff                           test       edi, edi
0018a 0f8412090000                   je         0x7f63dbbfbfa2
00190 be40000000                     mov        esi, 0x40
00195 2bf3                           sub        esi, ebx
00197 3bfe                           cmp        edi, esi
00199 0f8fef010000                   jg         0x7f63dbbfb88e
0019f 2bf7                           sub        esi, edi
001a1 c462cbf7c0                     shrx       r8, rax, rsi
001a6 83ff40                         cmp        edi, 0x40
001a9 0f8dcd1f0000                   jge        0x7f63dbbfd67c
001af 41ba01000000                   mov        r10d, 1
001b5 c4c2c1f7ea                     shlx       rbp, r10, rdi
001ba 48ffcd                         dec        rbp
001bd 4923e8                         and        rbp, r8
001c0 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001c5 448bdf                         mov        r11d, edi
001c8 458bcb                         mov        r9d, r11d
001cb 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001d0 458d5108                       lea        r10d, [r9 + 8]
001d4 4183fa40                       cmp        r10d, 0x40
001d8 7c35                           jl         0x7f63dbbfb70f
001da 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001df 4183c1c8                       add        r9d, -0x38
001e3 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001e8 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f0 8b542408                       mov        edx, dword ptr [rsp + 8]
001f4 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
001f8 90                             nop        
001f9 90                             nop        
001fa 90                             nop        
001fb e86085b4ff                     call       0x7f63db743c60
00200 0f1f8400f8020000               nop        dword ptr [rax + rax + 0x2f8]
00208 4889442420                     mov        qword ptr [rsp + 0x20], rax
0020d eb31                           jmp        0x7f63dbbfb740
0020f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00214 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0021c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00221 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00226 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0022e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00236 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0023b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00240 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00245 458b5208                       mov        r10d, dword ptr [r10 + 8]
00249 4183fa20                       cmp        r10d, 0x20
0024d 0f8db11d0000                   jge        0x7f63dbbfd504
00253 c462abf74c2460                 shrx       r9, qword ptr [rsp + 0x60], r10
0025a 41b801000000                   mov        r8d, 1
00260 c44229f7d8                     shlx       r11d, r8d, r10d
00265 41ffcb                         dec        r11d
00268 4d63d3                         movsxd     r10, r11d
0026b 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00270 458bda                         mov        r11d, r10d
00273 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00278 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0027d 458b5208                       mov        r10d, dword ptr [r10 + 8]
00281 418bca                         mov        ecx, r10d
00284 4183fa20                       cmp        r10d, 0x20
00288 0f8d021e0000                   jge        0x7f63dbbfd590
0028e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00296 458b5228                       mov        r10d, dword ptr [r10 + 0x28]
0029a 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002a2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002a7 458b5a18                       mov        r11d, dword ptr [r10 + 0x18]
002ab 418b5b08                       mov        ebx, dword ptr [r11 + 8]
002af 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002b4 458b5318                       mov        r10d, dword ptr [r11 + 0x18]
002b8 418b7a08                       mov        edi, dword ptr [r10 + 8]
002bc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002c1 458b5a18                       mov        r11d, dword ptr [r10 + 0x18]
002c5 458b5308                       mov        r10d, dword ptr [r11 + 8]
002c9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002ce 4585db                         test       r11d, r11d
002d1 0f8eb0190000                   jle        0x7f63dbbfd187
002d7 ffcb                           dec        ebx
002d9 895c2460                       mov        dword ptr [rsp + 0x60], ebx
002dd ffcf                           dec        edi
002df 897c2464                       mov        dword ptr [rsp + 0x64], edi
002e3 41ffca                         dec        r10d
002e6 4489542468                     mov        dword ptr [rsp + 0x68], r10d
002eb c442f3f7d1                     shrx       r10, r9, rcx
002f0 c44271f7d8                     shlx       r11d, r8d, ecx
002f5 458bc2                         mov        r8d, r10d
002f8 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
002fd 41ffcb                         dec        r11d
00300 4d63d3                         movsxd     r10, r11d
00303 4d23d1                         and        r10, r9
00306 458bd2                         mov        r10d, r10d
00309 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0030e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00316 458b9af8000000                 mov        r11d, dword ptr [r10 + 0xf8]
0031d 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00325 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
0032c 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00334 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00338 4585db                         test       r11d, r11d
0033b 0f86fb190000                   jbe        0x7f63dbbfd23c
00341 4d63d3                         movsxd     r10, r11d
00344 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00349 49ffcb                         dec        r11
0034c 4d3bda                         cmp        r11, r10
0034f 0f83e7190000                   jae        0x7f63dbbfd23c
00355 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0035a 4585db                         test       r11d, r11d
0035d 0f8c291b0000                   jl         0x7f63dbbfd38c
00363 448b1424                       mov        r10d, dword ptr [rsp]
00367 4183c2f9                       add        r10d, -7
0036b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00373 4533d2                         xor        r10d, r10d
00376 4533db                         xor        r11d, r11d
00379 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00381 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00389 e991020000                     jmp        0x7f63dbbfbb1f
0038e 8bef                           mov        ebp, edi
00390 2bee                           sub        ebp, esi
00392 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0039a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0039f e8bc83b4ff                     call       0x7f63db743c60
003a4 0f1f84009c040001               nop        dword ptr [rax + rax + 0x100049c]
003ac 4823442428                     and        rax, qword ptr [rsp + 0x28]
003b1 41ba40000000                   mov        r10d, 0x40
003b7 442bd5                         sub        r10d, ebp
003ba c462d1f7d8                     shlx       r11, rax, rbp
003bf c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003c9 4d0bda                         or         r11, r10
003cc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003d1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003d6 e9edfdffff                     jmp        0x7f63dbbfb6c8
003db 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003e3 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
003e8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003ed 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
003f5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
003fa 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
003fe 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00402 90                             nop        
00403 90                             nop        
00404 90                             nop        
00405 90                             nop        
00406 90                             nop        
00407 90                             nop        
00408 90                             nop        
00409 90                             nop        
0040a 90                             nop        
0040b 90                             nop        
0040c 90                             nop        
0040d 90                             nop        
0040e 90                             nop        
0040f 90                             nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8d240a0000                   jge        0x7f63dbbfc344
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8de50a0000                   jge        0x7f63dbbfc438
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8dd30b0000                   jge        0x7f63dbbfc54c
00479 c4e2d3f7cf                     shrx       rcx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8db60c0000                   jge        0x7f63dbbfc658
004a2 41bb01000000                   mov        r11d, 1
004a8 c442d1f7cb                     shlx       r9, r11, rbp
004ad 49ffc9                         dec        r9
004b0 4c23c9                         and        r9, rcx
004b3 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004bb 418bcb                         mov        ecx, r11d
004be 4103ca                         add        ecx, r10d
004c1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c6 458bd2                         mov        r10d, r10d
004c9 4403d3                         add        r10d, ebx
004cc 4c63d9                         movsxd     r11, ecx
004cf 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
004d7 8bdb                           mov        ebx, ebx
004d9 4c03cb                         add        r9, rbx
004dc 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
004e4 4903db                         add        rbx, r11
004e7 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
004ef 4d85c9                         test       r9, r9
004f2 0f8e44080000                   jle        0x7f63dbbfc23c
004f8 4981f9ffffff7f                 cmp        r9, 0x7fffffff
004ff 0f8f930d0000                   jg         0x7f63dbbfc798
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8f920e0000                   jg         0x7f63dbbfc8a4
00512 81f9ffff0300                   cmp        ecx, 0x3ffff
00518 0f8f9a0f0000                   jg         0x7f63dbbfc9b8
0051e 418bd9                         mov        ebx, r9d
00521 81fb00000010                   cmp        ebx, 0x10000000
00527 0f839b100000                   jae        0x7f63dbbfcac8
0052d 4d63d2                         movsxd     r10, r10d
00530 4863cb                         movsxd     rcx, ebx
00533 49c1e312                       shl        r11, 0x12
00537 48c1e124                       shl        rcx, 0x24
0053b 490bcb                         or         rcx, r11
0053e 490bca                         or         rcx, r10
00541 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00549 448b8c24dc000000               mov        r9d, dword ptr [rsp + 0xdc]
00551 4b894cca10                     mov        qword ptr [r10 + r9*8 + 0x10], rcx
00556 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
0055a 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0055e 0f8daa000000                   jge        0x7f63dbbfbb0e
00564 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056c 49c1ea30                       shr        r10, 0x30
00570 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00575 49c1eb30                       shr        r11, 0x30
00579 418bca                         mov        ecx, r10d
0057c 458bd3                         mov        r10d, r11d
0057f 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
00587 c44233f7c8                     shrx       r9d, r8d, r9d
0058c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00594 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
0059c c4c223f7d8                     shrx       ebx, r8d, r11d
005a1 4403d3                         add        r10d, ebx
005a4 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
005a9 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005b1 4183fb20                       cmp        r11d, 0x20
005b5 0f8da5110000                   jge        0x7f63dbbfcc60
005bb 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005c3 49c1ea30                       shr        r10, 0x30
005c7 418bda                         mov        ebx, r10d
005ca 41ba01000000                   mov        r10d, 1
005d0 c44221f7d2                     shlx       r10d, r10d, r11d
005d5 41ffca                         dec        r10d
005d8 4523d1                         and        r10d, r9d
005db 4403d1                         add        r10d, ecx
005de 4489542448                     mov        dword ptr [rsp + 0x48], r10d
005e3 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005eb 4183fa20                       cmp        r10d, 0x20
005ef 0f8d37120000                   jge        0x7f63dbbfcd2c
005f5 41b901000000                   mov        r9d, 1
005fb c44229f7d1                     shlx       r10d, r9d, r10d
00600 41ffca                         dec        r10d
00603 4523d0                         and        r10d, r8d
00606 4403d3                         add        r10d, ebx
00609 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8dce030000                   jge        0x7f63dbbfbee6
00618 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0061f 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00624 44234c246c                     and        r9d, dword ptr [rsp + 0x6c]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
00632 458b4308                       mov        r8d, dword ptr [r11 + 8]
00636 453bc8                         cmp        r9d, r8d
00639 0f8373040000                   jae        0x7f63dbbfbfb2
0063f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00644 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00649 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0064e 418b5818                       mov        ebx, dword ptr [r8 + 0x18]
00652 448b4308                       mov        r8d, dword ptr [rbx + 8]
00656 4f8b5ccb10                     mov        r11, qword ptr [r11 + r9*8 + 0x10]
0065b 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00660 453bd0                         cmp        r10d, r8d
00663 0f8317050000                   jae        0x7f63dbbfc080
00669 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0066e 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
00673 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00678 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
0067c 418b4908                       mov        ecx, dword ptr [r9 + 8]
00680 4e8b54d310                     mov        r10, qword ptr [rbx + r10*8 + 0x10]
00685 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0068d 443bd9                         cmp        r11d, ecx
00690 0f83c2050000                   jae        0x7f63dbbfc158
00696 4f8b54d910                     mov        r10, qword ptr [r9 + r11*8 + 0x10]
0069b 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a3 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006aa ffc5                           inc        ebp
006ac 896c2404                       mov        dword ptr [rsp + 4], ebp
006b0 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b4 0f8da7030000                   jge        0x7f63dbbfbf61
006ba 49c1ea28                       shr        r10, 0x28
006be 458bda                         mov        r11d, r10d
006c1 450fb6d3                       movzx      r10d, r11b
006c5 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006cd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d2 49c1ea28                       shr        r10, 0x28
006d6 458bd2                         mov        r10d, r10d
006d9 410fb6ea                       movzx      ebp, r10b
006dd 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006e4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006ec 49c1ea28                       shr        r10, 0x28
006f0 458bda                         mov        r11d, r10d
006f3 450fb6db                       movzx      r11d, r11b
006f7 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
006ff 4103eb                         add        ebp, r11d
00702 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00709 41bb01000000                   mov        r11d, 1
0070f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00717 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0071f 49c1ea20                       shr        r10, 0x20
00723 458bda                         mov        r11d, r10d
00726 410fb6eb                       movzx      ebp, r11b
0072a 896c2474                       mov        dword ptr [rsp + 0x74], ebp
0072e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00733 49c1ea20                       shr        r10, 0x20
00737 458bd2                         mov        r10d, r10d
0073a 410fb6ea                       movzx      ebp, r10b
0073e 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00745 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0074d 49c1ea20                       shr        r10, 0x20
00751 458bda                         mov        r11d, r10d
00754 410fb6eb                       movzx      ebp, r11b
00758 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0075f 448bc5                         mov        r8d, ebp
00762 4403442474                     add        r8d, dword ptr [rsp + 0x74]
00767 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
0076f 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
00777 4585c0                         test       r8d, r8d
0077a 0f8412030000                   je         0x7f63dbbfbf92
00780 4183f83f                       cmp        r8d, 0x3f
00784 0f8f9a0f0000                   jg         0x7f63dbbfcc24
0078a 41b940000000                   mov        r9d, 0x40
00790 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
00795 453bc1                         cmp        r8d, r9d
00798 7e48                           jle        0x7f63dbbfbce2
0079a 418bd8                         mov        ebx, r8d
0079d 412bd9                         sub        ebx, r9d
007a0 4183f940                       cmp        r9d, 0x40
007a4 0f8d6a120000                   jge        0x7f63dbbfcf14
007aa 41ba01000000                   mov        r10d, 1
007b0 c442b1f7d2                     shlx       r10, r10, r9
007b5 49ffca                         dec        r10
007b8 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007c0 c4c2e1f7ea                     shlx       rbp, r10, rbx
007c5 41bb40000000                   mov        r11d, 0x40
007cb 442bdb                         sub        r11d, ebx
007ce c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007d5 490bea                         or         rbp, r10
007d8 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007e0 eb30                           jmp        0x7f63dbbfbd12
007e2 452bc8                         sub        r9d, r8d
007e5 c462b3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], r9
007ef 4183f840                       cmp        r8d, 0x40
007f3 0f8df7100000                   jge        0x7f63dbbfcdf0
007f9 41ba01000000                   mov        r10d, 1
007ff c4c2b9f7ea                     shlx       rbp, r10, r8
00804 48ffcd                         dec        rbp
00807 4923e9                         and        rbp, r9
0080a 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00812 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00817 4503d0                         add        r10d, r8d
0081a 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0081f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00824 4503d8                         add        r11d, r8d
00827 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0082c 4183fb40                       cmp        r11d, 0x40
00830 0f8cdafbffff                   jl         0x7f63dbbfb910
00836 458d53c0                       lea        r10d, [r11 - 0x40]
0083a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083f 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00843 83c5f8                         add        ebp, -8
00846 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0084a 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084e 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00852 83c1f0                         add        ecx, -0x10
00855 83f908                         cmp        ecx, 8
00858 0f8c32010000                   jl         0x7f63dbbfbe90
0085e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00863 4183c2e8                       add        r10d, -0x18
00867 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0086f 0f8266fbffff                   jb         0x7f63dbbfb8db
00875 bee4ffffff                     mov        esi, 0xffffffe4
0087a 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00882 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00887 44891c24                       mov        dword ptr [rsp], r11d
0088b 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00890 44895c2404                     mov        dword ptr [rsp + 4], r11d
00895 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0089a 4489442408                     mov        dword ptr [rsp + 8], r8d
0089f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008a4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008a9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008ae 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008b3 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008b8 4489442418                     mov        dword ptr [rsp + 0x18], r8d
008bd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008c2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008c7 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008cc 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008d1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008d6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008db 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008e0 4489442428                     mov        dword ptr [rsp + 0x28], r8d
008e5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008ea 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008ef 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
008f4 4489442430                     mov        dword ptr [rsp + 0x30], r8d
008f9 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
008fe 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00903 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00908 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0090d 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00912 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00917 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0091c 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00921 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00929 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0092e 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00936 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0093b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00940 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00945 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0094d 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00955 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0095d 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00965 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0096d 90                             nop        
0096e 90                             nop        
0096f e8ece8aeff                     call       0x7f63db6ea760
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
00986 4883e4f0                       and        rsp, 0xfffffffffffffff0
0098a e8714ab318                     call       0x7f63f4730900
0098f f4                             hlt        
00990 85c9                           test       ecx, ecx
00992 7f08                           jg         0x7f63dbbfbe9c
00994 4533d2                         xor        r10d, r10d
00997 e94cfaffff                     jmp        0x7f63dbbfb8e8
0099c 890c24                         mov        dword ptr [rsp], ecx
0099f 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
009a7 8b542408                       mov        edx, dword ptr [rsp + 8]
009ab 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
009b2 90                             nop        
009b3 e8a87db4ff                     call       0x7f63db743c60
009b8 0f1f8400b00a0003               nop        dword ptr [rax + rax + 0x3000ab0]
009c0 448b542408                     mov        r10d, dword ptr [rsp + 8]
009c5 41c1e203                       shl        r10d, 3
009c9 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ce 41c1e003                       shl        r8d, 3
009d2 452bd0                         sub        r10d, r8d
009d5 4181c2c0000000                 add        r10d, 0xc0
009dc c462a9f7d0                     shlx       r10, rax, r10
009e1 e902faffff                     jmp        0x7f63dbbfb8e8
009e6 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009ee 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f6 4d03c2                         add        r8, r10
009f9 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a01 4d3bc2                         cmp        r8, r10
00a04 7f29                           jg         0x7f63dbbfbf2f
00a06 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a0b 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a13 0f853b170000                   jne        0x7f63dbbfd654
00a19 418bc0                         mov        eax, r8d
00a1c 4881c410010000                 add        rsp, 0x110
00a23 5d                             pop        rbp
00a24 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a28 0f8758190000                   ja         0x7f63dbbfd886
00a2e c3                             ret        
00a2f 48be486d32e300000000           movabs     rsi, 0xe3326d48
00a39 90                             nop        
00a3a 90                             nop        
00a3b e8207db4ff                     call       0x7f63db743c60
00a40 0f1f8400380b0004               nop        dword ptr [rax + rax + 0x4000b38]
00a48 4885c0                         test       rax, rax
00a4b 0f84db160000                   je         0x7f63dbbfd62c
00a51 488bf0                         mov        rsi, rax
00a54 4881c410010000                 add        rsp, 0x110
00a5b 5d                             pop        rbp
00a5c e9ff6faeff                     jmp        0x7f63db6e2f60
00a61 4533d2                         xor        r10d, r10d
00a64 4533db                         xor        r11d, r11d
00a67 4533c9                         xor        r9d, r9d
00a6a 4533c0                         xor        r8d, r8d
00a6d 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a75 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00a7d 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
00a85 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00a8d e985fcffff                     jmp        0x7f63dbbfbc17
00a92 4533d2                         xor        r10d, r10d
00a95 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a9d e96ef9ffff                     jmp        0x7f63dbbfb910
00aa2 4533db                         xor        r11d, r11d
00aa5 4533d2                         xor        r10d, r10d
00aa8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00aad e916f7ffff                     jmp        0x7f63dbbfb6c8
00ab2 bee4ffffff                     mov        esi, 0xffffffe4
00ab7 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00abf 448b442408                     mov        r8d, dword ptr [rsp + 8]
00ac4 44890424                       mov        dword ptr [rsp], r8d
00ac8 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00acd 4489542404                     mov        dword ptr [rsp + 4], r10d
00ad2 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00ad7 4489442408                     mov        dword ptr [rsp + 8], r8d
00adc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ae1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ae6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00aeb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00af0 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00af5 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00afa 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00aff 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b04 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00b09 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00b0e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b13 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b18 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00b1d 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00b22 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b27 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00b2c 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00b31 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00b36 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00b3b 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b40 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b45 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b4a 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00b4f 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00b54 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b59 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00b5e 90                             nop        
00b5f e8fce6aeff                     call       0x7f63db6ea760
00b64 0f1f84005c0c0005               nop        dword ptr [rax + rax + 0x5000c5c]
00b6c 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
00b76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b7a e88148b318                     call       0x7f63f4730900
00b7f f4                             hlt        
00b80 bee4ffffff                     mov        esi, 0xffffffe4
00b85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b8d 448b442408                     mov        r8d, dword ptr [rsp + 8]
00b92 44890424                       mov        dword ptr [rsp], r8d
00b96 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b9b 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ba0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00ba5 4489442408                     mov        dword ptr [rsp + 8], r8d
00baa 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00baf 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bb4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00bb9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bbe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bc3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00bc8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00bcd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00bd2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00bd7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bdc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00be1 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00be6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00beb 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00bf0 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00bf5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bfa 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00bff 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c04 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c09 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c0e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c13 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c18 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00c1d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00c22 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00c27 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00c2c 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00c30 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00c35 90                             nop        
00c36 90                             nop        
00c37 e824e6aeff                     call       0x7f63db6ea760
00c3c 0f1f8400340d0006               nop        dword ptr [rax + rax + 0x6000d34]
00c44 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
00c4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c52 e8a947b318                     call       0x7f63f4730900
00c57 f4                             hlt        
00c58 bee4ffffff                     mov        esi, 0xffffffe4
00c5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c65 448b442408                     mov        r8d, dword ptr [rsp + 8]
00c6a 44890424                       mov        dword ptr [rsp], r8d
00c6e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00c73 4489542404                     mov        dword ptr [rsp + 4], r10d
00c78 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00c7d 4489442408                     mov        dword ptr [rsp + 8], r8d
00c82 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c87 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c8c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c91 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00c96 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c9b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ca0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ca5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00caa 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00caf 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00cb4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00cb9 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00cbe 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00cc3 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00cc8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00ccd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00cd2 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00cd7 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00cdc 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ce1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00ce6 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00ceb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00cf0 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00cf5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00cfa 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00cff 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00d04 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00d0c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00d11 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00d16 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00d1b e840e5aeff                     call       0x7f63db6ea760
00d20 0f1f8400180e0007               nop        dword ptr [rax + rax + 0x7000e18]
00d28 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
00d32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d36 e8c546b318                     call       0x7f63f4730900
00d3b f4                             hlt        
00d3c 4533db                         xor        r11d, r11d
00d3f 4d3bcb                         cmp        r9, r11
00d42 bdffffffff                     mov        ebp, 0xffffffff
00d47 7c08                           jl         0x7f63dbbfc251
00d49 400f95c5                       setne      bpl
00d4d 400fb6ed                       movzx      ebp, bpl
00d51 be45ffffff                     mov        esi, 0xffffff45
00d56 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00d5e 4c891c24                       mov        qword ptr [rsp], r11
00d62 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d67 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d6c 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00d74 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00d79 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d7e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00d83 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00d87 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00d8b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d90 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d95 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00d99 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00d9d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00da2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00da7 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00dab 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00daf 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00db4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00db9 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00dc0 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00dc4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00dc9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00dce 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00dd2 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00dd6 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00ddb 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00de0 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00de5 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00dea 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00df2 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00df7 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00dff 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00e04 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00e0c 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00e13 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00e1b 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00e23 e838e4aeff                     call       0x7f63db6ea760
00e28 0f1f8400200f0008               nop        dword ptr [rax + rax + 0x8000f20]
00e30 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
00e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e3e e8bd45b318                     call       0x7f63f4730900
00e43 f4                             hlt        
00e44 be45ffffff                     mov        esi, 0xffffff45
00e49 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e51 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e56 44891424                       mov        dword ptr [rsp], r10d
00e5a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00e5f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e64 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e69 4489542408                     mov        dword ptr [rsp + 8], r10d
00e6e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e76 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e7b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e80 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e85 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e8a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e8f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e94 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e99 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e9e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ea3 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ea8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ead 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00eb2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00eb7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ebc 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ec1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ec6 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ecb 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00ed0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ed5 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00eda 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00edf 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ee4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ee9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00eee 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ef3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ef8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00efd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f05 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f0a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f12 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f17 e844e3aeff                     call       0x7f63db6ea760
00f1c 0f1f840014100009               nop        dword ptr [rax + rax + 0x9001014]
00f24 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
00f2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f32 e8c944b318                     call       0x7f63f4730900
00f37 f4                             hlt        
00f38 be45ffffff                     mov        esi, 0xffffff45
00f3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f45 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00f4a 44891c24                       mov        dword ptr [rsp], r11d
00f4e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f53 4489542404                     mov        dword ptr [rsp + 4], r10d
00f58 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f5d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00f62 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f6a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f6f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f74 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f79 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f7e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f83 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f88 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f8d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f92 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f97 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f9c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00fa1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00fa6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00fab 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00fb0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00fb5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fba 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00fbf 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00fc4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00fc9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00fce 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00fd3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fd8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fdd 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fe2 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00fe7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fec 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ff1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ff9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ffe 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01006 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0100b 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
01013 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01018 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01020 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01028 90                             nop        
01029 90                             nop        
0102a 90                             nop        
0102b e830e2aeff                     call       0x7f63db6ea760
01030 0f1f84002811000a               nop        dword ptr [rax + rax + 0xa001128]
01038 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01042 4883e4f0                       and        rsp, 0xfffffffffffffff0
01046 e8b543b318                     call       0x7f63f4730900
0104b f4                             hlt        
0104c be45ffffff                     mov        esi, 0xffffff45
01051 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01059 448b542408                     mov        r10d, dword ptr [rsp + 8]
0105e 44891424                       mov        dword ptr [rsp], r10d
01062 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01067 44895c2404                     mov        dword ptr [rsp + 4], r11d
0106c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01071 4489542408                     mov        dword ptr [rsp + 8], r10d
01076 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0107e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01083 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01088 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0108d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01092 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01097 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0109c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
010a1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
010a6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
010ab 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
010b0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
010b5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
010ba 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
010bf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
010c4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
010c9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
010ce 4489542434                     mov        dword ptr [rsp + 0x34], r10d
010d3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
010d8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
010dd 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
010e2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
010e7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010ec 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
010f1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010f6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
010fb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01100 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01105 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0110d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01112 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0111a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0111f 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01127 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
0112e 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01136 90                             nop        
01137 e824e1aeff                     call       0x7f63db6ea760
0113c 0f1f84003412000b               nop        dword ptr [rax + rax + 0xb001234]
01144 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0114e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01152 e8a942b318                     call       0x7f63f4730900
01157 f4                             hlt        
01158 be45ffffff                     mov        esi, 0xffffff45
0115d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01165 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0116a 44890c24                       mov        dword ptr [rsp], r9d
0116e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01173 44895c2404                     mov        dword ptr [rsp + 4], r11d
01178 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0117d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01182 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0118a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0118f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01194 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01199 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0119e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
011a3 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
011a8 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
011ad 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
011b2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
011b7 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
011bc 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
011c1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
011c6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
011cb 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
011d0 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
011d5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
011da 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
011df 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
011e4 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
011e9 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
011ee 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
011f3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
011f8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
011fd 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01202 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01207 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0120c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01211 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01219 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0121e 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01226 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0122b 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01230 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01237 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0123f 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
01247 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0124f 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01257 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0125f 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01267 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0126f 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
01277 e8e4dfaeff                     call       0x7f63db6ea760
0127c 0f1f84007413000c               nop        dword ptr [rax + rax + 0xc001374]
01284 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0128e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01292 e86941b318                     call       0x7f63f4730900
01297 f4                             hlt        
01298 41bbffffff7f                   mov        r11d, 0x7fffffff
0129e 4d3bcb                         cmp        r9, r11
012a1 bdffffffff                     mov        ebp, 0xffffffff
012a6 7c08                           jl         0x7f63dbbfc7b0
012a8 400f95c5                       setne      bpl
012ac 400fb6ed                       movzx      ebp, bpl
012b0 be45ffffff                     mov        esi, 0xffffff45
012b5 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
012bd 4c891c24                       mov        qword ptr [rsp], r11
012c1 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
012c6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
012cb 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
012d3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
012d8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
012dd 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
012e2 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
012e6 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
012ea 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
012ef 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
012f4 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
012f8 895c2434                       mov        dword ptr [rsp + 0x34], ebx
012fc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01301 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01306 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0130a 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0130e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01313 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01318 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
0131f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01323 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01328 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0132d 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01331 895c2454                       mov        dword ptr [rsp + 0x54], ebx
01335 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0133a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0133f 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01344 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01349 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01351 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01356 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0135e 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
01363 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0136b 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
01372 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0137a 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01382 90                             nop        
01383 e8d8deaeff                     call       0x7f63db6ea760
01388 0f1f84008014000d               nop        dword ptr [rax + rax + 0xd001480]
01390 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0139a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0139e e85d40b318                     call       0x7f63f4730900
013a3 f4                             hlt        
013a4 be45ffffff                     mov        esi, 0xffffff45
013a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013b1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013b6 44891c24                       mov        dword ptr [rsp], r11d
013ba 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013bf 44895c2404                     mov        dword ptr [rsp + 4], r11d
013c4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013c9 44895c2408                     mov        dword ptr [rsp + 8], r11d
013ce 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
013d6 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
013db 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
013e0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
013e5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
013ea 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
013ef 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
013f4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
013f9 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
013fe 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01403 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01408 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0140d 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01412 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01417 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0141c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01421 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01426 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0142b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01430 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01435 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0143a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0143f 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01444 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01449 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0144e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01453 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01458 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0145d 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01465 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0146a 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01472 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01477 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0147c 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
01484 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0148c 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01494 90                             nop        
01495 90                             nop        
01496 90                             nop        
01497 e8c4ddaeff                     call       0x7f63db6ea760
0149c 0f1f84009415000e               nop        dword ptr [rax + rax + 0xe001594]
014a4 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
014ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
014b2 e8493fb318                     call       0x7f63f4730900
014b7 f4                             hlt        
014b8 be45ffffff                     mov        esi, 0xffffff45
014bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014c5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014ca 44891c24                       mov        dword ptr [rsp], r11d
014ce 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
014d3 44895c2404                     mov        dword ptr [rsp + 4], r11d
014d8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014dd 44895c2408                     mov        dword ptr [rsp + 8], r11d
014e2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
014ea 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014ef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014f4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014f9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
014fe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01503 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01508 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0150d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01512 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01517 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0151c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01521 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01526 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0152b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01530 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01535 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0153a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0153f 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01544 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01549 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0154e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01553 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01558 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0155d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01562 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01567 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0156c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01571 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01579 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0157e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01586 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0158b 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01590 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01597 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0159f 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
015a7 e8b4dcaeff                     call       0x7f63db6ea760
015ac 0f1f8400a416000f               nop        dword ptr [rax + rax + 0xf0016a4]
015b4 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
015be 4883e4f0                       and        rsp, 0xfffffffffffffff0
015c2 e8393eb318                     call       0x7f63f4730900
015c7 f4                             hlt        
015c8 be3dffffff                     mov        esi, 0xffffff3d
015cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015d5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015da 44891c24                       mov        dword ptr [rsp], r11d
015de 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
015e3 44894c2404                     mov        dword ptr [rsp + 4], r9d
015e8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
015ed 44894c2408                     mov        dword ptr [rsp + 8], r9d
015f2 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
015fa 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
015ff 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01604 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01609 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0160e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01613 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01618 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0161d 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01622 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01627 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0162c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01631 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01636 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0163b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01640 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01645 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0164a 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0164f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01654 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01659 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01661 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01666 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0166b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01670 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01675 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0167a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0167f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01684 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01689 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0168e 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01696 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0169b 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
016a3 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
016a8 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016ad 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
016b5 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
016bc 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
016c3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
016cb 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
016d3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
016db 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
016e3 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
016eb 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
016f3 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
016fb 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01703 e858dbaeff                     call       0x7f63db6ea760
01708 0f1f840000180010               nop        dword ptr [rax + rax + 0x10001800]
01710 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0171a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0171e e8dd3cb318                     call       0x7f63f4730900
01723 f4                             hlt        
01724 be45ffffff                     mov        esi, 0xffffff45
01729 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01731 448b542408                     mov        r10d, dword ptr [rsp + 8]
01736 44891424                       mov        dword ptr [rsp], r10d
0173a 4489442408                     mov        dword ptr [rsp + 8], r8d
0173f e81cdbaeff                     call       0x7f63db6ea760
01744 0f1f84003c180011               nop        dword ptr [rax + rax + 0x1100183c]
0174c 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01756 4883e4f0                       and        rsp, 0xfffffffffffffff0
0175a e8a13cb318                     call       0x7f63f4730900
0175f f4                             hlt        
01760 be45ffffff                     mov        esi, 0xffffff45
01765 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0176d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01772 44891424                       mov        dword ptr [rsp], r10d
01776 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0177b 4489542404                     mov        dword ptr [rsp + 4], r10d
01780 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01785 44895c2408                     mov        dword ptr [rsp + 8], r11d
0178a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0178f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01794 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01799 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0179e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017a3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017a8 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
017ad 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
017b2 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
017b7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017bc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017c1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017c6 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
017cb 4489542430                     mov        dword ptr [rsp + 0x30], r10d
017d0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017d5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
017da 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017df 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
017e4 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
017e9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
017ee 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017f6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017fb 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01800 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01804 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01809 90                             nop        
0180a 90                             nop        
0180b e850daaeff                     call       0x7f63db6ea760
01810 0f1f840008190012               nop        dword ptr [rax + rax + 0x12001908]
01818 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01822 4883e4f0                       and        rsp, 0xfffffffffffffff0
01826 e8d53bb318                     call       0x7f63f4730900
0182b f4                             hlt        
0182c be45ffffff                     mov        esi, 0xffffff45
01831 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01839 448b542408                     mov        r10d, dword ptr [rsp + 8]
0183e 44891424                       mov        dword ptr [rsp], r10d
01842 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01847 4489542404                     mov        dword ptr [rsp + 4], r10d
0184c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01851 4489542408                     mov        dword ptr [rsp + 8], r10d
01856 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0185b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01860 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01865 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0186a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0186f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01874 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01879 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0187e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01883 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01888 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0188d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01892 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01897 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0189c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
018a1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
018a6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018ab 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018b0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
018b5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018ba 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
018bf 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018c4 895c2454                       mov        dword ptr [rsp + 0x54], ebx
018c8 4489442458                     mov        dword ptr [rsp + 0x58], r8d
018cd 90                             nop        
018ce 90                             nop        
018cf e88cd9aeff                     call       0x7f63db6ea760
018d4 0f1f8400cc190013               nop        dword ptr [rax + rax + 0x130019cc]
018dc 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
018e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ea e8113bb318                     call       0x7f63f4730900
018ef f4                             hlt        
018f0 be45ffffff                     mov        esi, 0xffffff45
018f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018fd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01902 44891424                       mov        dword ptr [rsp], r10d
01906 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0190b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01910 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01915 4489542408                     mov        dword ptr [rsp + 8], r10d
0191a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01922 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01927 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0192c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01931 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01936 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0193b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01940 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01945 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0194a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0194f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01954 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01959 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0195e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01963 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01968 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0196d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01972 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01977 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0197c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01981 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01986 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0198b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01990 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01995 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0199a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0199f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019a9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
019b1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
019b6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019be 4c89542468                     mov        qword ptr [rsp + 0x68], r10
019c3 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
019cb 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
019d3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
019db 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
019e3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
019eb 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
019f3 e868d8aeff                     call       0x7f63db6ea760
019f8 0f1f8400f01a0014               nop        dword ptr [rax + rax + 0x14001af0]
01a00 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01a0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a0e e8ed39b318                     call       0x7f63f4730900
01a13 f4                             hlt        
01a14 be45ffffff                     mov        esi, 0xffffff45
01a19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a21 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a26 44891424                       mov        dword ptr [rsp], r10d
01a2a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01a2f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01a34 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a39 4489542408                     mov        dword ptr [rsp + 8], r10d
01a3e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a43 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a48 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a4d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a52 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a57 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a5c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a61 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a66 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01a6b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a70 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a75 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a7a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a7f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a84 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a89 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01a8e 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01a93 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a98 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a9d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01aa2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01aa7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01aac 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01ab1 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01ab6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01abb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ac0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ac8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01acd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ad5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ada 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01ae2 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01ae9 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01af1 90                             nop        
01af2 90                             nop        
01af3 e868d7aeff                     call       0x7f63db6ea760
01af8 0f1f8400f01b0015               nop        dword ptr [rax + rax + 0x15001bf0]
01b00 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0e e8ed38b318                     call       0x7f63f4730900
01b13 f4                             hlt        
01b14 4585c9                         test       r9d, r9d
01b17 7f07                           jg         0x7f63dbbfd020
01b19 33c0                           xor        eax, eax
01b1b e9a0e5ffff                     jmp        0x7f63dbbfb5c0
01b20 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01b24 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01b29 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01b2d 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01b31 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01b36 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b3b 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01b40 48894424f8                     mov        qword ptr [rsp - 8], rax
01b45 8b0424                         mov        eax, dword ptr [rsp]
01b48 89442404                       mov        dword ptr [rsp + 4], eax
01b4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b51 48894424f8                     mov        qword ptr [rsp - 8], rax
01b56 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b5d 890424                         mov        dword ptr [rsp], eax
01b60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b65 488bee                         mov        rbp, rsi
01b68 8b542408                       mov        edx, dword ptr [rsp + 8]
01b6c 418bc9                         mov        ecx, r9d
01b6f e8ec6bb4ff                     call       0x7f63db743c60
01b74 0f1f84006c1c0016               nop        dword ptr [rax + rax + 0x16001c6c]
01b7c 41ba40000000                   mov        r10d, 0x40
01b82 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01b87 c4e2a9f7c0                     shlx       rax, rax, r10
01b8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b91 8b442404                       mov        eax, dword ptr [rsp + 4]
01b95 890424                         mov        dword ptr [rsp], eax
01b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9d 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
01ba2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ba7 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01bac 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01bb0 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01bb4 448b6c2428                     mov        r13d, dword ptr [rsp + 0x28]
01bb9 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01bbd e9fee4ffff                     jmp        0x7f63dbbfb5c0
01bc2 4585c9                         test       r9d, r9d
01bc5 7f08                           jg         0x7f63dbbfd0cf
01bc7 4533f6                         xor        r14d, r14d
01bca e933e5ffff                     jmp        0x7f63dbbfb602
01bcf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01bd4 4889442430                     mov        qword ptr [rsp + 0x30], rax
01bd9 89542428                       mov        dword ptr [rsp + 0x28], edx
01bdd 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
01be2 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01be6 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01bea 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01bef 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bf4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf9 8b0424                         mov        eax, dword ptr [rsp]
01bfc 89442404                       mov        dword ptr [rsp + 4], eax
01c00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c05 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c11 890424                         mov        dword ptr [rsp], eax
01c14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c21 488bf5                         mov        rsi, rbp
01c24 8b542408                       mov        edx, dword ptr [rsp + 8]
01c28 418bc9                         mov        ecx, r9d
01c2b 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01c30 90                             nop        
01c31 90                             nop        
01c32 90                             nop        
01c33 e8286bb4ff                     call       0x7f63db743c60
01c38 0f1f8400301d0017               nop        dword ptr [rax + rax + 0x17001d30]
01c40 41bb80000000                   mov        r11d, 0x80
01c46 442b5c2414                     sub        r11d, dword ptr [rsp + 0x14]
01c4b c462a1f7f0                     shlx       r14, rax, r11
01c50 48894424f8                     mov        qword ptr [rsp - 8], rax
01c55 8b442404                       mov        eax, dword ptr [rsp + 4]
01c59 890424                         mov        dword ptr [rsp], eax
01c5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c61 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c66 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01c6b 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
01c6f 448b6c241c                     mov        r13d, dword ptr [rsp + 0x1c]
01c74 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01c78 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01c7d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c82 e97be4ffff                     jmp        0x7f63dbbfb602
01c87 4533c0                         xor        r8d, r8d
01c8a e95fedffff                     jmp        0x7f63dbbfbeee
01c8f bee4ffffff                     mov        esi, 0xffffffe4
01c94 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c9c 488f0424                       pop        qword ptr [rsp]
01ca0 90                             nop        
01ca1 90                             nop        
01ca2 90                             nop        
01ca3 e8b8d5aeff                     call       0x7f63db6ea760
01ca8 0f1f8400a01d0018               nop        dword ptr [rax + rax + 0x18001da0]
01cb0 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01cba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cbe e83d37b318                     call       0x7f63f4730900
01cc3 f4                             hlt        
01cc4 be5d000000                     mov        esi, 0x5d
01cc9 90                             nop        
01cca 90                             nop        
01ccb e890d5aeff                     call       0x7f63db6ea760
01cd0 0f1f8400c81d0019               nop        dword ptr [rax + rax + 0x19001dc8]
01cd8 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01ce2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ce6 e81537b318                     call       0x7f63f4730900
01ceb f4                             hlt        
01cec bef6ffffff                     mov        esi, 0xfffffff6
01cf1 90                             nop        
01cf2 90                             nop        
01cf3 e868d5aeff                     call       0x7f63db6ea760
01cf8 0f1f8400f01d001a               nop        dword ptr [rax + rax + 0x1a001df0]
01d00 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01d0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d0e e8ed36b318                     call       0x7f63f4730900
01d13 f4                             hlt        
01d14 bef6ffffff                     mov        esi, 0xfffffff6
01d19 90                             nop        
01d1a 90                             nop        
01d1b e840d5aeff                     call       0x7f63db6ea760
01d20 0f1f8400181e001b               nop        dword ptr [rax + rax + 0x1b001e18]
01d28 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01d32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d36 e8c536b318                     call       0x7f63f4730900
01d3b f4                             hlt        
01d3c be6effffff                     mov        esi, 0xffffff6e
01d41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d49 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d4e 44891c24                       mov        dword ptr [rsp], r11d
01d52 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d57 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d66 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d6b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d70 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d75 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d7a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01d7f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d84 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01d89 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01d8e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d93 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01d98 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d9d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01da2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01da7 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01dab 897c2444                       mov        dword ptr [rsp + 0x44], edi
01daf 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01db4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01db9 90                             nop        
01dba 90                             nop        
01dbb e8a0d4aeff                     call       0x7f63db6ea760
01dc0 0f1f8400b81e001c               nop        dword ptr [rax + rax + 0x1c001eb8]
01dc8 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dd6 e82536b318                     call       0x7f63f4730900
01ddb f4                             hlt        
01ddc bee4ffffff                     mov        esi, 0xffffffe4
01de1 48ffb42490000000               push       qword ptr [rsp + 0x90]
01de9 488f0424                       pop        qword ptr [rsp]
01ded 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01df2 48894424f8                     mov        qword ptr [rsp - 8], rax
01df7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01dfe 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e07 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e0b 89542434                       mov        dword ptr [rsp + 0x34], edx
01e0f e84cd4aeff                     call       0x7f63db6ea760
01e14 0f1f84000c1f001d               nop        dword ptr [rax + rax + 0x1d001f0c]
01e1c 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01e26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e2a e8d135b318                     call       0x7f63f4730900
01e2f f4                             hlt        
01e30 bee4ffffff                     mov        esi, 0xffffffe4
01e35 48ffb42490000000               push       qword ptr [rsp + 0x90]
01e3d 488f0424                       pop        qword ptr [rsp]
01e41 48894424f8                     mov        qword ptr [rsp - 8], rax
01e46 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e4d 89442418                       mov        dword ptr [rsp + 0x18], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01e5a 89542430                       mov        dword ptr [rsp + 0x30], edx
01e5e 4889442438                     mov        qword ptr [rsp + 0x38], rax
01e63 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01e68 90                             nop        
01e69 90                             nop        
01e6a 90                             nop        
01e6b e8f0d3aeff                     call       0x7f63db6ea760
01e70 0f1f8400681f001e               nop        dword ptr [rax + rax + 0x1e001f68]
01e78 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e86 e87535b318                     call       0x7f63f4730900
01e8b f4                             hlt        
01e8c bebeffffff                     mov        esi, 0xffffffbe
01e91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e99 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e9e 44891c24                       mov        dword ptr [rsp], r11d
01ea2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ea7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01eac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01eb1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eb6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ebb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ec0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ec5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01eca 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ecf 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ed4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ed9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ede 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ee3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ee8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01eed 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ef2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01ef7 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01efb 897c2444                       mov        dword ptr [rsp + 0x44], edi
01eff 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01f04 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01f09 90                             nop        
01f0a 90                             nop        
01f0b e850d3aeff                     call       0x7f63db6ea760
01f10 0f1f84000820001f               nop        dword ptr [rax + rax + 0x1f002008]
01f18 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01f22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f26 e8d534b318                     call       0x7f63f4730900
01f2b f4                             hlt        
01f2c beccffffff                     mov        esi, 0xffffffcc
01f31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f3e 44891c24                       mov        dword ptr [rsp], r11d
01f42 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01f47 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01f53 89442414                       mov        dword ptr [rsp + 0x14], eax
01f57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01f61 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01f66 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01f6a 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01f6e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01f73 e8e8d2aeff                     call       0x7f63db6ea760
01f78 0f1f840070200020               nop        dword ptr [rax + rax + 0x20002070]
01f80 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01f8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f8e e86d34b318                     call       0x7f63f4730900
01f93 f4                             hlt        
01f94 beccffffff                     mov        esi, 0xffffffcc
01f99 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01fa1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01fa6 44890c24                       mov        dword ptr [rsp], r9d
01faa 48894424f8                     mov        qword ptr [rsp - 8], rax
01faf 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01fb6 89442410                       mov        dword ptr [rsp + 0x10], eax
01fba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbf 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01fc4 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01fc9 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01fcd 89542428                       mov        dword ptr [rsp + 0x28], edx
01fd1 4889442430                     mov        qword ptr [rsp + 0x30], rax
01fd6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01fdb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01fe0 90                             nop        
01fe1 90                             nop        
01fe2 90                             nop        
01fe3 e878d2aeff                     call       0x7f63db6ea760
01fe8 0f1f8400e0200021               nop        dword ptr [rax + rax + 0x210020e0]
01ff0 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
01ffa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ffe e8fd33b318                     call       0x7f63f4730900
02003 f4                             hlt        
02004 be45ffffff                     mov        esi, 0xffffff45
02009 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02011 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02016 44891c24                       mov        dword ptr [rsp], r11d
0201a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0201f 4489442404                     mov        dword ptr [rsp + 4], r8d
02024 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02029 44895c2408                     mov        dword ptr [rsp + 8], r11d
0202e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02033 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02038 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0203d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02042 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
02047 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0204c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
02051 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02056 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0205b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02060 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02065 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0206a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0206f e8ecd1aeff                     call       0x7f63db6ea760
02074 0f1f84006c210022               nop        dword ptr [rax + rax + 0x2200216c]
0207c 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
02086 4883e4f0                       and        rsp, 0xfffffffffffffff0
0208a e87133b318                     call       0x7f63f4730900
0208f f4                             hlt        
02090 be45ffffff                     mov        esi, 0xffffff45
02095 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0209d 448b442408                     mov        r8d, dword ptr [rsp + 8]
020a2 44890424                       mov        dword ptr [rsp], r8d
020a6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
020ab 44895c2404                     mov        dword ptr [rsp + 4], r11d
020b0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
020b5 4489442408                     mov        dword ptr [rsp + 8], r8d
020ba 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
020bf 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
020c4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
020c9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020ce 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
020d3 4489442420                     mov        dword ptr [rsp + 0x20], r8d
020d8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
020dd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
020e2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
020e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
020ec 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
020f1 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
020f6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
020fb 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02100 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
02105 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0210a 90                             nop        
0210b e850d1aeff                     call       0x7f63db6ea760
02110 0f1f840008220023               nop        dword ptr [rax + rax + 0x23002208]
02118 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
02122 4883e4f0                       and        rsp, 0xfffffffffffffff0
02126 e8d532b318                     call       0x7f63f4730900
0212b f4                             hlt        
0212c bef6ffffff                     mov        esi, 0xfffffff6
02131 90                             nop        
02132 90                             nop        
02133 e828d1aeff                     call       0x7f63db6ea760
02138 0f1f840030220024               nop        dword ptr [rax + rax + 0x24002230]
02140 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0214a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0214e e8ad32b318                     call       0x7f63f4730900
02153 f4                             hlt        
02154 be5d000000                     mov        esi, 0x5d
02159 90                             nop        
0215a 90                             nop        
0215b e800d1aeff                     call       0x7f63db6ea760
02160 0f1f840058220025               nop        dword ptr [rax + rax + 0x25002258]
02168 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
02172 4883e4f0                       and        rsp, 0xfffffffffffffff0
02176 e88532b318                     call       0x7f63f4730900
0217b f4                             hlt        
0217c be45ffffff                     mov        esi, 0xffffff45
02181 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02189 448b542408                     mov        r10d, dword ptr [rsp + 8]
0218e 44891424                       mov        dword ptr [rsp], r10d
02192 894c2410                       mov        dword ptr [rsp + 0x10], ecx
02196 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0219b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021a0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
021a5 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
021ad 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
021b2 4c89442450                     mov        qword ptr [rsp + 0x50], r8
021b7 e8a4d0aeff                     call       0x7f63db6ea760
021bc 0f1f8400b4220026               nop        dword ptr [rax + rax + 0x260022b4]
021c4 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
021ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
021d2 e82932b318                     call       0x7f63f4730900
021d7 f4                             hlt        
021d8 bef6ffffff                     mov        esi, 0xfffffff6
021dd 418be9                         mov        ebp, r9d
021e0 90                             nop        
021e1 90                             nop        
021e2 90                             nop        
021e3 e878d0aeff                     call       0x7f63db6ea760
021e8 0f1f8400e0220027               nop        dword ptr [rax + rax + 0x270022e0]
021f0 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
021fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
021fe e8fd31b318                     call       0x7f63f4730900
02203 f4                             hlt        
02204 bef6ffffff                     mov        esi, 0xfffffff6
02209 418bea                         mov        ebp, r10d
0220c 90                             nop        
0220d 90                             nop        
0220e 90                             nop        
0220f e84cd0aeff                     call       0x7f63db6ea760
02214 0f1f84000c230028               nop        dword ptr [rax + rax + 0x2800230c]
0221c 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
02226 4883e4f0                       and        rsp, 0xfffffffffffffff0
0222a e8d131b318                     call       0x7f63f4730900
0222f f4                             hlt        
02230 bef6ffffff                     mov        esi, 0xfffffff6
02235 418beb                         mov        ebp, r11d
02238 90                             nop        
02239 90                             nop        
0223a 90                             nop        
0223b e820d0aeff                     call       0x7f63db6ea760
02240 0f1f840038230029               nop        dword ptr [rax + rax + 0x29002338]
02248 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
02252 4883e4f0                       and        rsp, 0xfffffffffffffff0
02256 e8a531b318                     call       0x7f63f4730900
0225b f4                             hlt        
0225c bef6ffffff                     mov        esi, 0xfffffff6
02261 90                             nop        
02262 90                             nop        
02263 e8f8cfaeff                     call       0x7f63db6ea760
02268 0f1f84006023002a               nop        dword ptr [rax + rax + 0x2a002360]
02270 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0227a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0227e e87d31b318                     call       0x7f63f4730900
02283 f4                             hlt        
02284 bef6ffffff                     mov        esi, 0xfffffff6
02289 90                             nop        
0228a 90                             nop        
0228b e8d0cfaeff                     call       0x7f63db6ea760
02290 0f1f84008823002b               nop        dword ptr [rax + rax + 0x2b002388]
02298 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
022a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022a6 e85531b318                     call       0x7f63f4730900
022ab f4                             hlt        
022ac bef6ffffff                     mov        esi, 0xfffffff6
022b1 90                             nop        
022b2 90                             nop        
022b3 e8a8cfaeff                     call       0x7f63db6ea760
022b8 0f1f8400b023002c               nop        dword ptr [rax + rax + 0x2c0023b0]
022c0 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
022ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
022ce e82d31b318                     call       0x7f63f4730900
022d3 f4                             hlt        
022d4 bef6ffffff                     mov        esi, 0xfffffff6
022d9 90                             nop        
022da 90                             nop        
022db e880cfaeff                     call       0x7f63db6ea760
022e0 0f1f8400d823002d               nop        dword ptr [rax + rax + 0x2d0023d8]
022e8 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
022f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022f6 e80531b318                     call       0x7f63f4730900
022fb f4                             hlt        
022fc bef6ffffff                     mov        esi, 0xfffffff6
02301 90                             nop        
02302 90                             nop        
02303 e858cfaeff                     call       0x7f63db6ea760
02308 0f1f84000024002e               nop        dword ptr [rax + rax + 0x2e002400]
02310 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0231a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0231e e8dd30b318                     call       0x7f63f4730900
02323 f4                             hlt        
02324 bef6ffffff                     mov        esi, 0xfffffff6
02329 90                             nop        
0232a 90                             nop        
0232b e830cfaeff                     call       0x7f63db6ea760
02330 0f1f84002824002f               nop        dword ptr [rax + rax + 0x2f002428]
02338 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
02342 4883e4f0                       and        rsp, 0xfffffffffffffff0
02346 e8b530b318                     call       0x7f63f4730900
0234b f4                             hlt        
0234c bef6ffffff                     mov        esi, 0xfffffff6
02351 90                             nop        
02352 90                             nop        
02353 e808cfaeff                     call       0x7f63db6ea760
02358 0f1f840050240030               nop        dword ptr [rax + rax + 0x30002450]
02360 48bf607621b4637f0000           movabs     rdi, 0x7f63b4217660
0236a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0236e e88d30b318                     call       0x7f63f4730900
02373 f4                             hlt        
02374 eb08                           jmp        0x7f63dbbfd87e
02376 eb06                           jmp        0x7f63dbbfd87e
02378 eb04                           jmp        0x7f63dbbfd87e
0237a eb02                           jmp        0x7f63dbbfd87e
0237c eb00                           jmp        0x7f63dbbfd87e
0237e 488bf0                         mov        rsi, rax
02381 e9cee6ffff                     jmp        0x7f63dbbfbf54
02386 49ba24bfbfdb637f0000           movabs     r10, 0x7f63dbbfbf24
02390 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02397 e9c48ab4ff                     jmp        0x7f63db746360
0239c e83f59b3ff                     call       0x7f63db7331e0
023a1 e978dcffff                     jmp        0x7f63dbbfb51e
023a6 f4                             hlt        
023a7 f4                             hlt        
