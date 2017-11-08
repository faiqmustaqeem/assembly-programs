.model small
.stack 100h
.data
str1 db "Number : $"
sod  db 10,13,"Sum of digits = $"
num dw 12345
sum dw 0
.code

main proc

mov ax,@data
mov ds,ax
mov ah,9
mov dx, offset str1
int 21h

mov ax,num
call outdec

start:
mov dx,0
mov ax,num;dividend
mov bx,10
div bx 
add sum,dx
mov num,ax
cmp ax,0
jne start

mov ah,9
mov dx, offset sod
int 21h
mov ax,sum
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
