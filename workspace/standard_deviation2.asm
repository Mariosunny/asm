        org     $1500
        org     $2000
        lds     $1800
        leas    -3,SP
        movw    #array,0,SP
        movb    #20,2,SP
        jsr     sum
        leas    3,SP
        swi

;stdev(2:array, 1:length)
stdev   ldx     2,SP
        ldaa    4,SP
        jsr     avg
        leas    -1,SP
        movb    #0,5,0,SP         ; loop counter

stdev0	ldaa    0,X
        pshd
        jsr     absdif
        leas    2,SP

        inx
        dbne    A, stdev0
        leas    1,SP
        rts

; sqr (1:num) -> D
sqr     ldaa    2,SP
        ldab    2,SP
        

; absdif (1:num1,2:num2) -> A
absdif  ldaa    2,SP
        ldab    3,SP
        cba
        bge     absdif0
        exg     A,B
absdif0 sba
        rts

; avg(2:array, 1:length) -> D
avg     jsr     sum
        exg     Y,D
        clra
        ldab    4,SP
        exg     X,D
        idiv
        rts

; sum(2:array, 1:length) -> Y
sum     ldx     2,SP
        ldaa    4,SP
        ldy     #0
sum0    ldab    0,X
        aby
        inx
        dbne    A sum0
        rts

array   dc.b         90, 105, 184, 105, 186, 83, 132, 14, 96, 125, 27, 120, 24, 13, 251, 116, 206, 60, 196, 188
        end