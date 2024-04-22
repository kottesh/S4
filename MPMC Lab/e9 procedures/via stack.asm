org 100h

.data
val dw 567

.code

mov ax, val
call print

ret

print proc
    xor cx, cx
    mov bx, 10
    
    lp:
        inc cx   ; for tracking nos of digits.
        div bx
        push dx
        xor dx, dx ; clear the dx. otherwise in the next iteration it will consider
                   ; dx:ax for divide opreation.
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