.model small
.stack 100h
.data
source db "this is a string$"
target db sizeof source dup(?)
.code

main proc

mov ax,@data
mov ds,ax

mov cx,lengthof source

mov si,lengthof source
sub si,2
mov di,0

l1:
mov dl,source[si]
mov target[di],dl
dec si
inc di
loop l1

mov target[di],'$'
mov ah,9
mov dx,offset target
int 21h

mov ah,4ch
int 21h
 
 
main endp
end main
