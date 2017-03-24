size    equ     4
        org     $2000
        
        swi

; add(num1, num2, des)
add_s   equ     1
add     leas    -add_s,SP
        movb    #0,0,SP
        andcc   #f0
add0    ldx     2+add_s,SP
        ldab    0,SP
        ldaa    B,X
        ldx     3+add_s,SP
        ldab    B,X
        adca    #0
	aba
        ldab    0,SP
        staa    B,SP
        inc     0,SP
        cmpb    #size
        bne     add0
        leas    add_s,SP
        rts


        end