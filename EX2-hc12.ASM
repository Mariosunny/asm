;
; Ex2.asm  ---- Example program 2 for the Ep9S12DP256 board (c)2002, EVBplus.com
;		Written by Wayne Chu
;
;     Function:	Makes the port B as a binary counter.
;
;
REGBLK:		equ	$0000

#include        reg9s12.h

SPEED:		equ	$FFFF	; change this number to change counting speed
;
STACK:	EQU	$2000
;
        org     $2000		; program code
start:
	lds	#STACK
	LDX	#REGBLK
	ldaa	#$ff
	staa	ddrb,x		; make port B an output port
	staa 	ddrp,x		; make port P an output port
	staa	ptp,x		; turn off 7-segment LED display

back:	inca
	staa 	portb,x
	jsr	d_10ms
	jmp	back
*
d_10ms:	ldab	#10		; delay 10 ms
	jmp	dly1

delay:	ldab	#1		; delay 1 ms
dly1:	ldy	#6000		; appox. 1ms = 24,000 cycles
dly:	dey			; 1 cycle
	bne	dly		; 3 cycles
	decb
	bne	dly1
	rts
	
  	end
