#include "C:/Users/Tyler/Documents/asm/REG9S12.H"
        org     $2000
        movb    #$02,pucr
        movb    #$07,ddrb
init    ldy     #array+19
loop    ldx    	0,Y
	movb    #$01,portb      ; set OC for channels 0 and 2
        jsr     d100ms          ; jump to delay subroutine
        movb    #$02,portb      ; set OC for channels 1
        jsr     d100ms          ; jump to delay subroutine
        movb    #$04,portb      ; set OC for channels 1
        jsr     d100ms          ; jump to delay subroutine
        dbne    Y,loop            ; loop back to beginning
        bra     init
        swi

d100ms  movb    #$90,tscr1      ; enable fast flag clear all
        movb    #$06,tscr2      ; set prescale factor to 64
        movb    #$01,tios       ; enable output compare for channel 0
        ldd     tcnt            ; load current value of TCNT to D
        addd    #37500          ; add offset to D
        std     tc0             ; write D to channel 0
poll    brclr   tflg1,$01,poll  ; loop infinitely until 37500 counts have passed
        dbne    X,d100ms        ; decrement X, loop again
        rts
        
        
array   dc.b    1, 2, 3, 5, 7, 9, 11, 13, 15, 17, 20, 22, 24, 27, 29
        end
        
        