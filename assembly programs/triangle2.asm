       .model large
.stack 1000h
.data
msg1 db 10,13,"Enter size of triangle : $"
space db 0
sizeoftriangle db 0
.code

main proc 

mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset msg1
int 21h

mov ah,1
int 21h
mov bl,al
mov bh,al
sub bh,'0'
mov sizeoftriangle,bh
mov ah,2
mov dl,10
int 21h


mov al,bl
mov cl,al
sub cl,'0'

loopa: 
mov bl,cl
mov dl,'*'
mov bh,sizeoftriangle
sub bh,cl
mov space,bh
mov cl,space
inc cl
mov ch,0
spacelabel:
mov dl,' '
int 21h
loop spacelabel
mov cl,bl
mov dl,'*'
loopstar:
int 21h
loop loopstar
mov cl,bl
mov dl,10
int 21h

loop loopa


mov ah,4ch
int 21h

main endp
end main