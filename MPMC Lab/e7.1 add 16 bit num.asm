org 100h

.data
num1 dw 0FFFFh
num2 dw 0FFFh
   
res dd ?            ; declare double word uninitialized

.code
    mov ax, num1
    add ax, num2
    
    mov dx, 0
    adc dx, 0
    
    mov [res], ax
    mov [res+2], dx ; store overflow in the higher 16 bits
ret

