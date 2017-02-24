N       equ     5
        org     $1500
param   rmb     10
        org     $2000
        lds     #$1500
        movw    #array, param
        movb    #N, param+2
        bsr     avg
        swi

        ; average(array, length) -> X
avg     bsr     sum
        ldab    param+2
        clra
        exg     X,D
        exg     D,Y
        idiv
        rts

        ; sum(array, length) -> Y
sum     ldx     param
        ldaa    param+2
        ldy     #0
sum0 	ldab    0,X
        aby
        inx
        dbne    A, sum0
        rts
        
array   dc.b    14, 93, 34, 67, 45

        end