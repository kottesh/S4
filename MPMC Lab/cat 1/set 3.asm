org 100h

.data
nums db 0,1,2,4,5,6,7
nums_len db 7
pivot db 3
target db 0
index db 100
default_idx db "-1 $"

r_nums db 100 dup(0)

.code

checking:
    mov al, nums_len
    cmp al, 1
    je find_index

rotate:
    xor ax, ax
    mov ah, pivot ; has the pivot index
    mov al, 0     ; counts the element to have count of the index!
    
    xor cx, cx
    mov cl, nums_len ; holds the original array length
   
    mov si, offset nums
    mov di, offset r_nums
    
idx_mover:
    inc si
    inc al
    dec cl ; every time i move to next element down the count by 1
    cmp al, ah
    je populate  
    jmp idx_mover

populate:
    xor dx, dx
    mov dl, [si]
    mov [di], dl
    inc si
    inc di
    dec cl ; every time I move to next element down the count by 1 same as above
    jnz populate
    jmp store_starting

store_starting:
    mov si, offset nums   
    xor cx, cx
    mov cl, pivot ; pivot index value here is used like the no of elements in the starting 
lp:
    xor dx, dx
    mov dl, [si]
    mov [di], dl
    inc di
    inc si
    dec cl
    jnz lp
    

; this will find the index of the element after rotating
find_index:
    xor ax, ax
    mov al, 0           ; for tracking the index
    mov cl, nums_len
    xor bx, bx
    mov bx, offset r_nums
    mov dl, target
itr:
    cmp [bx], dl
    je store
    inc bx
    inc al
    dec cl
    jnz itr
    jmp display

store:
    mov index, al ; if found the element store the index and just go for displaying it.

display:
    xor ax, ax
    xor dx, dx 
    
    ; (done! handled)need to write the index for not found element
    
    mov ah, 02h
    mov dl, index
    
    cmp dl, 100
    je not_found
    add dl, 30h
    int 21h
    jmp exit

not_found: ; for displaying -1 if the element is not found
    mov ah, 09h
    mov dx, offset default_idx
    int 21h

exit:
 
ret