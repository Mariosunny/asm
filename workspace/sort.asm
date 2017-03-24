        org     $2000
        leas    -3,SP
        movw    #array,0,SP
        movb    #20,2,SP
        jsr     sort
        leas    3,SP
        swi

; sort(array, length)


        rts
        
        
array   dc.b	6, 246, 110, 204, 214, 117, 26, 223, 238, 54, 48, 19, 141, 4, 135, 69, 226, 28, 233, 139
        end