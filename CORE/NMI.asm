%pushall(0)
LDA $4210
LDA #$80 : STA $2100
LDA #$81 : STA $4200
STZ $420C
LDA.b RAM_nmi_flg : BEQ +
JMP .nmilag
+
INC.b RAM_nmi_flg
STZ.b RAM_irq_flg

incsrc _mirrorupload.asm
JSR joypad
JSR nmi_game
STA $4200

.nmilag
LDA.b RAM_brightness : STA $2100
LDA.b RAM_hdmareg : STA $420C
%pullall(0)
RTI