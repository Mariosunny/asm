N       equ     20
        org     $1500
div     rmb     $20             ; reserve 32 bytes for divisible-by-4 array
ndiv    rmb     $20             ; reserve 32 bytes for not-divisible-by-4 array
divc    rmb     1               ; reserve 1 byte for divisible counter
ndivc   rmb     1               ; reserve 1 byte for non-divisible counter
        org     $2000
        movw    #0000, divc     ; clear both array counters
        ldaa    #N              ; use A as loop counter, initialize it to size of array
        ldx     #array          ; load address of main array into X
loop    brclr   0,X,$03,isdiv   ; branch to isdiv if least two significant bits are zero
        ldy     #ndiv           ; load address of non-divisible array to Y
        ldab    ndivc           ; load counter of non-divisible array to B
        inc     ndivc           ; increment non-divisible counter
        bra     done            ; skip over true block
isdiv   ldy     #div            ; load address of divisible array to Y
        ldab    divc            ; load counter of divisible array to B
        inc     divc            ; increment divisible counter
done    aby                     ; Y = Y + B
        movb    1,X+,0,Y        ; move number from main array to appropriate array, increment X
        dbne    A, loop         ; decrement A, branch to loop if A != 0
        swi
array   db      1, 3, 5, 6, 19, 41, 53, 28, 13, 42, 76, 14, 20, 54, 64, 74, 29, 33, 41, 45
        end
        