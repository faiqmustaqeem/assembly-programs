.model small
.stack 200h
.code

mov ah,2
mov dl,'*'
mov al,5
mov cx,5

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
mov dl,'*'
mov cx,bx

loop l1

mov ah,4ch
int 21h
main proc

main endp
end main