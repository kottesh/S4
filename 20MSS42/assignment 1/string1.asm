org 100h

.data 
src db "this is asm" ; source string
dst db 20 dup(?)     ; destination buffer

.code
mov ax, @data
mov ds, ax
mov es, ax
cld

mov si, offset src   ; load si with start of src address
mov di, offset dst   ; load di with start of dst address
mov cx, 20           
rep movsb            ; repeat copy byte until the cx becomes 0

ret 

