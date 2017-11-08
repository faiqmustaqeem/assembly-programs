.model small
.stack 200h
.data
.code
Main PROC
mov ah,2
mov dl,'A'
int 21h
mov ah,4ch
int 21h
Main ENDP
END Main