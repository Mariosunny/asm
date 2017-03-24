#include "C:/Users/Tyler/Documents/asm/REG9S12.H"
        org     $2000
        movb    #$02,pucr
        movb    #$07,ddrb
loop    movb    #$05,portb
        ldx     #30
        jsr     d100ms
	movb    #$02,portb
        ldx     #10
        jsr     d100ms
        bra     loop
        swi

d100ms  movb    #$90,tscr1
        movb    #$06,tscr2
        movb    #$01,tios
        ldd     tcnt
        addd    #37500
        std     tc0
poll    brclr   tflg1,$01,poll  ; branch if
        dbne    X,d100ms
        rts
        end
        
        