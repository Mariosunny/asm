	org	$2000	; program start
	; load incrementing values into memory: 00-0F, beginning at $1500
	ldd	#$0011	; D = $0011
	staa	$1500	; $1500 = A
	stab	$1501	; $1501 = B
	ldd	#$2233	; D = $2233
	staa	$1502	; $1502 = A
	stab	$1503	; $1503 = B
	ldd	#$4455	; D = $4455
	staa	$1504	; $1504 = A
	stab	$1505	; $1505 = B
	ldd	#$6677	; D = $6677
	staa	$1506	; $1506 = A
	stab	$1507	; $1507 = B
	ldd	#$8899	; D = $8899
	staa	$1508	; $1508 = A
	stab	$1509	; $1509 = B
	ldd	#$AABB	; D = $aabb
	staa	$150A	; $150a = A
	stab	$150B	; $150b = B
	ldd	#$CCDD	; D = $ccdd
	staa	$150C	; $150c = A
	stab	$150D	; $150d = B
	ldd	#$EEFF	; D = $eeff
	staa	$150E	; $150e = A
	stab	$150F	; $150f = B

	; 5 bit constant offset indexed addressing
	ldx	#$1509	; X = $1509
	ldaa	3,X	; A = [X + 3]
	ldab	-4,X	; B = [X - 4]

	; 9 bit constant offset indexed addressing
	ldy	#$1590	; Y = $1590
	ldaa	-78,Y	; A = [Y - 78]
	ldy	#$1490	; Y = $1490
	ldab	$45,Y	; B = [Y + $45]

	; 16 bit constant offset indexed addressing
	ldx	#$1000	; X = $1000
	ldaa	$ABC,X	; A = [X + $ABC]
	ldy	#$2000	; Y = $2000
	ldab	-$B9A,Y	; B = [Y - $B9A]

	; 16 bit constant indirect indexed addressing
	ldd	#$1505	; D = $1505
	staa	$1515	; $1515 = [A]
	stab	$1516	; $1516 = [B]
	ldx	#$152D	; X = $152D
	ldaa	[-$11,X]; A = [X - $11]

	ldd	#$1508	; D = $1508
	staa	$1545	; $1545 = [A]
	stab	$1546	; $1546 = [B]
	ldx	#$152D	; X = $152D
	ldab	[$24,X]	; B = [X + $24]
	swi
	end