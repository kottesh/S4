org 100h
   
.data
input dw ?
array db 10 dup(?)
cnt db 0
                  
.code
mov input, 4565
mov bx, 10
call print

ret

print proc
    mov si, offset array
cont:
    mov ax, input
    xor dx, dx
    div bx         
    add dl, 30h 
    mov [si], dx
    inc si
    mov input, ax  ; update input value
    
    xor ax, ax       ; -------------------------
    mov al, cnt      ; tracking number of digits 
    inc al           ;
    mov cnt, al      ; -------------------------
    
    cmp input, 0
    jne cont
    
    dec si
    mov bl, cnt
disp:
    mov dl, [si]
    dec si
    xor ax, ax
    mov ah, 02h
    int 21h
    
    dec bl
    cmp bl, 0
    jnz disp
    
    ret
print endp

ret
