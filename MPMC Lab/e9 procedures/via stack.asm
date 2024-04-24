org 100h

.data
val dw 9865

.code

mov dx, val
push dx
xor dx, dx
call print

int 20h     ; exit program.

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
