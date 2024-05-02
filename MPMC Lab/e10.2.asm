data segment
    num1 db -7
    num2 db 8
    
    of_msg db "overflow detected...$"
    neg_sign db "-$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
            
    xor ax, ax
    mov al, num1
    imul num2
    
    push ax
 

check1:          ; OF=CF=0 this must hold, if isn't print overflow msg and exit.
    jc overflow
check2:
    jo overflow   

shr ax, 15
cmp ax, 0
je print_pos

xor ax, ax
mov ah, 09h
mov dx, offset neg_sign
int 21h

pop ax
neg ax          ; take 2's complement
push ax 

call clear_regs
call print
int 20h


print_pos:  
call print
int 20h
               
print proc
    mov bp, sp
    mov ax, [bp+2]
    xor cx, cx
    mov bx, 10
    
    lp:
        inc cx   ; for tracking nos of digits.
        div bx
        push dx
        xor dx, dx ; clear the dx. otherwise in the next iteration it will consider
                   ; dx:ax for divide operation.
        cmp ax, 0
        jne lp
    mov ah, 02h
    disp:
        pop dx
        add dx, 30h
        int 21h
        loop disp
    ret
print endp

clear_regs proc
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    ret
clear_regs endp

overflow:
    mov dx, offset of_msg
    xor ax, ax
    mov ah, 09h
    int 21h
    int 20h
   
ends

end start
