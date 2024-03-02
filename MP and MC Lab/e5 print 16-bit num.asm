; print 16 bit number in decimal format on the console

org 100h

jmp begin

num dw 58956
dvi dw 10000  ; dvi -> dividend

begin:
    mov ax, num
    mov bx, dvi
    div bx  
    
    mov num, dx ; store the remainder (the new dividend)
           
    add ax, 30h  ; printing quotient on the console
    mov dx, ax
    mov ah, 02h
    int 21h
   
   
    mov ax, dvi 
    mov bx, 10
    mov dx, 0
    div bx
    mov dvi, ax ; update divisor 
 
    cmp num, 0
    jg begin
ret                   
