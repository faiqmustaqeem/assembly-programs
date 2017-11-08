       .model large
.stack 1000h
.data
msg1 db 10,13,"Enter size of triangle : $"
space db 0
sizeoftriangle db 0
temp db 0
counter_temp db 0
number db 0
n db 0
.code

main proc 

mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset msg1
int 21h

mov ah,1
int 21h ;input number
mov temp,al
mov number,al
sub number,'0'
mov bh,number
mov sizeoftriangle,bh
mov ah,2
mov dl,10
int 21h


mov al,temp
mov cl,al
sub cl,'0'
mov n,cl

loopa: 
mov counter_temp,cl

mov dl,' '
spacelabel:
int 21h
loop spacelabel

mov cl,counter_temp
mov bh,sizeoftriangle
mov number,bh
sub number,cl
mov bh,number
mov space,bh
mov cl,space
inc cl
mov ch,0
loopstar:
mov dl,'*'
int 21h
mov dl,' '
int 21h
loop loopstar
mov cl,counter_temp
mov dl,10
int 21h

loop loopa


mov cl,n
dec cl
loopb: 
mov counter_temp,cl
mov bh,sizeoftriangle
mov number,bh
sub number,cl
mov bh,number
mov space,bh
mov cl,space
inc cl
mov ch,0
mov dl,' '
spacelabel1:
int 21h
loop spacelabel1

mov cl,counter_temp

loopstar1:
mov dl,'*'
int 21h
mov dl,' '
int 21h
loop loopstar1
mov cl,counter_temp
mov dl,10
int 21h

loop loopb



mov ah,4ch
int 21h

main endp
end main