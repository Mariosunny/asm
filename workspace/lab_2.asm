N	equ	5
	org	$1500
array	dc.b	11,14,15,17,20
sum	rmb	2	; reserve 2 bytes of memory for sum
i	rmb	1	; reserve 1 byte of memory for loop counter
	org	$2000	; program start
	ldaa	#0	; A = 0
	staa	i	; i = 0
	staa	sum	; sum = 0
	staa 	sum+1	; [sum+1] = 0
loop	ldab	i	; B = i
	cmpb	#N	; B == 5?
	beq	done	; branch to done if B == 5
	ldx	#array; load pointer first element in array to X
	abx		; X = X + B
	ldab	0,X	; B = [X]
	ldy	sum	; Y = [sum]
	aby		; B = B + Y
	sty	sum	; sum = Y
	inc	i	; i++
	bra	loop	; branch back to loop
done	swi		; loop finished
	end
