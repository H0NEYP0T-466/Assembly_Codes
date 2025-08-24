.model small
.stack 100h
.data
    msg db 'enter a first number $',0
    msg1 db ,0ah,0dh,'the number is divisible by 3 $',0
    msg3 db ,0ah,0dh,'the numbers is divisible by 2 $',0
   ; msg4 db ,0ah,0dh,'the numbers are not equal$',0
    ;msg5 db ,0ah,0dh,'the first number is lesser than the second number and the second number is greater than the first number $',0
    ;msg6 db ,0ah,0dh,'the first number is greater than the second number and the second number is lesser than the first number$',0    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    
    mov bl,2
    
    div bl
    
    cmp ah,0
    je equal
    
    lea dx,msg1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov cl,al
     
    cmp bl,cl
    je equal
    jmp notequal
              
equal:
    lea dx,msg3
    mov ah,09h
    int 21h
    jmp exit 
notequal:
    lea dx,msg4
    mov ah,09h
    int 21h
    cmp bl,cl
    jg greaterthan
    jmp lessthan
lessthan:
    lea dx,msg5
    mov ah,09h
    int 21h
    jmp exit
greaterthan:
    lea dx,msg6
    mov ah,09h
    int 21h
exit:
    
    mov ah,4ch
    int 21h
    
endp main
    