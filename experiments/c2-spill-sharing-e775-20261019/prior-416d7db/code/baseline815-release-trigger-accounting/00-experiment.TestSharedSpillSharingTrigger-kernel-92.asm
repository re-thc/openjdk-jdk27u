00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ece0010000                 sub        rsp, 0x1e0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7fb18c39e51f
0001a e801a75507                     call       0x7fb1938f8c20
0001f 4889542430                     mov        qword ptr [rsp + 0x30], rdx
00024 48894c2438                     mov        qword ptr [rsp + 0x38], rcx
00029 4c89442440                     mov        qword ptr [rsp + 0x40], r8
0002e 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
00033 48bf4010406cb17f0000           movabs     rdi, 0x7fb16c401040
0003d 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
00040 83c302                         add        ebx, 2
00043 895f70                         mov        dword ptr [rdi + 0x70], ebx
00046 81e3fe070000                   and        ebx, 0x7fe
0004c 85db                           test       ebx, ebx
0004e 0f8479090000                   je         0x7fb18c39eecd
00054 837e0800                       cmp        dword ptr [rsi + 8], 0
00058 0f869a090000                   jbe        0x7fb18c39eef8
0005e 488b7e10                       mov        rdi, qword ptr [rsi + 0x10]
00062 4889bc24c0000000               mov        qword ptr [rsp + 0xc0], rdi
0006a 837e0801                       cmp        dword ptr [rsi + 8], 1
0006e 0f8696090000                   jbe        0x7fb18c39ef0a
00074 488b5e18                       mov        rbx, qword ptr [rsi + 0x18]
00078 837e0802                       cmp        dword ptr [rsi + 8], 2
0007c 0f869a090000                   jbe        0x7fb18c39ef1c
00082 488b4620                       mov        rax, qword ptr [rsi + 0x20]
00086 837e0803                       cmp        dword ptr [rsi + 8], 3
0008a 0f869e090000                   jbe        0x7fb18c39ef2e
00090 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
00094 837e0804                       cmp        dword ptr [rsi + 8], 4
00098 0f86a2090000                   jbe        0x7fb18c39ef40
0009e 4c8b6e30                       mov        r13, qword ptr [rsi + 0x30]
000a2 837e0805                       cmp        dword ptr [rsi + 8], 5
000a6 0f86a6090000                   jbe        0x7fb18c39ef52
000ac 4c8b7638                       mov        r14, qword ptr [rsi + 0x38]
000b0 837e0806                       cmp        dword ptr [rsi + 8], 6
000b4 0f86aa090000                   jbe        0x7fb18c39ef64
000ba 488b5640                       mov        rdx, qword ptr [rsi + 0x40]
000be 837e0807                       cmp        dword ptr [rsi + 8], 7
000c2 0f86ae090000                   jbe        0x7fb18c39ef76
000c8 488b4e48                       mov        rcx, qword ptr [rsi + 0x48]
000cc 837e0808                       cmp        dword ptr [rsi + 8], 8
000d0 0f86b2090000                   jbe        0x7fb18c39ef88
000d6 4c8b4650                       mov        r8, qword ptr [rsi + 0x50]
000da 837e0809                       cmp        dword ptr [rsi + 8], 9
000de 0f86b6090000                   jbe        0x7fb18c39ef9a
000e4 4c8b4e58                       mov        r9, qword ptr [rsi + 0x58]
000e8 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
000ed 837e080a                       cmp        dword ptr [rsi + 8], 0xa
000f1 0f86b5090000                   jbe        0x7fb18c39efac
000f7 4c8b4e60                       mov        r9, qword ptr [rsi + 0x60]
000fb 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00100 837e080b                       cmp        dword ptr [rsi + 8], 0xb
00104 0f86b4090000                   jbe        0x7fb18c39efbe
0010a 4c8b4e68                       mov        r9, qword ptr [rsi + 0x68]
0010e 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00113 837e080c                       cmp        dword ptr [rsi + 8], 0xc
00117 0f86b3090000                   jbe        0x7fb18c39efd0
0011d 4c8b4e70                       mov        r9, qword ptr [rsi + 0x70]
00121 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00126 837e080d                       cmp        dword ptr [rsi + 8], 0xd
0012a 0f86b2090000                   jbe        0x7fb18c39efe2
00130 4c8b4e78                       mov        r9, qword ptr [rsi + 0x78]
00134 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00139 837e080e                       cmp        dword ptr [rsi + 8], 0xe
0013d 0f86b1090000                   jbe        0x7fb18c39eff4
00143 4c8b8e80000000                 mov        r9, qword ptr [rsi + 0x80]
0014a 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
0014f 837e080f                       cmp        dword ptr [rsi + 8], 0xf
00153 0f86ad090000                   jbe        0x7fb18c39f006
00159 4c8b8e88000000                 mov        r9, qword ptr [rsi + 0x88]
00160 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
00168 837e0810                       cmp        dword ptr [rsi + 8], 0x10
0016c 0f86a6090000                   jbe        0x7fb18c39f018
00172 4c8b8e90000000                 mov        r9, qword ptr [rsi + 0x90]
00179 4c898c2488000000               mov        qword ptr [rsp + 0x88], r9
00181 837e0811                       cmp        dword ptr [rsi + 8], 0x11
00185 0f869f090000                   jbe        0x7fb18c39f02a
0018b 4c8b8e98000000                 mov        r9, qword ptr [rsi + 0x98]
00192 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
0019a 837e0812                       cmp        dword ptr [rsi + 8], 0x12
0019e 0f8698090000                   jbe        0x7fb18c39f03c
001a4 4c8b8ea0000000                 mov        r9, qword ptr [rsi + 0xa0]
001ab 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
001b3 837e0813                       cmp        dword ptr [rsi + 8], 0x13
001b7 0f8691090000                   jbe        0x7fb18c39f04e
001bd 4c8b8ea8000000                 mov        r9, qword ptr [rsi + 0xa8]
001c4 4c898c24a0000000               mov        qword ptr [rsp + 0xa0], r9
001cc 837e0814                       cmp        dword ptr [rsi + 8], 0x14
001d0 0f868a090000                   jbe        0x7fb18c39f060
001d6 4c8b8eb0000000                 mov        r9, qword ptr [rsi + 0xb0]
001dd 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
001e5 837e0815                       cmp        dword ptr [rsi + 8], 0x15
001e9 0f8683090000                   jbe        0x7fb18c39f072
001ef 4c8b8eb8000000                 mov        r9, qword ptr [rsi + 0xb8]
001f6 4c898c24b0000000               mov        qword ptr [rsp + 0xb0], r9
001fe 837e0816                       cmp        dword ptr [rsi + 8], 0x16
00202 0f867c090000                   jbe        0x7fb18c39f084
00208 4c8b8ec0000000                 mov        r9, qword ptr [rsi + 0xc0]
0020f 4c898c24b8000000               mov        qword ptr [rsp + 0xb8], r9
00217 837e0817                       cmp        dword ptr [rsi + 8], 0x17
0021b 0f8675090000                   jbe        0x7fb18c39f096
00221 4c8b8ec8000000                 mov        r9, qword ptr [rsi + 0xc8]
00228 488bf7                         mov        rsi, rdi
0022b 4833f3                         xor        rsi, rbx
0022e 4833f0                         xor        rsi, rax
00231 4933f3                         xor        rsi, r11
00234 4933f5                         xor        rsi, r13
00237 4933f6                         xor        rsi, r14
0023a 4833f2                         xor        rsi, rdx
0023d 4833f1                         xor        rsi, rcx
00240 4933f0                         xor        rsi, r8
00243 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
00248 4833f7                         xor        rsi, rdi
0024b 488b7c2458                     mov        rdi, qword ptr [rsp + 0x58]
00250 4833f7                         xor        rsi, rdi
00253 488b7c2460                     mov        rdi, qword ptr [rsp + 0x60]
00258 4833f7                         xor        rsi, rdi
0025b 488b7c2468                     mov        rdi, qword ptr [rsp + 0x68]
00260 4833f7                         xor        rsi, rdi
00263 488b7c2470                     mov        rdi, qword ptr [rsp + 0x70]
00268 4833f7                         xor        rsi, rdi
0026b 488b7c2478                     mov        rdi, qword ptr [rsp + 0x78]
00270 4833f7                         xor        rsi, rdi
00273 488bbc2480000000               mov        rdi, qword ptr [rsp + 0x80]
0027b 4833f7                         xor        rsi, rdi
0027e 488bbc2488000000               mov        rdi, qword ptr [rsp + 0x88]
00286 4833f7                         xor        rsi, rdi
00289 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
00291 4833f7                         xor        rsi, rdi
00294 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
0029c 4833f7                         xor        rsi, rdi
0029f 488bbc24a0000000               mov        rdi, qword ptr [rsp + 0xa0]
002a7 4833f7                         xor        rsi, rdi
002aa 488bbc24a8000000               mov        rdi, qword ptr [rsp + 0xa8]
002b2 4833f7                         xor        rsi, rdi
002b5 488bbc24b0000000               mov        rdi, qword ptr [rsp + 0xb0]
002bd 4833f7                         xor        rsi, rdi
002c0 488bbc24b8000000               mov        rdi, qword ptr [rsp + 0xb8]
002c8 4833f7                         xor        rsi, rdi
002cb 4933f1                         xor        rsi, r9
002ce 8bf6                           mov        esi, esi
002d0 81e6ff030000                   and        esi, 0x3ff
002d6 89b424c8000000                 mov        dword ptr [rsp + 0xc8], esi
002dd 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
002e7 488386a800000001               add        qword ptr [rsi + 0xa8], 1
002ef 4c898c2410010000               mov        qword ptr [rsp + 0x110], r9
002f7 4c89842408010000               mov        qword ptr [rsp + 0x108], r8
002ff 48898c2400010000               mov        qword ptr [rsp + 0x100], rcx
00307 48899424f8000000               mov        qword ptr [rsp + 0xf8], rdx
0030f 4c89b424f0000000               mov        qword ptr [rsp + 0xf0], r14
00317 4c89ac24e8000000               mov        qword ptr [rsp + 0xe8], r13
0031f 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
00327 48898424d8000000               mov        qword ptr [rsp + 0xd8], rax
0032f 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
00337 e824205707                     call       0x7fb193910860
0033c 0f1f840034040000               nop        dword ptr [rax + rax + 0x434]
00344 8bb424c8000000                 mov        esi, dword ptr [rsp + 0xc8]
0034b 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00350 3b7208                         cmp        esi, dword ptr [rdx + 8]
00353 0f8359080000                   jae        0x7fb18c39f0b2
00359 4863fe                         movsxd     rdi, esi
0035c 8b54ba0c                       mov        edx, dword ptr [rdx + rdi*4 + 0xc]
00360 488b4c2438                     mov        rcx, qword ptr [rsp + 0x38]
00365 3b7108                         cmp        esi, dword ptr [rcx + 8]
00368 0f835c080000                   jae        0x7fb18c39f0ca
0036e 4863fe                         movsxd     rdi, esi
00371 8b7cb90c                       mov        edi, dword ptr [rcx + rdi*4 + 0xc]
00375 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
0037a 413b7008                       cmp        esi, dword ptr [r8 + 8]
0037e 0f835e080000                   jae        0x7fb18c39f0e2
00384 4863de                         movsxd     rbx, esi
00387 418b5c980c                     mov        ebx, dword ptr [r8 + rbx*4 + 0xc]
0038c 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
00391 413b7108                       cmp        esi, dword ptr [r9 + 8]
00395 0f835f080000                   jae        0x7fb18c39f0fa
0039b 4863f6                         movsxd     rsi, esi
0039e 418b74b10c                     mov        esi, dword ptr [r9 + rsi*4 + 0xc]
003a3 48b84010406cb17f0000           movabs     rax, 0x7fb16c401040
003ad 488380b800000001               add        qword ptr [rax + 0xb8], 1
003b5 4863d2                         movsxd     rdx, edx
003b8 4863ff                         movsxd     rdi, edi
003bb 4803d7                         add        rdx, rdi
003be 4863db                         movsxd     rbx, ebx
003c1 4803d3                         add        rdx, rbx
003c4 4863f6                         movsxd     rsi, esi
003c7 4803d6                         add        rdx, rsi
003ca 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
003d2 4889942418010000               mov        qword ptr [rsp + 0x118], rdx
003da ba01000000                     mov        edx, 1
003df e87c1f5707                     call       0x7fb193910860
003e4 0f1f8400dc040001               nop        dword ptr [rax + rax + 0x10004dc]
003ec 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
003f6 488386c800000001               add        qword ptr [rsi + 0xc8], 1
003fe 488b942418010000               mov        rdx, qword ptr [rsp + 0x118]
00406 4803d0                         add        rdx, rax
00409 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00411 4889942420010000               mov        qword ptr [rsp + 0x120], rdx
00419 ba02000000                     mov        edx, 2
0041e 90                             nop        
0041f e83c1f5707                     call       0x7fb193910860
00424 0f1f84001c050002               nop        dword ptr [rax + rax + 0x200051c]
0042c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00436 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0043e 488b942420010000               mov        rdx, qword ptr [rsp + 0x120]
00446 4803d0                         add        rdx, rax
00449 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00451 4889942428010000               mov        qword ptr [rsp + 0x128], rdx
00459 ba03000000                     mov        edx, 3
0045e 90                             nop        
0045f e8fc1e5707                     call       0x7fb193910860
00464 0f1f84005c050003               nop        dword ptr [rax + rax + 0x300055c]
0046c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00476 488386e800000001               add        qword ptr [rsi + 0xe8], 1
0047e 488b942428010000               mov        rdx, qword ptr [rsp + 0x128]
00486 4803d0                         add        rdx, rax
00489 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00491 4889942430010000               mov        qword ptr [rsp + 0x130], rdx
00499 ba04000000                     mov        edx, 4
0049e 90                             nop        
0049f e8bc1e5707                     call       0x7fb193910860
004a4 0f1f84009c050004               nop        dword ptr [rax + rax + 0x400059c]
004ac 488b942430010000               mov        rdx, qword ptr [rsp + 0x130]
004b4 4803d0                         add        rdx, rax
004b7 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
004c1 488386f800000001               add        qword ptr [rsi + 0xf8], 1
004c9 488bb424e8000000               mov        rsi, qword ptr [rsp + 0xe8]
004d1 4889942438010000               mov        qword ptr [rsp + 0x138], rdx
004d9 ba05000000                     mov        edx, 5
004de 90                             nop        
004df e87c1e5707                     call       0x7fb193910860
004e4 0f1f8400dc050005               nop        dword ptr [rax + rax + 0x50005dc]
004ec 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
004f6 4883860801000001               add        qword ptr [rsi + 0x108], 1
004fe 488b942438010000               mov        rdx, qword ptr [rsp + 0x138]
00506 4803d0                         add        rdx, rax
00509 488bb424f0000000               mov        rsi, qword ptr [rsp + 0xf0]
00511 4889942440010000               mov        qword ptr [rsp + 0x140], rdx
00519 ba06000000                     mov        edx, 6
0051e 90                             nop        
0051f e83c1e5707                     call       0x7fb193910860
00524 0f1f84001c060006               nop        dword ptr [rax + rax + 0x600061c]
0052c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00536 4883861801000001               add        qword ptr [rsi + 0x118], 1
0053e 488b942440010000               mov        rdx, qword ptr [rsp + 0x140]
00546 4803d0                         add        rdx, rax
00549 488bb424f8000000               mov        rsi, qword ptr [rsp + 0xf8]
00551 4889942448010000               mov        qword ptr [rsp + 0x148], rdx
00559 ba07000000                     mov        edx, 7
0055e 90                             nop        
0055f e8fc1d5707                     call       0x7fb193910860
00564 0f1f84005c060007               nop        dword ptr [rax + rax + 0x700065c]
0056c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00576 4883862801000001               add        qword ptr [rsi + 0x128], 1
0057e 488b942448010000               mov        rdx, qword ptr [rsp + 0x148]
00586 4803d0                         add        rdx, rax
00589 488bb42400010000               mov        rsi, qword ptr [rsp + 0x100]
00591 4889942450010000               mov        qword ptr [rsp + 0x150], rdx
00599 ba08000000                     mov        edx, 8
0059e 90                             nop        
0059f e8bc1d5707                     call       0x7fb193910860
005a4 0f1f84009c060008               nop        dword ptr [rax + rax + 0x800069c]
005ac 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
005b6 4883863801000001               add        qword ptr [rsi + 0x138], 1
005be 488b942450010000               mov        rdx, qword ptr [rsp + 0x150]
005c6 4803d0                         add        rdx, rax
005c9 488bb42408010000               mov        rsi, qword ptr [rsp + 0x108]
005d1 4889942458010000               mov        qword ptr [rsp + 0x158], rdx
005d9 ba09000000                     mov        edx, 9
005de 90                             nop        
005df e87c1d5707                     call       0x7fb193910860
005e4 0f1f8400dc060009               nop        dword ptr [rax + rax + 0x90006dc]
005ec 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
005f6 4883864801000001               add        qword ptr [rsi + 0x148], 1
005fe 488b942458010000               mov        rdx, qword ptr [rsp + 0x158]
00606 4803d0                         add        rdx, rax
00609 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
0060e 4889942460010000               mov        qword ptr [rsp + 0x160], rdx
00616 ba0a000000                     mov        edx, 0xa
0061b 0f1f4000                       nop        dword ptr [rax]
0061f e83c1d5707                     call       0x7fb193910860
00624 0f1f84001c07000a               nop        dword ptr [rax + rax + 0xa00071c]
0062c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00636 4883865801000001               add        qword ptr [rsi + 0x158], 1
0063e 488b942460010000               mov        rdx, qword ptr [rsp + 0x160]
00646 4803d0                         add        rdx, rax
00649 488b742458                     mov        rsi, qword ptr [rsp + 0x58]
0064e 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
00656 ba0b000000                     mov        edx, 0xb
0065b 0f1f4000                       nop        dword ptr [rax]
0065f e8fc1c5707                     call       0x7fb193910860
00664 0f1f84005c07000b               nop        dword ptr [rax + rax + 0xb00075c]
0066c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00676 4883866801000001               add        qword ptr [rsi + 0x168], 1
0067e 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
00686 4803d0                         add        rdx, rax
00689 488b742460                     mov        rsi, qword ptr [rsp + 0x60]
0068e 4889942470010000               mov        qword ptr [rsp + 0x170], rdx
00696 ba0c000000                     mov        edx, 0xc
0069b 0f1f4000                       nop        dword ptr [rax]
0069f e8bc1c5707                     call       0x7fb193910860
006a4 0f1f84009c07000c               nop        dword ptr [rax + rax + 0xc00079c]
006ac 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
006b6 4883867801000001               add        qword ptr [rsi + 0x178], 1
006be 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
006c6 4803d0                         add        rdx, rax
006c9 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
006ce 4889942478010000               mov        qword ptr [rsp + 0x178], rdx
006d6 ba0d000000                     mov        edx, 0xd
006db 0f1f4000                       nop        dword ptr [rax]
006df e87c1c5707                     call       0x7fb193910860
006e4 0f1f8400dc07000d               nop        dword ptr [rax + rax + 0xd0007dc]
006ec 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
006f6 4883868801000001               add        qword ptr [rsi + 0x188], 1
006fe 488b942478010000               mov        rdx, qword ptr [rsp + 0x178]
00706 4803d0                         add        rdx, rax
00709 488b742470                     mov        rsi, qword ptr [rsp + 0x70]
0070e 4889942480010000               mov        qword ptr [rsp + 0x180], rdx
00716 ba0e000000                     mov        edx, 0xe
0071b 0f1f4000                       nop        dword ptr [rax]
0071f e83c1c5707                     call       0x7fb193910860
00724 0f1f84001c08000e               nop        dword ptr [rax + rax + 0xe00081c]
0072c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00736 4883869801000001               add        qword ptr [rsi + 0x198], 1
0073e 488b942480010000               mov        rdx, qword ptr [rsp + 0x180]
00746 4803d0                         add        rdx, rax
00749 488b742478                     mov        rsi, qword ptr [rsp + 0x78]
0074e 4889942488010000               mov        qword ptr [rsp + 0x188], rdx
00756 ba0f000000                     mov        edx, 0xf
0075b 0f1f4000                       nop        dword ptr [rax]
0075f e8fc1b5707                     call       0x7fb193910860
00764 0f1f84005c08000f               nop        dword ptr [rax + rax + 0xf00085c]
0076c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00776 488386a801000001               add        qword ptr [rsi + 0x1a8], 1
0077e 488b942488010000               mov        rdx, qword ptr [rsp + 0x188]
00786 4803d0                         add        rdx, rax
00789 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00791 4889942490010000               mov        qword ptr [rsp + 0x190], rdx
00799 ba10000000                     mov        edx, 0x10
0079e 90                             nop        
0079f e8bc1b5707                     call       0x7fb193910860
007a4 0f1f84009c080010               nop        dword ptr [rax + rax + 0x1000089c]
007ac 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
007b6 488386b801000001               add        qword ptr [rsi + 0x1b8], 1
007be 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
007c6 4803d0                         add        rdx, rax
007c9 488bb42488000000               mov        rsi, qword ptr [rsp + 0x88]
007d1 4889942498010000               mov        qword ptr [rsp + 0x198], rdx
007d9 ba11000000                     mov        edx, 0x11
007de 90                             nop        
007df e87c1b5707                     call       0x7fb193910860
007e4 0f1f8400dc080011               nop        dword ptr [rax + rax + 0x110008dc]
007ec 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
007f6 488386c801000001               add        qword ptr [rsi + 0x1c8], 1
007fe 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
00806 4803d0                         add        rdx, rax
00809 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00811 48899424a0010000               mov        qword ptr [rsp + 0x1a0], rdx
00819 ba12000000                     mov        edx, 0x12
0081e 90                             nop        
0081f e83c1b5707                     call       0x7fb193910860
00824 0f1f84001c090012               nop        dword ptr [rax + rax + 0x1200091c]
0082c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00836 488386d801000001               add        qword ptr [rsi + 0x1d8], 1
0083e 488b9424a0010000               mov        rdx, qword ptr [rsp + 0x1a0]
00846 4803d0                         add        rdx, rax
00849 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
00851 48899424a8010000               mov        qword ptr [rsp + 0x1a8], rdx
00859 ba13000000                     mov        edx, 0x13
0085e 90                             nop        
0085f e8fc1a5707                     call       0x7fb193910860
00864 0f1f84005c090013               nop        dword ptr [rax + rax + 0x1300095c]
0086c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00876 488386e801000001               add        qword ptr [rsi + 0x1e8], 1
0087e 488b9424a8010000               mov        rdx, qword ptr [rsp + 0x1a8]
00886 4803d0                         add        rdx, rax
00889 488bb424a0000000               mov        rsi, qword ptr [rsp + 0xa0]
00891 48899424b0010000               mov        qword ptr [rsp + 0x1b0], rdx
00899 ba14000000                     mov        edx, 0x14
0089e 90                             nop        
0089f e8bc1a5707                     call       0x7fb193910860
008a4 0f1f84009c090014               nop        dword ptr [rax + rax + 0x1400099c]
008ac 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
008b6 488386f801000001               add        qword ptr [rsi + 0x1f8], 1
008be 488b9424b0010000               mov        rdx, qword ptr [rsp + 0x1b0]
008c6 4803d0                         add        rdx, rax
008c9 488bb424a8000000               mov        rsi, qword ptr [rsp + 0xa8]
008d1 48899424b8010000               mov        qword ptr [rsp + 0x1b8], rdx
008d9 ba15000000                     mov        edx, 0x15
008de 90                             nop        
008df e87c1a5707                     call       0x7fb193910860
008e4 0f1f8400dc090015               nop        dword ptr [rax + rax + 0x150009dc]
008ec 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
008f6 4883860802000001               add        qword ptr [rsi + 0x208], 1
008fe 488b9424b8010000               mov        rdx, qword ptr [rsp + 0x1b8]
00906 4803d0                         add        rdx, rax
00909 488bb424b0000000               mov        rsi, qword ptr [rsp + 0xb0]
00911 48899424c0010000               mov        qword ptr [rsp + 0x1c0], rdx
00919 ba16000000                     mov        edx, 0x16
0091e 90                             nop        
0091f e83c1a5707                     call       0x7fb193910860
00924 0f1f84001c0a0016               nop        dword ptr [rax + rax + 0x16000a1c]
0092c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00936 4883861802000001               add        qword ptr [rsi + 0x218], 1
0093e 488b9424c0010000               mov        rdx, qword ptr [rsp + 0x1c0]
00946 4803d0                         add        rdx, rax
00949 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
00951 48899424c8010000               mov        qword ptr [rsp + 0x1c8], rdx
00959 ba17000000                     mov        edx, 0x17
0095e 90                             nop        
0095f e8fc195707                     call       0x7fb193910860
00964 0f1f84005c0a0017               nop        dword ptr [rax + rax + 0x17000a5c]
0096c 48be4010406cb17f0000           movabs     rsi, 0x7fb16c401040
00976 4883862802000001               add        qword ptr [rsi + 0x228], 1
0097e 488b9424c8010000               mov        rdx, qword ptr [rsp + 0x1c8]
00986 4803d0                         add        rdx, rax
00989 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00991 48899424d0010000               mov        qword ptr [rsp + 0x1d0], rdx
00999 ba18000000                     mov        edx, 0x18
0099e 90                             nop        
0099f e8bc195707                     call       0x7fb193910860
009a4 0f1f84009c0a0018               nop        dword ptr [rax + rax + 0x18000a9c]
009ac 488b9424d0010000               mov        rdx, qword ptr [rsp + 0x1d0]
009b4 4803d0                         add        rdx, rax
009b7 488bc2                         mov        rax, rdx
009ba 4881c4e0010000                 add        rsp, 0x1e0
009c1 5d                             pop        rbp
009c2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
009c6 0f873c020000                   ja         0x7fb18c39f108
009cc c3                             ret        
009cd 49ba5808406cb17f0000           movabs     r10, 0x7fb16c400858
009d7 4c89542408                     mov        qword ptr [rsp + 8], r10
009dc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
009e4 e877546507                     call       0x7fb1939f4360
009e9 e966f6ffff                     jmp        0x7fb18c39e554
009ee e8edf46407                     call       0x7fb1939ee3e0
009f3 e8e8f46407                     call       0x7fb1939ee3e0
009f8 48c7042400000000               mov        qword ptr [rsp], 0
00a00 4889742408                     mov        qword ptr [rsp + 8], rsi
00a05 e8d6eb6407                     call       0x7fb1939edae0
00a0a 48c7042401000000               mov        qword ptr [rsp], 1
00a12 4889742408                     mov        qword ptr [rsp + 8], rsi
00a17 e8c4eb6407                     call       0x7fb1939edae0
00a1c 48c7042402000000               mov        qword ptr [rsp], 2
00a24 4889742408                     mov        qword ptr [rsp + 8], rsi
00a29 e8b2eb6407                     call       0x7fb1939edae0
00a2e 48c7042403000000               mov        qword ptr [rsp], 3
00a36 4889742408                     mov        qword ptr [rsp + 8], rsi
00a3b e8a0eb6407                     call       0x7fb1939edae0
00a40 48c7042404000000               mov        qword ptr [rsp], 4
00a48 4889742408                     mov        qword ptr [rsp + 8], rsi
00a4d e88eeb6407                     call       0x7fb1939edae0
00a52 48c7042405000000               mov        qword ptr [rsp], 5
00a5a 4889742408                     mov        qword ptr [rsp + 8], rsi
00a5f e87ceb6407                     call       0x7fb1939edae0
00a64 48c7042406000000               mov        qword ptr [rsp], 6
00a6c 4889742408                     mov        qword ptr [rsp + 8], rsi
00a71 e86aeb6407                     call       0x7fb1939edae0
00a76 48c7042407000000               mov        qword ptr [rsp], 7
00a7e 4889742408                     mov        qword ptr [rsp + 8], rsi
00a83 e858eb6407                     call       0x7fb1939edae0
00a88 48c7042408000000               mov        qword ptr [rsp], 8
00a90 4889742408                     mov        qword ptr [rsp + 8], rsi
00a95 e846eb6407                     call       0x7fb1939edae0
00a9a 48c7042409000000               mov        qword ptr [rsp], 9
00aa2 4889742408                     mov        qword ptr [rsp + 8], rsi
00aa7 e834eb6407                     call       0x7fb1939edae0
00aac 48c704240a000000               mov        qword ptr [rsp], 0xa
00ab4 4889742408                     mov        qword ptr [rsp + 8], rsi
00ab9 e822eb6407                     call       0x7fb1939edae0
00abe 48c704240b000000               mov        qword ptr [rsp], 0xb
00ac6 4889742408                     mov        qword ptr [rsp + 8], rsi
00acb e810eb6407                     call       0x7fb1939edae0
00ad0 48c704240c000000               mov        qword ptr [rsp], 0xc
00ad8 4889742408                     mov        qword ptr [rsp + 8], rsi
00add e8feea6407                     call       0x7fb1939edae0
00ae2 48c704240d000000               mov        qword ptr [rsp], 0xd
00aea 4889742408                     mov        qword ptr [rsp + 8], rsi
00aef e8ecea6407                     call       0x7fb1939edae0
00af4 48c704240e000000               mov        qword ptr [rsp], 0xe
00afc 4889742408                     mov        qword ptr [rsp + 8], rsi
00b01 e8daea6407                     call       0x7fb1939edae0
00b06 48c704240f000000               mov        qword ptr [rsp], 0xf
00b0e 4889742408                     mov        qword ptr [rsp + 8], rsi
00b13 e8c8ea6407                     call       0x7fb1939edae0
00b18 48c7042410000000               mov        qword ptr [rsp], 0x10
00b20 4889742408                     mov        qword ptr [rsp + 8], rsi
00b25 e8b6ea6407                     call       0x7fb1939edae0
00b2a 48c7042411000000               mov        qword ptr [rsp], 0x11
00b32 4889742408                     mov        qword ptr [rsp + 8], rsi
00b37 e8a4ea6407                     call       0x7fb1939edae0
00b3c 48c7042412000000               mov        qword ptr [rsp], 0x12
00b44 4889742408                     mov        qword ptr [rsp + 8], rsi
00b49 e892ea6407                     call       0x7fb1939edae0
00b4e 48c7042413000000               mov        qword ptr [rsp], 0x13
00b56 4889742408                     mov        qword ptr [rsp + 8], rsi
00b5b e880ea6407                     call       0x7fb1939edae0
00b60 48c7042414000000               mov        qword ptr [rsp], 0x14
00b68 4889742408                     mov        qword ptr [rsp + 8], rsi
00b6d e86eea6407                     call       0x7fb1939edae0
00b72 48c7042415000000               mov        qword ptr [rsp], 0x15
00b7a 4889742408                     mov        qword ptr [rsp + 8], rsi
00b7f e85cea6407                     call       0x7fb1939edae0
00b84 48c7042416000000               mov        qword ptr [rsp], 0x16
00b8c 4889742408                     mov        qword ptr [rsp + 8], rsi
00b91 e84aea6407                     call       0x7fb1939edae0
00b96 48c7042417000000               mov        qword ptr [rsp], 0x17
00b9e 4889742408                     mov        qword ptr [rsp + 8], rsi
00ba3 e838ea6407                     call       0x7fb1939edae0
00ba8 e833f36407                     call       0x7fb1939ee3e0
00bad e82ef36407                     call       0x7fb1939ee3e0
00bb2 48893424                       mov        qword ptr [rsp], rsi
00bb6 4889542408                     mov        qword ptr [rsp + 8], rdx
00bbb e820ea6407                     call       0x7fb1939edae0
00bc0 e81bf36407                     call       0x7fb1939ee3e0
00bc5 e816f36407                     call       0x7fb1939ee3e0
00bca 48893424                       mov        qword ptr [rsp], rsi
00bce 48894c2408                     mov        qword ptr [rsp + 8], rcx
00bd3 e808ea6407                     call       0x7fb1939edae0
00bd8 e803f36407                     call       0x7fb1939ee3e0
00bdd e8fef26407                     call       0x7fb1939ee3e0
00be2 48893424                       mov        qword ptr [rsp], rsi
00be6 4c89442408                     mov        qword ptr [rsp + 8], r8
00beb e8f0e96407                     call       0x7fb1939edae0
00bf0 e8ebf26407                     call       0x7fb1939ee3e0
00bf5 e8e6f26407                     call       0x7fb1939ee3e0
00bfa 48893424                       mov        qword ptr [rsp], rsi
00bfe 4c894c2408                     mov        qword ptr [rsp + 8], r9
00c03 e8d8e96407                     call       0x7fb1939edae0
00c08 49bac2ee398cb17f0000           movabs     r10, 0x7fb18c39eec2
00c12 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00c19 e9c23d5707                     jmp        0x7fb193912ee0
00c1e 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
00c25 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
00c30 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
00c3b 4881c4e0010000                 add        rsp, 0x1e0
00c42 5d                             pop        rbp
00c43 e998e36407                     jmp        0x7fb1939ed4e0
