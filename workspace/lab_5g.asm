N       equ     4
        org     $1500
num     rmb     1
        org     $2000
        movb    #$5A,num        ; load $5A into $1500
        ldaa    num             ; A = $5A
        ldab    #N              ; B = 4
loop    rora                    ; rotate A to right
        dbne    B,loop          ; decrement B, branch if B != 0
        staa    num             ; $1500 = A
        swi
        end