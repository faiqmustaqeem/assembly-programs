.model small
.stack 200h
.data
str1  db "Enter size of square :  $"
.code

main proc 

mov ax,@data
mov ds,ax

mov ah,9         ;string output
mov dx,offset str1
int 21h

mov ah,1     ; char input
int 21h
mov bl,al
sub bl,30h
mov cx,bl

mov ah,2
mov dl,'*'


l1:
mov bx,cx
mov cx,5
l2:
int 21h
loop l2
mov cx,bx
mov bl,dl

mov dl,10
int 21h
mov dl,bl
loop l1

mov ah,4ch
int 21h

main endp
end main