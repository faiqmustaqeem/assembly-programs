   .model small
.stack 100h
.data
str1 db "this is string$"
v_count db 0
c_count db 0
vowel_msg db 10,13,"vowels : $"
digits_msg db 10,13,"digits : $" 
.code

main proc

mov ax,@data
mov ds,ax

mov cx,lengthof str1
mov si,0
labelforcount:

mov al,str1[si]
cmp al,'a'
je is_vowel
cmp al,'e'
je is_vowel
cmp al,'i'
je is_vowel
cmp al,'o'
je is_vowel
cmp al,'u'
je is_vowel
jmp is_consonant
is_vowel:
inc v_count
inc si
jmp endCnd
is_consonant:
inc c_count
inc si
loop labelforcount

mov ah,4ch
int 21h
 
 
main endp
end main
