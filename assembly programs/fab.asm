.model small
.stack 100h
.data
str1 db 10,13,"Enter range to dind all fabionicci numbers : $"

range dw 0
firstNum dw 0
secondNum dw 1
tmp dw 0
fab dw 0
.code 
main proc

mov ax,@data
mov ds,ax


mov ah,9
mov dx,offset str1
int 21h

call InputDec
mov cx,ax
push ax
mov ah,2
mov dl,10
int 21h
pop ax
label1:
mov fab,0
mov bx,firstNum
add fab,bx

mov bx,secondNum
add fab,bx

mov ax,fab
call outdec
push ax
mov ah,2
mov dl,10
int 21h
mov ah,2
mov dl,13
int 21h
pop ax
mov bx,secondNum
mov firstNum,bx

mov bx,fab
mov secondNum,bx

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
rep_loop1:
mov dx,0
div bx
push dx
inc cx
cmp ax,0
jne rep_loop1
mov ah,2
print_loop:
pop dx
add dl,'0'
int 21h
loop print_loop

pop dx
pop cx
pop bx
pop ax
ret
outdec endp
end main