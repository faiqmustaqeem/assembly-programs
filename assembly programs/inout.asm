.model small
.stack 100h
.data

.code 
main proc

mov ax,@data
mov ds,ax

mov ax,5

mov cx,16

label1:
shl ax,1
jc print_One
jnc print_Zero
push ax
print_One:
mov ah,2
mov dl,'1'
int 21h
jmp endLoop
print_Zero:
mov ah,2
mov dl,'0'
int 21h
endLoop:
loop label1





mov ah,4ch
int 21h

main endp



InputDec proc
push dx
push cx
push bx
start:

mov ah,2
mov dl,'?'
int 21h

mov bx,0
mov cx,0
mov ah,1
int 21h

cmp al,'-'
je minus

cmp al,'+'
je plus

jmp rep_loop

minus:
mov cx,1

plus:
int 21h

rep_loop:
cmp al,'0'
jl notDigit

cmp al,'9'
jg notDigit

sub al,30h
mov ah,0
push ax

mov ax,10
mul bx

pop bx
add bx,ax
mov ah,1
int 21h

cmp al,0Dh
jne rep_loop

mov ax,bx
cmp cx,0
je exit
neg ax
exit:
pop bx
pop cx
pop dx

ret 
notDigit:
mov ah,2
mov dl,0Dh
int 21h
mov dl,0Ah
int 21h
jmp start

InputDec endp


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