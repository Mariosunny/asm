keyboard	equ	PTA
	movb	#$01,PUCR		;pull up enable for Port A
get_char	movb	#$F0,DDRA		;set pins PP4~7 for output
scan_r0	movb	#$7F,keyboard		;row 0 containing keys 37BF
scan_kF	brclr	keyboard,$01,keyF	;is key F pressed?
scan_kB	brclr	keyboard,$02,keyB	;is key B pressed?
scan_k7	brclr	keyboard,$04,key7	;is key 7 pressed?
scan_k3	brclr	keyboard,$08,key3	;is key 3 pressed?
		bra	scan_r1

keyF	jmp	db_keyF		;debounce key F
keyB	jmp	db_keyB		;debounce key B
key7	jmp	db_key7		;debounce key 7
key3	jmp	db_key3		;debounce key 3

scan_r1	movb	#$BF,keyboard		;row 1 containing keys 26AE
scan_kE	brclr	keyboard,$01,keyE	;is key E pressed?
scan_kA	brclr	keyboard,$02,keyA	;is key A pressed?
scan_k6	brclr	keyboard,$04,key6	;is key 6 pressed?
scan_k2	brclr	keyboard,$08,key2	;is key 2 pressed?
		bra	scan_r2

keyE	jmp	db_keyE		;debounce key E
keyA	jmp	db_keyA		;debounce key A
key6	jmp	db_key6		;debounce key 6
key2	jmp	db_key2		;debounce key 2

scan_r2	movb	#$DF,keyboard		;row 2 containing keys 159D
scan_kD	brclr	keyboard,$01,keyD	;is key D pressed?
scan_k9	brclr	keyboard,$02,key9	;is key 9 pressed?
scan_k5	brclr	keyboard,$04,key5	;is key 5 pressed?
scan_k1	brclr	keyboard,$08,key1	;is key 1 pressed?
		bra	scan_r3

keyD	jmp	db_keyD	;debounce key D
key9	jmp	db_key9	;debounce key 9
key5	jmp	db_key5	;debounce key 5
key1	jmp	db_key1	;debounce key 1

scan_r3	movb	#$EF,keyboard			;row 3 containing keys 048C
scan_kC	brclr	keyboard,$01,keyC		;is key C pressed?
scan_k8	brclr	keyboard,$02,key8 		;is key 8 pressed?
scan_k4	brclr	keyboard,$04,key4		;is key 4 pressed?
scan_k0	brclr	keyboard,$08,key0	;is key 0 pressed?
		jmp	scan_r0
keyC	jmp	db_keyC	;debounce key C
key8	jmp	db_key8	;debounce key 8
key4	jmp	db_key4	;debounce key 4
key0	jmp	db_key0	;debounce key 0

db_keyF	jsr	delay10ms		;debounce key F
		brclr	keyboard,$01,getcF
		jmp	scan_kB
getcF	ldaa	#$46		;get the ASCII code of F
		rts
db_keyB	jsr	delay10ms	;debounce key B
		brclr	keyboard,$02,getcB
		jmp	scan_k7
getcB	ldaa	#$42	;get the ASCII code of B
		rts
db_key7	jsr	delay10ms	;debounce key 7
		brclr	keyboard,$04,getc7
		jmp	scan_k3
getc7	ldaa	#$37	;get the ASCII code of 7
		rts
db_key3	jsr	delay10ms	;debounce key 3
		brclr	keyboard,$08,getc3
		jmp	scan_r1
getc3	ldaa	#$33	;get the ASCII code of 3
		rts

db_keyE	jsr	delay10ms	;debounce key E
		brclr	keyboard,$01,getcE
		jmp	scan_kA
getcE	ldaa	#$45	;get the ASCII code of E
		rts
db_keyA	jsr	delay10ms	;debounce key A
		brclr	keyboard,$02,getcA
		jmp	scan_k6
getcA	ldaa	#$41	;get the ASCII code of A
		rts
db_key6	jsr	delay10ms	;debounce key 6
		brclr	keyboard,$04,getc6
		jmp	scan_k2
getc6	ldaa	#$36	;get the ASCII code of 6
		rts
db_key2	jsr	delay10ms	;debounce key 2
		brclr	keyboard,$08,getc2
		jmp	scan_r2
getc2	ldaa	#$32	;get the ASCII code of 2
		rts

db_keyD	jsr	delay10ms	;debounce key D
		brclr	keyboard,$01,getcD
		jmp	scan_k9
getcD	ldaa	#$44	;get the ASCII code of D
		rts
db_key9	jsr	delay10ms	;debounce key 9
		brclr	keyboard,$02,getc9
		jmp	scan_k5
getc9	ldaa	#$39	;get the ASCII code of 9
		rts
db_key5	jsr	delay10ms	;debounce key 5
		brclr	keyboard,$04,getc5
		jmp	scan_k1
getc5	ldaa	#$35	;get the ASCII code of 5
		rts
db_key1	jsr	delay10ms	;debounce key 1
		brclr	keyboard,$08,getc1
		jmp	scan_r3
getc1	ldaa	#$31	;get the ASCII code of 1
		rts

db_keyC	jsr	delay10ms	;debounce key C
		brclr	keyboard,$01,getcC
		jmp	scan_k8
getcC	ldaa	#$43	;get the ASCII code of C
		rts
db_key8	jsr	delay10ms	;debounce key 8
		brclr	keyboard,$02,getc8
		jmp	scan_k4
getc8	ldaa	#$38	;get the ASCII code of 8
		rts
db_key4	jsr	delay10ms	;debounce key 4
		brclr	keyboard,$04,getc4
		jmp	scan_k0
getc4	ldaa	#$34	;get the ASCII code of 4
		rts
db_key0	jsr	delay10ms	;debounce key 0
		brclr	keyboard,$08,getc0
		jmp	scan_r0
getc0	ldaa	#$30	;get the ASCII code of 0
		rts







;the following subroutine creates a 10 ms delay

delay10ms	movb	#$90,TSCR1	;enable TCNT and fast flags clear
	movb	#$06,TSCR2	;configure prescale factor to 64
	movb	#$01,TIOS	;enable OC0
	ldd	TCNT
	addd	#3750	;start an output compare operation
	std	TC0	;with 10 ms time delay
wait_lp2	brclr	TFLG1,$01,wait_lp2	
				;if equal, C0F in TFLG1 is set to 1
	rts
