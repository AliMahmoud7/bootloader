[BITS 16]	 ; 16 bit code generation  (real mode)
[ORG 0x7C00]	 ; ORGin location is 7C00 
;(the bootsector will be loaded at 0x7C00 and INT 0x19 will jump to it)

;Main program
main:		 ; Main program label


;MOV instruction is used to copy values from source to destination
;AX - the accumulator register (divided into AH / AL).
		 
mov ah,00h  ;get keystroke from keyboard and store it in AL(character output subfunction)
int 16h     ;(BIOS Interrup for keyboard operations)

mov ah,0eh  ;Display a character on the screen or, echo it (character output subfunction)
int 10h     ;(BIOS Interrupt for screen operations)  

;Each interrupt may have up to 256 sub-functions

jmp $		 ; Put it into a coninuous loop to stop it running off into
		 ;  the memory running any junk it may find there.
		
  		; End matter
times 510-($-$$) db 0	; Fill the rest of the sector with zeros
dw 0xAA55		; Boot signature
;db - stays for Define Byte.
;dw - stays for Define Word.