N	equ	5
	org	$1500
array	dc.b	11,14,15,17,20
sum	rmb	2	; reserve 2 bytes of memory for sum
i	rmb	1	; reserve 1 byte of memory for loop counter
	org	$2000	; program start
	ldaa	#0	; A = 0
	staa	sum	; sum = 0
	staa 	sum+1	; [sum+1] = 0
	movb  #N,i  ; i = 5
loop	ldab	i	; B = i
	cmpb	#0	; B == 0?
	beq	done	; branch to done if B == 1
	ldx	#array; load pointer to array to X
	decb        ; B = B - 1
	abx		; X = X + B
	ldab	0,X	; B = [X]
	ldy	sum	; Y = [sum]
	aby		; B = B + Y
	sty	sum	; sum = Y
	dec	i	; i--
	bra	loop	; branch back to loop
done	swi		; loop finished
	end
