; Carriage return -> 0Dh 

                ;DIVIDE                      
                
; for divison the dx regsiter must be cleared(word by word)
; and al for byte by byte.
 
; word / byte: ax <- word, bl <- byte.
; quotient will be in al, remainder in ah
mov ax, 1000
mov bl, 10
div bl

; word/word: ax <- word, bx <- word
; in this case the dx:ax will used for division
; the remainder will be in the dx and quotient in the ax
mov ax, 10001
mov bx, 100
div bx    

            ;MULTIPLY
xor ax, ax
xor bx, bx
xor dx, dx

; in this word with word
; the most significant part will get stored in the dx
; and least significant part will get stored in the ax            
mov ax, 10000
mov bx, 10
mul bx

; in this byte with byte
; al * bl will get performed and the result get stored in the ax
mov al, 100
mov bl, 10
mul bl

; NOTE: Don't do mixing like byte with word and vice versa for the multiplication.
; Example: in the below set of INS. Emu will perform byte with byte operation
mov ax, 10000 ; HEX: 27 10
mov bl, 10    ; HEX: A
mul bl        
              ; RESULT will be like A0 that get stored in the AX register
              
              ; In this, 10 from multiplicand(27 10) was got multiplied with (A)
              ; So, we are getting A0 as result...

