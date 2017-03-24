N       equ     4
        org     $1500
num     rmb     1
        org     $2000
        movb    #$5A,num        ; load $5A into $1500
        ldab    num             ; B = $5A
        ldaa    #N              ; A = 4
loop    rorb                    ; rotate B to right
        dbne    A,loop          ; decrement A, branch if A != 0
        stab    num             ; $1500 = B
        swi
        end