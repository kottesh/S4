; get a character from the user and print
ORG 100h    

MOV AH, 00h
INT 16h  

MOV AH, 0Eh
INT 10h

INT 21h

RET