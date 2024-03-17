org 100h

.data
data db "to the mars"

.code
mov di, offset data
mov cx, 11
mov al, 'm'
repne scasb 

ret

