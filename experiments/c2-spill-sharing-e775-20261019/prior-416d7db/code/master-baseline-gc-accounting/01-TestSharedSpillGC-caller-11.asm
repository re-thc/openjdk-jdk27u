00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4883ec40                       sub        rsp, 0x40
0000c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00014 0f85f8040000                   jne        0x7fd590099212
0001a 448bc9                         mov        r9d, ecx
0001d 4c8bc2                         mov        r8, rdx
00020 4c8bde                         mov        r11, rsi
00023 448b5604                       mov        r10d, dword ptr [rsi + 4]
00027 4183fa02                       cmp        r10d, 2
0002b 0f86cd010000                   jbe        0x7fd590098efe
00031 488bee                         mov        rbp, rsi
00034 448b5608                       mov        r10d, dword ptr [rsi + 8]
00038 8b4e0c                         mov        ecx, dword ptr [rsi + 0xc]
0003b 8b5e10                         mov        ebx, dword ptr [rsi + 0x10]
0003e 4d8bda                         mov        r11, r10
00041 4c3b2550008613                 cmp        r12, qword ptr [rip + 0x13860050]
00048 0f8414000000                   je         0x7fd590098d62
0004e 48bf28c29ca1d57f0000           movabs     rdi, 0x7fd5a19cc228
00058 4883e4f0                       and        rsp, 0xfffffffffffffff0
0005c e8ffe7c212                     call       0x7fd5a2cc7560
00061 f4                             hlt        
00062 4152                           push       r10
00064 50                             push       rax
00065 4153                           push       r11
00067 49ba701b0b70d57f0000           movabs     r10, 0x7fd5700b1b70
00071 4152                           push       r10
00073 488b0526048b13                 mov        rax, qword ptr [rip + 0x138b0426]
0007a ffd0                           call       rax
0007c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00081 44891424                       mov        dword ptr [rsp], r10d
00085 4c8bd3                         mov        r10, rbx
00088 4c3b2509008613                 cmp        r12, qword ptr [rip + 0x13860009]
0008f 0f8414000000                   je         0x7fd590098da9
00095 48bf28c29ca1d57f0000           movabs     rdi, 0x7fd5a19cc228
0009f 4883e4f0                       and        rsp, 0xfffffffffffffff0
000a3 e8b8e7c212                     call       0x7fd5a2cc7560
000a8 f4                             hlt        
000a9 4152                           push       r10
000ab 50                             push       rax
000ac 4152                           push       r10
000ae 49bad01d0b70d57f0000           movabs     r10, 0x7fd5700b1dd0
000b8 4152                           push       r10
000ba 488b05df038b13                 mov        rax, qword ptr [rip + 0x138b03df]
000c1 ffd0                           call       rax
000c3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
000c8 895c2408                       mov        dword ptr [rsp + 8], ebx
000cc 4c8bd1                         mov        r10, rcx
000cf 4c3b25c2ff8513                 cmp        r12, qword ptr [rip + 0x1385ffc2]
000d6 0f8414000000                   je         0x7fd590098df0
000dc 48bf28c29ca1d57f0000           movabs     rdi, 0x7fd5a19cc228
000e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
000ea e871e7c212                     call       0x7fd5a2cc7560
000ef f4                             hlt        
000f0 4152                           push       r10
000f2 50                             push       rax
000f3 4152                           push       r10
000f5 49bad01d0b70d57f0000           movabs     r10, 0x7fd5700b1dd0
000ff 4152                           push       r10
00101 488b0598038b13                 mov        rax, qword ptr [rip + 0x138b0398]
00108 ffd0                           call       rax
0010a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0010f 894c2404                       mov        dword ptr [rsp + 4], ecx
00113 498bf3                         mov        rsi, r11
00116 498bd2                         mov        rdx, r10
00119 488b4c2418                     mov        rcx, qword ptr [rsp + 0x18]
0011e 90                             nop        
0011f e83c3e0700                     call       0x7fd59010cc60
00124 0f1f84001c020000               nop        dword ptr [rax + rax + 0x21c]
0012c 4889442410                     mov        qword ptr [rsp + 0x10], rax
00131 4c8bd5                         mov        r10, rbp
00134 418b6a08                       mov        ebp, dword ptr [r10 + 8]
00138 448b1c24                       mov        r11d, dword ptr [rsp]
0013c 443bdd                         cmp        r11d, ebp
0013f 0f857f010000                   jne        0x7fd590098fc4
00145 418b6a0c                       mov        ebp, dword ptr [r10 + 0xc]
00149 8b4c2404                       mov        ecx, dword ptr [rsp + 4]
0014d 3bcd                           cmp        ecx, ebp
0014f 0f8597010000                   jne        0x7fd590098fec
00155 418b6a10                       mov        ebp, dword ptr [r10 + 0x10]
00159 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0015e 443bcd                         cmp        r9d, ebp
00161 0f85ad010000                   jne        0x7fd590099014
00167 418b6b04                       mov        ebp, dword ptr [r11 + 4]
0016b 448b5504                       mov        r10d, dword ptr [rbp + 4]
0016f 4183fa0d                       cmp        r10d, 0xd
00173 0f86bb000000                   jbe        0x7fd590098f34
00179 440fbe4515                     movsx      r8d, byte ptr [rbp + 0x15]
0017e 4d8b5308                       mov        r10, qword ptr [r11 + 8]
00182 458bda                         mov        r11d, r10d
00185 410fbeeb                       movsx      ebp, r11b
00189 443bc5                         cmp        r8d, ebp
0018c 0f85ae010000                   jne        0x7fd590099040
00192 8b6904                         mov        ebp, dword ptr [rcx + 4]
00195 448b5d04                       mov        r11d, dword ptr [rbp + 4]
00199 4933c2                         xor        rax, r10
0019c 4183fb0d                       cmp        r11d, 0xd
001a0 0f86c2000000                   jbe        0x7fd590098f68
001a6 0fbe5d15                       movsx      ebx, byte ptr [rbp + 0x15]
001aa 4c8b5108                       mov        r10, qword ptr [rcx + 8]
001ae 458bc2                         mov        r8d, r10d
001b1 410fbee8                       movsx      ebp, r8b
001b5 3bdd                           cmp        ebx, ebp
001b7 0f85b7010000                   jne        0x7fd590099074
001bd 418b6904                       mov        ebp, dword ptr [r9 + 4]
001c1 448b5d04                       mov        r11d, dword ptr [rbp + 4]
001c5 4933c2                         xor        rax, r10
001c8 4183fb0d                       cmp        r11d, 0xd
001cc 0f86c6000000                   jbe        0x7fd590098f98
001d2 440fbe5d15                     movsx      r11d, byte ptr [rbp + 0x15]
001d7 4d8b5108                       mov        r10, qword ptr [r9 + 8]
001db 458bc2                         mov        r8d, r10d
001de 410fbee8                       movsx      ebp, r8b
001e2 443bdd                         cmp        r11d, ebp
001e5 0f85bd010000                   jne        0x7fd5900990a8
001eb 4933c2                         xor        rax, r10
001ee 4883c440                       add        rsp, 0x40
001f2 5d                             pop        rbp
001f3 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001f7 0f87ff020000                   ja         0x7fd5900991fc
001fd c3                             ret        
001fe bee4ffffff                     mov        esi, 0xffffffe4
00203 48891424                       mov        qword ptr [rsp], rdx
00207 894c2408                       mov        dword ptr [rsp + 8], ecx
0020b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00210 90                             nop        
00211 90                             nop        
00212 90                             nop        
00213 e8c8850100                     call       0x7fd5900b14e0
00218 0f1f840010030001               nop        dword ptr [rax + rax + 0x1000310]
00220 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0022a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0022e e82de6c212                     call       0x7fd5a2cc7560
00233 f4                             hlt        
00234 bee4ffffff                     mov        esi, 0xffffffe4
00239 890c24                         mov        dword ptr [rsp], ecx
0023c 44894c2404                     mov        dword ptr [rsp + 4], r9d
00241 44895c2408                     mov        dword ptr [rsp + 8], r11d
00246 90                             nop        
00247 e894850100                     call       0x7fd5900b14e0
0024c 0f1f840044030002               nop        dword ptr [rax + rax + 0x2000344]
00254 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0025e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00262 e8f9e5c212                     call       0x7fd5a2cc7560
00267 f4                             hlt        
00268 bee4ffffff                     mov        esi, 0xffffffe4
0026d 44890c24                       mov        dword ptr [rsp], r9d
00271 4889442408                     mov        qword ptr [rsp + 8], rax
00276 90                             nop        
00277 e864850100                     call       0x7fd5900b14e0
0027c 0f1f840074030003               nop        dword ptr [rax + rax + 0x3000374]
00284 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0028e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00292 e8c9e5c212                     call       0x7fd5a2cc7560
00297 f4                             hlt        
00298 bee4ffffff                     mov        esi, 0xffffffe4
0029d 48890424                       mov        qword ptr [rsp], rax
002a1 90                             nop        
002a2 90                             nop        
002a3 e838850100                     call       0x7fd5900b14e0
002a8 0f1f8400a0030004               nop        dword ptr [rax + rax + 0x40003a0]
002b0 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
002ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
002be e89de5c212                     call       0x7fd5a2cc7560
002c3 f4                             hlt        
002c4 be45ffffff                     mov        esi, 0xffffff45
002c9 90                             nop        
002ca 90                             nop        
002cb e810850100                     call       0x7fd5900b14e0
002d0 0f1f8400c8030005               nop        dword ptr [rax + rax + 0x50003c8]
002d8 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
002e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
002e6 e875e5c212                     call       0x7fd5a2cc7560
002eb f4                             hlt        
002ec be45ffffff                     mov        esi, 0xffffff45
002f1 90                             nop        
002f2 90                             nop        
002f3 e8e8840100                     call       0x7fd5900b14e0
002f8 0f1f8400f0030006               nop        dword ptr [rax + rax + 0x60003f0]
00300 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0030a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0030e e84de5c212                     call       0x7fd5a2cc7560
00313 f4                             hlt        
00314 be45ffffff                     mov        esi, 0xffffff45
00319 44894c2404                     mov        dword ptr [rsp + 4], r9d
0031e 90                             nop        
0031f e8bc840100                     call       0x7fd5900b14e0
00324 0f1f84001c040007               nop        dword ptr [rax + rax + 0x700041c]
0032c 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
00336 4883e4f0                       and        rsp, 0xfffffffffffffff0
0033a e821e5c212                     call       0x7fd5a2cc7560
0033f f4                             hlt        
00340 be45ffffff                     mov        esi, 0xffffff45
00345 890c24                         mov        dword ptr [rsp], ecx
00348 44894c2404                     mov        dword ptr [rsp + 4], r9d
0034d 4489442408                     mov        dword ptr [rsp + 8], r8d
00352 90                             nop        
00353 e888840100                     call       0x7fd5900b14e0
00358 0f1f840050040008               nop        dword ptr [rax + rax + 0x8000450]
00360 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0036a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0036e e8ede4c212                     call       0x7fd5a2cc7560
00373 f4                             hlt        
00374 be45ffffff                     mov        esi, 0xffffff45
00379 44890c24                       mov        dword ptr [rsp], r9d
0037d 4889442408                     mov        qword ptr [rsp + 8], rax
00382 895c2404                       mov        dword ptr [rsp + 4], ebx
00386 90                             nop        
00387 e854840100                     call       0x7fd5900b14e0
0038c 0f1f840084040009               nop        dword ptr [rax + rax + 0x9000484]
00394 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0039e 4883e4f0                       and        rsp, 0xfffffffffffffff0
003a2 e8b9e4c212                     call       0x7fd5a2cc7560
003a7 f4                             hlt        
003a8 be45ffffff                     mov        esi, 0xffffff45
003ad 48890424                       mov        qword ptr [rsp], rax
003b1 44895c2408                     mov        dword ptr [rsp + 8], r11d
003b6 90                             nop        
003b7 e824840100                     call       0x7fd5900b14e0
003bc 0f1f8400b404000a               nop        dword ptr [rax + rax + 0xa0004b4]
003c4 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
003ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
003d2 e889e4c212                     call       0x7fd5a2cc7560
003d7 f4                             hlt        
003d8 488bf0                         mov        rsi, rax
003db 4883c440                       add        rsp, 0x40
003df 5d                             pop        rbp
003e0 e97bce0000                     jmp        0x7fd5900a5f60
003e5 bef6ffffff                     mov        esi, 0xfffffff6
003ea 90                             nop        
003eb e8f0830100                     call       0x7fd5900b14e0
003f0 0f1f8400e804000b               nop        dword ptr [rax + rax + 0xb0004e8]
003f8 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
00402 4883e4f0                       and        rsp, 0xfffffffffffffff0
00406 e855e4c212                     call       0x7fd5a2cc7560
0040b f4                             hlt        
0040c bef6ffffff                     mov        esi, 0xfffffff6
00411 90                             nop        
00412 90                             nop        
00413 e8c8830100                     call       0x7fd5900b14e0
00418 0f1f84001005000c               nop        dword ptr [rax + rax + 0xc000510]
00420 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0042a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0042e e82de4c212                     call       0x7fd5a2cc7560
00433 f4                             hlt        
00434 bef6ffffff                     mov        esi, 0xfffffff6
00439 90                             nop        
0043a 90                             nop        
0043b e8a0830100                     call       0x7fd5900b14e0
00440 0f1f84003805000d               nop        dword ptr [rax + rax + 0xd000538]
00448 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
00452 4883e4f0                       and        rsp, 0xfffffffffffffff0
00456 e805e4c212                     call       0x7fd5a2cc7560
0045b f4                             hlt        
0045c bef6ffffff                     mov        esi, 0xfffffff6
00461 90                             nop        
00462 90                             nop        
00463 e878830100                     call       0x7fd5900b14e0
00468 0f1f84006005000e               nop        dword ptr [rax + rax + 0xe000560]
00470 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
0047a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0047e e8dde3c212                     call       0x7fd5a2cc7560
00483 f4                             hlt        
00484 bef6ffffff                     mov        esi, 0xfffffff6
00489 90                             nop        
0048a 90                             nop        
0048b e850830100                     call       0x7fd5900b14e0
00490 0f1f84008805000f               nop        dword ptr [rax + rax + 0xf000588]
00498 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
004a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
004a6 e8b5e3c212                     call       0x7fd5a2cc7560
004ab f4                             hlt        
004ac bef6ffffff                     mov        esi, 0xfffffff6
004b1 90                             nop        
004b2 90                             nop        
004b3 e828830100                     call       0x7fd5900b14e0
004b8 0f1f8400b0050010               nop        dword ptr [rax + rax + 0x100005b0]
004c0 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
004ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
004ce e88de3c212                     call       0x7fd5a2cc7560
004d3 f4                             hlt        
004d4 bef6ffffff                     mov        esi, 0xfffffff6
004d9 90                             nop        
004da 90                             nop        
004db e800830100                     call       0x7fd5900b14e0
004e0 0f1f8400d8050011               nop        dword ptr [rax + rax + 0x110005d8]
004e8 48bf602a0b70d57f0000           movabs     rdi, 0x7fd5700b2a60
004f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
004f6 e865e3c212                     call       0x7fd5a2cc7560
004fb f4                             hlt        
004fc 49baf38e0990d57f0000           movabs     r10, 0x7fd590098ef3
00506 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0050d e94e610700                     jmp        0x7fd59010f360
00512 e849310600                     call       0x7fd5900fc360
00517 e9fefaffff                     jmp        0x7fd590098d1a
0051c f4                             hlt        
0051d f4                             hlt        
0051e f4                             hlt        
0051f f4                             hlt        
