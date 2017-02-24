*
* Ex2.asm  ---- Example program 2 for the Ep2711E9 board (c)2002, EVBplus.com

*		Written by Wayne Chu
*
*     Function:	Makes			 the port B as a binary counter.
*
*
* The 68HC11 control register address is the offset address from the
* register base address $1000, so index addressing mode can also be used,
* otherwise only extended addressing mode can be used.
*
portb:		equ	$4
REGBLK:		equ	$1000
SPEED:          equ     $2500    ; change this number to change counting speed

STACK:	equ	$FF
*
	org	$F000
start:
	lds	#STACK
	ldx	#REGBLK
back:	inca
	staa 	portb,x
	jsr	delay
	jmp	back
*
delay:	pshx
	ldx	#SPEED		; delay 2500 loops =2000 cycles = 10ms
dly:	dex			; 3 cycles
	nop			; 2 cycle
	bne	dly		; 3 cycles
	pulx
	rts

	org	$FFFE
	fdb	start
	end

