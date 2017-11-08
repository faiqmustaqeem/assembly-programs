   .model small
.stack 100h
.data
source db "this is si siht$"
msg1 db 10,13,"Palindrome !$"
msg2 db 10,13,"Not Palindrome !$"
.code

main proc

mov ax,@data
mov ds,ax





mov si,0
mov di,lengthof source-2
mov cx,lengthof source-1
l2:
mov al,source[si]
cmp al,source[di]
je palindromecheck
jne notpalindrome
palindromecheck:
cmp si,lengthof source-1
je printpal
inc si
dec di
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
