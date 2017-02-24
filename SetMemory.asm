;
;  SetMemory.asm   - for 68hc12 family devices that use d-bug12 as the monitor.
;
; Store $77 at location $3000, and $33 at location $3001, and return to d-bug12 via swi.
; This shows that the Auto functions can capture the value of registers and memory.
;
;AsmIDE AutoLoad="load" AutoGo="g 2000" AutoDump="md 3000 3010"   AutoDump="md 3030 305f"


	org $3000
MyData: db 0                    ; we'll put some data here

STACK:	EQU	$2000           ; stack builds back from $2000

        org     $2000		; program code
start:
	lds	#STACK          ; always set your stack pointer

	ldaa	#$77
	staa	MyData
	
	ldab    #$33
	stab    MyData+1
	
	swi
	
  	end
