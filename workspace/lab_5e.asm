        org     $1500
num     rmb     1
	org     $2000
        movb    #$5A,num        ; load $5A into $1500
        ldaa    num             ; A = $5A
        oraa    #$66            ; set bits 7,5,3,1 in A
        anda    #$66            ; clear bits 6,4,2,0 in A
        staa    num             ; $1500 = A
        swi
        end