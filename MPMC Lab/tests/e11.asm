data segment
    array1 db 1, 2, 3, 4, 5
    array2 db 5 dup(0)    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax

            
    lea si, array1
    lea di, array2
    
    mov cx, 5
    
    rep movsb
    
    mov ax, 4c00h
    int 21h    
ends

end start