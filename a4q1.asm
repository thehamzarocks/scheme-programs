section .data
msg1: db "enter string",0Ah
len1:equ $-msg1;
msg2: db "string is",0Ah
len2: equ $-msg2
msg3: db "length is",0Ah
len3: equ $-msg3
newline: db 0Ah
msg4: db "empty",0Ah
len4: equ $-msg4
nod1: dw 0

section .bss
string: resb 100
nod: resw 1
num: resw 1
temp: resb 1
ctr: resw 1


section .txt
global _start:
_start:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,len1
int 80h
mov ebx,string
mov word[nod],0
call read_string

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,len2
int 80h

mov ebx,string
mov word[ctr],0
call print_string



jmp exit

print_string:
cmp word[nod],0
je empty_string
 mov al,byte[ebx]
 mov  byte[temp],al
 call check_alpha
 pusha
 mov eax,4
 mov ebx,1
 mov ecx,temp
 mov edx,1
 int 80h
 popa
 inc word[ctr]
 inc ebx
 mov ax,word[nod]
 cmp word[ctr],ax
 je end_print_string
 jmp print_string
 
 check_alpha:
 pusha
 cmp byte[temp],65
 jb ignore
 cmp byte[temp],90
 ja check_small
 popa
 ret
 
 check_small:
  pusha
 cmp byte[temp],97
 jb ignore
 cmp byte[temp],122
ja ignore
 popa
 ret
 
 
 ignore:
 inc word[ctr]
 inc ebx
 mov ax,word[nod]
 cmp word[ctr],ax
 je end_print_string
 jmp print_string
 
 
 
 empty_string:
 mov eax,4
 mov ebx,1
 mov ecx,msg4
 mov edx,len4
 int 80h
 ret
 
 end_print_string:
 mov eax,4
 mov ebx,1
 mov ecx,newline
 mov edx,1
 int 80h
 ret
 
read_string:
pusha
   mov eax,3
   mov ebx,0
   mov ecx,temp
   mov edx,1
   int 80h
popa   
   cmp byte[temp],10
   je end_read_string
   inc word[nod]
    mov al,byte[temp]
    mov byte[ebx],al
    inc ebx
    jmp read_string
    
  end_read_string:
  ret  
  

  

exit:
mov eax,1
mov ebx,0
int 80h

