                                                        .model small
.stack 100h 
.data
.code
main proc 
mov ax ,3
push ax 
mov ax,4
push ax
call power
call outdec

mov ah,4ch
int 21h
main endp 


power proc

mov bp,sp
cmp word ptr [bp+2],0
JG l1
mov ax ,1
ret 4
l1:
mov bp,sp
mov bx , word ptr[bp+4]
push bx
mov bp,sp
mov bx , word ptr[bp+4]
dec bx
push bx
call power 
mov bp,sp

mul word ptr [bp+4]
ret 4
power endp


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



 





