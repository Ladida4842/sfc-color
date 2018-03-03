;PPU registers updated here from RAM mirrors
;HDMA, IRQ, and mode-specific NMI can override these

;layer positions
	LDA.b RAM_layer1x : STA $210D
	LDA.b RAM_layer1x+1 : STA $210D
	LDA.b RAM_layer1y : STA $210E
	LDA.b RAM_layer1y+1 : STA $210E
	LDA.b RAM_layer2x : STA $210F
	LDA.b RAM_layer2x+1 : STA $210F
	LDA.b RAM_layer2y : STA $2110
	LDA.b RAM_layer2y+1 : STA $2110
	LDA.b RAM_layer3x : STA $2111
	LDA.b RAM_layer3x+1 : STA $2111
	LDA.b RAM_layer3y : STA $2112
	LDA.b RAM_layer3y+1 : STA $2112
	LDA.b RAM_layer4x : STA $2113
	LDA.b RAM_layer4x+1 : STA $2113
	LDA.b RAM_layer4y : STA $2114
	LDA.b RAM_layer4y+1 : STA $2114

REP #$20

;windowing
	LDA.b RAM_winsel12 : STA $2123
	LDY.b RAM_winselobj : STY $2125
	LDA.b RAM_window1left : STA $2126
	LDA.b RAM_window2left : STA $2128
	LDA.b RAM_winmaskbg : STA $212A

;color math related
	LDA.b RAM_mainscr : STA $212C : STA $212E
	LDA.b RAM_cgwsel : STA $2130

;layer VRAM locations
	LDA.b RAM_layer12gfx : STA $210B
	LDA.b RAM_layer1map : STA $2107
	LDA.b RAM_layer3map : STA $2109

;other
	LDY.b RAM_obsel : STY $2101
	LDY.b RAM_gfxmode : STY $2105
	LDY.b RAM_mosaic : STY $2106
	LDY.b RAM_setini : STY $2133

;sprite DMA
	LDA.w #OAM : STA $4302
	LDY #$80 : STY $4304
	LDA #$0220 : STA $4305
	LDA #$0400 : STA $4300
	TAY
	STY $2102
	STY $2121
	INY : STY $420B

;palette DMA
	LSR : STA $4305
	LDA #$2202 : STA $4300
	LDA.w #CGRAM : STA $4302
	STY $420B

;color constant
	LDA.b RAM_bgcolor : ASL #3
	SEP #$21 : ROR #3 : XBA
	ORA #$40 : STA $2132
	LDA.b RAM_bgcolor+1 : LSR
	SEC : ROR : STA $2132
	XBA : STA $2132