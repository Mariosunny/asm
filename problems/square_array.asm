N       equ     16
        org     $1500
res     rmb     2
i       rmb     1
        org     $2000
        movw    #$1600,res
        ldx     #array
        movb    #0, i
loop    ldaa    0,X
        ldab    0,X
        mul
        ldy     res
        std     0,Y
        ldab    #2
	aby
        sty     res
        inx
        ldaa    i
        cmpa    #N-1
        inc     i
        bne     loop
        swi
array   dc.b    193, 130, 79, 227, 209, 93, 23, 154, 43, 107, 92, 200, 122, 173, 69, 218
        end
        