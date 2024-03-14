; if a number like 65535 is entered it will get stored like 53556
; to print the input back, remainder value from division by 10 will be used.

org 100h

.data

mult dw 10 ; mult --> multiplier
input dw ?
cnt db 4

.code

mov ah, 01h
int 21h  
mov ah, 0
sub al, 30h
mov [input], ax

mov bx, 10

get_input:
    mov ah, 01h
    int 21h
    
    cmp al, 0Dh      ; if CR encountered, exit loop and print input value
    je print
    
    xor ah, ah
    sub al, 30h
    mul bx
   
    add [input], ax  ; update input value
    
    mov ax, bx
    mul mult
    mov bx, ax
    
    dec cnt          ; by default get a 5-digit input
    jnz get_input

print:
    mov ax, 00h      ; clear window
    int 10h 
    mov bx, 10

print_loop:
    mov ax, [input]
    xor dx, dx
    div bx         
    add dl, 30h
    mov [input], ax  ; update input value
    xor ax, ax
    mov ah, 02h
    int 21h 
    
    cmp [input], 0
    jne print_loop
    
ret   
    
