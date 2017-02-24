N       equ     16
        org     $1500
num   	rmb     2
        org     $1505
count   rmb     1       ; 1s count
	org     $2000   ; program start
	movw	#$1234,$1500
        clr     count   ; count = 0
        ldx    	#N      ; initialize loop counter to 16
        ldd     num     ; D = $1500
loop    lsrd            ; logical right shift D
        bcc     zero    ; branch to zero if carry flag = 0
        inc     count   ; increment 1s counter
zero	dbne    X, loop ; decrement X, branch if X == 0
        swi
        end
        