org 100h

jmp start

sum DB 0
n1  DB 5
n2  DB 4
result DB "result: $"

start:
    mov al, n1
    add al, n2
    mov sum, al
              
    mov dx, offset result
    mov ah, 9h
    int 21h
              
    mov dl, sum
    mov ah, 2h
    add dl, '0'
    int 21h

exit:
    int 20h
ret