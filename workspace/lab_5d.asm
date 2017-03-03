        org     $1500
num     rmb     1
	org     $2000
        movb    #$5A,num        ; load $5A into $1500
        ldaa    num             ; A = $5A
        eora    #$0f            ; toggle bits 0,1,2,3 in A
        oraa    #$f0            ; set bits 7,6,5,4 in A
        staa    num             ; $1500 = A
        swi
        end