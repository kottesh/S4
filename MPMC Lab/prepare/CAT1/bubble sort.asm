; hacky bubble sort (this code takes atlest 25-30Sec for just 9 elements. kek!)

org 100h

.data
arr db 9, 8, 7, 6, 5, 4, 3, 2, 1
arr_len db 9
temp db 0

.code

mov si, offset arr
xor cx, cx
mov cl, arr_len 
mov ch, arr_len

looper:
    dec ch
    jz exit
    mov si, offset arr     ; every time(no of elements) do assign the si 
                           ; to the inital address of array
    
    mov cl, ch             ; set the counter value of inner loop to 
                           ; current counter value in the outer loop.
sort:
    ; can't compare the memory directly. 
    ; thus load the values in the accumulator and compare.   
    mov ah, [si]
    mov al, [si + 1]
    cmp ah, al
    jg swap
cont:
    inc si  
    dec cl
    jz looper
    jmp sort
       
swap:
    ; can't move data between the memory.
    ; for that first load data in the register 
    ; and then assign to si and si + 1
    mov bh, [si]
    mov bl, [si+1]
    mov [si], bl
    mov [si+1], bh
    jmp cont      
exit:

ret

