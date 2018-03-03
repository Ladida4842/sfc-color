;ROM HEADER

cleartable
org $00FFC0
fillbyte $20 : fill 21
org $00FFC0

;ROM title, 21 bytes, JIS X 201
db $CE,$DE,$DD,$C6,$20,$C9,$20,$B8,$B4,$BD,$C4
;ボンニ　ノ　クエスト	HO " N NI _ NO _ KU E SU TO
;亹薾のクエスト

warnpc $00FFD5
org $00FFD5

db $01		;ROM layout (HiROM)
db $00		;Cartridge type (ROM)
db $06		;ROM size (1MBit, or 128KB)
db $00		;SRAM size (0KB)
db $00		;Country code (Japan NTSC)
db $00		;Developer code (Null)
db $00		;Version number (v1.00)
dw ~$0000 	;Checksum complement
dw $0000 	;Checksum


;ROM VECTORS

- JML RESET
dw $FFFF,+,$FFFF,++,$FFFF,+++
+ JML BRK
++ JML NMI
+++ JML IRQ
dw -,$4842

warnpc $018000