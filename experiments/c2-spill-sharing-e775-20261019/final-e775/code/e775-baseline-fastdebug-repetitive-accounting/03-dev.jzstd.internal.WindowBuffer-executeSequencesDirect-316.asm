00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854019b6ff                   jne        0x7fcbcf72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8590200000                   jne        0x7fcbcfbcf4ce
0003e 4c894c2438                     mov        qword ptr [rsp + 0x38], r9
00043 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00047 498be8                         mov        rbp, r8
0004a 8bcf                           mov        ecx, edi
0004c 488bde                         mov        rbx, rsi
0004f 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00052 448b5604                       mov        r10d, dword ptr [rsi + 4]
00056 458bda                         mov        r11d, r10d
00059 442bd8                         sub        r11d, eax
0005c 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00064 453bcb                         cmp        r9d, r11d
00067 0f8f19130000                   jg         0x7fcbcfbce786
0006d 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00071 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00076 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
0007a 4c639c24c0000000               movsxd     r11, dword ptr [rsp + 0xc0]
00082 4c63c0                         movsxd     r8, eax
00085 4c03442440                     add        r8, qword ptr [rsp + 0x40]
0008a 492bf8                         sub        rdi, r8
0008d 4c3bdf                         cmp        r11, rdi
00090 0f8ff0120000                   jg         0x7fcbcfbce786
00096 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009a 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f8439100000                   je         0x7fcbcfbce4e0
000a7 33ff                           xor        edi, edi
000a9 4c8bc2                         mov        r8, rdx
000ac 8b7204                         mov        esi, dword ptr [rdx + 4]
000af 8b5340                         mov        edx, dword ptr [rbx + 0x40]
000b2 85c9                           test       ecx, ecx
000b4 0f8ea4000000                   jle        0x7fcbcfbcd55e
000ba 89442410                       mov        dword ptr [rsp + 0x10], eax
000be 4c2b6c2440                     sub        r13, qword ptr [rsp + 0x40]
000c3 8d46e0                         lea        eax, [rsi - 0x20]
000c6 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000cb 458d5ae0                       lea        r11d, [r10 - 0x20]
000cf 448b5504                       mov        r10d, dword ptr [rbp + 4]
000d3 4585d2                         test       r10d, r10d
000d6 0f8610140000                   jbe        0x7fcbcfbce8ec
000dc 4d63d2                         movsxd     r10, r10d
000df 4c63c9                         movsxd     r9, ecx
000e2 49ffc9                         dec        r9
000e5 4d3bca                         cmp        r9, r10
000e8 0f83fe130000                   jae        0x7fcbcfbce8ec
000ee 4c8bd2                         mov        r10, rdx
000f1 4c3b25600fd018                 cmp        r12, qword ptr [rip + 0x18d00f60]
000f8 0f8414000000                   je         0x7fcbcfbcd512
000fe 48bf28129ae6cb7f0000           movabs     rdi, 0x7fcbe69a1228
00108 4883e4f0                       and        rsp, 0xfffffffffffffff0
0010c e80ff70c18                     call       0x7fcbe7c9cc20
00111 f4                             hlt        
00112 4533c9                         xor        r9d, r9d
00115 48895c2468                     mov        qword ptr [rsp + 0x68], rbx
0011a 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0011f 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00123 4c89b42480000000               mov        qword ptr [rsp + 0x80], r14
0012b 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
00133 897c2454                       mov        dword ptr [rsp + 0x54], edi
00137 89742458                       mov        dword ptr [rsp + 0x58], esi
0013b 8954247c                       mov        dword ptr [rsp + 0x7c], edx
0013f 89842490000000                 mov        dword ptr [rsp + 0x90], eax
00146 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0014e 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00156 4533d2                         xor        r10d, r10d
00159 e9c20c0000                     jmp        0x7fcbcfbce220
0015e 85d2                           test       edx, edx
00160 0f843a130000                   je         0x7fcbcfbce8a0
00166 4c8bca                         mov        r9, rdx
00169 4533db                         xor        r11d, r11d
0016c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00171 85c0                           test       eax, eax
00173 0f8ccf120000                   jl         0x7fcbcfbce848
00179 3b742430                       cmp        esi, dword ptr [rsp + 0x30]
0017d 0f82c9120000                   jb         0x7fcbcfbce84c
00183 428d2c10                       lea        ebp, [rax + r10]
00187 418b4904                       mov        ecx, dword ptr [r9 + 4]
0018b 3bcd                           cmp        ecx, ebp
0018d 0f82bd120000                   jb         0x7fcbcfbce850
00193 4585d2                         test       r10d, r10d
00196 0f8cb8120000                   jl         0x7fcbcfbce854
0019c 4585d2                         test       r10d, r10d
0019f 7433                           je         0x7fcbcfbcd5d4
001a1 498d740108                     lea        rsi, [r9 + rax + 8]
001a6 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
001ab 4963d2                         movsxd     rdx, r10d
001ae 4883fa20                       cmp        rdx, 0x20
001b2 7739                           ja         0x7fcbcfbcd5ed
001b4 4d63d2                         movsxd     r10, r10d
001b7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001be c442a8f5db                     bzhi       r11, r11, r10
001c3 c4c1fb92fb                     kmovq      k7, r11
001c8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001ce 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
001d4 896b38                         mov        dword ptr [rbx + 0x38], ebp
001d7 c5f877                         vzeroupper 
001da 4881c4b0000000                 add        rsp, 0xb0
001e1 5d                             pop        rbp
001e2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001e6 0f87cc1e0000                   ja         0x7fcbcfbcf4b8
001ec c3                             ret        
001ed c5f877                         vzeroupper 
001f0 49ba409171cfcb7f0000           movabs     r10, 0x7fcbcf719140
001fa 41ffd2                         call       r10
001fd 0f1f840000000000               nop        dword ptr [rax + rax]
00205 ebcd                           jmp        0x7fcbcfbcd5d4
00207 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0020c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00214 458b4304                       mov        r8d, dword ptr [r11 + 4]
00218 83c3fd                         add        ebx, -3
0021b 4183f802                       cmp        r8d, 2
0021f 0f86db110000                   jbe        0x7fcbcfbce800
00225 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00229 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00231 45895810                       mov        dword ptr [r8 + 0x10], r11d
00235 458b4008                       mov        r8d, dword ptr [r8 + 8]
00239 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00241 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00245 41895b08                       mov        dword ptr [r11 + 8], ebx
00249 895c2448                       mov        dword ptr [rsp + 0x48], ebx
0024d e9aa000000                     jmp        0x7fcbcfbcd6fc
00252 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00257 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0025f 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00263 3bd9                           cmp        ebx, ecx
00265 0f8305130000                   jae        0x7fcbcfbce970
0026b 418b6c9b08                     mov        ebp, dword ptr [r11 + rbx*4 + 8]
00270 85db                           test       ebx, ebx
00272 7e5f                           jle        0x7fcbcfbcd6d3
00274 85c9                           test       ecx, ecx
00276 0f86ac130000                   jbe        0x7fcbcfbcea28
0027c 4c63c9                         movsxd     r9, ecx
0027f 4c63db                         movsxd     r11, ebx
00282 49ffcb                         dec        r11
00285 4d3bd9                         cmp        r11, r9
00288 0f839a130000                   jae        0x7fcbcfbcea28
0028e 83f901                         cmp        ecx, 1
00291 0f8691130000                   jbe        0x7fcbcfbcea28
00297 448d43ff                       lea        r8d, [rbx - 1]
0029b 4d63d8                         movsxd     r11, r8d
0029e 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
002a6 418bf8                         mov        edi, r8d
002a9 83c7cc                         add        edi, -0x34
002ac c1ef02                         shr        edi, 2
002af 448d441fff                     lea        r8d, [rdi + rbx - 1]
002b4 ba04000000                     mov        edx, 4
002b9 c442e8f5c0                     bzhi       r8, r8, rdx
002be 4d2bd8                         sub        r11, r8
002c1 4533c0                         xor        r8d, r8d
002c4 4d85db                         test       r11, r11
002c7 4d0f4cd8                       cmovl      r11, r8
002cb 458bc3                         mov        r8d, r11d
002ce e9330c0000                     jmp        0x7fcbcfbce306
002d3 85c9                           test       ecx, ecx
002d5 0f8609130000                   jbe        0x7fcbcfbce9e4
002db 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
002e3 896908                         mov        dword ptr [rcx + 8], ebp
002e6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002eb 896c2448                       mov        dword ptr [rsp + 0x48], ebp
002ef 48898c24c8000000               mov        qword ptr [rsp + 0xc8], rcx
002f7 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
002fc 48634c2448                     movsxd     rcx, dword ptr [rsp + 0x48]
00301 4c635c2410                     movsxd     r11, dword ptr [rsp + 0x10]
00306 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
0030b 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00310 44034c2434                     add        r9d, dword ptr [rsp + 0x34]
00315 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0031a 4863542434                     movsxd     rdx, dword ptr [rsp + 0x34]
0031f 4c03da                         add        r11, rdx
00322 458be9                         mov        r13d, r9d
00325 442b6c2448                     sub        r13d, dword ptr [rsp + 0x48]
0032a 493bcb                         cmp        rcx, r11
0032d 7f18                           jg         0x7fcbcfbcd747
0032f 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
00334 4585c0                         test       r8d, r8d
00337 0f84e30e0000                   je         0x7fcbcfbce620
0033d 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00342 4533c9                         xor        r9d, r9d
00345 eb10                           jmp        0x7fcbcfbcd757
00347 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
0034c 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00351 41b901000000                   mov        r9d, 1
00357 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0035c 4585c0                         test       r8d, r8d
0035f 0f8e17100000                   jle        0x7fcbcfbce77c
00365 4585c9                         test       r9d, r9d
00368 0f85230d0000                   jne        0x7fcbcfbce491
0036e 458bda                         mov        r11d, r10d
00371 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
00376 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0037b 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
00380 4403442428                     add        r8d, dword ptr [rsp + 0x28]
00385 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
0038d 0f8f1f0a0000                   jg         0x7fcbcfbce1b2
00393 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0039b 0f8f110a0000                   jg         0x7fcbcfbce1b2
003a1 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
003a5 83c5f1                         add        ebp, -0xf
003a8 49c7c600000080                 mov        r14, 0xffffffff80000000
003af 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
003b4 4183fb10                       cmp        r11d, 0x10
003b8 0f8ea1010000                   jle        0x7fcbcfbcd95f
003be 4183fb30                       cmp        r11d, 0x30
003c2 0f8e89000000                   jle        0x7fcbcfbcd851
003c8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
003cd 458b5b04                       mov        r11d, dword ptr [r11 + 4]
003d1 4585d2                         test       r10d, r10d
003d4 0f8cba160000                   jl         0x7fcbcfbcee94
003da 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
003df 4585c9                         test       r9d, r9d
003e2 0f8cac160000                   jl         0x7fcbcfbcee94
003e8 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
003ed 443b442414                     cmp        r8d, dword ptr [rsp + 0x14]
003f2 0f829c160000                   jb         0x7fcbcfbcee94
003f8 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
003fd 0f8291160000                   jb         0x7fcbcfbcee94
00403 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00408 4585c0                         test       r8d, r8d
0040b 0f8407020000                   je         0x7fcbcfbcda18
00411 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00416 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
0041b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00420 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00425 4b8d740808                     lea        rsi, [r8 + r9 + 8]
0042a 4883fa20                       cmp        rdx, 0x20
0042e 0f86bf010000                   jbe        0x7fcbcfbcd9f3
00434 c5f877                         vzeroupper 
00437 49ba409171cfcb7f0000           movabs     r10, 0x7fcbcf719140
00441 41ffd2                         call       r10
00444 0f1f840000000000               nop        dword ptr [rax + rax]
0044c e9c7010000                     jmp        0x7fcbcfbcda18
00451 85ed                           test       ebp, ebp
00453 0f8cf3150000                   jl         0x7fcbcfbcee4c
00459 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
0045e 418d68f1                       lea        ebp, [r8 - 0xf]
00462 443bd5                         cmp        r10d, ebp
00465 0f839d140000                   jae        0x7fcbcfbced08
0046b 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00470 418b5904                       mov        ebx, dword ptr [r9 + 4]
00474 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00479 8d6bf1                         lea        ebp, [rbx - 0xf]
0047c 4963ca                         movsxd     rcx, r10d
0047f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00484 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
0048b 85ed                           test       ebp, ebp
0048d 0f8c5d160000                   jl         0x7fcbcfbceef0
00493 448d5bf1                       lea        r11d, [rbx - 0xf]
00497 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0049c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
004a1 453bd3                         cmp        r10d, r11d
004a4 0f83a6140000                   jae        0x7fcbcfbced50
004aa 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
004af 458d5910                       lea        r11d, [r9 + 0x10]
004b3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
004b8 4963f9                         movsxd     rdi, r9d
004bb 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
004c0 c4c17a7f443a08                 vmovdqu    xmmword ptr [r10 + rdi + 8], xmm0
004c7 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
004cc 0f8d74030000                   jge        0x7fcbcfbcdc46
004d2 482bcf                         sub        rcx, rdi
004d5 4963d0                         movsxd     rdx, r8d
004d8 4883c2f1                       add        rdx, -0xf
004dc 4d63db                         movsxd     r11, r11d
004df 4d8d140b                       lea        r10, [r11 + rcx]
004e3 4c3bd2                         cmp        r10, rdx
004e6 0f8398160000                   jae        0x7fcbcfbcef84
004ec 48637c2428                     movsxd     rdi, dword ptr [rsp + 0x28]
004f1 4c8bd7                         mov        r10, rdi
004f4 4d2bd3                         sub        r10, r11
004f7 4983c20f                       add        r10, 0xf
004fb 4983e2f0                       and        r10, 0xfffffffffffffff0
004ff 458bda                         mov        r11d, r10d
00502 478d540b10                     lea        r10d, [r11 + r9 + 0x10]
00507 4d63da                         movsxd     r11, r10d
0050a 4d8d540bf0                     lea        r10, [r11 + rcx - 0x10]
0050f 4c3bd2                         cmp        r10, rdx
00512 0f836c160000                   jae        0x7fcbcfbcef84
00518 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0051d 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00522 0f835c160000                   jae        0x7fcbcfbcef84
00528 4c63d3                         movsxd     r10, ebx
0052b 4983c3f0                       add        r11, -0x10
0052f 4983c2f1                       add        r10, -0xf
00533 4d3bda                         cmp        r11, r10
00536 0f8348160000                   jae        0x7fcbcfbcef84
0053c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00541 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00548 0f8f66160000                   jg         0x7fcbcfbcefb4
0054e 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
00553 452bd1                         sub        r10d, r9d
00556 4183c120                       add        r9d, 0x20
0055a e9d2000000                     jmp        0x7fcbcfbcda31
0055f 85ed                           test       ebp, ebp
00561 0f8ced110000                   jl         0x7fcbcfbceb54
00567 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
0056b 83c5f1                         add        ebp, -0xf
0056e 443bd5                         cmp        r10d, ebp
00571 0f8350110000                   jae        0x7fcbcfbceac7
00577 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0057c 458b4304                       mov        r8d, dword ptr [r11 + 4]
00580 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00585 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0058a 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0058f c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00596 418d68f1                       lea        ebp, [r8 - 0xf]
0059a 85ed                           test       ebp, ebp
0059c 0f8cf6110000                   jl         0x7fcbcfbceb98
005a2 4183c0f1                       add        r8d, -0xf
005a6 4489442428                     mov        dword ptr [rsp + 0x28], r8d
005ab 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
005b0 453bd8                         cmp        r11d, r8d
005b3 0f8353110000                   jae        0x7fcbcfbceb0c
005b9 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
005be 4403542424                     add        r10d, dword ptr [rsp + 0x24]
005c3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
005c8 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
005cd c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
005d4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
005d9 4503d3                         add        r10d, r11d
005dc 458bda                         mov        r11d, r10d
005df 442b5c2448                     sub        r11d, dword ptr [rsp + 0x48]
005e4 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
005e9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
005ee e971020000                     jmp        0x7fcbcfbcdc64
005f3 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
005f8 4d63d2                         movsxd     r10, r10d
005fb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00602 c442a8f5db                     bzhi       r11, r11, r10
00607 c4c1fb92fb                     kmovq      k7, r11
0060c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00612 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00618 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0061d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00622 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00627 e938020000                     jmp        0x7fcbcfbcdc64
0062c 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00631 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00636 458bc2                         mov        r8d, r10d
00639 4403442418                     add        r8d, dword ptr [rsp + 0x18]
0063e 488b5c2470                     mov        rbx, qword ptr [rsp + 0x70]
00643 c4a17a6f440308                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 8]
0064a 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0064f c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00656 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0065b 4183c310                       add        r11d, 0x10
0065f 453bd9                         cmp        r11d, r9d
00662 7cc8                           jl         0x7fcbcfbcda2c
00664 4881c710ffffff                 add        rdi, -0xf0
0066b 4881ff00000080                 cmp        rdi, -0x80000000
00672 490f4cfe                       cmovl      rdi, r14
00676 448bcf                         mov        r9d, edi
00679 453bd9                         cmp        r11d, r9d
0067c 0f8d79010000                   jge        0x7fcbcfbcdbfb
00682 4d63c3                         movsxd     r8, r11d
00685 4c03c1                         add        r8, rcx
00688 4c3bc2                         cmp        r8, rdx
0068b 0f8353150000                   jae        0x7fcbcfbcefe4
00691 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00696 4181c000010000                 add        r8d, 0x100
0069d 4963d8                         movsxd     rbx, r8d
006a0 4803d9                         add        rbx, rcx
006a3 483bda                         cmp        rbx, rdx
006a6 0f834c150000                   jae        0x7fcbcfbceff8
006ac 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
006b1 0f8355150000                   jae        0x7fcbcfbcf00c
006b7 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
006bc 0f835e150000                   jae        0x7fcbcfbcf020
006c2 90                             nop        
006c3 90                             nop        
006c4 90                             nop        
006c5 90                             nop        
006c6 90                             nop        
006c7 90                             nop        
006c8 90                             nop        
006c9 90                             nop        
006ca 90                             nop        
006cb 90                             nop        
006cc 90                             nop        
006cd 90                             nop        
006ce 90                             nop        
006cf 90                             nop        
006d0 458bc3                         mov        r8d, r11d
006d3 4963f8                         movsxd     rdi, r8d
006d6 458bc3                         mov        r8d, r11d
006d9 438d2c1a                       lea        ebp, [r10 + r11]
006dd 8bdd                           mov        ebx, ebp
006df 488b742470                     mov        rsi, qword ptr [rsp + 0x70]
006e4 c5fa6f442e08                   vmovdqu    xmm0, xmmword ptr [rsi + rbp + 8]
006ea 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
006ee c4a17a7f440508                 vmovdqu    xmmword ptr [rbp + r8 + 8], xmm0
006f5 4c63c3                         movsxd     r8, ebx
006f8 c4a17a6f440618                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x18]
006ff c5fa7f443d18                   vmovdqu    xmmword ptr [rbp + rdi + 0x18], xmm0
00705 c4a17a6f440628                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x28]
0070c c5fa7f443d28                   vmovdqu    xmmword ptr [rbp + rdi + 0x28], xmm0
00712 c4a17a6f440638                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x38]
00719 c5fa7f443d38                   vmovdqu    xmmword ptr [rbp + rdi + 0x38], xmm0
0071f c4a17a6f440648                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x48]
00726 c5fa7f443d48                   vmovdqu    xmmword ptr [rbp + rdi + 0x48], xmm0
0072c c4a17a6f440658                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x58]
00733 c5fa7f443d58                   vmovdqu    xmmword ptr [rbp + rdi + 0x58], xmm0
00739 c4a17a6f440668                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x68]
00740 c5fa7f443d68                   vmovdqu    xmmword ptr [rbp + rdi + 0x68], xmm0
00746 c4a17a6f440678                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x78]
0074d c5fa7f443d78                   vmovdqu    xmmword ptr [rbp + rdi + 0x78], xmm0
00753 c4a17a6f840688000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x88]
0075d c5fa7f843d88000000             vmovdqu    xmmword ptr [rbp + rdi + 0x88], xmm0
00766 c4a17a6f840698000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x98]
00770 c5fa7f843d98000000             vmovdqu    xmmword ptr [rbp + rdi + 0x98], xmm0
00779 c4a17a6f8406a8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xa8]
00783 c5fa7f843da8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xa8], xmm0
0078c c4a17a6f8406b8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xb8]
00796 c5fa7f843db8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xb8], xmm0
0079f c4a17a6f8406c8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xc8]
007a9 c5fa7f843dc8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xc8], xmm0
007b2 c4a17a6f8406d8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xd8]
007bc c5fa7f843dd8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xd8], xmm0
007c5 c4a17a6f8406e8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xe8]
007cf c5fa7f843de8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xe8], xmm0
007d8 c4a17a6f8406f8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xf8]
007e2 c5fa7f843df8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xf8], xmm0
007eb 4181c300010000                 add        r11d, 0x100
007f2 453bd9                         cmp        r11d, r9d
007f5 0f8cd5feffff                   jl         0x7fcbcfbcdad0
007fb 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00800 7d44                           jge        0x7fcbcfbcdc46
00802 4d63c3                         movsxd     r8, r11d
00805 4c03c1                         add        r8, rcx
00808 4c3bc2                         cmp        r8, rdx
0080b 0f836f160000                   jae        0x7fcbcfbcf280
00811 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00816 0f8378160000                   jae        0x7fcbcfbcf294
0081c 458bc3                         mov        r8d, r11d
0081f 438d0c1a                       lea        ecx, [r10 + r11]
00823 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00828 c4c17a6f440908                 vmovdqu    xmm0, xmmword ptr [r9 + rcx + 8]
0082f 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00834 c4817a7f440108                 vmovdqu    xmmword ptr [r9 + r8 + 8], xmm0
0083b 4183c310                       add        r11d, 0x10
0083f 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00844 7cd6                           jl         0x7fcbcfbcdc1c
00846 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0084b 44035c2424                     add        r11d, dword ptr [rsp + 0x24]
00850 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00855 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0085a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0085f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00864 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00869 458b5204                       mov        r10d, dword ptr [r10 + 4]
0086d 458d42f1                       lea        r8d, [r10 - 0xf]
00871 4489442418                     mov        dword ptr [rsp + 0x18], r8d
00876 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0087b 4183fb10                       cmp        r11d, 0x10
0087f 7f6a                           jg         0x7fcbcfbcdceb
00881 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00886 4183f810                       cmp        r8d, 0x10
0088a 7c5f                           jl         0x7fcbcfbcdceb
0088c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00891 4585db                         test       r11d, r11d
00894 0f8c9a120000                   jl         0x7fcbcfbcef34
0089a 4183c2f1                       add        r10d, -0xf
0089e 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
008a3 453bc2                         cmp        r8d, r10d
008a6 0f83ec100000                   jae        0x7fcbcfbced98
008ac 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b1 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
008b6 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
008bb c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
008c2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008c7 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
008cc 0f8326110000                   jae        0x7fcbcfbcedf8
008d2 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
008d6 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
008dd 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
008e2 438d0413                       lea        eax, [r11 + r10]
008e6 e90d050000                     jmp        0x7fcbcfbce1f8
008eb 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
008f0 442b5c2460                     sub        r11d, dword ptr [rsp + 0x60]
008f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008fa 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
008ff 4d8bd8                         mov        r11, r8
00902 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00907 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0090c 4183c308                       add        r11d, 8
00910 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00915 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0091a 4403442420                     add        r8d, dword ptr [rsp + 0x20]
0091f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00924 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00929 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
0092e 0f8d83030000                   jge        0x7fcbcfbce0b7
00934 4183fb10                       cmp        r11d, 0x10
00938 0f8d9a000000                   jge        0x7fcbcfbcddd8
0093e 4183fb08                       cmp        r11d, 8
00942 7d31                           jge        0x7fcbcfbcdd75
00944 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00949 8b542460                       mov        edx, dword ptr [rsp + 0x60]
0094d 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00951 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00956 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
0095b 90                             nop        
0095c c5f877                         vzeroupper 
0095f e8fc1eb6ff                     call       0x7fcbcf72fc60
00964 0f1f84005c0a0000               nop        dword ptr [rax + rax + 0xa5c]
0096c 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00970 e983040000                     jmp        0x7fcbcfbce1f8
00975 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
0097a 8b542450                       mov        edx, dword ptr [rsp + 0x50]
0097e 90                             nop        
0097f 90                             nop        
00980 c5f877                         vzeroupper 
00983 e8d81eb6ff                     call       0x7fcbcf72fc60
00988 0f1f8400800a0001               nop        dword ptr [rax + rax + 0x1000a80]
00990 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00995 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00999 488bc8                         mov        rcx, rax
0099c c5f877                         vzeroupper 
0099f e8bc1eb6ff                     call       0x7fcbcf72fc60
009a4 0f1f84009c0a0002               nop        dword ptr [rax + rax + 0x2000a9c]
009ac 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
009b1 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
009b6 0f8d84090000                   jge        0x7fcbcfbce740
009bc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
009c1 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
009c8 0f8f02150000                   jg         0x7fcbcfbcf2d0
009ce 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
009d3 e91d090000                     jmp        0x7fcbcfbce6f5
009d8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
009dd 4585db                         test       r11d, r11d
009e0 0f8cb6130000                   jl         0x7fcbcfbcf19c
009e6 458bda                         mov        r11d, r10d
009e9 458bd3                         mov        r10d, r11d
009ec 4183c3f1                       add        r11d, -0xf
009f0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
009f5 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
009fa 453bc3                         cmp        r8d, r11d
009fd 0f8331120000                   jae        0x7fcbcfbcf034
00a03 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
00a08 4963c9                         movsxd     rcx, r9d
00a0b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a10 c4c17a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 8]
00a17 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00a1c 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00a21 0f8351120000                   jae        0x7fcbcfbcf078
00a27 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00a2b 8d6b10                         lea        ebp, [rbx + 0x10]
00a2e 4c63db                         movsxd     r11, ebx
00a31 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00a36 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00a3d 3b6c2434                       cmp        ebp, dword ptr [rsp + 0x34]
00a41 0f8d5f020000                   jge        0x7fcbcfbce0a6
00a47 492bcb                         sub        rcx, r11
00a4a 4963fa                         movsxd     rdi, r10d
00a4d 4883c7f1                       add        rdi, -0xf
00a51 4c63d5                         movsxd     r10, ebp
00a54 4d8d1c0a                       lea        r11, [r10 + rcx]
00a58 4c3bdf                         cmp        r11, rdi
00a5b 0f8373120000                   jae        0x7fcbcfbcf0d4
00a61 4863742434                     movsxd     rsi, dword ptr [rsp + 0x34]
00a66 4c8bde                         mov        r11, rsi
00a69 4d2bda                         sub        r11, r10
00a6c 4983c30f                       add        r11, 0xf
00a70 4983e3f0                       and        r11, 0xfffffffffffffff0
00a74 458bdb                         mov        r11d, r11d
00a77 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00a7c 4d63d2                         movsxd     r10, r10d
00a7f 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
00a84 4c3bdf                         cmp        r11, rdi
00a87 0f8347120000                   jae        0x7fcbcfbcf0d4
00a8d 3b6c2418                       cmp        ebp, dword ptr [rsp + 0x18]
00a91 0f833d120000                   jae        0x7fcbcfbcf0d4
00a97 4983c2f0                       add        r10, -0x10
00a9b 4c3bd7                         cmp        r10, rdi
00a9e 0f8330120000                   jae        0x7fcbcfbcf0d4
00aa4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00aa9 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00ab0 0f8f5a120000                   jg         0x7fcbcfbcf110
00ab6 442bcb                         sub        r9d, ebx
00ab9 83c320                         add        ebx, 0x20
00abc 448bd5                         mov        r10d, ebp
00abf 458d0429                       lea        r8d, [r9 + rbp]
00ac3 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00ac8 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00acf c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00ad6 8d5510                         lea        edx, [rbp + 0x10]
00ad9 3bd3                           cmp        edx, ebx
00adb 7d04                           jge        0x7fcbcfbcdee1
00add 8bea                           mov        ebp, edx
00adf ebdb                           jmp        0x7fcbcfbcdebc
00ae1 4881c610ffffff                 add        rsi, -0xf0
00ae8 4881fe00000080                 cmp        rsi, -0x80000000
00aef 490f4cf6                       cmovl      rsi, r14
00af3 8bde                           mov        ebx, esi
00af5 3bd3                           cmp        edx, ebx
00af7 0f8d68010000                   jge        0x7fcbcfbce065
00afd 4c63d2                         movsxd     r10, edx
00b00 4c03d1                         add        r10, rcx
00b03 4c3bd7                         cmp        r10, rdi
00b06 0f8340120000                   jae        0x7fcbcfbcf14c
00b0c 81c500010000                   add        ebp, 0x100
00b12 4c63d5                         movsxd     r10, ebp
00b15 4c03d1                         add        r10, rcx
00b18 4c3bd7                         cmp        r10, rdi
00b1b 0f833f120000                   jae        0x7fcbcfbcf160
00b21 3b542418                       cmp        edx, dword ptr [rsp + 0x18]
00b25 0f8349120000                   jae        0x7fcbcfbcf174
00b2b 3b6c2418                       cmp        ebp, dword ptr [rsp + 0x18]
00b2f 0f8353120000                   jae        0x7fcbcfbcf188
00b35 90                             nop        
00b36 90                             nop        
00b37 90                             nop        
00b38 90                             nop        
00b39 90                             nop        
00b3a 90                             nop        
00b3b 90                             nop        
00b3c 90                             nop        
00b3d 90                             nop        
00b3e 90                             nop        
00b3f 90                             nop        
00b40 448bd2                         mov        r10d, edx
00b43 4963ea                         movsxd     rbp, r10d
00b46 448bd2                         mov        r10d, edx
00b49 418d3411                       lea        esi, [r9 + rdx]
00b4d 448bde                         mov        r11d, esi
00b50 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
00b54 c5fa6f443008                   vmovdqu    xmm0, xmmword ptr [rax + rsi + 8]
00b5a c4a17a7f441008                 vmovdqu    xmmword ptr [rax + r10 + 8], xmm0
00b61 4d63c3                         movsxd     r8, r11d
00b64 c4a17a6f440018                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x18]
00b6b c5fa7f442818                   vmovdqu    xmmword ptr [rax + rbp + 0x18], xmm0
00b71 c4a17a6f440028                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x28]
00b78 c5fa7f442828                   vmovdqu    xmmword ptr [rax + rbp + 0x28], xmm0
00b7e c4a17a6f440038                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x38]
00b85 c5fa7f442838                   vmovdqu    xmmword ptr [rax + rbp + 0x38], xmm0
00b8b c4a17a6f440048                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x48]
00b92 c5fa7f442848                   vmovdqu    xmmword ptr [rax + rbp + 0x48], xmm0
00b98 c4a17a6f440058                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x58]
00b9f c5fa7f442858                   vmovdqu    xmmword ptr [rax + rbp + 0x58], xmm0
00ba5 c4a17a6f440068                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x68]
00bac c5fa7f442868                   vmovdqu    xmmword ptr [rax + rbp + 0x68], xmm0
00bb2 c4a17a6f440078                 vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x78]
00bb9 c5fa7f442878                   vmovdqu    xmmword ptr [rax + rbp + 0x78], xmm0
00bbf c4a17a6f840088000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x88]
00bc9 c5fa7f842888000000             vmovdqu    xmmword ptr [rax + rbp + 0x88], xmm0
00bd2 c4a17a6f840098000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0x98]
00bdc c5fa7f842898000000             vmovdqu    xmmword ptr [rax + rbp + 0x98], xmm0
00be5 c4a17a6f8400a8000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0xa8]
00bef c5fa7f8428a8000000             vmovdqu    xmmword ptr [rax + rbp + 0xa8], xmm0
00bf8 c4a17a6f8400b8000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0xb8]
00c02 c5fa7f8428b8000000             vmovdqu    xmmword ptr [rax + rbp + 0xb8], xmm0
00c0b c4a17a6f8400c8000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0xc8]
00c15 c5fa7f8428c8000000             vmovdqu    xmmword ptr [rax + rbp + 0xc8], xmm0
00c1e c4a17a6f8400d8000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0xd8]
00c28 c5fa7f8428d8000000             vmovdqu    xmmword ptr [rax + rbp + 0xd8], xmm0
00c31 c4a17a6f8400e8000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0xe8]
00c3b c5fa7f8428e8000000             vmovdqu    xmmword ptr [rax + rbp + 0xe8], xmm0
00c44 c4a17a6f8400f8000000           vmovdqu    xmm0, xmmword ptr [rax + r8 + 0xf8]
00c4e c5fa7f8428f8000000             vmovdqu    xmmword ptr [rax + rbp + 0xf8], xmm0
00c57 81c200010000                   add        edx, 0x100
00c5d 3bd3                           cmp        edx, ebx
00c5f 0f8cdbfeffff                   jl         0x7fcbcfbcdf40
00c65 3b542434                       cmp        edx, dword ptr [rsp + 0x34]
00c69 7d3b                           jge        0x7fcbcfbce0a6
00c6b 4c63d2                         movsxd     r10, edx
00c6e 4c03d1                         add        r10, rcx
00c71 4c3bd7                         cmp        r10, rdi
00c74 0f832e120000                   jae        0x7fcbcfbcf2a8
00c7a 3b542418                       cmp        edx, dword ptr [rsp + 0x18]
00c7e 0f8338120000                   jae        0x7fcbcfbcf2bc
00c84 448bda                         mov        r11d, edx
00c87 458d1411                       lea        r10d, [r9 + rdx]
00c8b 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00c8f c4a17a6f441108                 vmovdqu    xmm0, xmmword ptr [rcx + r10 + 8]
00c96 c4a17a7f441908                 vmovdqu    xmmword ptr [rcx + r11 + 8], xmm0
00c9d 83c210                         add        edx, 0x10
00ca0 3b542434                       cmp        edx, dword ptr [rsp + 0x34]
00ca4 7cde                           jl         0x7fcbcfbce084
00ca6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00cab 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00caf 418bc3                         mov        eax, r11d
00cb2 e941010000                     jmp        0x7fcbcfbce1f8
00cb7 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
00cbc 4183f830                       cmp        r8d, 0x30
00cc0 7f62                           jg         0x7fcbcfbce124
00cc2 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00cc7 8b542450                       mov        edx, dword ptr [rsp + 0x50]
00ccb 90                             nop        
00ccc c5f877                         vzeroupper 
00ccf e88c1bb6ff                     call       0x7fcbcf72fc60
00cd4 0f1f8400cc0d0003               nop        dword ptr [rax + rax + 0x3000dcc]
00cdc 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00ce1 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00ce5 488bc8                         mov        rcx, rax
00ce8 c5f877                         vzeroupper 
00ceb e8701bb6ff                     call       0x7fcbcf72fc60
00cf0 0f1f8400e80d0004               nop        dword ptr [rax + rax + 0x4000de8]
00cf8 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
00cfd 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00d02 0f8dca050000                   jge        0x7fcbcfbce6d2
00d08 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d0d 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00d14 0f8f2a110000                   jg         0x7fcbcfbcf244
00d1a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d1f e941050000                     jmp        0x7fcbcfbce665
00d24 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
00d29 4585c0                         test       r8d, r8d
00d2c 0f8cae100000                   jl         0x7fcbcfbcf1e0
00d32 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d37 4585db                         test       r11d, r11d
00d3a 0f8ca0100000                   jl         0x7fcbcfbcf1e0
00d40 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00d45 44035c2450                     add        r11d, dword ptr [rsp + 0x50]
00d4a 453bd3                         cmp        r10d, r11d
00d4d 0f828d100000                   jb         0x7fcbcfbcf1e0
00d53 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00d58 0f8282100000                   jb         0x7fcbcfbcf1e0
00d5e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00d63 4585db                         test       r11d, r11d
00d66 0f8466050000                   je         0x7fcbcfbce6d2
00d6c 458bd3                         mov        r10d, r11d
00d6f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d74 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
00d79 4b8d7c0b08                     lea        rdi, [r11 + r9 + 8]
00d7e 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00d83 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00d88 4963d2                         movsxd     rdx, r10d
00d8b 4883fa20                       cmp        rdx, 0x20
00d8f 0f861d050000                   jbe        0x7fcbcfbce6b2
00d95 c5f877                         vzeroupper 
00d98 49ba409171cfcb7f0000           movabs     r10, 0x7fcbcf719140
00da2 41ffd2                         call       r10
00da5 0f1f840000000000               nop        dword ptr [rax + rax]
00dad e920050000                     jmp        0x7fcbcfbce6d2
00db2 418bea                         mov        ebp, r10d
00db5 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
00dbd 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00dc1 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
00dc5 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00dca 8b7c2434                       mov        edi, dword ptr [rsp + 0x34]
00dce 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00dd3 44890c24                       mov        dword ptr [rsp], r9d
00dd7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00ddc 44895c2408                     mov        dword ptr [rsp + 8], r11d
00de1 458bca                         mov        r9d, r10d
00de4 c5f877                         vzeroupper 
00de7 e8741ab6ff                     call       0x7fcbcf72fc60
00dec 0f1f8400e40e0005               nop        dword ptr [rax + rax + 0x5000ee4]
00df4 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00df8 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
00dfd 41ffc1                         inc        r9d
00e00 443b4c2464                     cmp        r9d, dword ptr [rsp + 0x64]
00e05 0f8df2020000                   jge        0x7fcbcfbce4fd
00e0b 89442410                       mov        dword ptr [rsp + 0x10], eax
00e0f 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00e17 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
00e1b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e20 4e8b5ccd08                     mov        r11, qword ptr [rbp + r9*8 + 8]
00e25 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
00e2a 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00e32 458bcb                         mov        r9d, r11d
00e35 4181e1ffff0100                 and        r9d, 0x1ffff
00e3c 4d8bc3                         mov        r8, r11
00e3f 49c1f824                       sar        r8, 0x24
00e43 49c1eb12                       shr        r11, 0x12
00e47 418bd8                         mov        ebx, r8d
00e4a 458bc3                         mov        r8d, r11d
00e4d 4181e0ffff0300                 and        r8d, 0x3ffff
00e54 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00e59 85db                           test       ebx, ebx
00e5b 7d21                           jge        0x7fcbcfbce27e
00e5d 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
00e62 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00e66 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00e6b 443bd9                         cmp        r11d, ecx
00e6e 0f833c050000                   jae        0x7fcbcfbce7b0
00e74 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00e79 438b5c9808                     mov        ebx, dword ptr [r8 + r11*4 + 8]
00e7e 4585c9                         test       r9d, r9d
00e81 0f8402020000                   je         0x7fcbcfbce489
00e87 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e8c 452bda                         sub        r11d, r10d
00e8f 453bcb                         cmp        r9d, r11d
00e92 0f8fb9040000                   jg         0x7fcbcfbce751
00e98 458bd9                         mov        r11d, r9d
00e9b 83fb03                         cmp        ebx, 3
00e9e 0f8f63f3ffff                   jg         0x7fcbcfbcd607
00ea4 4585db                         test       r11d, r11d
00ea7 7402                           je         0x7fcbcfbce2ab
00ea9 ffcb                           dec        ebx
00eab 85db                           test       ebx, ebx
00ead 0f8480020000                   je         0x7fcbcfbce533
00eb3 83fb03                         cmp        ebx, 3
00eb6 0f8494020000                   je         0x7fcbcfbce550
00ebc 83fb02                         cmp        ebx, 2
00ebf 0f868df3ffff                   jbe        0x7fcbcfbcd652
00ec5 48be1801a5e200000000           movabs     rsi, 0xe2a50118
00ecf 418bea                         mov        ebp, r10d
00ed2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ed7 90                             nop        
00ed8 c5f877                         vzeroupper 
00edb e88019b6ff                     call       0x7fcbcf72fc60
00ee0 0f1f8400d80f0006               nop        dword ptr [rax + rax + 0x6000fd8]
00ee8 4885c0                         test       rax, rax
00eeb 0f84c7060000                   je         0x7fcbcfbce9b8
00ef1 488bf0                         mov        rsi, rax
00ef4 c5f877                         vzeroupper 
00ef7 4881c4b0000000                 add        rsp, 0xb0
00efe 5d                             pop        rbp
00eff e95c78afff                     jmp        0x7fcbcf6c5b60
00f04 8bda                           mov        ebx, edx
00f06 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00f0e 458b5c9b04                     mov        r11d, dword ptr [r11 + rbx*4 + 4]
00f13 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
00f1b 44895c9f08                     mov        dword ptr [rdi + rbx*4 + 8], r11d
00f20 8d53ff                         lea        edx, [rbx - 1]
00f23 413bd0                         cmp        edx, r8d
00f26 7fdc                           jg         0x7fcbcfbce304
00f28 83fa3f                         cmp        edx, 0x3f
00f2b 0f8e3f070000                   jle        0x7fcbcfbcea70
00f31 4c63da                         movsxd     r11, edx
00f34 49ffcb                         dec        r11
00f37 4d3bd9                         cmp        r11, r9
00f3a 0f8337070000                   jae        0x7fcbcfbcea77
00f40 83c3c0                         add        ebx, -0x40
00f43 4c63db                         movsxd     r11, ebx
00f46 49ffcb                         dec        r11
00f49 4d3bd9                         cmp        r11, r9
00f4c 0f8339070000                   jae        0x7fcbcfbcea8b
00f52 3bd1                           cmp        edx, ecx
00f54 0f8345070000                   jae        0x7fcbcfbcea9f
00f5a 3bd9                           cmp        ebx, ecx
00f5c 0f8351070000                   jae        0x7fcbcfbceab3
00f62 eb0e                           jmp        0x7fcbcfbce372
00f64 90                             nop        
00f65 90                             nop        
00f66 90                             nop        
00f67 90                             nop        
00f68 90                             nop        
00f69 90                             nop        
00f6a 90                             nop        
00f6b 90                             nop        
00f6c 90                             nop        
00f6d 90                             nop        
00f6e 90                             nop        
00f6f 90                             nop        
00f70 8bd3                           mov        edx, ebx
00f72 8d7ac1                         lea        edi, [rdx - 0x3f]
00f75 8d72d0                         lea        esi, [rdx - 0x30]
00f78 448d42f1                       lea        r8d, [rdx - 0xf]
00f7c 448d5af0                       lea        r11d, [rdx - 0x10]
00f80 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00f88 62b17e486f849b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11*4 + 8]
00f93 62b17e487f848308000000         vmovdqu32  zmmword ptr [rbx + r8*4 + 8], zmm0
00f9e 448d42e1                       lea        r8d, [rdx - 0x1f]
00fa2 448d5ae0                       lea        r11d, [rdx - 0x20]
00fa6 62b17e486f849b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11*4 + 8]
00fb1 62b17e487f848308000000         vmovdqu32  zmmword ptr [rbx + r8*4 + 8], zmm0
00fbc 62f17e486f84b308000000         vmovdqu32  zmm0, zmmword ptr [rbx + rsi*4 + 8]
00fc7 448d42d1                       lea        r8d, [rdx - 0x2f]
00fcb 62b17e487f848308000000         vmovdqu32  zmmword ptr [rbx + r8*4 + 8], zmm0
00fd6 8d5ac0                         lea        ebx, [rdx - 0x40]
00fd9 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00fe1 62d17e486f849b08000000         vmovdqu32  zmm0, zmmword ptr [r11 + rbx*4 + 8]
00fec 62d17e487f84bb08000000         vmovdqu32  zmmword ptr [r11 + rdi*4 + 8], zmm0
00ff7 83fb3f                         cmp        ebx, 0x3f
00ffa 0f8f70ffffff                   jg         0x7fcbcfbce370
01000 83fb0f                         cmp        ebx, 0xf
01003 7e45                           jle        0x7fcbcfbce44a
01005 83c2b1                         add        edx, -0x4f
01008 4c63da                         movsxd     r11, edx
0100b 49ffcb                         dec        r11
0100e 4d3bd9                         cmp        r11, r9
01011 0f83e6070000                   jae        0x7fcbcfbcebfd
01017 3bd1                           cmp        edx, ecx
01019 0f8306080000                   jae        0x7fcbcfbcec25
0101f 90                             nop        
01020 448d5bf1                       lea        r11d, [rbx - 0xf]
01024 83c3f0                         add        ebx, -0x10
01027 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0102f 62d17e486f849808000000         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 + 8]
0103a 62917e487f849808000000         vmovdqu32  zmmword ptr [r8 + r11*4 + 8], zmm0
01045 83fb0f                         cmp        ebx, 0xf
01048 7fd6                           jg         0x7fcbcfbce420
0104a 85db                           test       ebx, ebx
0104c 0f8e81f2ffff                   jle        0x7fcbcfbcd6d3
01052 4c63db                         movsxd     r11, ebx
01055 49ffcb                         dec        r11
01058 4d3bd9                         cmp        r11, r9
0105b 0f83b0070000                   jae        0x7fcbcfbcec11
01061 3bd9                           cmp        ebx, ecx
01063 0f83d0070000                   jae        0x7fcbcfbcec39
01069 90                             nop        
0106a 90                             nop        
0106b 90                             nop        
0106c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01074 458b449b04                     mov        r8d, dword ptr [r11 + rbx*4 + 4]
01079 4589449b08                     mov        dword ptr [r11 + rbx*4 + 8], r8d
0107e ffcb                           dec        ebx
01080 85db                           test       ebx, ebx
01082 7fe8                           jg         0x7fcbcfbce46c
01084 e94af2ffff                     jmp        0x7fcbcfbcd6d3
01089 4533db                         xor        r11d, r11d
0108c e90afeffff                     jmp        0x7fcbcfbce29b
01091 4c2bd9                         sub        r11, rcx
01094 4d85db                         test       r11, r11
01097 0f8ddf020000                   jge        0x7fcbcfbce77c
0109d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
010a2 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
010a6 4d85d2                         test       r10, r10
010a9 0f85cd020000                   jne        0x7fcbcfbce77c
010af bd08000000                     mov        ebp, 8
010b4 be17000000                     mov        esi, 0x17
010b9 90                             nop        
010ba 90                             nop        
010bb 90                             nop        
010bc c5f877                         vzeroupper 
010bf e89cf5afff                     call       0x7fcbcf6cda60
010c4 0f1f8400bc110007               nop        dword ptr [rax + rax + 0x70011bc]
010cc 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
010d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
010da e841e70c18                     call       0x7fcbe7c9cc20
010df f4                             hlt        
010e0 4d03c3                         add        r8, r11
010e3 4d3bc6                         cmp        r8, r14
010e6 7e08                           jle        0x7fcbcfbce4f0
010e8 4533ed                         xor        r13d, r13d
010eb e9b7efffff                     jmp        0x7fcbcfbcd4a7
010f0 4533ed                         xor        r13d, r13d
010f3 bf01000000                     mov        edi, 1
010f8 e9acefffff                     jmp        0x7fcbcfbcd4a9
010fd 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01102 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
01107 85c9                           test       ecx, ecx
01109 0f84cd060000                   je         0x7fcbcfbcebdc
0110f 4c8bc9                         mov        r9, rcx
01112 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01117 4585db                         test       r11d, r11d
0111a 0f8ccc060000                   jl         0x7fcbcfbcebec
01120 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
01125 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
0112a 8b742458                       mov        esi, dword ptr [rsp + 0x58]
0112e e93ef0ffff                     jmp        0x7fcbcfbcd571
01133 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
0113b 448b4104                       mov        r8d, dword ptr [rcx + 4]
0113f 4585c0                         test       r8d, r8d
01142 0f8605070000                   jbe        0x7fcbcfbcec4d
01148 8b6908                         mov        ebp, dword ptr [rcx + 8]
0114b e99bf1ffff                     jmp        0x7fcbcfbcd6eb
01150 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01158 448b4904                       mov        r9d, dword ptr [rcx + 4]
0115c 4183f902                       cmp        r9d, 2
01160 0f8642070000                   jbe        0x7fcbcfbceca8
01166 8b6908                         mov        ebp, dword ptr [rcx + 8]
01169 ffcd                           dec        ebp
0116b 85ed                           test       ebp, ebp
0116d 7e2f                           jle        0x7fcbcfbce59e
0116f 458bcb                         mov        r9d, r11d
01172 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0117a 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
0117e 41894b10                       mov        dword ptr [r11 + 0x10], ecx
01182 458b4308                       mov        r8d, dword ptr [r11 + 8]
01186 4589430c                       mov        dword ptr [r11 + 0xc], r8d
0118a 41896b08                       mov        dword ptr [r11 + 8], ebp
0118e 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01196 458bd9                         mov        r11d, r9d
01199 e94df1ffff                     jmp        0x7fcbcfbcd6eb
0119e 48be4001a5e200000000           movabs     rsi, 0xe2a50140
011a8 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
011b0 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
011b8 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
011c0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
011c5 44898c24c8000000               mov        dword ptr [rsp + 0xc8], r9d
011cd 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
011d5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
011da 90                             nop        
011db 90                             nop        
011dc c5f877                         vzeroupper 
011df e87c16b6ff                     call       0x7fcbcf72fc60
011e4 0f1f8400dc120008               nop        dword ptr [rax + rax + 0x80012dc]
011ec 4885c0                         test       rax, rax
011ef 0f85fcfcffff                   jne        0x7fcbcfbce2f1
011f5 bef6ffffff                     mov        esi, 0xfffffff6
011fa 90                             nop        
011fb 90                             nop        
011fc c5f877                         vzeroupper 
011ff e85cf4afff                     call       0x7fcbcf6cda60
01204 0f1f8400fc120009               nop        dword ptr [rax + rax + 0x90012fc]
0120c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01216 4883e4f0                       and        rsp, 0xfffffffffffffff0
0121a e801e60c18                     call       0x7fcbe7c9cc20
0121f f4                             hlt        
01220 4d63c5                         movsxd     r8, r13d
01223 4c3b842488000000               cmp        r8, qword ptr [rsp + 0x88]
0122b 7c24                           jl         0x7fcbcfbce651
0122d 483b8c2480000000               cmp        rcx, qword ptr [rsp + 0x80]
01235 7e0d                           jle        0x7fcbcfbce644
01237 4533c0                         xor        r8d, r8d
0123a 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0123f e90df1ffff                     jmp        0x7fcbcfbcd751
01244 4533c9                         xor        r9d, r9d
01247 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0124c e9f1f0ffff                     jmp        0x7fcbcfbcd742
01251 4533c9                         xor        r9d, r9d
01254 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01259 e9f3f0ffff                     jmp        0x7fcbcfbcd751
0125e 90                             nop        
0125f 90                             nop        
01260 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01265 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01269 036c240c                       add        ebp, dword ptr [rsp + 0xc]
0126d 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
01272 8bd5                           mov        edx, ebp
01274 c5f877                         vzeroupper 
01277 e8e415b6ff                     call       0x7fcbcf72fc60
0127c 0f1f84007413000a               nop        dword ptr [rax + rax + 0xa001374]
01284 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
01289 8b542410                       mov        edx, dword ptr [rsp + 0x10]
0128d 488bc8                         mov        rcx, rax
01290 c5f877                         vzeroupper 
01293 e8c815b6ff                     call       0x7fcbcf72fc60
01298 0f1f84009013000b               nop        dword ptr [rax + rax + 0xb001390]
012a0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
012a5 4183c208                       add        r10d, 8
012a9 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
012ae 7cb0                           jl         0x7fcbcfbce660
012b0 eb20                           jmp        0x7fcbcfbce6d2
012b2 4d63d2                         movsxd     r10, r10d
012b5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
012bc c442a8f5db                     bzhi       r11, r11, r10
012c1 c4c1fb92fb                     kmovq      k7, r11
012c6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012cc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012d2 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
012d7 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
012db 418bc2                         mov        eax, r10d
012de e915fbffff                     jmp        0x7fcbcfbce1f8
012e3 90                             nop        
012e4 90                             nop        
012e5 90                             nop        
012e6 90                             nop        
012e7 90                             nop        
012e8 90                             nop        
012e9 90                             nop        
012ea 90                             nop        
012eb 90                             nop        
012ec 90                             nop        
012ed 90                             nop        
012ee 90                             nop        
012ef 90                             nop        
012f0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
012f5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
012f9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
012fd 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
01302 8bd5                           mov        edx, ebp
01304 c5f877                         vzeroupper 
01307 e85415b6ff                     call       0x7fcbcf72fc60
0130c 0f1f84000414000c               nop        dword ptr [rax + rax + 0xc001404]
01314 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
01319 8b542410                       mov        edx, dword ptr [rsp + 0x10]
0131d 488bc8                         mov        rcx, rax
01320 c5f877                         vzeroupper 
01323 e83815b6ff                     call       0x7fcbcf72fc60
01328 0f1f84002014000d               nop        dword ptr [rax + rax + 0xd001420]
01330 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01335 4183c208                       add        r10d, 8
01339 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
0133e 7cb0                           jl         0x7fcbcfbce6f0
01340 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01345 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
01349 418bc2                         mov        eax, r10d
0134c e9a7faffff                     jmp        0x7fcbcfbce1f8
01351 be17000000                     mov        esi, 0x17
01356 90                             nop        
01357 90                             nop        
01358 c5f877                         vzeroupper 
0135b e800f3afff                     call       0x7fcbcf6cda60
01360 0f1f84005814000e               nop        dword ptr [rax + rax + 0xe001458]
01368 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01372 4883e4f0                       and        rsp, 0xfffffffffffffff0
01376 e8a5e40c18                     call       0x7fcbe7c9cc20
0137b f4                             hlt        
0137c bd02000000                     mov        ebp, 2
01381 e92efdffff                     jmp        0x7fcbcfbce4b4
01386 be17000000                     mov        esi, 0x17
0138b 90                             nop        
0138c c5f877                         vzeroupper 
0138f e8ccf2afff                     call       0x7fcbcf6cda60
01394 0f1f84008c14000f               nop        dword ptr [rax + rax + 0xf00148c]
0139c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
013a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013aa e871e40c18                     call       0x7fcbe7c9cc20
013af f4                             hlt        
013b0 bee4ffffff                     mov        esi, 0xffffffe4
013b5 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013bd 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
013c5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013ca 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
013d2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
013d7 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
013dc c5f877                         vzeroupper 
013df e87cf2afff                     call       0x7fcbcf6cda60
013e4 0f1f8400dc140010               nop        dword ptr [rax + rax + 0x100014dc]
013ec 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
013f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013fa e821e40c18                     call       0x7fcbe7c9cc20
013ff f4                             hlt        
01400 bee4ffffff                     mov        esi, 0xffffffe4
01405 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0140a 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0140f 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01414 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01419 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0141e 895c2420                       mov        dword ptr [rsp + 0x20], ebx
01422 90                             nop        
01423 90                             nop        
01424 c5f877                         vzeroupper 
01427 e834f2afff                     call       0x7fcbcf6cda60
0142c 0f1f840024150011               nop        dword ptr [rax + rax + 0x11001524]
01434 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0143e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01442 e8d9e30c18                     call       0x7fcbe7c9cc20
01447 f4                             hlt        
01448 8be8                           mov        ebp, eax
0144a eb0a                           jmp        0x7fcbcfbce856
0144c 8be8                           mov        ebp, eax
0144e eb06                           jmp        0x7fcbcfbce856
01450 8be8                           mov        ebp, eax
01452 eb02                           jmp        0x7fcbcfbce856
01454 8be8                           mov        ebp, eax
01456 beccffffff                     mov        esi, 0xffffffcc
0145b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01463 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
0146b 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01470 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01475 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0147a 90                             nop        
0147b 90                             nop        
0147c c5f877                         vzeroupper 
0147f e8dcf1afff                     call       0x7fcbcf6cda60
01484 0f1f84007c150012               nop        dword ptr [rax + rax + 0x1200157c]
0148c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01496 4883e4f0                       and        rsp, 0xfffffffffffffff0
0149a e881e30c18                     call       0x7fcbe7c9cc20
0149f f4                             hlt        
014a0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
014a5 8be8                           mov        ebp, eax
014a7 33c9                           xor        ecx, ecx
014a9 458bd3                         mov        r10d, r11d
014ac bef6ffffff                     mov        esi, 0xfffffff6
014b1 898c24c0000000                 mov        dword ptr [rsp + 0xc0], ecx
014b8 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
014c0 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
014c8 c5f877                         vzeroupper 
014cb e890f1afff                     call       0x7fcbcf6cda60
014d0 0f1f8400c8150013               nop        dword ptr [rax + rax + 0x130015c8]
014d8 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
014e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
014e6 e835e30c18                     call       0x7fcbe7c9cc20
014eb f4                             hlt        
014ec be6effffff                     mov        esi, 0xffffff6e
014f1 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
014f9 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
01501 899424c8000000                 mov        dword ptr [rsp + 0xc8], edx
01508 48894424f8                     mov        qword ptr [rsp - 8], rax
0150d 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01511 898424cc000000                 mov        dword ptr [rsp + 0xcc], eax
01518 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151d 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01522 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01527 48ff742440                     push       qword ptr [rsp + 0x40]
0152c 488f442428                     pop        qword ptr [rsp + 0x28]
01531 897c2424                       mov        dword ptr [rsp + 0x24], edi
01535 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
0153a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
0153f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01544 89442450                       mov        dword ptr [rsp + 0x50], eax
01548 894c2454                       mov        dword ptr [rsp + 0x54], ecx
0154c c5f877                         vzeroupper 
0154f e80cf1afff                     call       0x7fcbcf6cda60
01554 0f1f84004c160014               nop        dword ptr [rax + rax + 0x1400164c]
0155c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01566 4883e4f0                       and        rsp, 0xfffffffffffffff0
0156a e8b1e20c18                     call       0x7fcbe7c9cc20
0156f f4                             hlt        
01570 bee4ffffff                     mov        esi, 0xffffffe4
01575 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0157a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0157f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01584 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01589 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0158e 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01592 90                             nop        
01593 90                             nop        
01594 c5f877                         vzeroupper 
01597 e8c4f0afff                     call       0x7fcbcf6cda60
0159c 0f1f840094160015               nop        dword ptr [rax + rax + 0x15001694]
015a4 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
015ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
015b2 e869e20c18                     call       0x7fcbe7c9cc20
015b7 f4                             hlt        
015b8 bef6ffffff                     mov        esi, 0xfffffff6
015bd 90                             nop        
015be 90                             nop        
015bf 90                             nop        
015c0 c5f877                         vzeroupper 
015c3 e898f0afff                     call       0x7fcbcf6cda60
015c8 0f1f8400c0160016               nop        dword ptr [rax + rax + 0x160016c0]
015d0 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
015da 4883e4f0                       and        rsp, 0xfffffffffffffff0
015de e83de20c18                     call       0x7fcbe7c9cc20
015e3 f4                             hlt        
015e4 bee4ffffff                     mov        esi, 0xffffffe4
015e9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015ee 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
015f3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
015f8 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015fd 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01602 90                             nop        
01603 90                             nop        
01604 c5f877                         vzeroupper 
01607 e854f0afff                     call       0x7fcbcf6cda60
0160c 0f1f840004170017               nop        dword ptr [rax + rax + 0x17001704]
01614 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0161e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01622 e8f9e10c18                     call       0x7fcbe7c9cc20
01627 f4                             hlt        
01628 be6effffff                     mov        esi, 0xffffff6e
0162d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01632 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01637 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0163c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01641 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01646 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
0164a 90                             nop        
0164b 90                             nop        
0164c c5f877                         vzeroupper 
0164f e80cf0afff                     call       0x7fcbcf6cda60
01654 0f1f84004c170018               nop        dword ptr [rax + rax + 0x1800174c]
0165c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01666 4883e4f0                       and        rsp, 0xfffffffffffffff0
0166a e8b1e10c18                     call       0x7fcbe7c9cc20
0166f f4                             hlt        
01670 8bda                           mov        ebx, edx
01672 e9d3f9ffff                     jmp        0x7fcbcfbce44a
01677 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01681 4883e4f0                       and        rsp, 0xfffffffffffffff0
01685 e896e10c18                     call       0x7fcbe7c9cc20
0168a f4                             hlt        
0168b 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01695 4883e4f0                       and        rsp, 0xfffffffffffffff0
01699 e882e10c18                     call       0x7fcbe7c9cc20
0169e f4                             hlt        
0169f 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
016a9 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ad e86ee10c18                     call       0x7fcbe7c9cc20
016b2 f4                             hlt        
016b3 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
016bd 4883e4f0                       and        rsp, 0xfffffffffffffff0
016c1 e85ae10c18                     call       0x7fcbe7c9cc20
016c6 f4                             hlt        
016c7 bee4ffffff                     mov        esi, 0xffffffe4
016cc 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
016d1 4489442418                     mov        dword ptr [rsp + 0x18], r8d
016d6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
016db 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016e0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016e5 90                             nop        
016e6 90                             nop        
016e7 90                             nop        
016e8 c5f877                         vzeroupper 
016eb e870efafff                     call       0x7fcbcf6cda60
016f0 0f1f8400e8170019               nop        dword ptr [rax + rax + 0x190017e8]
016f8 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01702 4883e4f0                       and        rsp, 0xfffffffffffffff0
01706 e815e10c18                     call       0x7fcbe7c9cc20
0170b f4                             hlt        
0170c c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01712 bee4ffffff                     mov        esi, 0xffffffe4
01717 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0171f 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01727 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0172f 90                             nop        
01730 c5f877                         vzeroupper 
01733 e828efafff                     call       0x7fcbcf6cda60
01738 0f1f84003018001a               nop        dword ptr [rax + rax + 0x1a001830]
01740 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0174a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0174e e8cde00c18                     call       0x7fcbe7c9cc20
01753 f4                             hlt        
01754 beccffffff                     mov        esi, 0xffffffcc
01759 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0175e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01763 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01768 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0176d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01772 90                             nop        
01773 90                             nop        
01774 c5f877                         vzeroupper 
01777 e8e4eeafff                     call       0x7fcbcf6cda60
0177c 0f1f84007418001b               nop        dword ptr [rax + rax + 0x1b001874]
01784 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0178e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01792 e889e00c18                     call       0x7fcbe7c9cc20
01797 f4                             hlt        
01798 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0179e beccffffff                     mov        esi, 0xffffffcc
017a3 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
017a8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017ad 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
017b2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017b7 90                             nop        
017b8 c5f877                         vzeroupper 
017bb e8a0eeafff                     call       0x7fcbcf6cda60
017c0 0f1f8400b818001c               nop        dword ptr [rax + rax + 0x1c0018b8]
017c8 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
017d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017d6 e845e00c18                     call       0x7fcbe7c9cc20
017db f4                             hlt        
017dc 8be8                           mov        ebp, eax
017de 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
017e3 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
017e7 e9c0fcffff                     jmp        0x7fcbcfbce8ac
017ec 8be8                           mov        ebp, eax
017ee 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
017f3 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
017f8 e959fcffff                     jmp        0x7fcbcfbce856
017fd 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01807 4883e4f0                       and        rsp, 0xfffffffffffffff0
0180b e810e00c18                     call       0x7fcbe7c9cc20
01810 f4                             hlt        
01811 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
0181b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0181f e8fcdf0c18                     call       0x7fcbe7c9cc20
01824 f4                             hlt        
01825 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
0182f 4883e4f0                       and        rsp, 0xfffffffffffffff0
01833 e8e8df0c18                     call       0x7fcbe7c9cc20
01838 f4                             hlt        
01839 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01843 4883e4f0                       and        rsp, 0xfffffffffffffff0
01847 e8d4df0c18                     call       0x7fcbe7c9cc20
0184c f4                             hlt        
0184d bee4ffffff                     mov        esi, 0xffffffe4
01852 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01857 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
0185f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01864 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01869 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0186e 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01873 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01878 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
0187d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01882 90                             nop        
01883 90                             nop        
01884 c5f877                         vzeroupper 
01887 e8d4edafff                     call       0x7fcbcf6cda60
0188c 0f1f84008419001d               nop        dword ptr [rax + rax + 0x1d001984]
01894 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0189e 4883e4f0                       and        rsp, 0xfffffffffffffff0
018a2 e879df0c18                     call       0x7fcbe7c9cc20
018a7 f4                             hlt        
018a8 bee4ffffff                     mov        esi, 0xffffffe4
018ad 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
018b2 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
018ba 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018bf 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
018c4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018c9 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
018ce 4489442414                     mov        dword ptr [rsp + 0x14], r8d
018d3 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
018d8 48894c2420                     mov        qword ptr [rsp + 0x20], rcx
018dd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
018e2 90                             nop        
018e3 90                             nop        
018e4 c5f877                         vzeroupper 
018e7 e874edafff                     call       0x7fcbcf6cda60
018ec 0f1f8400e419001e               nop        dword ptr [rax + rax + 0x1e0019e4]
018f4 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
018fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01902 e819df0c18                     call       0x7fcbe7c9cc20
01907 f4                             hlt        
01908 bee4ffffff                     mov        esi, 0xffffffe4
0190d 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01912 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01917 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0191c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01921 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01926 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0192b 90                             nop        
0192c c5f877                         vzeroupper 
0192f e82cedafff                     call       0x7fcbcf6cda60
01934 0f1f84002c1a001f               nop        dword ptr [rax + rax + 0x1f001a2c]
0193c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01946 4883e4f0                       and        rsp, 0xfffffffffffffff0
0194a e8d1de0c18                     call       0x7fcbe7c9cc20
0194f f4                             hlt        
01950 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01956 bee4ffffff                     mov        esi, 0xffffffe4
0195b 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01963 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0196b 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01973 90                             nop        
01974 c5f877                         vzeroupper 
01977 e8e4ecafff                     call       0x7fcbcf6cda60
0197c 0f1f8400741a0020               nop        dword ptr [rax + rax + 0x20001a74]
01984 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0198e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01992 e889de0c18                     call       0x7fcbe7c9cc20
01997 f4                             hlt        
01998 bee4ffffff                     mov        esi, 0xffffffe4
0199d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
019a5 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
019ad 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
019b5 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
019ba 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
019c2 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
019c7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019cc 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019d1 90                             nop        
019d2 90                             nop        
019d3 90                             nop        
019d4 c5f877                         vzeroupper 
019d7 e884ecafff                     call       0x7fcbcf6cda60
019dc 0f1f8400d41a0021               nop        dword ptr [rax + rax + 0x21001ad4]
019e4 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
019ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
019f2 e829de0c18                     call       0x7fcbe7c9cc20
019f7 f4                             hlt        
019f8 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
019fe bee4ffffff                     mov        esi, 0xffffffe4
01a03 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01a0b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01a13 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01a1b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01a20 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
01a28 c5f877                         vzeroupper 
01a2b e830ecafff                     call       0x7fcbcf6cda60
01a30 0f1f8400281b0022               nop        dword ptr [rax + rax + 0x22001b28]
01a38 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01a42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a46 e8d5dd0c18                     call       0x7fcbe7c9cc20
01a4b f4                             hlt        
01a4c beccffffff                     mov        esi, 0xffffffcc
01a51 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01a56 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01a5b 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01a60 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01a65 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a6a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a6f 90                             nop        
01a70 c5f877                         vzeroupper 
01a73 e8e8ebafff                     call       0x7fcbcf6cda60
01a78 0f1f8400701b0023               nop        dword ptr [rax + rax + 0x23001b70]
01a80 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01a8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a8e e88ddd0c18                     call       0x7fcbe7c9cc20
01a93 f4                             hlt        
01a94 beccffffff                     mov        esi, 0xffffffcc
01a99 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01aa1 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01aa9 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01ab1 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01ab6 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01abb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01ac0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01ac5 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01aca 90                             nop        
01acb 90                             nop        
01acc c5f877                         vzeroupper 
01acf e88cebafff                     call       0x7fcbcf6cda60
01ad4 0f1f8400cc1b0024               nop        dword ptr [rax + rax + 0x24001bcc]
01adc 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01ae6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aea e831dd0c18                     call       0x7fcbe7c9cc20
01aef f4                             hlt        
01af0 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01af6 beccffffff                     mov        esi, 0xffffffcc
01afb 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01b00 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b05 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b0a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01b0f 90                             nop        
01b10 c5f877                         vzeroupper 
01b13 e848ebafff                     call       0x7fcbcf6cda60
01b18 0f1f8400101c0025               nop        dword ptr [rax + rax + 0x25001c10]
01b20 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01b2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b2e e8eddc0c18                     call       0x7fcbe7c9cc20
01b33 f4                             hlt        
01b34 beccffffff                     mov        esi, 0xffffffcc
01b39 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01b41 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01b49 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01b51 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01b56 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
01b5e 90                             nop        
01b5f 90                             nop        
01b60 c5f877                         vzeroupper 
01b63 e8f8eaafff                     call       0x7fcbcf6cda60
01b68 0f1f8400601c0026               nop        dword ptr [rax + rax + 0x26001c60]
01b70 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01b7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b7e e89ddc0c18                     call       0x7fcbe7c9cc20
01b83 f4                             hlt        
01b84 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
01b88 83c510                         add        ebp, 0x10
01b8b be6effffff                     mov        esi, 0xffffff6e
01b90 c5f877                         vzeroupper 
01b93 e8c8eaafff                     call       0x7fcbcf6cda60
01b98 0f1f8400901c0027               nop        dword ptr [rax + rax + 0x27001c90]
01ba0 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bae e86ddc0c18                     call       0x7fcbe7c9cc20
01bb3 f4                             hlt        
01bb4 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
01bb8 83c510                         add        ebp, 0x10
01bbb be66ffffff                     mov        esi, 0xffffff66
01bc0 c5f877                         vzeroupper 
01bc3 e898eaafff                     call       0x7fcbcf6cda60
01bc8 0f1f8400c01c0028               nop        dword ptr [rax + rax + 0x28001cc0]
01bd0 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01bda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bde e83ddc0c18                     call       0x7fcbe7c9cc20
01be3 f4                             hlt        
01be4 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01bee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bf2 e829dc0c18                     call       0x7fcbe7c9cc20
01bf7 f4                             hlt        
01bf8 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c06 e815dc0c18                     call       0x7fcbe7c9cc20
01c0b f4                             hlt        
01c0c 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01c16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c1a e801dc0c18                     call       0x7fcbe7c9cc20
01c1f f4                             hlt        
01c20 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01c2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2e e8eddb0c18                     call       0x7fcbe7c9cc20
01c33 f4                             hlt        
01c34 bee4ffffff                     mov        esi, 0xffffffe4
01c39 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01c41 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01c49 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01c51 90                             nop        
01c52 90                             nop        
01c53 90                             nop        
01c54 c5f877                         vzeroupper 
01c57 e804eaafff                     call       0x7fcbcf6cda60
01c5c 0f1f8400541d0029               nop        dword ptr [rax + rax + 0x29001d54]
01c64 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01c6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c72 e8a9db0c18                     call       0x7fcbe7c9cc20
01c77 f4                             hlt        
01c78 c5fa7f442420                   vmovdqu    xmmword ptr [rsp + 0x20], xmm0
01c7e bee4ffffff                     mov        esi, 0xffffffe4
01c83 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01c8b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01c93 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01c9b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01ca0 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
01ca8 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
01cad 90                             nop        
01cae 90                             nop        
01caf 90                             nop        
01cb0 c5f877                         vzeroupper 
01cb3 e8a8e9afff                     call       0x7fcbcf6cda60
01cb8 0f1f8400b01d002a               nop        dword ptr [rax + rax + 0x2a001db0]
01cc0 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01cca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cce e84ddb0c18                     call       0x7fcbe7c9cc20
01cd3 f4                             hlt        
01cd4 4183c110                       add        r9d, 0x10
01cd8 be6effffff                     mov        esi, 0xffffff6e
01cdd 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01ce2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ce7 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01cec c5f877                         vzeroupper 
01cef e86ce9afff                     call       0x7fcbcf6cda60
01cf4 0f1f8400ec1d002b               nop        dword ptr [rax + rax + 0x2b001dec]
01cfc 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01d06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d0a e811db0c18                     call       0x7fcbe7c9cc20
01d0f f4                             hlt        
01d10 4183c110                       add        r9d, 0x10
01d14 be66ffffff                     mov        esi, 0xffffff66
01d19 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01d1e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01d23 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01d28 c5f877                         vzeroupper 
01d2b e830e9afff                     call       0x7fcbcf6cda60
01d30 0f1f8400281e002c               nop        dword ptr [rax + rax + 0x2c001e28]
01d38 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d46 e8d5da0c18                     call       0x7fcbe7c9cc20
01d4b f4                             hlt        
01d4c 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01d56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d5a e8c1da0c18                     call       0x7fcbe7c9cc20
01d5f f4                             hlt        
01d60 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01d6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6e e8adda0c18                     call       0x7fcbe7c9cc20
01d73 f4                             hlt        
01d74 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01d7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d82 e899da0c18                     call       0x7fcbe7c9cc20
01d87 f4                             hlt        
01d88 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01d92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d96 e885da0c18                     call       0x7fcbe7c9cc20
01d9b f4                             hlt        
01d9c beccffffff                     mov        esi, 0xffffffcc
01da1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01da9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01db1 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01db9 90                             nop        
01dba 90                             nop        
01dbb 90                             nop        
01dbc c5f877                         vzeroupper 
01dbf e89ce8afff                     call       0x7fcbcf6cda60
01dc4 0f1f8400bc1e002d               nop        dword ptr [rax + rax + 0x2d001ebc]
01dcc 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dda e841da0c18                     call       0x7fcbe7c9cc20
01ddf f4                             hlt        
01de0 beccffffff                     mov        esi, 0xffffffcc
01de5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01ded 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01df5 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01dfd 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01e02 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
01e0a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01e0f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e14 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01e19 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e1e 90                             nop        
01e1f 90                             nop        
01e20 c5f877                         vzeroupper 
01e23 e838e8afff                     call       0x7fcbcf6cda60
01e28 0f1f8400201f002e               nop        dword ptr [rax + rax + 0x2e001f20]
01e30 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e8ddd90c18                     call       0x7fcbe7c9cc20
01e43 f4                             hlt        
01e44 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01e48 83c508                         add        ebp, 8
01e4b be66ffffff                     mov        esi, 0xffffff66
01e50 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01e55 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e5a 90                             nop        
01e5b 90                             nop        
01e5c c5f877                         vzeroupper 
01e5f e8fce7afff                     call       0x7fcbcf6cda60
01e64 0f1f84005c1f002f               nop        dword ptr [rax + rax + 0x2f001f5c]
01e6c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01e76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e7a e8a1d90c18                     call       0x7fcbe7c9cc20
01e7f f4                             hlt        
01e80 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01e8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e8e e88dd90c18                     call       0x7fcbe7c9cc20
01e93 f4                             hlt        
01e94 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01e9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ea2 e879d90c18                     call       0x7fcbe7c9cc20
01ea7 f4                             hlt        
01ea8 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01eb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eb6 e865d90c18                     call       0x7fcbe7c9cc20
01ebb f4                             hlt        
01ebc 48bf60ce44a8cb7f0000           movabs     rdi, 0x7fcba844ce60
01ec6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eca e851d90c18                     call       0x7fcbe7c9cc20
01ecf f4                             hlt        
01ed0 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01ed4 83c508                         add        ebp, 8
01ed7 be66ffffff                     mov        esi, 0xffffff66
01edc 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01ee1 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ee6 90                             nop        
01ee7 90                             nop        
01ee8 c5f877                         vzeroupper 
01eeb e870e7afff                     call       0x7fcbcf6cda60
01ef0 0f1f8400e81f0030               nop        dword ptr [rax + rax + 0x30001fe8]
01ef8 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01f02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f06 e815d90c18                     call       0x7fcbe7c9cc20
01f0b f4                             hlt        
01f0c bef6ffffff                     mov        esi, 0xfffffff6
01f11 90                             nop        
01f12 90                             nop        
01f13 90                             nop        
01f14 c5f877                         vzeroupper 
01f17 e844e7afff                     call       0x7fcbcf6cda60
01f1c 0f1f840014200031               nop        dword ptr [rax + rax + 0x31002014]
01f24 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01f2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f32 e8e9d80c18                     call       0x7fcbe7c9cc20
01f37 f4                             hlt        
01f38 bef6ffffff                     mov        esi, 0xfffffff6
01f3d 8b6c241c                       mov        ebp, dword ptr [rsp + 0x1c]
01f41 90                             nop        
01f42 90                             nop        
01f43 90                             nop        
01f44 c5f877                         vzeroupper 
01f47 e814e7afff                     call       0x7fcbcf6cda60
01f4c 0f1f840044200032               nop        dword ptr [rax + rax + 0x32002044]
01f54 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01f5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f62 e8b9d80c18                     call       0x7fcbe7c9cc20
01f67 f4                             hlt        
01f68 bef6ffffff                     mov        esi, 0xfffffff6
01f6d 90                             nop        
01f6e 90                             nop        
01f6f 90                             nop        
01f70 c5f877                         vzeroupper 
01f73 e8e8e6afff                     call       0x7fcbcf6cda60
01f78 0f1f840070200033               nop        dword ptr [rax + rax + 0x33002070]
01f80 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01f8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f8e e88dd80c18                     call       0x7fcbe7c9cc20
01f93 f4                             hlt        
01f94 bef6ffffff                     mov        esi, 0xfffffff6
01f99 8beb                           mov        ebp, ebx
01f9b 90                             nop        
01f9c c5f877                         vzeroupper 
01f9f e8bce6afff                     call       0x7fcbcf6cda60
01fa4 0f1f84009c200034               nop        dword ptr [rax + rax + 0x3400209c]
01fac 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01fb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fba e861d80c18                     call       0x7fcbe7c9cc20
01fbf f4                             hlt        
01fc0 eb14                           jmp        0x7fcbcfbcf3d6
01fc2 eb12                           jmp        0x7fcbcfbcf3d6
01fc4 eb10                           jmp        0x7fcbcfbcf3d6
01fc6 eb0e                           jmp        0x7fcbcfbcf3d6
01fc8 eb0c                           jmp        0x7fcbcfbcf3d6
01fca eb0a                           jmp        0x7fcbcfbcf3d6
01fcc eb08                           jmp        0x7fcbcfbcf3d6
01fce eb06                           jmp        0x7fcbcfbcf3d6
01fd0 eb04                           jmp        0x7fcbcfbcf3d6
01fd2 eb02                           jmp        0x7fcbcfbcf3d6
01fd4 eb00                           jmp        0x7fcbcfbcf3d6
01fd6 488bf0                         mov        rsi, rax
01fd9 e916efffff                     jmp        0x7fcbcfbce2f4
01fde bef6ffffff                     mov        esi, 0xfffffff6
01fe3 90                             nop        
01fe4 c5f877                         vzeroupper 
01fe7 e874e6afff                     call       0x7fcbcf6cda60
01fec 0f1f8400e4200035               nop        dword ptr [rax + rax + 0x350020e4]
01ff4 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
01ffe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02002 e819d80c18                     call       0x7fcbe7c9cc20
02007 f4                             hlt        
02008 bef6ffffff                     mov        esi, 0xfffffff6
0200d 90                             nop        
0200e 90                             nop        
0200f 90                             nop        
02010 c5f877                         vzeroupper 
02013 e848e6afff                     call       0x7fcbcf6cda60
02018 0f1f840010210036               nop        dword ptr [rax + rax + 0x36002110]
02020 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
0202a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0202e e8edd70c18                     call       0x7fcbe7c9cc20
02033 f4                             hlt        
02034 bef6ffffff                     mov        esi, 0xfffffff6
02039 90                             nop        
0203a 90                             nop        
0203b 90                             nop        
0203c c5f877                         vzeroupper 
0203f e81ce6afff                     call       0x7fcbcf6cda60
02044 0f1f84003c210037               nop        dword ptr [rax + rax + 0x3700213c]
0204c 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
02056 4883e4f0                       and        rsp, 0xfffffffffffffff0
0205a e8c1d70c18                     call       0x7fcbe7c9cc20
0205f f4                             hlt        
02060 bef6ffffff                     mov        esi, 0xfffffff6
02065 418bea                         mov        ebp, r10d
02068 c5f877                         vzeroupper 
0206b e8f0e5afff                     call       0x7fcbcf6cda60
02070 0f1f840068210038               nop        dword ptr [rax + rax + 0x38002168]
02078 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
02082 4883e4f0                       and        rsp, 0xfffffffffffffff0
02086 e895d70c18                     call       0x7fcbe7c9cc20
0208b f4                             hlt        
0208c bef6ffffff                     mov        esi, 0xfffffff6
02091 90                             nop        
02092 90                             nop        
02093 90                             nop        
02094 c5f877                         vzeroupper 
02097 e8c4e5afff                     call       0x7fcbcf6cda60
0209c 0f1f840094210039               nop        dword ptr [rax + rax + 0x39002194]
020a4 48bf90ad36a8cb7f0000           movabs     rdi, 0x7fcba836ad90
020ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
020b2 e869d70c18                     call       0x7fcbe7c9cc20
020b7 f4                             hlt        
020b8 49bae2d5bccfcb7f0000           movabs     r10, 0x7fcbcfbcd5e2
020c2 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
020c9 e9922eb6ff                     jmp        0x7fcbcf732360
020ce e80dfdb4ff                     call       0x7fcbcf71f1e0
020d3 e966dfffff                     jmp        0x7fcbcfbcd43e
