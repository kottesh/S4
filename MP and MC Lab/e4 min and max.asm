org 100h

jmp begin
array db 1, 8, 10 ,5, 11

begin:
    mov bx, offset array
    mov cl, 4
    mov ah, [bx]
    mov al, [bx]
    inc bx

; have used the opposite logic in finding max or min
; greater(max) case -> if min in [bx] compared to value in al then skip, otherwise store.
; lesser(min) case -> if max in [bx] compared to vlaue in al then skip, otherwise store. 

; below loop will find the min
lp:
    cmp [bx], al ; store min value in AL
    jg check
    mov al, [bx]
check:
    cmp [bx], ah ; store max value in AH
    jl skipto
    mov ah, [bx] 
skipto:
    inc bx       
    dec cl
    jnz lp       ; jump to start of loop if cl is not 0 

ret          