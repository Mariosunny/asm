        org     $1500
        org     $2000
        lds     $1800
        leas    -3,SP
        movw    #array,0,SP
        movb    #20,2,SP
        jsr     sum
        leas    3,SP
        swi

; sum(2:array, 1:length) -> Y
sum     ldx     2,SP
        ldaa    4,SP
        ldy     #0
sum0    ldab    0,X
        aby
        inx
        dbne    A, sum0
        rts

array   dc.b         90, 105, 184, 105, 186, 83, 132, 14, 96, 125, 27, 120, 24, 13, 251, 116, 206, 60, 196, 188
        end