.model small
.stack 100h
.data
str1 db "Faiq123$"
upper_case_count db 0
lower_case_count db 0
digit_count db 0
vowel_count db 0
consonant_count db 0
upper db 10,13,"Upper case characters are : $"
lower db 10,13,"Lower case characters are : $"
digit db 10,13,"Digits are : $"
vowel db 10,13,"vowels are : $"
consonant db 10,13,"Consonants are : $"
.code

main proc

mov ax,@data
mov ds,ax

mov ah,2
mov dl,10
int 21h

mov ah,9
mov dx,offset str1
int 21h

mov cx,lengthof str1
mov di,0
label1:
mov al,str1[di]

cmp al,'0'
jge checkSecondCndForDigit
jmp not_Digit
checkSecondCndForDigit:
cmp al,'9'
jle inc_Digit
jmp not_Digit
inc_Digit:
inc digit_count
jmp exit
not_Digit:

cmp al,'A'
jge checkSecondCndForUpperCaseLetter
jmp not_upperCase
checkSecondCndForUpperCaseLetter:
cmp al,'Z'
jle inc_uppercase
jmp not_upperCase
inc_uppercase:
inc upper_case_count
not_upperCase:

cmp al,'a'
jge checkSecondCndForLowerCaseLetter
jmp not_LowerCase
checkSecondCndForLowerCaseLetter:
cmp al,'z'
jle inc_LowerCase
jmp not_LowerCase
inc_LowerCase:
inc Lower_case_count
not_LowerCase:



cmp al,'a'
je inc_vowel_count
cmp al,'e'
je inc_vowel_count
cmp al,'i'
je inc_vowel_count
cmp al,'o'
je inc_vowel_count
cmp al,'u'
je inc_vowel_count
cmp al,'A'
je inc_vowel_count
cmp al,'E'
je inc_vowel_count
cmp al,'I'
je inc_vowel_count
cmp al,'O'
je inc_vowel_count
cmp al,'U'
je inc_vowel_count
jmp inc_consonant_count
inc_vowel_count:
inc vowel_count
jmp exit
inc_consonant_count:
inc consonant_count

exit:
inc di
loop label1

mov ah,9
mov dx,offset lower
int 21h
mov ah,2
mov dl,lower_case_count
add dl,'0'
int 21h

mov ah,9
mov dx,offset upper
int 21h
mov ah,2
mov dl,upper_case_count
add dl,'0'
int 21h

mov ah,9
mov dx,offset digit
int 21h
mov ah,2
mov dl,digit_count
add dl,'0'
int 21h

mov ah,9
mov dx,offset vowel
int 21h
mov ah,2
mov dl,vowel_count
add dl,'0'
int 21h

mov ah,9
mov dx,offset consonant
int 21h
mov ah,2
mov dl,consonant_count
add dl,'0'
int 21h




mov ah,4ch
int 21h
 
 
main endp
end main
