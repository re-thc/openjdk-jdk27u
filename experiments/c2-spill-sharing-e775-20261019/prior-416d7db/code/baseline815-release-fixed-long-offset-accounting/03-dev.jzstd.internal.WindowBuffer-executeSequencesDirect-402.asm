00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0aca9ff                   jne        0x7f897b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85570a0000                   jne        0x7f897be75715
0003e c5f96ec7                       vmovd      xmm0, edi
00042 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00047 4d8be8                         mov        r13, r8
0004a 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004e 488bde                         mov        rbx, rsi
00051 8b463c                         mov        eax, dword ptr [rsi + 0x3c]
00054 8b4e38                         mov        ecx, dword ptr [rsi + 0x38]
00057 448bd9                         mov        r11d, ecx
0005a 442bd8                         sub        r11d, eax
0005d 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00065 453bd3                         cmp        r10d, r11d
00068 0f8fae050000                   jg         0x7f897be7529c
0006e 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00072 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00077 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007b 4c638424c0000000               movsxd     r8, dword ptr [rsp + 0xc0]
00083 4c63c8                         movsxd     r9, eax
00086 4c034c2440                     add        r9, qword ptr [rsp + 0x40]
0008b 4d2bd9                         sub        r11, r9
0008e 4d3bc3                         cmp        r8, r11
00091 0f8fa9050000                   jg         0x7f897be752c0
00097 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
0009b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
000a0 4c8b5628                       mov        r10, qword ptr [rsi + 0x28]
000a4 448b5e44                       mov        r11d, dword ptr [rsi + 0x44]
000a8 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
000ad 4d85d2                         test       r10, r10
000b0 0f8516040000                   jne        0x7f897be7514c
000b6 4d03c8                         add        r9, r8
000b9 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
000be 0f8fa4050000                   jg         0x7f897be752e8
000c4 4c8bc2                         mov        r8, rdx
000c7 8b7a08                         mov        edi, dword ptr [rdx + 8]
000ca c4c1797ec1                     vmovd      r9d, xmm0
000cf 4585c9                         test       r9d, r9d
000d2 0f8ee0010000                   jle        0x7f897be74f38
000d8 c5f96ec8                       vmovd      xmm1, eax
000dc 448d5fe0                       lea        r11d, [rdi - 0x20]
000e0 894c2478                       mov        dword ptr [rsp + 0x78], ecx
000e4 448d51e0                       lea        r10d, [rcx - 0x20]
000e8 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
000ed 48f7dd                         neg        rbp
000f0 418b5508                       mov        edx, dword ptr [r13 + 8]
000f4 85d2                           test       edx, edx
000f6 0f8651030000                   jbe        0x7f897be750cd
000fc 4963c9                         movsxd     rcx, r9d
000ff 4863d2                         movsxd     rdx, edx
00102 48ffc9                         dec        rcx
00105 483bca                         cmp        rcx, rdx
00108 0f833f030000                   jae        0x7f897be750cd
0010e 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
00116 418b4608                       mov        eax, dword ptr [r14 + 8]
0011a 85c0                           test       eax, eax
0011c 0f860e040000                   jbe        0x7f897be751b0
00122 c5f97eca                       vmovd      edx, xmm1
00126 33c9                           xor        ecx, ecx
00128 4889b424c8000000               mov        qword ptr [rsp + 0xc8], rsi
00130 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00135 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0013a 4c89742458                     mov        qword ptr [rsp + 0x58], r14
0013f 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
00146 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0014e 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00156 4889ac2490000000               mov        qword ptr [rsp + 0x90], rbp
0015e 898424c0000000                 mov        dword ptr [rsp + 0xc0], eax
00165 4533db                         xor        r11d, r11d
00168 4d8b54cd10                     mov        r10, qword ptr [r13 + rcx*8 + 0x10]
0016d 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00171 4c896c2410                     mov        qword ptr [rsp + 0x10], r13
00176 4d8bc2                         mov        r8, r10
00179 49c1f824                       sar        r8, 0x24
0017d 418bc8                         mov        ecx, r8d
00180 4d8bc2                         mov        r8, r10
00183 49c1e812                       shr        r8, 0x12
00187 458bca                         mov        r9d, r10d
0018a 418bc0                         mov        eax, r8d
0018d 4181e1ffff0100                 and        r9d, 0x1ffff
00194 25ffff0300                     and        eax, 0x3ffff
00199 85c9                           test       ecx, ecx
0019b 0f8ccb050000                   jl         0x7f897be753ec
001a1 4585c9                         test       r9d, r9d
001a4 0f84c2010000                   je         0x7f897be74fec
001aa 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001ae 412beb                         sub        ebp, r11d
001b1 443bcd                         cmp        r9d, ebp
001b4 0f8fb6060000                   jg         0x7f897be754f0
001ba 83f903                         cmp        ecx, 3
001bd 0f8fb1010000                   jg         0x7f897be74ff4
001c3 4585c9                         test       r9d, r9d
001c6 0f84c4060000                   je         0x7f897be75510
001cc 83f901                         cmp        ecx, 1
001cf 0f8513050000                   jne        0x7f897be75368
001d5 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
001da 448b530c                       mov        r10d, dword ptr [rbx + 0xc]
001de 418bca                         mov        ecx, r10d
001e1 8bb424c0000000                 mov        esi, dword ptr [rsp + 0xc0]
001e8 4d63d1                         movsxd     r10, r9d
001eb 4c63c2                         movsxd     r8, edx
001ee 4c03442440                     add        r8, qword ptr [rsp + 0x40]
001f3 4d03c2                         add        r8, r10
001f6 4c63d1                         movsxd     r10, ecx
001f9 4d3bd0                         cmp        r10, r8
001fc 0f8fea050000                   jg         0x7f897be7546c
00202 85c9                           test       ecx, ecx
00204 0f8eb2040000                   jle        0x7f897be7533c
0020a 468d140a                       lea        r10d, [rdx + r9]
0020e 4403d0                         add        r10d, eax
00211 478d040b                       lea        r8d, [r11 + r9]
00215 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0021d 0f8f81010000                   jg         0x7f897be75024
00223 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
0022b 0f8fe3060000                   jg         0x7f897be75594
00231 4183f910                       cmp        r9d, 0x10
00235 0f8e59030000                   jle        0x7f897be75214
0023b be45ffffff                     mov        esi, 0xffffff45
00240 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00248 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0024d 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
00255 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0025a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0025f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00264 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0026c 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
00271 89542428                       mov        dword ptr [rsp + 0x28], edx
00275 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0027a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0027f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00284 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00289 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0028e 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00293 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00298 89442448                       mov        dword ptr [rsp + 0x48], eax
0029c 894c2460                       mov        dword ptr [rsp + 0x60], ecx
002a0 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
002a5 666690                         nop        
002a8 c5f877                         vzeroupper 
002ab e8302eb6ff                     call       0x7f897b9d7d60
002b0 0f1f8400a8030000               nop        dword ptr [rax + rax + 0x3a8]
002b8 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
002bd 4533db                         xor        r11d, r11d
002c0 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
002c4 8b4908                         mov        ecx, dword ptr [rcx + 8]
002c7 4585db                         test       r11d, r11d
002ca 0f8ccc010000                   jl         0x7f897be7511c
002d0 85c0                           test       eax, eax
002d2 0f8cc4010000                   jl         0x7f897be7511c
002d8 3b7c240c                       cmp        edi, dword ptr [rsp + 0xc]
002dc 0f82ba010000                   jb         0x7f897be7511c
002e2 428d2c10                       lea        ebp, [rax + r10]
002e6 3bcd                           cmp        ecx, ebp
002e8 0f82ae010000                   jb         0x7f897be7511c
002ee 4585d2                         test       r10d, r10d
002f1 0f8ca5010000                   jl         0x7f897be7511c
002f7 4585d2                         test       r10d, r10d
002fa 743d                           je         0x7f897be74fb9
002fc 4b8d7c180c                     lea        rdi, [r8 + r11 + 0xc]
00301 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00306 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
0030b 498d74010c                     lea        rsi, [r9 + rax + 0xc]
00310 4963d2                         movsxd     rdx, r10d
00313 4883fa20                       cmp        rdx, 0x20
00317 7739                           ja         0x7f897be74fd2
00319 4d63d2                         movsxd     r10, r10d
0031c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00323 c442a8f5db                     bzhi       r11, r11, r10
00328 c4c1fb92fb                     kmovq      k7, r11
0032d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00333 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00339 896b3c                         mov        dword ptr [rbx + 0x3c], ebp
0033c c5f877                         vzeroupper 
0033f 4881c4b0000000                 add        rsp, 0xb0
00346 5d                             pop        rbp
00347 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0034b 0f872e070000                   ja         0x7f897be756ff
00351 c3                             ret        
00352 c5f877                         vzeroupper 
00355 49ba209f8f7b897f0000           movabs     r10, 0x7f897b8f9f20
0035f 41ffd2                         call       r10
00362 0f1f840000000000               nop        dword ptr [rax + rax]
0036a ebcd                           jmp        0x7f897be74fb9
0036c 4533c9                         xor        r9d, r9d
0036f e946feffff                     jmp        0x7f897be74e3a
00374 83c1fd                         add        ecx, -3
00377 8bb424c0000000                 mov        esi, dword ptr [rsp + 0xc0]
0037e 83fe02                         cmp        esi, 2
00381 0f8619060000                   jbe        0x7f897be75620
00387 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
0038c 448b5310                       mov        r10d, dword ptr [rbx + 0x10]
00390 44895314                       mov        dword ptr [rbx + 0x14], r10d
00394 448b430c                       mov        r8d, dword ptr [rbx + 0xc]
00398 44894310                       mov        dword ptr [rbx + 0x10], r8d
0039c 894b0c                         mov        dword ptr [rbx + 0xc], ecx
0039f e944feffff                     jmp        0x7f897be74e68
003a4 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
003ac 448bd1                         mov        r10d, ecx
003af 458be9                         mov        r13d, r9d
003b2 89b424c0000000                 mov        dword ptr [rsp + 0xc0], esi
003b9 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
003be 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
003c3 4d8bc1                         mov        r8, r9
003c6 418beb                         mov        ebp, r11d
003c9 498bf0                         mov        rsi, r8
003cc 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
003d0 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
003d5 418bfd                         mov        edi, r13d
003d8 44891424                       mov        dword ptr [rsp], r10d
003dc 89442408                       mov        dword ptr [rsp + 8], eax
003e0 4889742438                     mov        qword ptr [rsp + 0x38], rsi
003e5 897c246c                       mov        dword ptr [rsp + 0x6c], edi
003e9 458bcb                         mov        r9d, r11d
003ec c5f877                         vzeroupper 
003ef e8ecb7a9ff                     call       0x7f897b910860
003f4 0f1f8400ec040001               nop        dword ptr [rax + rax + 0x10004ec]
003fc 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00400 ffc1                           inc        ecx
00402 3b4c2428                       cmp        ecx, dword ptr [rsp + 0x28]
00406 7d17                           jge        0x7f897be7509f
00408 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00410 8bd0                           mov        edx, eax
00412 4c8b6c2410                     mov        r13, qword ptr [rsp + 0x10]
00417 458bda                         mov        r11d, r10d
0041a e949fdffff                     jmp        0x7f897be74de8
0041f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00424 442b9424c4000000               sub        r10d, dword ptr [rsp + 0xc4]
0042c 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00434 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00439 8bbc2480000000                 mov        edi, dword ptr [rsp + 0x80]
00440 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00448 e973feffff                     jmp        0x7f897be74f40
0044d be6effffff                     mov        esi, 0xffffff6e
00452 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0045a 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0045f 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
00464 89442430                       mov        dword ptr [rsp + 0x30], eax
00468 48ff742440                     push       qword ptr [rsp + 0x40]
0046d 488f442438                     pop        qword ptr [rsp + 0x38]
00472 48ff742448                     push       qword ptr [rsp + 0x48]
00477 488f442440                     pop        qword ptr [rsp + 0x40]
0047c 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00481 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00486 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0048b 90                             nop        
0048c c5f877                         vzeroupper 
0048f e84c2cb6ff                     call       0x7f897b9d7d60
00494 0f1f84008c050002               nop        dword ptr [rax + rax + 0x200058c]
0049c beccffffff                     mov        esi, 0xffffffcc
004a1 488beb                         mov        rbp, rbx
004a4 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
004ac 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
004b1 89442414                       mov        dword ptr [rsp + 0x14], eax
004b5 4489542418                     mov        dword ptr [rsp + 0x18], r10d
004ba 6690                           nop        
004bc c5f877                         vzeroupper 
004bf e81c2cb6ff                     call       0x7f897b9d7d60
004c4 0f1f8400bc050003               nop        dword ptr [rax + rax + 0x30005bc]
004cc 4533db                         xor        r11d, r11d
004cf 4d3bd3                         cmp        r10, r11
004d2 bdffffffff                     mov        ebp, 0xffffffff
004d7 7c08                           jl         0x7f897be75161
004d9 400f95c5                       setne      bpl
004dd 400fb6ed                       movzx      ebp, bpl
004e1 be45ffffff                     mov        esi, 0xffffff45
004e6 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
004ee 4889542410                     mov        qword ptr [rsp + 0x10], rdx
004f3 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
004f8 897c2428                       mov        dword ptr [rsp + 0x28], edi
004fc 89442430                       mov        dword ptr [rsp + 0x30], eax
00500 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00504 48ff742440                     push       qword ptr [rsp + 0x40]
00509 488f442438                     pop        qword ptr [rsp + 0x38]
0050e 48ff742448                     push       qword ptr [rsp + 0x48]
00513 488f442440                     pop        qword ptr [rsp + 0x40]
00518 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0051d 666690                         nop        
00520 c5f877                         vzeroupper 
00523 e8b82bb6ff                     call       0x7f897b9d7d60
00528 0f1f840020060004               nop        dword ptr [rax + rax + 0x4000620]
00530 bebeffffff                     mov        esi, 0xffffffbe
00535 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0053d 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
00545 4c896c2410                     mov        qword ptr [rsp + 0x10], r13
0054a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0054f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00554 4c89742428                     mov        qword ptr [rsp + 0x28], r14
00559 c5fa114c2430                   vmovss     dword ptr [rsp + 0x30], xmm1
0055f 48ff742440                     push       qword ptr [rsp + 0x40]
00564 488f442438                     pop        qword ptr [rsp + 0x38]
00569 48ff742448                     push       qword ptr [rsp + 0x48]
0056e 488f442440                     pop        qword ptr [rsp + 0x40]
00573 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00578 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0057d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00582 6690                           nop        
00584 c5f877                         vzeroupper 
00587 e8542bb6ff                     call       0x7f897b9d7d60
0058c 0f1f840084060005               nop        dword ptr [rax + rax + 0x5000684]
00594 be45ffffff                     mov        esi, 0xffffff45
00599 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
005a1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005a6 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
005ae 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
005b3 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
005bb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
005c0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
005c5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
005ca 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
005d2 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
005d7 89542428                       mov        dword ptr [rsp + 0x28], edx
005db 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
005e0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
005e5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005ea 4c89542440                     mov        qword ptr [rsp + 0x40], r10
005ef 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
005f4 4489442434                     mov        dword ptr [rsp + 0x34], r8d
005f9 89442448                       mov        dword ptr [rsp + 0x48], eax
005fd 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00602 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
00607 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0060b 90                             nop        
0060c c5f877                         vzeroupper 
0060f e8cc2ab6ff                     call       0x7f897b9d7d60
00614 0f1f84000c070006               nop        dword ptr [rax + rax + 0x600070c]
0061c be45ffffff                     mov        esi, 0xffffff45
00621 8bac24c0000000                 mov        ebp, dword ptr [rsp + 0xc0]
00628 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00630 c5f877                         vzeroupper 
00633 e8a82ab6ff                     call       0x7f897b9d7d60
00638 0f1f840030070007               nop        dword ptr [rax + rax + 0x7000730]
00640 4d3bc3                         cmp        r8, r11
00643 bdffffffff                     mov        ebp, 0xffffffff
00648 7c08                           jl         0x7f897be752d2
0064a 400f95c5                       setne      bpl
0064e 400fb6ed                       movzx      ebp, bpl
00652 be45ffffff                     mov        esi, 0xffffff45
00657 90                             nop        
00658 c5f877                         vzeroupper 
0065b e8802ab6ff                     call       0x7f897b9d7d60
00660 0f1f840058070008               nop        dword ptr [rax + rax + 0x8000758]
00668 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0066d 4d3bca                         cmp        r9, r10
00670 bdffffffff                     mov        ebp, 0xffffffff
00675 7c08                           jl         0x7f897be752ff
00677 400f95c5                       setne      bpl
0067b 400fb6ed                       movzx      ebp, bpl
0067f be45ffffff                     mov        esi, 0xffffff45
00684 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0068c 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00691 4c896c2418                     mov        qword ptr [rsp + 0x18], r13
00696 897c2428                       mov        dword ptr [rsp + 0x28], edi
0069a 89442430                       mov        dword ptr [rsp + 0x30], eax
0069e 894c2434                       mov        dword ptr [rsp + 0x34], ecx
006a2 48ff742440                     push       qword ptr [rsp + 0x40]
006a7 488f442438                     pop        qword ptr [rsp + 0x38]
006ac c5f877                         vzeroupper 
006af e82c2ab6ff                     call       0x7f897b9d7d60
006b4 0f1f8400ac070009               nop        dword ptr [rax + rax + 0x90007ac]
006bc be45ffffff                     mov        esi, 0xffffff45
006c1 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
006c9 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
006d1 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
006d8 c5f877                         vzeroupper 
006db e8002ab6ff                     call       0x7f897b9d7d60
006e0 0f1f8400d807000a               nop        dword ptr [rax + rax + 0xa0007d8]
006e8 ffc9                           dec        ecx
006ea be45ffffff                     mov        esi, 0xffffff45
006ef 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
006f7 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
006fc 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
00704 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00709 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0070e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00713 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0071b 89542428                       mov        dword ptr [rsp + 0x28], edx
0071f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00724 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00729 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0072e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00733 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00738 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
0073d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00742 89442448                       mov        dword ptr [rsp + 0x48], eax
00746 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0074b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00750 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00754 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
00759 666690                         nop        
0075c c5f877                         vzeroupper 
0075f e87c29b6ff                     call       0x7f897b9d7d60
00764 0f1f84005c08000b               nop        dword ptr [rax + rax + 0xb00085c]
0076c be45ffffff                     mov        esi, 0xffffff45
00771 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00779 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0077e 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00786 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0078b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00790 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00795 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0079d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
007a2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
007a7 89542428                       mov        dword ptr [rsp + 0x28], edx
007ab 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
007b0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
007b5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
007ba 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
007bf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
007c4 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
007c9 4489542434                     mov        dword ptr [rsp + 0x34], r10d
007ce 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
007d3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
007d7 894c2450                       mov        dword ptr [rsp + 0x50], ecx
007db 90                             nop        
007dc c5f877                         vzeroupper 
007df e8fc28b6ff                     call       0x7f897b9d7d60
007e4 0f1f8400dc08000c               nop        dword ptr [rax + rax + 0xc0008dc]
007ec 4d3bd0                         cmp        r10, r8
007ef bdffffffff                     mov        ebp, 0xffffffff
007f4 7c08                           jl         0x7f897be7547e
007f6 400f95c5                       setne      bpl
007fa 400fb6ed                       movzx      ebp, bpl
007fe be45ffffff                     mov        esi, 0xffffff45
00803 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0080b 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00813 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00818 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00820 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00825 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0082a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0082f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00834 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00839 89542430                       mov        dword ptr [rsp + 0x30], edx
0083d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00842 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00847 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0084c 89442450                       mov        dword ptr [rsp + 0x50], eax
00850 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
00855 894c2468                       mov        dword ptr [rsp + 0x68], ecx
00859 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0085e 6690                           nop        
00860 c5f877                         vzeroupper 
00863 e87828b6ff                     call       0x7f897b9d7d60
00868 0f1f84006009000d               nop        dword ptr [rax + rax + 0xd000960]
00870 be45ffffff                     mov        esi, 0xffffff45
00875 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0087d 666690                         nop        
00880 c5f877                         vzeroupper 
00883 e85828b6ff                     call       0x7f897b9d7d60
00888 0f1f84008009000e               nop        dword ptr [rax + rax + 0xe000980]
00890 ffc9                           dec        ecx
00892 be45ffffff                     mov        esi, 0xffffff45
00897 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
0089f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
008a4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
008ac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008b1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
008b6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008bb 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
008c3 89542428                       mov        dword ptr [rsp + 0x28], edx
008c7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008cc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
008d1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
008d6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
008db 4c89542440                     mov        qword ptr [rsp + 0x40], r10
008e0 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
008e5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
008ea 89442448                       mov        dword ptr [rsp + 0x48], eax
008ee 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
008f3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008f8 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
008fc 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
00901 666690                         nop        
00904 c5f877                         vzeroupper 
00907 e8d427b6ff                     call       0x7f897b9d7d60
0090c 0f1f8400040a000f               nop        dword ptr [rax + rax + 0xf000a04]
00914 be45ffffff                     mov        esi, 0xffffff45
00919 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00921 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00926 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0092e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00933 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00938 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0093d 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00945 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
0094a 89542428                       mov        dword ptr [rsp + 0x28], edx
0094e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00953 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00958 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0095d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00962 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00967 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
0096c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00971 89442448                       mov        dword ptr [rsp + 0x48], eax
00975 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0097a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00982 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00987 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0098b 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00990 c5f877                         vzeroupper 
00993 e84827b6ff                     call       0x7f897b9d7d60
00998 0f1f8400900a0010               nop        dword ptr [rax + rax + 0x10000a90]
009a0 bee4ffffff                     mov        esi, 0xffffffe4
009a5 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
009ad 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
009b2 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
009ba 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
009bf 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
009c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009d1 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
009d6 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
009de 89542428                       mov        dword ptr [rsp + 0x28], edx
009e2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
009e7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
009ec 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009f1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
009f6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009fb 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00a00 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a05 89442448                       mov        dword ptr [rsp + 0x48], eax
00a09 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00a0d 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
00a12 6690                           nop        
00a14 c5f877                         vzeroupper 
00a17 e8c426b6ff                     call       0x7f897b9d7d60
00a1c 0f1f8400140b0011               nop        dword ptr [rax + rax + 0x11000b14]
00a24 bef6ffffff                     mov        esi, 0xfffffff6
00a29 666690                         nop        
00a2c c5f877                         vzeroupper 
00a2f e8ac26b6ff                     call       0x7f897b9d7d60
00a34 0f1f84002c0b0012               nop        dword ptr [rax + rax + 0x12000b2c]
00a3c bef6ffffff                     mov        esi, 0xfffffff6
00a41 498be8                         mov        rbp, r8
00a44 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00a4c 898424c4000000                 mov        dword ptr [rsp + 0xc4], eax
00a53 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a5b 90                             nop        
00a5c c5f877                         vzeroupper 
00a5f e87c26b6ff                     call       0x7f897b9d7d60
00a64 0f1f84005c0b0013               nop        dword ptr [rax + rax + 0x13000b5c]
00a6c 488bf0                         mov        rsi, rax
00a6f c5f877                         vzeroupper 
00a72 4881c4b0000000                 add        rsp, 0xb0
00a79 5d                             pop        rbp
00a7a e96149b6ff                     jmp        0x7f897b9da060
00a7f 49bac74fe77b897f0000           movabs     r10, 0x7f897be74fc7
00a89 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00a90 e9cbd7a9ff                     jmp        0x7f897b912ee0
00a95 e886a3a8ff                     call       0x7f897b8ffaa0
00a9a e99ff5ffff                     jmp        0x7f897be74cbe
00a9f f4                             hlt        
