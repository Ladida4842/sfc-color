;dynamic ram allocation is used
;all ram addresses must be prefixed with RAM_ and have a defined byte length

norom
org 0
namespace "RAM"
base $7E0000
skip 16			;RESERVED FOR SCRATCH RAM

gamemode: skip 1	;game mode
subgamemode: skip 1	;sub-game mode
brightness: skip 1	;stores to $2100
frame: skip 1		;current frame #, 8bit (why do i need a 16bit one?)

frametimer: skip 1	;timer for frames in intro

nmi_flg: skip 1		;nmi flag. nonzero breaks out of wait loop (and skips most of NMI if lag)
irq_flg: skip 1		;irq to run. nmi sets this to 0

setini: skip 1		;stores to $2133
gfxmode: skip 1		;stores to $2105

mainscr: skip 1		;stores to $212C & $212E
subscr: skip 1		;stores to $212D & $212F

layer1x: skip 2		;stores to $210D
layer1y: skip 2		;stores to $210E
layer2x: skip 2		;stores to $210F
layer2y: skip 2		;stores to $2110
layer3x: skip 2		;stores to $2111
layer3y: skip 2		;stores to $2112
layer4x: skip 2		;stores to $2113
layer4y: skip 2		;stores to $2114

hdmareg: skip 1		;stores to $420C
cgwsel: skip 1		;stores to $2130
cgadsub: skip 1		;stores to $2131

layer12gfx: skip 1	;stores to $210B
layer34gfx: skip 1	;stores to $210C

layer1map: skip 1	;stores to $2107
layer2map: skip 1	;stores to $2108
layer3map: skip 1	;stores to $2109
layer4map: skip 1	;stores to $210A

bgcolor: skip 2		;fixed color in BGR555. converted to $2132

obsel: skip 1		;stores to $2101

mosaic: skip 1		;stores to $2106

winsel12: skip 1	;stores to $2123
winsel34: skip 1	;stores to $2124
winselobj: skip 1	;stores to $2125

window1left: skip 1	;stores to $2126
window1right: skip 1	;stores to $2127
window2left: skip 1	;stores to $2128
window2right: skip 1	;stores to $2129

winmaskbg: skip 1	;stores to $212A
winmaskobj: skip 1	;stores to $212B

spc0: skip 1
spc1: skip 1
spc2: skip 1
spc3: skip 1

mouse1accel: skip 1
mouse2accel: skip 1
mouse1X: skip 1
mouse1Y: skip 1
mouse2X: skip 1
mouse2Y: skip 1

joy1pressL: skip 1	;axlr----
joy1pressH: skip 1	;byetUDLR
joy2pressL: skip 1	;axlr----
joy2pressH: skip 1	;byetUDLR
joy1heldL: skip 1	;axlr----
joy1heldH: skip 1	;byetUDLR
joy2heldL: skip 1	;axlr----
joy2heldH: skip 1	;byetUDLR
joy1disL: skip 1	;axlr----
joy1disH: skip 1	;byetUDLR
joy2disL: skip 1	;axlr----
joy2disH: skip 1	;byetUDLR
joy1raw: skip 2		;2 bytes. dont touch
joy2raw: skip 2		;2 bytes. dont touch

audiostream: skip 3	;address for audio streaming
audiostream_sync: skip 1

random: skip 2		;output from random number generator @ GetRand

warnpc $7E0100
base $7E0100

tilemap: skip $0800	;reserved for tilemap tables


namespace off
warnpc $7E1800

base $7E1800
HDMA: skip $0300
CGRAM: skip $0200
OAM:
OAM_X: skip 1
OAM_Y: skip 1
OAM_T: skip 1
OAM_P: skip 1
skip 256-4
OAM2:
OAM2_X: skip 1
OAM2_Y: skip 1
OAM2_T: skip 1
OAM2_P: skip 1
skip 256-4
H_OAM: skip 32
OAM_UP: skip 64
OAM2_UP: skip 64
warnpc $7E2000

warnpc $7F0000

base $7F0000
VRAM_BUFFER:		;general-purpose buffer for data to be uploaded to VRAM

base off