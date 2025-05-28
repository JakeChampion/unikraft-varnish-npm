# varnish + stunnel unikraft example

To build and deploy to Unikraft Cloud run `./deploy.sh`

Currently it is using `runtime: base:latest` and will have this output:

```
1: Set IPv4 address 10.0.0.9 mask 255.255.255.252 gw 10.0.0.10
en1: Added
en1: Interface is up
[    0.072413] CRIT: [libukvmem] Cannot handle write page fault at 0x401f9bffc (ec: 0x2): -12
[    0.072922] CRIT: [libkvmplat] page fault handler returned error: -12
[    0.073301] CRIT: [libkvmplat] Unhandled page fault vaddr=0x401f9bffc, error code=0x2
[    0.073764] CRIT: [appelfloader] Unikraft crash - Telesto (0.16.2~3a5017b)
[    0.074167] CRIT: [appelfloader] Thread "init"@0x400017020
[    0.074492] CRIT: [appelfloader] RIP: 0008:000000000013e35c
[    0.074820] CRIT: [appelfloader] RSP: 0010:000000000000bb20 EFLAGS: 00010206 ORIG_RAX: 0000000000000002
[    0.075372] CRIT: [appelfloader] RAX: 0000000000000001 RBX: 0000000000000001 RCX:0000000401f9a000
[    0.075904] CRIT: [appelfloader] RDX: 0000000401f98000 RSI: 0000000400000078 RDI:0000000400000230
[    0.076425] CRIT: [appelfloader] RBP: 000000000000bb40 R08: 0000000000002000 R09:0000000400000000
[    0.076946] CRIT: [appelfloader] R10: 0000000401f98000 R11: 0000000000000000 R12:0000000000000001
[    0.077466] CRIT: [appelfloader] R13: 0000000401f96020 R14: 0000000401f80020 R15:000000000000cc10
[    0.077985] CRIT: [appelfloader] Stack:
[    0.078213] CRIT: [appelfloader]  0000bb20  00 00 00 00 00 00 00 00  |........|
[    0.078640] CRIT: [appelfloader]  0000bb28  1d 00 00 00 00 00 00 00  |........|
[    0.079072] CRIT: [appelfloader]  0000bb30  01 00 00 00 00 00 00 00  |........|
[    0.079513] CRIT: [appelfloader]  0000bb38  20 60 f9 01 04 00 00 00  | `......|
[    0.079943] CRIT: [appelfloader]  0000bb40  60 bb 00 00 00 00 00 00  |`.......|
[    0.080372] CRIT: [appelfloader]  0000bb48  a2 d8 13 00 00 00 00 00  |........|
[    0.080802] CRIT: [appelfloader]  0000bb50  1c 00 00 00 00 00 00 00  |........|
[    0.081234] CRIT: [appelfloader]  0000bb58  10 dc 00 00 00 00 00 00  |........|
[    0.081661] CRIT: [appelfloader] Call Trace:
[    0.081912] CRIT: [appelfloader]  [0x000000000013e35c]
[    0.082213] CRIT: [appelfloader]  [0x000000000013d8a1]
[    0.082513] CRIT: [appelfloader]  [0x0000000000121b9e]
[    0.082816] CRIT: [appelfloader]  [0x0000000000157129]
[    0.083120] CRIT: [appelfloader]  [0x0000000000159956]
[    0.083431] CRIT: [appelfloader]  [0x000000000015be35]
[    0.083733] CRIT: [appelfloader]  [0x000000000015c090]
[    0.084035] CRIT: [appelfloader]  [0x000000000015c0f4]
[    0.084336] CRIT: [appelfloader]  [0x0000000000143248]
[    0.084637] CRIT: [appelfloader]  [0x000000000015e3ac]
[    0.084939] CRIT: [appelfloader]  [0x000000000015e773]
[    0.085239] CRIT: [appelfloader]  [0x000000000014225e]
[    0.085546] CRIT: [appelfloader]  [0x0000000000142796]
[    0.085847] CRIT: [appelfloader]  [0x00000000001110a8]
[    0.086148] CRIT: [appelfloader]  [0x0000000000000000]
```

If we instead use `runtime: base-compat:latest` and then run `./deploy.sh` we will see this output:

```
[    0.075115] Initramfs unpacking failed: write error
```