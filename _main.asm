incsrc _macros.asm	;general macros, not all used
incsrc _RAM.asm		;RAM addresses, important

hirom

org $008000

RESET:	incsrc CORE/RESET.asm
NMI:	incsrc CORE/NMI.asm
BRK:	incsrc CORE/BRK.asm
IRQ:	incsrc CORE/IRQ.asm

nmi_game:
LDA #$81
RTS


-
RTS

game:
LDA.b RAM_gamemode
BNE -
LDA #$80 : STA $2115
REP #$20
STZ $2116
LDA #$1801 : STA $4300
LDA.w #GFX : STA $4302
LDY.b #GFX>>16 : STY $4304
STZ $4305
LDX #$01 : STX $420B
LDA #$7C00 : STA $2116
LDA.w #MAP : STA $4302
LDY.b #MAP>>16 : STY $4304
LDA #$0800 : STA $4305
STX $420B
SEP #$20

REP #$10
LDX #$01FF
-
LDA PAL,x
STA.w CGRAM,x
DEX : BPL -
SEP #$10

REP #$20
LDA #$3101 : STA $4320
LDA.w #HDMAA : STA $4322
LDY.b #HDMAA>>16 : STY $4324

LDA #$0000 : STA $4330
LDA.w #BRIGHT : STA $4332
LDY.b #BRIGHT>>16 : STY $4334
SEP #$20
LDA #$0C : TSB.b RAM_hdmareg

;LDA #$FF : STA.w CGRAM
;STA.w CGRAM+1

LDA #$01 : STA.b RAM_mainscr : STA.b RAM_subscr
LDA #$7C : STA.b RAM_layer1map
LDA #$03 : STA.b RAM_gfxmode
LDA #$0F : STA.b RAM_brightness
LDA #$04 : STA.b RAM_setini
INC.b RAM_gamemode
LDA #$80 : STA $4200
RTS

macro col()
;dl $FF0301
dl $FE0301
dl $FD0301
dl $FC0301
dl $FB0301
dl $FA0301
dl $F90301
dl $F80301
dl $F70301
dl $F60301
dl $F50301
dl $F40301
dl $F30301
dl $F20301
dl $F10301
dl $F00301
dl $EF0301
dl $EE0301
dl $ED0301
dl $EC0301
dl $EB0301
dl $EA0301
dl $E90301
dl $E80301
dl $E70301
dl $E60301
dl $E50301
dl $E40301
dl $E30301
dl $E20301
dl $E10301
endmacro

macro invcol()
dl $E08301
dl $E18301
dl $E28301
dl $E38301
dl $E48301
dl $E58301
dl $E68301
dl $E78301
dl $E88301
dl $E98301
dl $EA8301
dl $EB8301
dl $EC8301
dl $ED8301
dl $EE8301
dl $EF8301
dl $F08301
dl $F18301
dl $F28301
dl $F38301
dl $F48301
dl $F58301
dl $F68301
dl $F78301
dl $F88301
dl $F98301
dl $FA8301
dl $FB8301
dl $FC8301
dl $FD8301
dl $FE8301
dl $FF8301
endmacro

macro bright()
db $3E,$0F
db $1E,$0C
db $1E,$09
db $1E,$06
db $1E,$03
db $1E,$02
db $1E,$01
db $01,$01
db $01,$07
db $01,$06
db $01,$05
db $01,$04
db $01,$03
db $01,$01
db $01,$02
endmacro

BRIGHT:
%bright()
db $00

HDMAA:
%col()
%invcol()
%col()
%col()
%col()
%col()
%col()
%col()
db $00

PAL:	incbin rainbow.bin

incsrc CORE/_joypad.asm

warnpc $00FFC0
incsrc _header.asm

org $410000
fillbyte $00 : fill $010000

org $410000
GFX:	incbin 8bpp.bin

org $41F000
MAP:	incbin altmap.bin