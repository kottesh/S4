org 100h

.data
arr_x db 5, 2, 1 
arr_y db 5, 9, 2, 8

arr_x_len db 3
arr_y_len db 4

common_len db 0
uncommon_len db 0

common db 10 dup (?)   ; Memory to store the common elements
uncommon db 10 dup (?) ; Memory to store the uncommon elements

.code

mov cl, arr_x_len

mov si, offset arr_x
mov di, offset arr_y

mov bx, offset common
mov dx, offset uncommon

l1: 
    mov al, [si]

    mov ch, arr_y_len
    mov di, offset arr_y
    l2:
        cmp ch, 0
        je uncom
        
        mov ah, [di]
        inc di
        dec ch 
        cmp al, ah
        jne l2      ; if not found continue in the same loop
        
        mov al, common_len
        inc al
        mov common_len, al
        mov [bx], ah
        inc bx
        
        inc si
        dec cl
        jz cmp_with_cmn
        
        jmp l1

uncom:
    push bx
    mov bx, dx
    mov [bx], al
    inc bx
    mov dx, bx
    
    mov al, uncommon_len
    inc al
    mov uncommon_len, al
    pop bx

    inc si
    dec cl
    jz cmp_with_cmn
    jmp l1
    
cmp_with_cmn:
    mov si, 0
    mov di, 0
    mov si, offset arr_y
    mov bx, dx
    mov cl, arr_y_len
    
lp1:
    mov ch, common_len
    mov di, offset common
    mov al, [si]
    lp2:
        cmp ch, 0
        je store
        
        mov ah, [di]  
        dec ch 
        inc di
        cmp ah, al 
        jne lp2
        
        inc si
        dec cl
        jz exit
        
        jmp lp1
        
store:
    mov ah, uncommon_len
    inc ah
    mov uncommon_len, ah
    mov [bx], al
    inc bx
    inc si
    dec cl
    jz exit
    jmp lp1    
    
exit:

ret