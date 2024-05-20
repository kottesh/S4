org 100h

isr60h:
    push ax
    push bx
    mov ax, 0b800h
    mov es, ax
    mov di, 0
    mov al, 'z'
    mov ah, 0eh
    stosw
    pop bx
    pop ax
    iret

set_vector:
    cli
    mov ax, seg isr60h
    mov ds, ax
    mov word ptr [60h*4], offset isr60h
    mov word ptr [60h*4+2], ax
    sti

trigger_interrupt:
    int 60h

hang:
    hlt
    end set_vector
