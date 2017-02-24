N       equ     16
	org     $2000
        ldaa    #N
        ldx     #array
loop    ldab    0,X
        rorb    1
        stab    0,X
        inx
        dbne    A, loop
        swi
array   dc.b    193, 130, 79, 227, 209, 93, 23, 154, 43, 107, 92, 200, 122, 173, 69, 218
        end
        