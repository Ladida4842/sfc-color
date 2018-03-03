incsrc _init.asm

CLI
BRA +		;skip NMI wait and frame increment
		;because of this, NMI technically runs after main code
-
WAI
LDA.b RAM_nmi_flg : BEQ -
INC.b RAM_frame
+
JSR game
STZ.b RAM_nmi_flg : BRA -