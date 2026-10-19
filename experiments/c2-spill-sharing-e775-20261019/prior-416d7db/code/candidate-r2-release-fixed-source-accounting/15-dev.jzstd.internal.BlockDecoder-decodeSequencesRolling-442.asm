00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8522200000                   jne        0x7f4c1be87c40
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
00050 0f83d11a0000                   jae        0x7f4c1be87727
00056 0fb65c160b                     movzx      ebx, byte ptr [rsi + rdx + 0xb]
0005b 85db                           test       ebx, ebx
0005d 0f84e51a0000                   je         0x7f4c1be87748
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
0009a 0f8c0c190000                   jl         0x7f4c1be875ac
000a0 4585d2                         test       r10d, r10d
000a3 0f8c7b1c0000                   jl         0x7f4c1be87924
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 443bc5                         cmp        r8d, ebp
000b2 0f83581b0000                   jae        0x7f4c1be87810
000b8 458bd8                         mov        r11d, r8d
000bb 4a8b441e0c                     mov        rax, qword ptr [rsi + r11 + 0xc]
000c0 4183c1f8                       add        r9d, -8
000c4 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
000cc 4183c3f0                       add        r11d, -0x10
000d0 4183f908                       cmp        r9d, 8
000d4 0f8c80190000                   jl         0x7f4c1be8765a
000da 4585d2                         test       r10d, r10d
000dd 0f8c951c0000                   jl         0x7f4c1be87978
000e3 8b2c24                         mov        ebp, dword ptr [rsp]
000e6 83c5f9                         add        ebp, -7
000e9 443bdd                         cmp        r11d, ebp
000ec 0f835e1b0000                   jae        0x7f4c1be87850
000f2 418bcb                         mov        ecx, r11d
000f5 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000fd 4d8b74090c                     mov        r14, qword ptr [r9 + rcx + 0xc]
00102 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00107 8b4d1c                         mov        ecx, dword ptr [rbp + 0x1c]
0010a 85c9                           test       ecx, ecx
0010c 0f844a1a0000                   je         0x7f4c1be8775c
00112 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00116 418b7908                       mov        edi, dword ptr [r9 + 8]
0011a 8b7524                         mov        esi, dword ptr [rbp + 0x24]
0011d 85f6                           test       esi, esi
0011f 0f844b1a0000                   je         0x7f4c1be87770
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
0018a 0f84fe080000                   je         0x7f4c1be8668e
00190 be40000000                     mov        esi, 0x40
00195 2bf3                           sub        esi, ebx
00197 3bfe                           cmp        edi, esi
00199 0f8fef010000                   jg         0x7f4c1be85f8e
0019f 2bf7                           sub        esi, edi
001a1 c462cbf7c0                     shrx       r8, rax, rsi
001a6 83ff40                         cmp        edi, 0x40
001a9 0f8d4d1d0000                   jge        0x7f4c1be87afc
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
001d8 7c35                           jl         0x7f4c1be85e0f
001da 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001df 4183c1c8                       add        r9d, -0x38
001e3 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001e8 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f0 8b542408                       mov        edx, dword ptr [rsp + 8]
001f4 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
001f8 666690                         nop        
001fb e860aaa8ff                     call       0x7f4c1b910860
00200 0f1f8400f8020000               nop        dword ptr [rax + rax + 0x2f8]
00208 4889442420                     mov        qword ptr [rsp + 0x20], rax
0020d eb31                           jmp        0x7f4c1be85e40
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
0024d 0f8d811b0000                   jge        0x7f4c1be879d4
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
00288 0f8dbe1b0000                   jge        0x7f4c1be87a4c
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
002d1 0f8e48180000                   jle        0x7f4c1be8771f
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
0033b 0f8643180000                   jbe        0x7f4c1be87784
00341 4d63d3                         movsxd     r10, r11d
00344 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00349 49ffcb                         dec        r11
0034c 4d3bda                         cmp        r11, r10
0034f 0f832f180000                   jae        0x7f4c1be87784
00355 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0035a 4585db                         test       r11d, r11d
0035d 0f8c35190000                   jl         0x7f4c1be87898
00363 448b1424                       mov        r10d, dword ptr [rsp]
00367 4183c2f9                       add        r10d, -7
0036b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00373 4533d2                         xor        r10d, r10d
00376 4533db                         xor        r11d, r11d
00379 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00381 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00389 e991020000                     jmp        0x7f4c1be8621f
0038e 8bef                           mov        ebp, edi
00390 2bee                           sub        ebp, esi
00392 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0039a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0039f e8bca8a8ff                     call       0x7f4c1b910860
003a4 0f1f84009c040001               nop        dword ptr [rax + rax + 0x100049c]
003ac 4823442428                     and        rax, qword ptr [rsp + 0x28]
003b1 41ba40000000                   mov        r10d, 0x40
003b7 442bd5                         sub        r10d, ebp
003ba c462d1f7d8                     shlx       r11, rax, rbp
003bf c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003c9 4d0bda                         or         r11, r10
003cc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003d1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003d6 e9edfdffff                     jmp        0x7f4c1be85dc8
003db 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003e3 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
003e8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003ed 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
003f5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
003fa 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
003fe 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00402 0f1f8000000000                 nop        dword ptr [rax]
00409 0f1f8000000000                 nop        dword ptr [rax]
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8dc0090000                   jge        0x7f4c1be869e0
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d6d0a0000                   jge        0x7f4c1be86ac0
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d470b0000                   jge        0x7f4c1be86bc0
00479 c4e2d3f7cf                     shrx       rcx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d160c0000                   jge        0x7f4c1be86cb8
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
004f2 0f8ef4070000                   jle        0x7f4c1be868ec
004f8 4981f9ffffff7f                 cmp        r9, 0x7fffffff
004ff 0f8fdf0c0000                   jg         0x7f4c1be86de4
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8fca0d0000                   jg         0x7f4c1be86edc
00512 81f9ffff0300                   cmp        ecx, 0x3ffff
00518 0f8fbe0e0000                   jg         0x7f4c1be86fdc
0051e 418bd9                         mov        ebx, r9d
00521 81fb00000010                   cmp        ebx, 0x10000000
00527 0f83ab0f0000                   jae        0x7f4c1be870d8
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
0055e 0f8daa000000                   jge        0x7f4c1be8620e
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
005b5 0f8d8d100000                   jge        0x7f4c1be87248
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
005ef 0f8d0b110000                   jge        0x7f4c1be87300
005f5 41b901000000                   mov        r9d, 1
005fb c44229f7d1                     shlx       r10d, r9d, r10d
00600 41ffca                         dec        r10d
00603 4523d0                         and        r10d, r8d
00606 4403d3                         add        r10d, ebx
00609 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8dba030000                   jge        0x7f4c1be865d2
00618 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0061f 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00624 44234c246c                     and        r9d, dword ptr [rsp + 0x6c]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
00632 458b4308                       mov        r8d, dword ptr [r11 + 8]
00636 453bc8                         cmp        r9d, r8d
00639 0f835f040000                   jae        0x7f4c1be8669e
0063f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00644 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00649 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0064e 418b5818                       mov        ebx, dword ptr [r8 + 0x18]
00652 448b4308                       mov        r8d, dword ptr [rbx + 8]
00656 4f8b5ccb10                     mov        r11, qword ptr [r11 + r9*8 + 0x10]
0065b 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00660 453bd0                         cmp        r10d, r8d
00663 0f83ef040000                   jae        0x7f4c1be86758
00669 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0066e 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
00673 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00678 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
0067c 418b4908                       mov        ecx, dword ptr [r9 + 8]
00680 4e8b54d310                     mov        r10, qword ptr [rbx + r10*8 + 0x10]
00685 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0068d 443bd9                         cmp        r11d, ecx
00690 0f8386050000                   jae        0x7f4c1be8681c
00696 4f8b54d910                     mov        r10, qword ptr [r9 + r11*8 + 0x10]
0069b 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a3 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006aa ffc5                           inc        ebp
006ac 896c2404                       mov        dword ptr [rsp + 4], ebp
006b0 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b4 0f8d93030000                   jge        0x7f4c1be8664d
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
0077a 0f84fe020000                   je         0x7f4c1be8667e
00780 4183f83f                       cmp        r8d, 0x3f
00784 0f8f960e0000                   jg         0x7f4c1be87220
0078a 41b940000000                   mov        r9d, 0x40
00790 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
00795 453bc1                         cmp        r8d, r9d
00798 7e48                           jle        0x7f4c1be863e2
0079a 418bd8                         mov        ebx, r8d
0079d 412bd9                         sub        ebx, r9d
007a0 4183f940                       cmp        r9d, 0x40
007a4 0f8d16110000                   jge        0x7f4c1be874c0
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
007e0 eb30                           jmp        0x7f4c1be86412
007e2 452bc8                         sub        r9d, r8d
007e5 c462b3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], r9
007ef 4183f840                       cmp        r8d, 0x40
007f3 0f8db70f0000                   jge        0x7f4c1be873b0
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
00830 0f8cdafbffff                   jl         0x7f4c1be86010
00836 458d53c0                       lea        r10d, [r11 - 0x40]
0083a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083f 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00843 83c5f8                         add        ebp, -8
00846 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0084a 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084e 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00852 83c1f0                         add        ecx, -0x10
00855 83f908                         cmp        ecx, 8
00858 0f8c1e010000                   jl         0x7f4c1be8657c
0085e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00863 4183c2e8                       add        r10d, -0x18
00867 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0086f 0f8266fbffff                   jb         0x7f4c1be85fdb
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
0096d 6690                           nop        
0096f e8ec17b5ff                     call       0x7f4c1b9d7d60
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 85c9                           test       ecx, ecx
0097e 7f08                           jg         0x7f4c1be86588
00980 4533d2                         xor        r10d, r10d
00983 e960faffff                     jmp        0x7f4c1be85fe8
00988 890c24                         mov        dword ptr [rsp], ecx
0098b 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00993 8b542408                       mov        edx, dword ptr [rsp + 8]
00997 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
0099e 90                             nop        
0099f e8bca2a8ff                     call       0x7f4c1b910860
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b542408                     mov        r10d, dword ptr [rsp + 8]
009b1 41c1e203                       shl        r10d, 3
009b5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ba 41c1e003                       shl        r8d, 3
009be 452bd0                         sub        r10d, r8d
009c1 4181c2c0000000                 add        r10d, 0xc0
009c8 c462a9f7d0                     shlx       r10, rax, r10
009cd e916faffff                     jmp        0x7f4c1be85fe8
009d2 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009da 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009e2 4d03c2                         add        r8, r10
009e5 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009ed 4d3bc2                         cmp        r8, r10
009f0 7f29                           jg         0x7f4c1be8661b
009f2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
009f7 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
009ff 0f85e3140000                   jne        0x7f4c1be87ae8
00a05 418bc0                         mov        eax, r8d
00a08 4881c410010000                 add        rsp, 0x110
00a0f 5d                             pop        rbp
00a10 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a14 0f8710160000                   ja         0x7f4c1be87c2a
00a1a c3                             ret        
00a1b 48be385d32e300000000           movabs     rsi, 0xe3325d38
00a25 6690                           nop        
00a27 e834a2a8ff                     call       0x7f4c1b910860
00a2c 0f1f8400240b0004               nop        dword ptr [rax + rax + 0x4000b24]
00a34 4885c0                         test       rax, rax
00a37 0f8497140000                   je         0x7f4c1be87ad4
00a3d 488bf0                         mov        rsi, rax
00a40 4881c410010000                 add        rsp, 0x110
00a47 5d                             pop        rbp
00a48 e9933fb5ff                     jmp        0x7f4c1b9da5e0
00a4d 4533d2                         xor        r10d, r10d
00a50 4533db                         xor        r11d, r11d
00a53 4533c9                         xor        r9d, r9d
00a56 4533c0                         xor        r8d, r8d
00a59 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a61 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00a69 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
00a71 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
00a79 e999fcffff                     jmp        0x7f4c1be86317
00a7e 4533d2                         xor        r10d, r10d
00a81 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a89 e982f9ffff                     jmp        0x7f4c1be86010
00a8e 4533db                         xor        r11d, r11d
00a91 4533d2                         xor        r10d, r10d
00a94 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a99 e92af7ffff                     jmp        0x7f4c1be85dc8
00a9e bee4ffffff                     mov        esi, 0xffffffe4
00aa3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00aab 448b442408                     mov        r8d, dword ptr [rsp + 8]
00ab0 44890424                       mov        dword ptr [rsp], r8d
00ab4 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ab9 4489542404                     mov        dword ptr [rsp + 4], r10d
00abe 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00ac3 4489442408                     mov        dword ptr [rsp + 8], r8d
00ac8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00acd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ad2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ad7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00adc 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00ae1 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00ae6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00aeb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00af0 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00af5 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00afa 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00aff 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b04 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00b09 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00b0e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b13 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00b18 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00b1d 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00b22 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00b27 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b2c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b31 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b36 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00b3b 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00b40 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b45 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00b4a 90                             nop        
00b4b e81016b5ff                     call       0x7f4c1b9d7d60
00b50 0f1f8400480c0005               nop        dword ptr [rax + rax + 0x5000c48]
00b58 bee4ffffff                     mov        esi, 0xffffffe4
00b5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b65 448b442408                     mov        r8d, dword ptr [rsp + 8]
00b6a 44890424                       mov        dword ptr [rsp], r8d
00b6e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b73 44895c2404                     mov        dword ptr [rsp + 4], r11d
00b78 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00b7d 4489442408                     mov        dword ptr [rsp + 8], r8d
00b82 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b87 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b8c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b91 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00b96 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b9b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ba0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ba5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00baa 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00baf 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bb4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00bb9 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00bbe 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bc3 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00bc8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00bcd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bd2 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00bd7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00bdc 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00be1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00be6 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00beb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00bf0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00bf5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00bfa 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00bff 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00c04 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00c08 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00c0d 6690                           nop        
00c0f e84c15b5ff                     call       0x7f4c1b9d7d60
00c14 0f1f84000c0d0006               nop        dword ptr [rax + rax + 0x6000d0c]
00c1c bee4ffffff                     mov        esi, 0xffffffe4
00c21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c29 448b442408                     mov        r8d, dword ptr [rsp + 8]
00c2e 44890424                       mov        dword ptr [rsp], r8d
00c32 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00c37 4489542404                     mov        dword ptr [rsp + 4], r10d
00c3c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00c41 4489442408                     mov        dword ptr [rsp + 8], r8d
00c46 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c50 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c55 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00c5a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c5f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c64 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00c69 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c6e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00c73 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00c78 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00c7d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c82 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00c87 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00c8c 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00c91 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c96 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00c9b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ca0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ca5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00caa 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00caf 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00cb4 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00cb9 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00cbe 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00cc3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cc8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00cd0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cd5 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00cda 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00cdf e87c14b5ff                     call       0x7f4c1b9d7d60
00ce4 0f1f8400dc0d0007               nop        dword ptr [rax + rax + 0x7000ddc]
00cec 4533db                         xor        r11d, r11d
00cef 4d3bcb                         cmp        r9, r11
00cf2 bdffffffff                     mov        ebp, 0xffffffff
00cf7 7c08                           jl         0x7f4c1be86901
00cf9 400f95c5                       setne      bpl
00cfd 400fb6ed                       movzx      ebp, bpl
00d01 be45ffffff                     mov        esi, 0xffffff45
00d06 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00d0e 4c891c24                       mov        qword ptr [rsp], r11
00d12 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d17 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d1c 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00d24 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00d29 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d2e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00d33 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00d37 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00d3b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d40 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d45 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00d49 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00d4d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d52 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00d57 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00d5b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00d5f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d64 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d69 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00d70 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00d74 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d79 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d7e 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00d82 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00d86 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00d8b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d90 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d95 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d9a 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00da2 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00da7 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00daf 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00db4 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00dbc 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00dc3 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00dcb 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00dd3 e88813b5ff                     call       0x7f4c1b9d7d60
00dd8 0f1f8400d00e0008               nop        dword ptr [rax + rax + 0x8000ed0]
00de0 be45ffffff                     mov        esi, 0xffffff45
00de5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ded 448b542408                     mov        r10d, dword ptr [rsp + 8]
00df2 44891424                       mov        dword ptr [rsp], r10d
00df6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00dfb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e00 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e05 4489542408                     mov        dword ptr [rsp + 8], r10d
00e0a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e12 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e17 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e1c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e21 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e26 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e2b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e30 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e35 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e3a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e3f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e44 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e49 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e4e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e53 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e58 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e5d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e62 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e67 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00e6c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e71 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e76 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e7b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e80 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e85 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e8a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e8f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e94 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e99 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ea1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ea6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00eae 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eb3 e8a812b5ff                     call       0x7f4c1b9d7d60
00eb8 0f1f8400b00f0009               nop        dword ptr [rax + rax + 0x9000fb0]
00ec0 be45ffffff                     mov        esi, 0xffffff45
00ec5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ecd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ed2 44891c24                       mov        dword ptr [rsp], r11d
00ed6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00edb 4489542404                     mov        dword ptr [rsp + 4], r10d
00ee0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ee5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00eea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ef2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ef7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00efc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f01 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f06 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f0b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f10 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f15 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f1a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f1f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f24 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f29 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f2e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f33 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f38 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f3d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f42 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f47 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00f4c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00f51 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f56 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f5b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f60 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00f65 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f6a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00f6f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f74 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f79 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f81 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f86 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f8e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f93 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
00f9b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00fa0 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00fa8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00fb0 666690                         nop        
00fb3 e8a811b5ff                     call       0x7f4c1b9d7d60
00fb8 0f1f8400b010000a               nop        dword ptr [rax + rax + 0xa0010b0]
00fc0 be45ffffff                     mov        esi, 0xffffff45
00fc5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fcd 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fd2 44891424                       mov        dword ptr [rsp], r10d
00fd6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fdb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fe0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fe5 4489542408                     mov        dword ptr [rsp + 8], r10d
00fea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ff2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ff7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ffc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01001 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01006 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0100b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01010 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01015 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0101a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0101f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01024 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01029 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0102e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01033 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01038 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0103d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01042 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01047 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0104c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01051 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01056 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0105b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01060 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01065 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0106a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0106f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01074 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01079 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01081 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01086 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0108e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01093 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0109b 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
010a2 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
010aa 90                             nop        
010ab e8b010b5ff                     call       0x7f4c1b9d7d60
010b0 0f1f8400a811000b               nop        dword ptr [rax + rax + 0xb0011a8]
010b8 be45ffffff                     mov        esi, 0xffffff45
010bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010c5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
010ca 44890c24                       mov        dword ptr [rsp], r9d
010ce 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010d3 44895c2404                     mov        dword ptr [rsp + 4], r11d
010d8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010dd 44894c2408                     mov        dword ptr [rsp + 8], r9d
010e2 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
010ea 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
010ef 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
010f4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
010f9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
010fe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01103 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01108 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0110d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01112 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01117 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0111c 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01121 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01126 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0112b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01130 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01135 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0113a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0113f 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01144 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01149 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0114e 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01153 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01158 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0115d 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01162 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01167 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0116c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01171 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01179 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0117e 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01186 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0118b 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01190 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01197 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0119f 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
011a7 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
011af 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
011b7 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
011bf 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
011c7 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
011cf 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
011d7 e8840fb5ff                     call       0x7f4c1b9d7d60
011dc 0f1f8400d412000c               nop        dword ptr [rax + rax + 0xc0012d4]
011e4 41bbffffff7f                   mov        r11d, 0x7fffffff
011ea 4d3bcb                         cmp        r9, r11
011ed bdffffffff                     mov        ebp, 0xffffffff
011f2 7c08                           jl         0x7f4c1be86dfc
011f4 400f95c5                       setne      bpl
011f8 400fb6ed                       movzx      ebp, bpl
011fc be45ffffff                     mov        esi, 0xffffff45
01201 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01209 4c891c24                       mov        qword ptr [rsp], r11
0120d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01212 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01217 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0121f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01224 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01229 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0122e 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
01232 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01236 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0123b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01240 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
01244 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01248 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0124d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01252 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01256 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0125a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0125f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01264 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
0126b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0126f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01274 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01279 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0127d 895c2454                       mov        dword ptr [rsp + 0x54], ebx
01281 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01286 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0128b 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01290 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01295 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0129d 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012a2 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012aa 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012af 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012b7 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
012be 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012c6 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012ce 90                             nop        
012cf e88c0eb5ff                     call       0x7f4c1b9d7d60
012d4 0f1f8400cc13000d               nop        dword ptr [rax + rax + 0xd0013cc]
012dc be45ffffff                     mov        esi, 0xffffff45
012e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012e9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
012ee 44891c24                       mov        dword ptr [rsp], r11d
012f2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
012f7 44895c2404                     mov        dword ptr [rsp + 4], r11d
012fc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01301 44895c2408                     mov        dword ptr [rsp + 8], r11d
01306 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0130e 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01313 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01318 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0131d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01322 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01327 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0132c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01331 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01336 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0133b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01340 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01345 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0134a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0134f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01354 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01359 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0135e 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01363 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01368 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0136d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01372 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01377 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0137c 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01381 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01386 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0138b 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01390 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01395 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0139d 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013a2 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013aa 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
013af 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013b4 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013bc 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
013c4 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013cc 666690                         nop        
013cf e88c0db5ff                     call       0x7f4c1b9d7d60
013d4 0f1f8400cc14000e               nop        dword ptr [rax + rax + 0xe0014cc]
013dc be45ffffff                     mov        esi, 0xffffff45
013e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013e9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013ee 44891c24                       mov        dword ptr [rsp], r11d
013f2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013f7 44895c2404                     mov        dword ptr [rsp + 4], r11d
013fc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01401 44895c2408                     mov        dword ptr [rsp + 8], r11d
01406 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0140e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01413 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01418 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0141d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01422 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01427 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0142c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01431 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01436 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0143b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01440 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01445 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0144a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0144f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01454 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01459 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0145e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01463 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01468 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0146d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01472 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01477 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0147c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01481 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01486 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0148b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01490 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01495 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0149d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
014a2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
014aa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
014af 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014b4 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
014bb 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
014c3 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
014cb e8900cb5ff                     call       0x7f4c1b9d7d60
014d0 0f1f8400c815000f               nop        dword ptr [rax + rax + 0xf0015c8]
014d8 be3dffffff                     mov        esi, 0xffffff3d
014dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014e5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014ea 44891c24                       mov        dword ptr [rsp], r11d
014ee 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
014f3 44894c2404                     mov        dword ptr [rsp + 4], r9d
014f8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
014fd 44894c2408                     mov        dword ptr [rsp + 8], r9d
01502 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0150a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0150f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01514 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01519 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0151e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01523 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01528 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0152d 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01532 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01537 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0153c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01541 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01546 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0154b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01550 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01555 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0155a 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0155f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01564 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01569 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01571 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01576 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0157b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01580 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01585 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0158a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0158f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01594 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01599 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0159e 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
015a6 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
015ab 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
015b3 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
015b8 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
015bd 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
015c5 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
015cc 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
015d3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
015db 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
015e3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
015eb 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
015f3 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
015fb 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01603 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0160b 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01613 e8480bb5ff                     call       0x7f4c1b9d7d60
01618 0f1f840010170010               nop        dword ptr [rax + rax + 0x10001710]
01620 be45ffffff                     mov        esi, 0xffffff45
01625 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0162d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01632 44891424                       mov        dword ptr [rsp], r10d
01636 4489442408                     mov        dword ptr [rsp + 8], r8d
0163b e8200bb5ff                     call       0x7f4c1b9d7d60
01640 0f1f840038170011               nop        dword ptr [rax + rax + 0x11001738]
01648 be45ffffff                     mov        esi, 0xffffff45
0164d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01655 448b542408                     mov        r10d, dword ptr [rsp + 8]
0165a 44891424                       mov        dword ptr [rsp], r10d
0165e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01663 4489542404                     mov        dword ptr [rsp + 4], r10d
01668 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0166d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01672 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01677 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0167c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01681 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01686 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0168b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01690 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01695 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0169a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0169f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
016a4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
016a9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
016ae 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
016b3 4489542430                     mov        dword ptr [rsp + 0x30], r10d
016b8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
016bd 4489542440                     mov        dword ptr [rsp + 0x40], r10d
016c2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
016c7 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
016cc 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016d1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
016d6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
016de 4c89542450                     mov        qword ptr [rsp + 0x50], r10
016e3 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
016e8 894c2460                       mov        dword ptr [rsp + 0x60], ecx
016ec 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
016f1 6690                           nop        
016f3 e8680ab5ff                     call       0x7f4c1b9d7d60
016f8 0f1f8400f0170012               nop        dword ptr [rax + rax + 0x120017f0]
01700 be45ffffff                     mov        esi, 0xffffff45
01705 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0170d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01712 44891424                       mov        dword ptr [rsp], r10d
01716 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0171b 4489542404                     mov        dword ptr [rsp + 4], r10d
01720 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01725 4489542408                     mov        dword ptr [rsp + 8], r10d
0172a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0172f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01734 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01739 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0173e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01743 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01748 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0174d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01752 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01757 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0175c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01761 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01766 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0176b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01770 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01775 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0177a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0177f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01784 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01789 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0178e 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01793 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01798 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0179c 4489442458                     mov        dword ptr [rsp + 0x58], r8d
017a1 6690                           nop        
017a3 e8b809b5ff                     call       0x7f4c1b9d7d60
017a8 0f1f8400a0180013               nop        dword ptr [rax + rax + 0x130018a0]
017b0 be45ffffff                     mov        esi, 0xffffff45
017b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017bd 448b542408                     mov        r10d, dword ptr [rsp + 8]
017c2 44891424                       mov        dword ptr [rsp], r10d
017c6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
017cb 44895c2404                     mov        dword ptr [rsp + 4], r11d
017d0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017d5 4489542408                     mov        dword ptr [rsp + 8], r10d
017da 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
017e2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
017e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017f1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017f6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017fb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01800 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01805 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0180a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0180f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01814 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01819 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0181e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01823 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01828 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0182d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01832 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01837 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0183c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01841 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01846 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0184b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01850 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01855 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0185a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0185f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01864 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01869 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01871 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01876 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0187e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01883 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
0188b 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
01893 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0189b 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
018a3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
018ab 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
018b3 e8a808b5ff                     call       0x7f4c1b9d7d60
018b8 0f1f8400b0190014               nop        dword ptr [rax + rax + 0x140019b0]
018c0 be45ffffff                     mov        esi, 0xffffff45
018c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018cd 448b542408                     mov        r10d, dword ptr [rsp + 8]
018d2 44891424                       mov        dword ptr [rsp], r10d
018d6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
018db 44895c2404                     mov        dword ptr [rsp + 4], r11d
018e0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018e5 4489542408                     mov        dword ptr [rsp + 8], r10d
018ea 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018ef 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018f4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
018f9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018fe 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01903 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01908 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0190d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01912 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01917 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0191c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01921 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01926 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0192b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01930 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01935 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0193a 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0193f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01944 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01949 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0194e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01953 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01958 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0195d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01962 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01967 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0196c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01974 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01979 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01981 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01986 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0198e 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01995 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0199d 6690                           nop        
0199f e8bc07b5ff                     call       0x7f4c1b9d7d60
019a4 0f1f84009c1a0015               nop        dword ptr [rax + rax + 0x15001a9c]
019ac 4585c9                         test       r9d, r9d
019af 7f07                           jg         0x7f4c1be875b8
019b1 33c0                           xor        eax, eax
019b3 e908e7ffff                     jmp        0x7f4c1be85cc0
019b8 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019bc 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
019c1 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
019c5 894c2418                       mov        dword ptr [rsp + 0x18], ecx
019c9 4489442414                     mov        dword ptr [rsp + 0x14], r8d
019ce 4489542410                     mov        dword ptr [rsp + 0x10], r10d
019d3 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
019d8 48894424f8                     mov        qword ptr [rsp - 8], rax
019dd 8b0424                         mov        eax, dword ptr [rsp]
019e0 89442404                       mov        dword ptr [rsp + 4], eax
019e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e9 48894424f8                     mov        qword ptr [rsp - 8], rax
019ee 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019f5 890424                         mov        dword ptr [rsp], eax
019f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fd 488bee                         mov        rbp, rsi
01a00 8b542408                       mov        edx, dword ptr [rsp + 8]
01a04 418bc9                         mov        ecx, r9d
01a07 e85492a8ff                     call       0x7f4c1b910860
01a0c 0f1f8400041b0016               nop        dword ptr [rax + rax + 0x16001b04]
01a14 41ba40000000                   mov        r10d, 0x40
01a1a 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01a1f c4e2a9f7c0                     shlx       rax, rax, r10
01a24 48894424f8                     mov        qword ptr [rsp - 8], rax
01a29 8b442404                       mov        eax, dword ptr [rsp + 4]
01a2d 890424                         mov        dword ptr [rsp], eax
01a30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a35 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
01a3a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a3f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01a44 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01a48 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01a4c 448b6c2428                     mov        r13d, dword ptr [rsp + 0x28]
01a51 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a55 e966e6ffff                     jmp        0x7f4c1be85cc0
01a5a 4585c9                         test       r9d, r9d
01a5d 7f08                           jg         0x7f4c1be87667
01a5f 4533f6                         xor        r14d, r14d
01a62 e99be6ffff                     jmp        0x7f4c1be85d02
01a67 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a6c 4889442430                     mov        qword ptr [rsp + 0x30], rax
01a71 89542428                       mov        dword ptr [rsp + 0x28], edx
01a75 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
01a7a 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01a7e 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01a82 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01a87 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a91 8b0424                         mov        eax, dword ptr [rsp]
01a94 89442404                       mov        dword ptr [rsp + 4], eax
01a98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01aa9 890424                         mov        dword ptr [rsp], eax
01aac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ab9 488bf5                         mov        rsi, rbp
01abc 8b542408                       mov        edx, dword ptr [rsp + 8]
01ac0 418bc9                         mov        ecx, r9d
01ac3 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01ac8 666690                         nop        
01acb e89091a8ff                     call       0x7f4c1b910860
01ad0 0f1f8400c81b0017               nop        dword ptr [rax + rax + 0x17001bc8]
01ad8 41bb80000000                   mov        r11d, 0x80
01ade 442b5c2414                     sub        r11d, dword ptr [rsp + 0x14]
01ae3 c462a1f7f0                     shlx       r14, rax, r11
01ae8 48894424f8                     mov        qword ptr [rsp - 8], rax
01aed 8b442404                       mov        eax, dword ptr [rsp + 4]
01af1 890424                         mov        dword ptr [rsp], eax
01af4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01afe 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01b03 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
01b07 448b6c241c                     mov        r13d, dword ptr [rsp + 0x1c]
01b0c 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01b10 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01b15 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b1a e9e3e5ffff                     jmp        0x7f4c1be85d02
01b1f 4533c0                         xor        r8d, r8d
01b22 e9b3eeffff                     jmp        0x7f4c1be865da
01b27 bee4ffffff                     mov        esi, 0xffffffe4
01b2c 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b34 488f0424                       pop        qword ptr [rsp]
01b38 666690                         nop        
01b3b e82006b5ff                     call       0x7f4c1b9d7d60
01b40 0f1f8400381c0018               nop        dword ptr [rax + rax + 0x18001c38]
01b48 be5d000000                     mov        esi, 0x5d
01b4d 6690                           nop        
01b4f e80c06b5ff                     call       0x7f4c1b9d7d60
01b54 0f1f84004c1c0019               nop        dword ptr [rax + rax + 0x19001c4c]
01b5c bef6ffffff                     mov        esi, 0xfffffff6
01b61 6690                           nop        
01b63 e8f805b5ff                     call       0x7f4c1b9d7d60
01b68 0f1f8400601c001a               nop        dword ptr [rax + rax + 0x1a001c60]
01b70 bef6ffffff                     mov        esi, 0xfffffff6
01b75 6690                           nop        
01b77 e8e405b5ff                     call       0x7f4c1b9d7d60
01b7c 0f1f8400741c001b               nop        dword ptr [rax + rax + 0x1b001c74]
01b84 be6effffff                     mov        esi, 0xffffff6e
01b89 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b91 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b96 44891c24                       mov        dword ptr [rsp], r11d
01b9a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b9f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ba4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ba9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bae 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01bb3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bb8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bbd 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bc2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bc7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01bcc 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01bd1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01bd6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bdb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01be0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01be5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bea 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01bef 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01bf3 897c2444                       mov        dword ptr [rsp + 0x44], edi
01bf7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01bfc 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c01 6690                           nop        
01c03 e85805b5ff                     call       0x7f4c1b9d7d60
01c08 0f1f8400001d001c               nop        dword ptr [rax + rax + 0x1c001d00]
01c10 bee4ffffff                     mov        esi, 0xffffffe4
01c15 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c1d 488f0424                       pop        qword ptr [rsp]
01c21 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01c26 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c32 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c3f 89542434                       mov        dword ptr [rsp + 0x34], edx
01c43 e81805b5ff                     call       0x7f4c1b9d7d60
01c48 0f1f8400401d001d               nop        dword ptr [rax + rax + 0x1d001d40]
01c50 bee4ffffff                     mov        esi, 0xffffffe4
01c55 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c5d 488f0424                       pop        qword ptr [rsp]
01c61 48894424f8                     mov        qword ptr [rsp - 8], rax
01c66 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c6d 89442418                       mov        dword ptr [rsp + 0x18], eax
01c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c76 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01c7a 89542430                       mov        dword ptr [rsp + 0x30], edx
01c7e 4889442438                     mov        qword ptr [rsp + 0x38], rax
01c83 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01c88 666690                         nop        
01c8b e8d004b5ff                     call       0x7f4c1b9d7d60
01c90 0f1f8400881d001e               nop        dword ptr [rax + rax + 0x1e001d88]
01c98 bebeffffff                     mov        esi, 0xffffffbe
01c9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ca5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01caa 44891c24                       mov        dword ptr [rsp], r11d
01cae 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cb3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cb8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cbd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cc2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cc7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ccc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cd1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01cd6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01cdb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ce0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ce5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01cea 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cef 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cf4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cf9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01cfe 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01d03 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01d07 897c2444                       mov        dword ptr [rsp + 0x44], edi
01d0b 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01d10 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01d15 6690                           nop        
01d17 e84404b5ff                     call       0x7f4c1b9d7d60
01d1c 0f1f8400141e001f               nop        dword ptr [rax + rax + 0x1f001e14]
01d24 beccffffff                     mov        esi, 0xffffffcc
01d29 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d31 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d36 44891c24                       mov        dword ptr [rsp], r11d
01d3a 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01d3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d44 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d4b 89442414                       mov        dword ptr [rsp + 0x14], eax
01d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d54 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01d59 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d5e 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01d62 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01d66 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01d6b e8f003b5ff                     call       0x7f4c1b9d7d60
01d70 0f1f8400681e0020               nop        dword ptr [rax + rax + 0x20001e68]
01d78 beccffffff                     mov        esi, 0xffffffcc
01d7d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d85 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01d8a 44890c24                       mov        dword ptr [rsp], r9d
01d8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d93 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d9a 89442410                       mov        dword ptr [rsp + 0x10], eax
01d9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da3 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01da8 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01dad 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01db1 89542428                       mov        dword ptr [rsp + 0x28], edx
01db5 4889442430                     mov        qword ptr [rsp + 0x30], rax
01dba 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01dbf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01dc4 666690                         nop        
01dc7 e89403b5ff                     call       0x7f4c1b9d7d60
01dcc 0f1f8400c41e0021               nop        dword ptr [rax + rax + 0x21001ec4]
01dd4 be45ffffff                     mov        esi, 0xffffff45
01dd9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01de1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01de6 44891c24                       mov        dword ptr [rsp], r11d
01dea 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01def 4489442404                     mov        dword ptr [rsp + 4], r8d
01df4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01df9 44895c2408                     mov        dword ptr [rsp + 8], r11d
01dfe 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e03 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01e08 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e0d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e12 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01e17 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01e1c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01e21 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01e26 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01e2b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01e30 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01e35 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01e3a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01e3f e81c03b5ff                     call       0x7f4c1b9d7d60
01e44 0f1f84003c1f0022               nop        dword ptr [rax + rax + 0x22001f3c]
01e4c be45ffffff                     mov        esi, 0xffffff45
01e51 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e59 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e5e 44890424                       mov        dword ptr [rsp], r8d
01e62 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01e67 44895c2404                     mov        dword ptr [rsp + 4], r11d
01e6c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01e71 4489442408                     mov        dword ptr [rsp + 8], r8d
01e76 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e7b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01e80 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e85 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e8a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01e8f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01e94 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01e99 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01e9e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ea3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ea8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01ead 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01eb2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01eb7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ebc 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01ec1 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ec6 90                             nop        
01ec7 e89402b5ff                     call       0x7f4c1b9d7d60
01ecc 0f1f8400c41f0023               nop        dword ptr [rax + rax + 0x23001fc4]
01ed4 bef6ffffff                     mov        esi, 0xfffffff6
01ed9 6690                           nop        
01edb e88002b5ff                     call       0x7f4c1b9d7d60
01ee0 0f1f8400d81f0024               nop        dword ptr [rax + rax + 0x24001fd8]
01ee8 be5d000000                     mov        esi, 0x5d
01eed 6690                           nop        
01eef e86c02b5ff                     call       0x7f4c1b9d7d60
01ef4 0f1f8400ec1f0025               nop        dword ptr [rax + rax + 0x25001fec]
01efc be45ffffff                     mov        esi, 0xffffff45
01f01 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f09 448b542408                     mov        r10d, dword ptr [rsp + 8]
01f0e 44891424                       mov        dword ptr [rsp], r10d
01f12 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01f16 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01f1b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f20 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01f25 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01f2d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01f32 4c89442450                     mov        qword ptr [rsp + 0x50], r8
01f37 e82402b5ff                     call       0x7f4c1b9d7d60
01f3c 0f1f840034200026               nop        dword ptr [rax + rax + 0x26002034]
01f44 bef6ffffff                     mov        esi, 0xfffffff6
01f49 418be9                         mov        ebp, r9d
01f4c 666690                         nop        
01f4f e80c02b5ff                     call       0x7f4c1b9d7d60
01f54 0f1f84004c200027               nop        dword ptr [rax + rax + 0x2700204c]
01f5c bef6ffffff                     mov        esi, 0xfffffff6
01f61 418bea                         mov        ebp, r10d
01f64 666690                         nop        
01f67 e8f401b5ff                     call       0x7f4c1b9d7d60
01f6c 0f1f840064200028               nop        dword ptr [rax + rax + 0x28002064]
01f74 bef6ffffff                     mov        esi, 0xfffffff6
01f79 418beb                         mov        ebp, r11d
01f7c 666690                         nop        
01f7f e8dc01b5ff                     call       0x7f4c1b9d7d60
01f84 0f1f84007c200029               nop        dword ptr [rax + rax + 0x2900207c]
01f8c bef6ffffff                     mov        esi, 0xfffffff6
01f91 6690                           nop        
01f93 e8c801b5ff                     call       0x7f4c1b9d7d60
01f98 0f1f84009020002a               nop        dword ptr [rax + rax + 0x2a002090]
01fa0 bef6ffffff                     mov        esi, 0xfffffff6
01fa5 6690                           nop        
01fa7 e8b401b5ff                     call       0x7f4c1b9d7d60
01fac 0f1f8400a420002b               nop        dword ptr [rax + rax + 0x2b0020a4]
01fb4 bef6ffffff                     mov        esi, 0xfffffff6
01fb9 6690                           nop        
01fbb e8a001b5ff                     call       0x7f4c1b9d7d60
01fc0 0f1f8400b820002c               nop        dword ptr [rax + rax + 0x2c0020b8]
01fc8 bef6ffffff                     mov        esi, 0xfffffff6
01fcd 6690                           nop        
01fcf e88c01b5ff                     call       0x7f4c1b9d7d60
01fd4 0f1f8400cc20002d               nop        dword ptr [rax + rax + 0x2d0020cc]
01fdc bef6ffffff                     mov        esi, 0xfffffff6
01fe1 6690                           nop        
01fe3 e87801b5ff                     call       0x7f4c1b9d7d60
01fe8 0f1f8400e020002e               nop        dword ptr [rax + rax + 0x2e0020e0]
01ff0 bef6ffffff                     mov        esi, 0xfffffff6
01ff5 6690                           nop        
01ff7 e86401b5ff                     call       0x7f4c1b9d7d60
01ffc 0f1f8400f420002f               nop        dword ptr [rax + rax + 0x2f0020f4]
02004 bef6ffffff                     mov        esi, 0xfffffff6
02009 6690                           nop        
0200b e85001b5ff                     call       0x7f4c1b9d7d60
02010 0f1f840008210030               nop        dword ptr [rax + rax + 0x30002108]
02018 eb08                           jmp        0x7f4c1be87c22
0201a eb06                           jmp        0x7f4c1be87c22
0201c eb04                           jmp        0x7f4c1be87c22
0201e eb02                           jmp        0x7f4c1be87c22
02020 eb00                           jmp        0x7f4c1be87c22
02022 488bf0                         mov        rsi, rax
02025 e916eaffff                     jmp        0x7f4c1be86640
0202a 49ba1066e81b4c7f0000           movabs     r10, 0x7f4c1be86610
02034 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0203b e9a0b2a8ff                     jmp        0x7f4c1b912ee0
02040 e85b7ea7ff                     call       0x7f4c1b8ffaa0
02045 e9d4dfffff                     jmp        0x7f4c1be85c1e
0204a f4                             hlt        
0204b f4                             hlt        
0204c f4                             hlt        
0204d f4                             hlt        
0204e f4                             hlt        
0204f f4                             hlt        
