        org     $1500
param   rmb     10
        org     $2000
        lds     $1800
        movw    #array,param
        movb    #20,param+2
        leas    -3,SP
        jsr     stdev
        leas    3,SP
        swi

; stdev(2:array, 1:length)
_avg    equ     0
stdev   jsr     avg
        leas    -1,SP
        exg     D,X
        ldx     param
        clra
        ldab    param+2
        exg     D,Y
stdev0	ldaa    0,X
        ldab    _avg,SP
        sba
        staa    param
        jsr     sqr
        
        inx
        dbne    Y,stdev0
        leas    1,SP
        rts

; abs(1:num)
abs
        
; sqr(1:num) -> Y:D
sqr     clra
        ldy     #0
        ldab    param
        ldy     param
        emuls
        rts
        
; avg(2:array, 1:length) -> X
avg     jsr     sum
        clra
        ldab    param+2
        exg     D,X
        exg     Y,D
        idiv
        rts

; sum(2:array, 1:length) -> Y
sum     ldaa    param+2
        ldx     param
        ldy     #0
sum0    ldab    0,X
        aby
        inx
        dbne    A, sum0
        rts

array   dc.b         90, 105, 184, 105, 186, 83, 132, 14, 96, 125, 27, 120, 24, 13, 251, 116, 206, 60, 196, 188
        end