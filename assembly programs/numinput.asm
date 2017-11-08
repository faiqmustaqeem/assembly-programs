.model small
.stack 100h
.data
str1 db "value of ax is : $"
temp dw 0
ans dw 0
.code

main proc

mov ax,@data
mov ds,ax

call InputNumber
push ax

mov ah,2
mov dl,10
int 21h
mov ah,9
mov dx,offset str1
int 21h
pop ax
call outdec 

mov ah,4ch
int 21h
 

                
 
                
main endp

InputNumber proc
loop_num:
mov ah,1
int 21h 
mov ah,0
mov temp,ax

cmp ax,13
je out_loop
sub ax,'0'

mov ax,ans
mov bx,10
mov dx,0
mul bx
mov ans,ax
sub temp,'0'
mov dx,temp
add ans,dx

jmp loop_num
out_loop:
mov ax,ans

ret
InputNumber endp

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
