.model small
.stack 100h
.data
.code

main proc

mov ax,@data
mov ds,ax

mov ax,1234
call outdec


mov ah,4ch
int 21h
 
 
main endp

outdec proc

push ax
push bx
push cx
push dx

cmp ax,0
jge if_check
push ax
push dl,'-'
mov ah,2
int 21h
pop ax
neg ax
if_check:
mov cx,0
mov bx,10
rep_loop:
mov dx,0
div bx
push dx
inc cx
cmp ax,0
jne rep_loop

print_loop:
pop dx
add dl,'0'
int 21h
loop print_loop

pop dx
pop cx
pop cx
pop ax

outdec endp

end main
