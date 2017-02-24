	org     $2000   ; program start
        ldd     #$BBCC  ; D = $BBCC
        staa    $1501   ; $1501 = A
        stab    $1502   ; $1502 = B
        ldaa    $1501   ; A = m[$1501]
        ldab    $1502   ; B = m[$1502]
        swi
        end