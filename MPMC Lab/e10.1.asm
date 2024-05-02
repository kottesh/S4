data segment
    num1 dw 32765
    num2 dw -32768
    buf dw ?

    of_msg db "overflow detected...$"

    neg_sign db "-$"
ends

stack segment
    dw 128 dup(0)
ends
      
code segment
    mov ax, data
    mov ds, ax
    mov es, ax

    mov ax, num1
    cmp ax, 32767 ; the sub op will be done but operands won't get affected
                  ; but the flags get updated.
    jg overflow
    
    mov ax, num2
    cmp ax, 32767
    jg overflow
    
    mov ax, num1
    add ax, num2
    
    jo overflow  ; check for overflow addition
                 ; there the res is not within -32768 to 32767
                 ; then print the overflow msg and exit.
    
    mov buf, ax
    
    shr ax, 15
    cmp ax, 1
    jne print_pos
    
    mov ah, 09h
    mov dx, offset neg_sign
    int 21h
    
    call clear_regs   ; printing negative number
    mov ax, buf
    neg ax
    push ax
    call print
    
    int 20h
    
    print_pos:   ; printing positive number
        call clear_regs
        mov ax, buf
        push ax
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
        mov ah, 09h
        mov dx, offset of_msg
        int 21h
        int 20h   
ends
