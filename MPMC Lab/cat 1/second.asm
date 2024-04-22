org 100h

.data
nums db 4,5,6,7,0,1,2
nums_len db 7
target db 3
pivot db 0

default db "-1 $"

idx1 db 0
idx2 db ?

.code
    mov si, offset nums
    mov dl, target
    cmp nums_len, 1

    je f_part
     
start:
    mov al, nums_len
    sub al, pivot
    mov idx2, al
    
    mov si, offset nums
    mov di, offset nums
    
    mov cl, idx2
looper:
    inc di
    dec cl
    jnz looper
    
    mov al, [di]  ; second half
    mov ah, [si]  ; first half
    
    xor dx, dx
    mov dl, target
    
    
    cmp dl, ah
    jge f_part       ; greater than or equal to second part
    jmp s_part       ; first part
    
    
s_part:       
    xor ax, ax
    mov cl, idx2 

lp:  
    mov al, cl
    cmp dl, [di] ; target is stored in the dl before
    je display
    inc di
    inc cl
    mov al, 100
    cmp cl, nums_len
    je display
    jmp lp

f_part:
    xor ax, ax
    mov cl, 0
    
    
lpp:
    mov al, cl
    cmp dl, [si]
    je display
    inc si
    inc cl   
    mov al, 100
    cmp cl, idx2
    je display
    jmp lpp    
    

display:
    cmp al, 100
    je dflt
    mov dl, al
    add dl, 30h
    xor ax, ax
    mov ah, 02h
    int 21h 
    jmp exit
    
dflt:
    mov dx, offset default
    mov ah, 09h
    int 21h

exit:        
ret
