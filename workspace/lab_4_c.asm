N       equ     20              ; array size
qnt     equ     3               ; divisor
        org     $1500
div     rmb     $20             ; reserve 32 bytes for divisible-by-3 array
ndiv    rmb     $20             ; reserve 32 bytes for not-divisible-by-3 array
arrc    rmb     1               ; reserve 1 byte for main array counter
divc    rmb     1               ; reserve 1 byte for divisible counter
ndivc   rmb     1               ; reserve 1 byte for non-divisible counter
        org     $2000
        fill    #00, 3          ; clear array counters
loop    ldx     #array          ; load pointer to main array into X
        ldab    arrc            ; B = array counter
        abx                     ; B = B + X
        clra                    ; A = 0
        ldab    0,X             ; B = m[X]
        ldx     #qnt            ; X = 3
        idiv                    ; X = D/X, D = D % X
        cmpb    #0              ; compare least significant byte in D to 0
        beq     isdiv           ; if remainder == 0, goto isdiv branch
        ldy     #ndiv           ; load pointer to non-divisible array into Y
        ldab    ndivc           ; load non-divisible counter into B
        aby                     ; Y = B + Y
        inc     ndivc           ; increment non-divisible counter
        bra     done            ; branch to done, skip over true block
isdiv   ldy     #div            ; load pointer to divisible array into Y
        ldab    divc            ; load divisible counter into B
        aby                     ; Y = B + Y
        inc     divc            ; increment divisible counter
done    ldx     #array          ; load pointer to main array into X again
        ldab    arrc            ; load main array counter into B
        abx                     ; X = B + X
        movb    0,X,0,Y         ; move current element to designated array
        inc     arrc            ; increment main array pointer
        ldaa    arrc            ; A = main array pointer
        cmpa    #N              ; compare A to array size
        bne     loop            ; loop if A < size
        swi
array   db      1, 3, 5, 6, 19, 41, 53, 28, 13, 42, 76, 14, 20, 54, 64, 74, 29, 33, 41, 45
        end
        