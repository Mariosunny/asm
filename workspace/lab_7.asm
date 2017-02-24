n       equ     5
z       equ     6
        org     $1500
array   dc.b    6, 4, 9, 4, 7
        org     $2000
        clra
        ldx     #array
loop    ldab    0,X
        addb    #z
        stab    0,X
        inx
        inca
        cmpa    #n
        bne     loop
        swi
        end