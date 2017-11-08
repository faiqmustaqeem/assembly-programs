.model small
.stack 100h
.data
var dw 0
str1 db 10,13,"Enter Decimal number to Convert into Binary : $"
.code 
main proc

mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset str1
int 21h

call InputDec
mov var,ax
mov ax,0
mov ah,2
mov dl,10
int 21h
mov ah,2
mov dl,13
int 21h
mov ax,0

mov cx,16

label1:
shl var,1
jc print_One
jnc print_Zero
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

end main