   .model small
.stack 100h
.data
source db "this is si siht$"
target db lengthof source dup(?)
msg1 db 10,13,"Palindrome !$"
msg2 db 10,13,"Not Palindrome !$"
.code

main proc

mov ax,@data
mov ds,ax

mov cx,lengthof source-1

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

mov si,0

mov cx,lengthof source-1
l2:
mov al,source[si]
cmp al,target[si]
je palindrome
jne notpalindrome
palindrome:
cmp si,lengthof source-1
je printpal
inc si
loop l2
printpal:
mov ah,9
mov dx,offset msg1
int 21h
jmp exit
notpalindrome:
mov ah,9
mov dx,offset msg2
int 21h
exit:
mov ah,4ch
int 21h
 
 
main endp
end main
