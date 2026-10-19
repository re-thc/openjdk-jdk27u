00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f854a210000                   jne        0x7efc7bbded68
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
00050 0f83231b0000                   jae        0x7efc7bbde779
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f84471b0000                   je         0x7efc7bbde7ac
00065 448bda                         mov        r11d, edx
00068 442bd9                         sub        r11d, ecx
0006b 8b0c24                         mov        ecx, dword ptr [rsp]
0006e 83c1f9                         add        ecx, -7
00071 8d42f8                         lea        eax, [rdx - 8]
00074 468d0cdd00000000               lea        r9d, [r11*8]
0007c f3450fbdd0                     lzcnt      r10d, r8d
00081 41be1f000000                   mov        r14d, 0x1f
00087 452bf2                         sub        r14d, r10d
0008a bf08000000                     mov        edi, 8
0008f 412bfe                         sub        edi, r14d
00092 418bd1                         mov        edx, r9d
00095 2bd7                           sub        edx, edi
00097 4183fb08                       cmp        r11d, 8
0009b 0f8c63190000                   jl         0x7efc7bbde604
000a1 85c9                           test       ecx, ecx
000a3 0f8c331d0000                   jl         0x7efc7bbde9dc
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f83f11b0000                   jae        0x7efc7bbde8a8
000b7 448bc0                         mov        r8d, eax
000ba 4e8b6c0608                     mov        r13, qword ptr [rsi + r8 + 8]
000bf 4183c3f8                       add        r11d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183fb08                       cmp        r11d, 8
000d3 0f8cd8190000                   jl         0x7efc7bbde6b1
000d9 85c9                           test       ecx, ecx
000db 0f8c571d0000                   jl         0x7efc7bbdea38
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f830c1c0000                   jae        0x7efc7bbde8fc
000f0 458bda                         mov        r11d, r10d
000f3 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
000fb 4b8b741808                     mov        rsi, qword ptr [r8 + r11 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00109 4585db                         test       r11d, r11d
0010c 0f84c21a0000                   je         0x7efc7bbde7d4
00112 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00116 458b4104                       mov        r8d, dword ptr [r9 + 4]
0011a 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011d 85db                           test       ebx, ebx
0011f 0f84d71a0000                   je         0x7efc7bbde7fc
00125 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0012a 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
00132 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00137 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
0013c 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00143 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00148 897c2424                       mov        dword ptr [rsp + 0x24], edi
0014c 89442410                       mov        dword ptr [rsp + 0x10], eax
00150 894c2404                       mov        dword ptr [rsp + 4], ecx
00154 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015c 45034304                       add        r8d, dword ptr [r11 + 4]
00160 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00165 44034304                       add        r8d, dword ptr [rbx + 4]
00169 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0016d 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00172 4c8bd3                         mov        r10, rbx
00175 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0017a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0017f 4d8bd3                         mov        r10, r11
00182 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00187 4d8bd1                         mov        r10, r9
0018a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018f 4585c0                         test       r8d, r8d
00192 0f84d9080000                   je         0x7efc7bbdd671
00198 be40000000                     mov        esi, 0x40
0019d 2bf7                           sub        esi, edi
0019f 443bc6                         cmp        r8d, esi
001a2 0f8f00020000                   jg         0x7efc7bbdcfa8
001a8 412bf0                         sub        esi, r8d
001ab c4c2cbf7ed                     shrx       rbp, r13, rsi
001b0 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b5 4183f840                       cmp        r8d, 0x40
001b9 0f8dad1d0000                   jge        0x7efc7bbdeb6c
001bf 41bb01000000                   mov        r11d, 1
001c5 c442b9f7d3                     shlx       r10, r11, r8
001ca 49ffca                         dec        r10
001cd 4c23d5                         and        r10, rbp
001d0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d5 458bd0                         mov        r10d, r8d
001d8 458bca                         mov        r9d, r10d
001db 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e0 458d4108                       lea        r8d, [r9 + 8]
001e4 4183f840                       cmp        r8d, 0x40
001e8 7c35                           jl         0x7efc7bbdce1f
001ea 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001ef 4183c1c8                       add        r9d, -0x38
001f3 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f8 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00200 8b542408                       mov        edx, dword ptr [rsp + 8]
00204 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00208 90                             nop        
00209 90                             nop        
0020a 90                             nop        
0020b e8502eb5ff                     call       0x7efc7b72fc60
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7efc7bbdce50
0021f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00224 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0022c 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00231 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00236 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0023e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00246 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00250 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00255 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00259 83fd20                         cmp        ebp, 0x20
0025c 0f8d3a1c0000                   jge        0x7efc7bbdea9c
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
00298 0f8d3a1c0000                   jge        0x7efc7bbdead8
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
002df 0f8e8c180000                   jle        0x7efc7bbde771
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
00357 0f86c7180000                   jbe        0x7efc7bbde824
0035d 4d63d2                         movsxd     r10, r10d
00360 4c63d9                         movsxd     r11, ecx
00363 49ffcb                         dec        r11
00366 4d3bda                         cmp        r11, r10
00369 0f83b5180000                   jae        0x7efc7bbde824
0036f 448b542404                     mov        r10d, dword ptr [rsp + 4]
00374 4585d2                         test       r10d, r10d
00377 0f8cdb190000                   jl         0x7efc7bbde958
0037d 448b1c24                       mov        r11d, dword ptr [rsp]
00381 4183c3f9                       add        r11d, -7
00385 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0038d 4533d2                         xor        r10d, r10d
00390 4533db                         xor        r11d, r11d
00393 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0039b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
003a3 e985020000                     jmp        0x7efc7bbdd22d
003a8 418be8                         mov        ebp, r8d
003ab 2bee                           sub        ebp, esi
003ad 90                             nop        
003ae 90                             nop        
003af e8ac2cb5ff                     call       0x7efc7b72fc60
003b4 0f1f8400ac040001               nop        dword ptr [rax + rax + 0x10004ac]
003bc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003c1 41bb40000000                   mov        r11d, 0x40
003c7 442bdd                         sub        r11d, ebp
003ca c462d1f7c0                     shlx       r8, rax, rbp
003cf c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003d9 4d0bc2                         or         r8, r10
003dc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003e1 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e6 e9edfdffff                     jmp        0x7efc7bbdcdd8
003eb 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003f3 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
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
0042a 0f8d8c0a0000                   jge        0x7efc7bbddabc
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bc2                         mov        r8d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8d4d0b0000                   jge        0x7efc7bbddbb0
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bca                         mov        ecx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d380c0000                   jge        0x7efc7bbddcc4
0048c c4e2d3f7df                     shrx       rbx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d270d0000                   jge        0x7efc7bbddddc
004b5 41bb01000000                   mov        r11d, 1
004bb c442d1f7cb                     shlx       r9, r11, rbp
004c0 49ffc9                         dec        r9
004c3 4c23cb                         and        r9, rbx
004c6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004ce 418bfb                         mov        edi, r11d
004d1 4103fa                         add        edi, r10d
004d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004d9 458bd2                         mov        r10d, r10d
004dc 4403d1                         add        r10d, ecx
004df 4863cf                         movsxd     rcx, edi
004e2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004ea 458bdb                         mov        r11d, r11d
004ed 4d03cb                         add        r9, r11
004f0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
004f8 4c03d9                         add        r11, rcx
004fb 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
00503 4d85c9                         test       r9, r9
00506 0f8e7c070000                   jle        0x7efc7bbdd888
0050c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00513 0f8fc70d0000                   jg         0x7efc7bbddee0
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fc60e0000                   jg         0x7efc7bbddfec
00526 81ffffff0300                   cmp        edi, 0x3ffff
0052c 0f8fa20f0000                   jg         0x7efc7bbde0d4
00532 458bd9                         mov        r11d, r9d
00535 4181fb00000010                 cmp        r11d, 0x10000000
0053c 0f837a100000                   jae        0x7efc7bbde1bc
00542 4d63d2                         movsxd     r10, r10d
00545 4d63db                         movsxd     r11, r11d
00548 48c1e112                       shl        rcx, 0x12
0054c 49c1e324                       shl        r11, 0x24
00550 4c0bd9                         or         r11, rcx
00553 4d0bda                         or         r11, r10
00556 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0055d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00565 4e895cd108                     mov        qword ptr [rcx + r10*8 + 8], r11
0056a 8b2c24                         mov        ebp, dword ptr [rsp]
0056d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00571 0f8da5000000                   jge        0x7efc7bbdd21c
00577 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0057f 49c1ea30                       shr        r10, 0x30
00583 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00588 49c1eb30                       shr        r11, 0x30
0058c 458bca                         mov        r9d, r10d
0058f 418bcb                         mov        ecx, r11d
00592 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0059a c4c22bf7d8                     shrx       ebx, r8d, r10d
0059f 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005a7 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
005af c44223f7d0                     shrx       r10d, r8d, r11d
005b4 4103ca                         add        ecx, r10d
005b7 894c2474                       mov        dword ptr [rsp + 0x74], ecx
005bb 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005c3 4183fb20                       cmp        r11d, 0x20
005c7 0f8def100000                   jge        0x7efc7bbde2bc
005cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005d5 49c1ea30                       shr        r10, 0x30
005d9 458bd2                         mov        r10d, r10d
005dc b901000000                     mov        ecx, 1
005e1 c4e221f7c9                     shlx       ecx, ecx, r11d
005e6 ffc9                           dec        ecx
005e8 23cb                           and        ecx, ebx
005ea 4103c9                         add        ecx, r9d
005ed 894c2448                       mov        dword ptr [rsp + 0x48], ecx
005f1 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005f9 4183fb20                       cmp        r11d, 0x20
005fd 0f8d65110000                   jge        0x7efc7bbde368
00603 41b901000000                   mov        r9d, 1
00609 c44221f7c9                     shlx       r9d, r9d, r11d
0060e 41ffc9                         dec        r9d
00611 4523c8                         and        r9d, r8d
00614 4503ca                         add        r9d, r10d
00617 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0061c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00620 0f8dcf030000                   jge        0x7efc7bbdd5f5
00626 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
0062d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00632 4423542474                     and        r10d, dword ptr [rsp + 0x74]
00637 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0063c 418b4814                       mov        ecx, dword ptr [r8 + 0x14]
00640 448b5904                       mov        r11d, dword ptr [rcx + 4]
00644 453bd3                         cmp        r10d, r11d
00647 0f8334040000                   jae        0x7efc7bbdd681
0064d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00652 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00657 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0065c 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00660 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00664 4e8b54d108                     mov        r10, qword ptr [rcx + r10*8 + 8]
00669 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0066e 443bc3                         cmp        r8d, ebx
00671 0f83a5040000                   jae        0x7efc7bbdd71c
00677 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0067c 4423542448                     and        r10d, dword ptr [rsp + 0x48]
00681 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00686 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
0068a 418b4904                       mov        ecx, dword ptr [r9 + 4]
0068e 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00693 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
0069b 443bd1                         cmp        r10d, ecx
0069e 0f8328050000                   jae        0x7efc7bbdd7cc
006a4 4f8b54d108                     mov        r10, qword ptr [r9 + r10*8 + 8]
006a9 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b1 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006b8 ffc5                           inc        ebp
006ba 892c24                         mov        dword ptr [rsp], ebp
006bd 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c1 0f8dff020000                   jge        0x7efc7bbdd5c6
006c7 49c1ea28                       shr        r10, 0x28
006cb 458bd2                         mov        r10d, r10d
006ce 450fb6d2                       movzx      r10d, r10b
006d2 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006da 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006df 49c1ea28                       shr        r10, 0x28
006e3 458bda                         mov        r11d, r10d
006e6 410fb6eb                       movzx      ebp, r11b
006ea 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006f1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006f9 49c1ea28                       shr        r10, 0x28
006fd 458bda                         mov        r11d, r10d
00700 450fb6db                       movzx      r11d, r11b
00704 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0070c 4103eb                         add        ebp, r11d
0070f 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00716 41ba01000000                   mov        r10d, 1
0071c 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
00724 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0072c 49c1ea20                       shr        r10, 0x20
00730 458bd2                         mov        r10d, r10d
00733 410fb6ea                       movzx      ebp, r10b
00737 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
0073e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00743 49c1ea20                       shr        r10, 0x20
00747 458bda                         mov        r11d, r10d
0074a 410fb6eb                       movzx      ebp, r11b
0074e 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00755 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0075d 49c1ea20                       shr        r10, 0x20
00761 458bd2                         mov        r10d, r10d
00764 410fb6ea                       movzx      ebp, r10b
00768 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0076f 448bcd                         mov        r9d, ebp
00772 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
0077a 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
00782 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
0078a 4585c9                         test       r9d, r9d
0078d 0f84fd050000                   je         0x7efc7bbdd990
00793 4183f93f                       cmp        r9d, 0x3f
00797 0f8fe3060000                   jg         0x7efc7bbdda80
0079d 41b840000000                   mov        r8d, 0x40
007a3 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007a8 453bc8                         cmp        r9d, r8d
007ab 7e48                           jle        0x7efc7bbdd3f5
007ad 418bc9                         mov        ecx, r9d
007b0 412bc8                         sub        ecx, r8d
007b3 4183f840                       cmp        r8d, 0x40
007b7 0f8d47110000                   jge        0x7efc7bbde504
007bd 41ba01000000                   mov        r10d, 1
007c3 c442b9f7d2                     shlx       r10, r10, r8
007c8 49ffca                         dec        r10
007cb 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007d3 c4c2f1f7ea                     shlx       rbp, r10, rcx
007d8 41bb40000000                   mov        r11d, 0x40
007de 442bd9                         sub        r11d, ecx
007e1 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007e8 490bea                         or         rbp, r10
007eb 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007f3 eb30                           jmp        0x7efc7bbdd425
007f5 452bc1                         sub        r8d, r9d
007f8 c462bbf7842498000000           shrx       r8, qword ptr [rsp + 0x98], r8
00802 4183f940                       cmp        r9d, 0x40
00806 0f8df40f0000                   jge        0x7efc7bbde400
0080c 41ba01000000                   mov        r10d, 1
00812 c4c2b1f7ea                     shlx       rbp, r10, r9
00817 48ffcd                         dec        rbp
0081a 4923e8                         and        rbp, r8
0081d 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00825 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0082a 4503d1                         add        r10d, r9d
0082d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00832 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00837 4503d9                         add        r11d, r9d
0083a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0083f 4183fa40                       cmp        r10d, 0x40
00843 0f8cd7fbffff                   jl         0x7efc7bbdd020
00849 4183c2c0                       add        r10d, -0x40
0084d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00852 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00856 83c5f8                         add        ebp, -8
00859 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085d 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00861 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00865 83c1f0                         add        ecx, -0x10
00868 83f908                         cmp        ecx, 8
0086b 0f8c07010000                   jl         0x7efc7bbdd578
00871 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00876 4183c0e8                       add        r8d, -0x18
0087a 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00882 0f8263fbffff                   jb         0x7efc7bbdcfeb
00888 bee4ffffff                     mov        esi, 0xffffffe4
0088d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00895 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0089a 44891c24                       mov        dword ptr [rsp], r11d
0089e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a3 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a8 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ad 44895c2408                     mov        dword ptr [rsp + 8], r11d
008b2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008b7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008bc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008c1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008c6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008cb 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008d0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008d5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008da 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008df 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008e4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008e9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008ee 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008f3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008f8 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00902 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00907 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0090c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00911 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00916 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0091b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00920 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00925 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0092a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0092f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00934 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0093c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00941 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00949 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0094e 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00956 90                             nop        
00957 e80405afff                     call       0x7efc7b6cda60
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
0096e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00972 e8697fcc17                     call       0x7efc938a54e0
00977 f4                             hlt        
00978 85c9                           test       ecx, ecx
0097a 7f08                           jg         0x7efc7bbdd584
0097c 4533d2                         xor        r10d, r10d
0097f e974faffff                     jmp        0x7efc7bbdcff8
00984 8be9                           mov        ebp, ecx
00986 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098e 8b542408                       mov        edx, dword ptr [rsp + 8]
00992 90                             nop        
00993 e8c826b5ff                     call       0x7efc7b72fc60
00998 0f1f8400900a0003               nop        dword ptr [rax + rax + 0x3000a90]
009a0 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
009a5 41c1e303                       shl        r11d, 3
009a9 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ae 41c1e003                       shl        r8d, 3
009b2 452bd8                         sub        r11d, r8d
009b5 4181c3c0000000                 add        r11d, 0xc0
009bc c462a1f7d0                     shlx       r10, rax, r11
009c1 e932faffff                     jmp        0x7efc7bbdcff8
009c6 4533d2                         xor        r10d, r10d
009c9 33ed                           xor        ebp, ebp
009cb 4533c0                         xor        r8d, r8d
009ce 4533db                         xor        r11d, r11d
009d1 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009d9 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009e0 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
009e8 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
009f0 e92ffdffff                     jmp        0x7efc7bbdd324
009f5 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009fd 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a05 4d03c2                         add        r8, r10
00a08 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a10 4d3bc2                         cmp        r8, r10
00a13 7f29                           jg         0x7efc7bbdd63e
00a15 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a1a 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a22 0f851c150000                   jne        0x7efc7bbdeb44
00a28 418bc0                         mov        eax, r8d
00a2b 4881c410010000                 add        rsp, 0x110
00a32 5d                             pop        rbp
00a33 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a37 0f8715170000                   ja         0x7efc7bbded52
00a3d c3                             ret        
00a3e 48bee8462ae300000000           movabs     rsi, 0xe32a46e8
00a48 90                             nop        
00a49 90                             nop        
00a4a 90                             nop        
00a4b e81026b5ff                     call       0x7efc7b72fc60
00a50 0f1f8400480b0004               nop        dword ptr [rax + rax + 0x4000b48]
00a58 4885c0                         test       rax, rax
00a5b 0f84bb140000                   je         0x7efc7bbdeb1c
00a61 488bf0                         mov        rsi, rax
00a64 4881c410010000                 add        rsp, 0x110
00a6b 5d                             pop        rbp
00a6c e9efb9aeff                     jmp        0x7efc7b6c9060
00a71 4533d2                         xor        r10d, r10d
00a74 4533db                         xor        r11d, r11d
00a77 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a7c e957f7ffff                     jmp        0x7efc7bbdcdd8
00a81 bee4ffffff                     mov        esi, 0xffffffe4
00a86 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a8e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a93 44891c24                       mov        dword ptr [rsp], r11d
00a97 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a9c 4489442404                     mov        dword ptr [rsp + 4], r8d
00aa1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00aa6 44895c2408                     mov        dword ptr [rsp + 8], r11d
00aab 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00ab0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00ab5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00aba 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00abf 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ac4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ac9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ace 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ad3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ad8 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00add 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ae2 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ae7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00aec 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00af1 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00af5 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00afa 90                             nop        
00afb e86003afff                     call       0x7efc7b6cda60
00b00 0f1f8400f80b0005               nop        dword ptr [rax + rax + 0x5000bf8]
00b08 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b16 e8c57dcc17                     call       0x7efc938a54e0
00b1b f4                             hlt        
00b1c bee4ffffff                     mov        esi, 0xffffffe4
00b21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b29 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b2e 44891424                       mov        dword ptr [rsp], r10d
00b32 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00b37 44894c2404                     mov        dword ptr [rsp + 4], r9d
00b3c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b41 4489542408                     mov        dword ptr [rsp + 8], r10d
00b46 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b50 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00b55 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00b5a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00b5f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00b64 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b69 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b6e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00b73 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b78 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b7d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b82 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b87 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b8c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b91 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00b96 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b9b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ba0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00ba5 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00baa 90                             nop        
00bab e8b002afff                     call       0x7efc7b6cda60
00bb0 0f1f8400a80c0006               nop        dword ptr [rax + rax + 0x6000ca8]
00bb8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00bc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bc6 e8157dcc17                     call       0x7efc938a54e0
00bcb f4                             hlt        
00bcc bee4ffffff                     mov        esi, 0xffffffe4
00bd1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bd9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00bde 44891c24                       mov        dword ptr [rsp], r11d
00be2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00be7 4489442404                     mov        dword ptr [rsp + 4], r8d
00bec 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00bf1 44895c2408                     mov        dword ptr [rsp + 8], r11d
00bf6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bfb 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c00 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00c05 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00c0a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c0f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c14 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00c19 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c1e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c23 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c28 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00c2d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c32 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c37 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c3c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c41 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c46 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c4b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c50 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c55 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c5a 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c5f 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c64 90                             nop        
00c65 90                             nop        
00c66 90                             nop        
00c67 e8f401afff                     call       0x7efc7b6cda60
00c6c 0f1f8400640d0007               nop        dword ptr [rax + rax + 0x7000d64]
00c74 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00c7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c82 e8597ccc17                     call       0x7efc938a54e0
00c87 f4                             hlt        
00c88 4533db                         xor        r11d, r11d
00c8b 4d3bcb                         cmp        r9, r11
00c8e bdffffffff                     mov        ebp, 0xffffffff
00c93 7c08                           jl         0x7efc7bbdd89d
00c95 400f95c5                       setne      bpl
00c99 400fb6ed                       movzx      ebp, bpl
00c9d be45ffffff                     mov        esi, 0xffffff45
00ca2 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00caa 4c891c24                       mov        qword ptr [rsp], r11
00cae 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00cb2 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00cb6 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00cbe 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cc3 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00cc8 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00ccd 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00cd1 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00cd5 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00cda 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cdf 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00ce3 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00ce7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00cec 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00cf1 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00cf5 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00cf9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00cfe 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d03 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00d0a 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00d0e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d13 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d18 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00d1c 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00d20 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d25 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d2a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d2f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d34 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d3c 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d41 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d49 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d4e 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d56 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d5d 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d65 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d6d 90                             nop        
00d6e 90                             nop        
00d6f e8ec00afff                     call       0x7efc7b6cda60
00d74 0f1f84006c0e0008               nop        dword ptr [rax + rax + 0x8000e6c]
00d7c 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d8a e8517bcc17                     call       0x7efc938a54e0
00d8f f4                             hlt        
00d90 be45ffffff                     mov        esi, 0xffffff45
00d95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d9d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00da2 44891c24                       mov        dword ptr [rsp], r11d
00da6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00dab 4489542404                     mov        dword ptr [rsp + 4], r10d
00db0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00db5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dbf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dc4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00dc9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00dce 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dd3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00dd8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ddd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00de2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00de7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00dec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00df1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00df6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00dfb 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e00 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e05 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e0a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00e0f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e14 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e19 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e1e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e23 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e28 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e2d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e32 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e37 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e3c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e44 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e49 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e51 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e56 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00e5e 90                             nop        
00e5f e8fcffaeff                     call       0x7efc7b6cda60
00e64 0f1f84005c0f0009               nop        dword ptr [rax + rax + 0x9000f5c]
00e6c 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00e76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e7a e8617acc17                     call       0x7efc938a54e0
00e7f f4                             hlt        
00e80 be45ffffff                     mov        esi, 0xffffff45
00e85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e8d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e92 44891c24                       mov        dword ptr [rsp], r11d
00e96 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e9b e8c0ffaeff                     call       0x7efc7b6cda60
00ea0 0f1f8400980f000a               nop        dword ptr [rax + rax + 0xa000f98]
00ea8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00eb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eb6 e8257acc17                     call       0x7efc938a54e0
00ebb f4                             hlt        
00ebc be45ffffff                     mov        esi, 0xffffff45
00ec1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ec9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ece 44891c24                       mov        dword ptr [rsp], r11d
00ed2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ed7 4489542404                     mov        dword ptr [rsp + 4], r10d
00edc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ee1 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ee6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00eee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ef3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ef8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00efd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f02 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f07 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f0c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f11 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f16 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f1b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f20 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f25 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f2a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f2f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f34 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f39 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f3e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f43 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f48 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f4d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f52 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f57 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f5c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f61 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f66 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f6b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f70 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f75 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f7d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f82 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f8a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f8f e8ccfeaeff                     call       0x7efc7b6cda60
00f94 0f1f84008c10000b               nop        dword ptr [rax + rax + 0xb00108c]
00f9c 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
00fa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00faa e83179cc17                     call       0x7efc938a54e0
00faf f4                             hlt        
00fb0 be45ffffff                     mov        esi, 0xffffff45
00fb5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fbd 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fc2 44891424                       mov        dword ptr [rsp], r10d
00fc6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fcb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fd0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fd5 4489542408                     mov        dword ptr [rsp + 8], r10d
00fda 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fe2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fe7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ff1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ff6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ffb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01000 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01005 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0100a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0100f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01014 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01019 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0101e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01023 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01028 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0102d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01032 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01037 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0103c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01041 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01046 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0104b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01050 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01055 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0105a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0105f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01064 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01069 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01071 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01076 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0107e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01083 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
0108b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01090 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01098 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010a0 90                             nop        
010a1 90                             nop        
010a2 90                             nop        
010a3 e8b8fdaeff                     call       0x7efc7b6cda60
010a8 0f1f8400a011000c               nop        dword ptr [rax + rax + 0xc0011a0]
010b0 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
010ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
010be e81d78cc17                     call       0x7efc938a54e0
010c3 f4                             hlt        
010c4 be45ffffff                     mov        esi, 0xffffff45
010c9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010d1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
010d6 44891c24                       mov        dword ptr [rsp], r11d
010da 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
010df 4489542404                     mov        dword ptr [rsp + 4], r10d
010e4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010e9 44895c2408                     mov        dword ptr [rsp + 8], r11d
010ee 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010f6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010fb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01100 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01105 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0110a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0110f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01114 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01119 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0111e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01123 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01128 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0112d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01132 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01137 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0113c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01141 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01146 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0114b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01150 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01155 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0115a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0115f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01164 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01169 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0116e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01173 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01178 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0117d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01185 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0118a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01192 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01197 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
0119f 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
011a4 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011ac 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
011b3 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011bb e8a0fcaeff                     call       0x7efc7b6cda60
011c0 0f1f8400b812000d               nop        dword ptr [rax + rax + 0xd0012b8]
011c8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
011d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
011d6 e80577cc17                     call       0x7efc938a54e0
011db f4                             hlt        
011dc be45ffffff                     mov        esi, 0xffffff45
011e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011e9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
011ee 44891c24                       mov        dword ptr [rsp], r11d
011f2 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
011f7 44894c2404                     mov        dword ptr [rsp + 4], r9d
011fc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01201 44895c2408                     mov        dword ptr [rsp + 8], r11d
01206 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0120b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01210 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01215 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0121a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0121f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01224 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01229 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0122e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01233 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01238 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0123d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01242 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01247 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0124c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01251 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01256 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0125b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01260 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01265 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0126a 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0126f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01274 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01279 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0127e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01283 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01288 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01290 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01295 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0129d 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012a2 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012a7 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
012ae 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012b6 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
012be 90                             nop        
012bf e89cfbaeff                     call       0x7efc7b6cda60
012c4 0f1f8400bc13000e               nop        dword ptr [rax + rax + 0xe0013bc]
012cc 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
012d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
012da e80176cc17                     call       0x7efc938a54e0
012df f4                             hlt        
012e0 41bbffffff7f                   mov        r11d, 0x7fffffff
012e6 4d3bcb                         cmp        r9, r11
012e9 bdffffffff                     mov        ebp, 0xffffffff
012ee 7c08                           jl         0x7efc7bbddef8
012f0 400f95c5                       setne      bpl
012f4 400fb6ed                       movzx      ebp, bpl
012f8 be45ffffff                     mov        esi, 0xffffff45
012fd 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01305 4c891c24                       mov        qword ptr [rsp], r11
01309 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0130e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01313 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0131b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01320 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01324 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01328 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0132d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01332 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01336 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0133a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0133f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01344 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01348 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0134c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01351 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01356 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
0135a 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0135e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01366 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0136b 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0136f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01373 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01378 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0137d 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01381 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01385 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0138a 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0138f 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01397 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0139c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013a4 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
013a9 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
013b1 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
013b8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013c0 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013c8 90                             nop        
013c9 90                             nop        
013ca 90                             nop        
013cb e890faaeff                     call       0x7efc7b6cda60
013d0 0f1f8400c814000f               nop        dword ptr [rax + rax + 0xf0014c8]
013d8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
013e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
013e6 e8f574cc17                     call       0x7efc938a54e0
013eb f4                             hlt        
013ec be45ffffff                     mov        esi, 0xffffff45
013f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013f9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
013fe 44890c24                       mov        dword ptr [rsp], r9d
01402 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01407 44894c2404                     mov        dword ptr [rsp + 4], r9d
0140c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01411 44895c2408                     mov        dword ptr [rsp + 8], r11d
01416 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0141b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01420 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01425 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0142a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0142f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01434 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01439 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0143e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01443 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01448 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0144d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01452 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01457 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0145c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01461 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01466 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0146b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01470 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01475 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0147a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0147f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01484 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01489 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0148e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01493 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01498 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
014a0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
014a5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014aa 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014b2 90                             nop        
014b3 e8a8f9aeff                     call       0x7efc7b6cda60
014b8 0f1f8400b0150010               nop        dword ptr [rax + rax + 0x100015b0]
014c0 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
014ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
014ce e80d74cc17                     call       0x7efc938a54e0
014d3 f4                             hlt        
014d4 be45ffffff                     mov        esi, 0xffffff45
014d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014e1 448b542408                     mov        r10d, dword ptr [rsp + 8]
014e6 44891424                       mov        dword ptr [rsp], r10d
014ea 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014ef 4489542404                     mov        dword ptr [rsp + 4], r10d
014f4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014f9 44895c2408                     mov        dword ptr [rsp + 8], r11d
014fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01503 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01508 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0150d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01512 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01517 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0151c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01521 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01526 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0152b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01530 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01535 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0153a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0153f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01544 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01549 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0154e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01553 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01558 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0155d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01562 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01567 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0156c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01571 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01576 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0157b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01580 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01588 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0158d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01592 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01599 90                             nop        
0159a 90                             nop        
0159b e8c0f8aeff                     call       0x7efc7b6cda60
015a0 0f1f840098160011               nop        dword ptr [rax + rax + 0x11001698]
015a8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
015b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015b6 e82573cc17                     call       0x7efc938a54e0
015bb f4                             hlt        
015bc be3dffffff                     mov        esi, 0xffffff3d
015c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015c9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
015ce 44890c24                       mov        dword ptr [rsp], r9d
015d2 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
015d6 894c2404                       mov        dword ptr [rsp + 4], ecx
015da 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
015de 894c2408                       mov        dword ptr [rsp + 8], ecx
015e2 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
015e7 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
015ec 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
015f0 894c240c                       mov        dword ptr [rsp + 0xc], ecx
015f4 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
015f9 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
015fe 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01602 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01606 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0160b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01610 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01614 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01618 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0161d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01622 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01626 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0162a 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0162f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01634 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0163b 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0163f 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01644 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01649 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0164d 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01651 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01656 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0165b 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01660 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01665 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0166d 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01672 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
0167a 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
0167f 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01684 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0168c 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
01693 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0169b e8c0f7aeff                     call       0x7efc7b6cda60
016a0 0f1f840098170012               nop        dword ptr [rax + rax + 0x12001798]
016a8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
016b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016b6 e82572cc17                     call       0x7efc938a54e0
016bb f4                             hlt        
016bc be45ffffff                     mov        esi, 0xffffff45
016c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016c9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016ce 44891c24                       mov        dword ptr [rsp], r11d
016d2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016d7 44895c2404                     mov        dword ptr [rsp + 4], r11d
016dc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016e1 4489542408                     mov        dword ptr [rsp + 8], r10d
016e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016fa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016ff 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01704 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01709 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0170e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01713 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01718 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0171d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01722 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01727 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0172c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01731 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01736 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0173b 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01740 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01744 90                             nop        
01745 90                             nop        
01746 90                             nop        
01747 e814f7aeff                     call       0x7efc7b6cda60
0174c 0f1f840044180013               nop        dword ptr [rax + rax + 0x13001844]
01754 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
0175e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01762 e87971cc17                     call       0x7efc938a54e0
01767 f4                             hlt        
01768 be45ffffff                     mov        esi, 0xffffff45
0176d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01775 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0177a 44891c24                       mov        dword ptr [rsp], r11d
0177e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01783 44895c2404                     mov        dword ptr [rsp + 4], r11d
01788 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0178d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01792 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01797 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0179c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
017a1 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
017a6 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
017ab 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
017b0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
017b5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
017ba 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
017bf 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
017c4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017c9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017ce 894c2430                       mov        dword ptr [rsp + 0x30], ecx
017d2 4489542454                     mov        dword ptr [rsp + 0x54], r10d
017d7 4489442458                     mov        dword ptr [rsp + 0x58], r8d
017dc 90                             nop        
017dd 90                             nop        
017de 90                             nop        
017df e87cf6aeff                     call       0x7efc7b6cda60
017e4 0f1f8400dc180014               nop        dword ptr [rax + rax + 0x140018dc]
017ec 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
017f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fa e8e170cc17                     call       0x7efc938a54e0
017ff f4                             hlt        
01800 be45ffffff                     mov        esi, 0xffffff45
01805 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0180d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01812 44891424                       mov        dword ptr [rsp], r10d
01816 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0181b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01820 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01825 44895c2408                     mov        dword ptr [rsp + 8], r11d
0182a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01832 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01837 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0183c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01841 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01846 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0184b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01850 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01855 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0185a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0185f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01864 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01869 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0186e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01873 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01878 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0187d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01882 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01887 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0188c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01891 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01896 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0189b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
018a0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018a5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018aa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
018af 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018b4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018b9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018c1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018c6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018ce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018d3 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
018db 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
018e3 e878f5aeff                     call       0x7efc7b6cda60
018e8 0f1f8400e0190015               nop        dword ptr [rax + rax + 0x150019e0]
018f0 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
018fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018fe e8dd6fcc17                     call       0x7efc938a54e0
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
01938 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0193d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01942 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01947 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0194c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01951 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01956 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0195b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01960 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01965 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0196a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0196f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01974 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01979 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0197e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01983 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01988 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0198d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01992 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01997 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0199c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019a1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
019a6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019ab 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019b0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
019b8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
019bd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019c5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
019ca 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
019d2 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
019d9 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
019e1 90                             nop        
019e2 90                             nop        
019e3 e878f4aeff                     call       0x7efc7b6cda60
019e8 0f1f8400e01a0016               nop        dword ptr [rax + rax + 0x16001ae0]
019f0 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
019fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019fe e8dd6ecc17                     call       0x7efc938a54e0
01a03 f4                             hlt        
01a04 4585db                         test       r11d, r11d
01a07 7f08                           jg         0x7efc7bbde611
01a09 4533ed                         xor        r13d, r13d
01a0c e9aee6ffff                     jmp        0x7efc7bbdccbf
01a11 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a15 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01a1a 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a1e 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01a23 89442414                       mov        dword ptr [rsp + 0x14], eax
01a27 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01a2b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a30 48894424f8                     mov        qword ptr [rsp - 8], rax
01a35 8b0424                         mov        eax, dword ptr [rsp]
01a38 89442404                       mov        dword ptr [rsp + 4], eax
01a3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a41 48894424f8                     mov        qword ptr [rsp - 8], rax
01a46 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a4d 890424                         mov        dword ptr [rsp], eax
01a50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a55 488bee                         mov        rbp, rsi
01a58 8b542408                       mov        edx, dword ptr [rsp + 8]
01a5c 418bcb                         mov        ecx, r11d
01a5f e8fc15b5ff                     call       0x7efc7b72fc60
01a64 0f1f84005c1b0017               nop        dword ptr [rax + rax + 0x17001b5c]
01a6c 41bb40000000                   mov        r11d, 0x40
01a72 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01a77 c462a1f7e8                     shlx       r13, rax, r11
01a7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a81 8b442404                       mov        eax, dword ptr [rsp + 4]
01a85 890424                         mov        dword ptr [rsp], eax
01a88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01a92 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01a96 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01a9a 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01a9f 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01aa3 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01aa8 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01aac e90ee6ffff                     jmp        0x7efc7bbdccbf
01ab1 4585db                         test       r11d, r11d
01ab4 7f07                           jg         0x7efc7bbde6bd
01ab6 33f6                           xor        esi, esi
01ab8 e943e6ffff                     jmp        0x7efc7bbdcd00
01abd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ac2 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01ac7 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01acb 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01ad0 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01ad4 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01ad9 89442414                       mov        dword ptr [rsp + 0x14], eax
01add 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01ae1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ae6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aeb 8b0424                         mov        eax, dword ptr [rsp]
01aee 89442404                       mov        dword ptr [rsp + 4], eax
01af2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af7 48894424f8                     mov        qword ptr [rsp - 8], rax
01afc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b03 890424                         mov        dword ptr [rsp], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b13 488bf5                         mov        rsi, rbp
01b16 8b542408                       mov        edx, dword ptr [rsp + 8]
01b1a 418bcb                         mov        ecx, r11d
01b1d 90                             nop        
01b1e 90                             nop        
01b1f e83c15b5ff                     call       0x7efc7b72fc60
01b24 0f1f84001c1c0018               nop        dword ptr [rax + rax + 0x18001c1c]
01b2c 41bb80000000                   mov        r11d, 0x80
01b32 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01b37 c4e2a1f7f0                     shlx       rsi, rax, r11
01b3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b41 8b442404                       mov        eax, dword ptr [rsp + 4]
01b45 890424                         mov        dword ptr [rsp], eax
01b48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4d 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01b51 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01b55 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01b59 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01b5e 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b62 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01b67 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b6c e98fe5ffff                     jmp        0x7efc7bbdcd00
01b71 4533c0                         xor        r8d, r8d
01b74 e984eeffff                     jmp        0x7efc7bbdd5fd
01b79 bee4ffffff                     mov        esi, 0xffffffe4
01b7e 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b86 488f0424                       pop        qword ptr [rsp]
01b8a 90                             nop        
01b8b e8d0f2aeff                     call       0x7efc7b6cda60
01b90 0f1f8400881c0019               nop        dword ptr [rax + rax + 0x19001c88]
01b98 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01ba2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ba6 e8356dcc17                     call       0x7efc938a54e0
01bab f4                             hlt        
01bac be5d000000                     mov        esi, 0x5d
01bb1 90                             nop        
01bb2 90                             nop        
01bb3 e8a8f2aeff                     call       0x7efc7b6cda60
01bb8 0f1f8400b01c001a               nop        dword ptr [rax + rax + 0x1a001cb0]
01bc0 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01bca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bce e80d6dcc17                     call       0x7efc938a54e0
01bd3 f4                             hlt        
01bd4 bef6ffffff                     mov        esi, 0xfffffff6
01bd9 90                             nop        
01bda 90                             nop        
01bdb e880f2aeff                     call       0x7efc7b6cda60
01be0 0f1f8400d81c001b               nop        dword ptr [rax + rax + 0x1b001cd8]
01be8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01bf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bf6 e8e56ccc17                     call       0x7efc938a54e0
01bfb f4                             hlt        
01bfc bef6ffffff                     mov        esi, 0xfffffff6
01c01 90                             nop        
01c02 90                             nop        
01c03 e858f2aeff                     call       0x7efc7b6cda60
01c08 0f1f8400001d001c               nop        dword ptr [rax + rax + 0x1c001d00]
01c10 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01c1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c1e e8bd6ccc17                     call       0x7efc938a54e0
01c23 f4                             hlt        
01c24 be6effffff                     mov        esi, 0xffffff6e
01c29 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c31 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c36 44891424                       mov        dword ptr [rsp], r10d
01c3a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c3f 4489542408                     mov        dword ptr [rsp + 8], r10d
01c44 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c49 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c4e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c53 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c58 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c5d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c62 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c67 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c6c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01c71 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01c76 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01c7b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c80 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c85 90                             nop        
01c86 90                             nop        
01c87 e8d4f1aeff                     call       0x7efc7b6cda60
01c8c 0f1f8400841d001d               nop        dword ptr [rax + rax + 0x1d001d84]
01c94 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01c9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ca2 e8396ccc17                     call       0x7efc938a54e0
01ca7 f4                             hlt        
01ca8 bee4ffffff                     mov        esi, 0xffffffe4
01cad 48ffb42490000000               push       qword ptr [rsp + 0x90]
01cb5 488f0424                       pop        qword ptr [rsp]
01cb9 89442418                       mov        dword ptr [rsp + 0x18], eax
01cbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01cc9 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01ccd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd2 897c2428                       mov        dword ptr [rsp + 0x28], edi
01cd6 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01cda 90                             nop        
01cdb e880f1aeff                     call       0x7efc7b6cda60
01ce0 0f1f8400d81d001e               nop        dword ptr [rax + rax + 0x1e001dd8]
01ce8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01cf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cf6 e8e56bcc17                     call       0x7efc938a54e0
01cfb f4                             hlt        
01cfc bee4ffffff                     mov        esi, 0xffffffe4
01d01 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d09 488f0424                       pop        qword ptr [rsp]
01d0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d12 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d19 89442418                       mov        dword ptr [rsp + 0x18], eax
01d1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d22 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01d26 89542428                       mov        dword ptr [rsp + 0x28], edx
01d2a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01d2f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d34 90                             nop        
01d35 90                             nop        
01d36 90                             nop        
01d37 e824f1aeff                     call       0x7efc7b6cda60
01d3c 0f1f8400341e001f               nop        dword ptr [rax + rax + 0x1f001e34]
01d44 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01d4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d52 e8896bcc17                     call       0x7efc938a54e0
01d57 f4                             hlt        
01d58 bebeffffff                     mov        esi, 0xffffffbe
01d5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d65 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d6a 44891424                       mov        dword ptr [rsp], r10d
01d6e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d73 4489542408                     mov        dword ptr [rsp + 8], r10d
01d78 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d7d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d82 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d87 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d8c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d91 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d96 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01d9b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01da0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01da5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01daa 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01daf 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01db4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01db9 90                             nop        
01dba 90                             nop        
01dbb e8a0f0aeff                     call       0x7efc7b6cda60
01dc0 0f1f8400b81e0020               nop        dword ptr [rax + rax + 0x20001eb8]
01dc8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dd6 e8056bcc17                     call       0x7efc938a54e0
01ddb f4                             hlt        
01ddc beccffffff                     mov        esi, 0xffffffcc
01de1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01de9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01dee 44891424                       mov        dword ptr [rsp], r10d
01df2 89442410                       mov        dword ptr [rsp + 0x10], eax
01df6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e02 89442414                       mov        dword ptr [rsp + 0x14], eax
01e06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0b 897c2418                       mov        dword ptr [rsp + 0x18], edi
01e0f 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01e13 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01e17 e844f0aeff                     call       0x7efc7b6cda60
01e1c 0f1f8400141f0021               nop        dword ptr [rax + rax + 0x21001f14]
01e24 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01e2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e32 e8a96acc17                     call       0x7efc938a54e0
01e37 f4                             hlt        
01e38 beccffffff                     mov        esi, 0xffffffcc
01e3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e45 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e4a 44890424                       mov        dword ptr [rsp], r8d
01e4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e53 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e5a 89442410                       mov        dword ptr [rsp + 0x10], eax
01e5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e63 897c2414                       mov        dword ptr [rsp + 0x14], edi
01e67 89542418                       mov        dword ptr [rsp + 0x18], edx
01e6b 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01e70 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01e75 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01e79 90                             nop        
01e7a 90                             nop        
01e7b e8e0efaeff                     call       0x7efc7b6cda60
01e80 0f1f8400781f0022               nop        dword ptr [rax + rax + 0x22001f78]
01e88 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01e92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e96 e8456acc17                     call       0x7efc938a54e0
01e9b f4                             hlt        
01e9c be45ffffff                     mov        esi, 0xffffff45
01ea1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ea6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01eab 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01eb0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01eb5 90                             nop        
01eb6 90                             nop        
01eb7 e8a4efaeff                     call       0x7efc7b6cda60
01ebc 0f1f8400b41f0023               nop        dword ptr [rax + rax + 0x23001fb4]
01ec4 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01ece 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ed2 e8096acc17                     call       0x7efc938a54e0
01ed7 f4                             hlt        
01ed8 be45ffffff                     mov        esi, 0xffffff45
01edd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ee2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ee7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01eec 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ef1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ef6 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01efb e860efaeff                     call       0x7efc7b6cda60
01f00 0f1f8400f81f0024               nop        dword ptr [rax + rax + 0x24001ff8]
01f08 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f16 e8c569cc17                     call       0x7efc938a54e0
01f1b f4                             hlt        
01f1c bef6ffffff                     mov        esi, 0xfffffff6
01f21 90                             nop        
01f22 90                             nop        
01f23 e838efaeff                     call       0x7efc7b6cda60
01f28 0f1f840020200025               nop        dword ptr [rax + rax + 0x25002020]
01f30 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01f3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f3e e89d69cc17                     call       0x7efc938a54e0
01f43 f4                             hlt        
01f44 be5d000000                     mov        esi, 0x5d
01f49 90                             nop        
01f4a 90                             nop        
01f4b e810efaeff                     call       0x7efc7b6cda60
01f50 0f1f840048200026               nop        dword ptr [rax + rax + 0x26002048]
01f58 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01f62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f66 e87569cc17                     call       0x7efc938a54e0
01f6b f4                             hlt        
01f6c be45ffffff                     mov        esi, 0xffffff45
01f71 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f79 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f7e 44891c24                       mov        dword ptr [rsp], r11d
01f82 90                             nop        
01f83 e8d8eeaeff                     call       0x7efc7b6cda60
01f88 0f1f840080200027               nop        dword ptr [rax + rax + 0x27002080]
01f90 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01f9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9e e83d69cc17                     call       0x7efc938a54e0
01fa3 f4                             hlt        
01fa4 bef6ffffff                     mov        esi, 0xfffffff6
01fa9 418bea                         mov        ebp, r10d
01fac 90                             nop        
01fad 90                             nop        
01fae 90                             nop        
01faf e8aceeaeff                     call       0x7efc7b6cda60
01fb4 0f1f8400ac200028               nop        dword ptr [rax + rax + 0x280020ac]
01fbc 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01fc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fca e81169cc17                     call       0x7efc938a54e0
01fcf f4                             hlt        
01fd0 bef6ffffff                     mov        esi, 0xfffffff6
01fd5 418be8                         mov        ebp, r8d
01fd8 90                             nop        
01fd9 90                             nop        
01fda 90                             nop        
01fdb e880eeaeff                     call       0x7efc7b6cda60
01fe0 0f1f8400d8200029               nop        dword ptr [rax + rax + 0x290020d8]
01fe8 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
01ff2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff6 e8e568cc17                     call       0x7efc938a54e0
01ffb f4                             hlt        
01ffc bef6ffffff                     mov        esi, 0xfffffff6
02001 418bea                         mov        ebp, r10d
02004 90                             nop        
02005 90                             nop        
02006 90                             nop        
02007 e854eeaeff                     call       0x7efc7b6cda60
0200c 0f1f84000421002a               nop        dword ptr [rax + rax + 0x2a002104]
02014 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
0201e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02022 e8b968cc17                     call       0x7efc938a54e0
02027 f4                             hlt        
02028 bef6ffffff                     mov        esi, 0xfffffff6
0202d 90                             nop        
0202e 90                             nop        
0202f e82ceeaeff                     call       0x7efc7b6cda60
02034 0f1f84002c21002b               nop        dword ptr [rax + rax + 0x2b00212c]
0203c 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
02046 4883e4f0                       and        rsp, 0xfffffffffffffff0
0204a e89168cc17                     call       0x7efc938a54e0
0204f f4                             hlt        
02050 bef6ffffff                     mov        esi, 0xfffffff6
02055 90                             nop        
02056 90                             nop        
02057 e804eeaeff                     call       0x7efc7b6cda60
0205c 0f1f84005421002c               nop        dword ptr [rax + rax + 0x2c002154]
02064 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
0206e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02072 e86968cc17                     call       0x7efc938a54e0
02077 f4                             hlt        
02078 bef6ffffff                     mov        esi, 0xfffffff6
0207d 90                             nop        
0207e 90                             nop        
0207f e8dcedaeff                     call       0x7efc7b6cda60
02084 0f1f84007c21002d               nop        dword ptr [rax + rax + 0x2d00217c]
0208c 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
02096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209a e84168cc17                     call       0x7efc938a54e0
0209f f4                             hlt        
020a0 bef6ffffff                     mov        esi, 0xfffffff6
020a5 90                             nop        
020a6 90                             nop        
020a7 e8b4edaeff                     call       0x7efc7b6cda60
020ac 0f1f8400a421002e               nop        dword ptr [rax + rax + 0x2e0021a4]
020b4 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
020be 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c2 e81968cc17                     call       0x7efc938a54e0
020c7 f4                             hlt        
020c8 bef6ffffff                     mov        esi, 0xfffffff6
020cd 90                             nop        
020ce 90                             nop        
020cf e88cedaeff                     call       0x7efc7b6cda60
020d4 0f1f8400cc21002f               nop        dword ptr [rax + rax + 0x2f0021cc]
020dc 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
020e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ea e8f167cc17                     call       0x7efc938a54e0
020ef f4                             hlt        
020f0 bef6ffffff                     mov        esi, 0xfffffff6
020f5 90                             nop        
020f6 90                             nop        
020f7 e864edaeff                     call       0x7efc7b6cda60
020fc 0f1f8400f4210030               nop        dword ptr [rax + rax + 0x300021f4]
02104 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
0210e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02112 e8c967cc17                     call       0x7efc938a54e0
02117 f4                             hlt        
02118 bef6ffffff                     mov        esi, 0xfffffff6
0211d 90                             nop        
0211e 90                             nop        
0211f e83cedaeff                     call       0x7efc7b6cda60
02124 0f1f84001c220031               nop        dword ptr [rax + rax + 0x3100221c]
0212c 48bf50017854fc7e0000           movabs     rdi, 0x7efc54780150
02136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213a e8a167cc17                     call       0x7efc938a54e0
0213f f4                             hlt        
02140 eb08                           jmp        0x7efc7bbded4a
02142 eb06                           jmp        0x7efc7bbded4a
02144 eb04                           jmp        0x7efc7bbded4a
02146 eb02                           jmp        0x7efc7bbded4a
02148 eb00                           jmp        0x7efc7bbded4a
0214a 488bf0                         mov        rsi, rax
0214d e912e9ffff                     jmp        0x7efc7bbdd664
02152 49ba33d6bd7bfc7e0000           movabs     r10, 0x7efc7bbdd633
0215c 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02163 e9f835b5ff                     jmp        0x7efc7b732360
02168 e87304b4ff                     call       0x7efc7b71f1e0
0216d e9acdeffff                     jmp        0x7efc7bbdcc1e
02172 f4                             hlt        
02173 f4                             hlt        
02174 f4                             hlt        
02175 f4                             hlt        
02176 f4                             hlt        
02177 f4                             hlt        
