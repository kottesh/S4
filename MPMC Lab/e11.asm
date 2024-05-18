data segment
    arr_x db 01,02,05,09,10
    arr_x_len db 5
    arr_y db 03,05,12,19
    arr_y_len db 4
    
    no_match_msg db "No First Match Found$"
    no_non_match_msg db "No First Non Match Found$"
    
    match_msg db " <- First Matching $"
    non_match_msg db " <- First Non Matching $" 
ends

stack segment
    dw   128  dup(0)
ends

code segment
start_x:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si, arr_x
    lea di, arr_y
    
    mov dx, offset arr_x_len
find_match:
    mov cx, offset arr_y_len
    mov al, [si]
    repne scasb
    jz print
    
    dec dl
    cmp dl, 0
    je  no_first_match_found
    lea di, arr_y
    inc si
    jmp find_match
        
print:
    mov dl, al
    add dl, 30h
    mov ah, 02h
    int 21h
    
    lea dx, match_msg
    mov ah, 09h
    int 21h

    jmp start_y
    

no_first_match_found:
    lea dx, no_match_msg
    mov ah, 09h
    int 21h
    
start_y:
    lea si, arr_x
    lea di, arr_y
    

    mov bx, offset arr_x_len      
find_non_match:
    mov cx, offset arr_y_len
    mov al, [si]
    repe scasb
    dec di 
    mov dl, [di]
    jnz print_non_matching
    
    dec bx
    cmp bx, 0
    je no_non_match_found
    lea di, arr_y
    inc si
    jmp find_non_match
    

print_non_matching:
    xor bx, bx
    mov bl, dl
    mov ah, 02h
    
    mov dl, al
    add dl, 30h
    int 21h
    
    mov dx, 2Ch
    int 21h
    mov dl, bl
    add dl, 30h
    int 21h
    
    lea dx, non_match_msg
    mov ah, 09h
    int 21h
    
    int 20h

no_non_match_found:
    mov ah, 09h
    lea dx, no_non_match_msg
    int 21h    
    
      
ends

end start_x
