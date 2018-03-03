;Joypad read
;since auto-joypad-read is enabled, this is simple stuff
;TODO: mouse support

joypad:
LSR $4212 : BCS joypad	;make sure controller still isn't being read by SNES
REP #$30

;joypad 1
	LDX $4218
	LDA.b RAM_joy1raw
	STX.b RAM_joy1raw
	AND.b RAM_joy1raw
	STA.b RAM_joy1heldL
	EOR.b RAM_joy1raw
	STA.b RAM_joy1pressL
	LDA.b RAM_joy1disL
	TRB.b RAM_joy1pressL
	TRB.b RAM_joy1heldL
	STZ.b RAM_joy1disL
	TXA
	AND #$000F
	CMP #$0001
	BNE +
	LDA $421C
	STA.b RAM_mouse1X
	+

;joypad 2
	LDX $421A
	LDA.b RAM_joy2raw
	STX.b RAM_joy2raw
	AND.b RAM_joy2raw
	STA.b RAM_joy2heldL
	EOR.b RAM_joy2raw
	STA.b RAM_joy2pressL
	LDA.b RAM_joy2disL
	TRB.b RAM_joy2pressL
	TRB.b RAM_joy2heldL
	STZ.b RAM_joy2disL
	TXA
	AND #$000F
	CMP #$0001
	BNE +
	LDA $421E
	STA.b RAM_mouse2X
	+

SEP #$30
RTS