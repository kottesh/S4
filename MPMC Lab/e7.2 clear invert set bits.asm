org 100h

.data
num db 10    ; data

set db 1     ; (0000 0001) 
clear db 254 ; (1111 1110) 
invert db 1  ; (0000 0001) 

pos db ?     ; store bit position

prompt db "enter bit position: $" 

.code
mov al, num

call display_prompt
mov dl, set    ; for set, do OR operation
mov cl, [pos]
rol dl, cl
or al, dl

call display_prompt
mov dl, clear  ; for clear, do AND operation
mov cl, [pos]
rol dl, cl
and al, dl

call display_prompt
mov dl, invert ; for invert, do XOR operation
mov cl, [pos]
rol dl, cl
xor al, dl

ret
                                 
; subroutine to display prompt and read bit position                                
display_prompt: 
    push ax               ; save the state of AX 'cause to continue
                          ; the manipulation with already manipulated data
    mov ax, 00h
    int 10h
    mov [pos], 0          ; clear the data in "pos"
    mov ah, 09h           ; display the prompt
    mov dx, offset prompt
    int 21h
    mov ah, 01h           ; get bit position
    int 21h
    sub al, 30h
    cmp al, 7
    jg default            ; jump to default if the bit position
                          ; is greater than 7 and assign pos to 0 (default value)

    mov [pos], al         ; store the bit position
    pop ax                ; restore AX
    ret 
                                    
default:
    mov [pos], 0
    pop ax
    ret                         
