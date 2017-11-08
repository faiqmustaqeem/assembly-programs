.model small
.stack 100h 
.data
.code
main proc 
mov ax ,5
push ax
call fact
call outdec

mov ah,4ch
int 21h
main endp 


fact proc

mov bp,sp
cmp word ptr [bp+2],1
JG l1
mov ax ,1
ret 2
l1:
mov bx , word ptr[bp+2]
dec bx
push bx
call fact 
mov bp,sp

mul word ptr [bp +2]
ret 2
fact endp


outdec proc

push ax
push bx
push cx
push dx

cmp ax,0
jge if_check
push ax
mov dl,'-'
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
mov ah,2
print_loop:
pop dx
add dl,'0'
int 21h
loop print_loop

pop dx
pop cx
pop cx
pop ax
ret
outdec endp

end main



 





