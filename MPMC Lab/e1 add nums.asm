org 100h
.data
    num1 dw 5
    num2 dw 500
    of_msg db "overflow detected...$" 
    uf_msg db "underflow detected...$"
    neg_sign db "-$"
    buf dw ?

.code
    mov ax, num1
    add ax, num2
    
check1:
    cmp ax, -32768
    jl underflow

check2:
    cmp ax, 32767
    jg overflow
    
jmp show  
    
overflow:    
    mov ah, 09h
    mov dx, offset of_msg
    int 21h 
    int 20h
    
underflow:
    mov ah, 09h
    mov dx, offset uf_msg
    int 21h
    int 20h
    
show:
    mov buf, ax
    shr ax, 15 
    cmp ax, 0
    je pos_print

neg_print:     
    mov dx, offset neg_sign
    mov ah, 09h
    int 21h
    
    mov ax, buf
    neg ax 
    call print
    int 20h
        
pos_print:
    mov ax, buf
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


ret
