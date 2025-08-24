.model small
.stack 100h
.data
    msg db ,0ah,0dh,'the number is even.$',0
    msg1 db ,0ah,0dh,'the number is odd.$',0
    msg3 db ,0ah,0dh, 'the digits are equal.$',0
    msg2 db 'enter first integer: $',0
    msg4 db 'enter second integer: $',0
    notequal db 'the number are not equal$',0
    num1 db ?
    num2 db ?
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, msg2
    mov ah, 09h
    int 21h 
    
    mov ah, 01h
    int 21h
    mov num1,al
    
    lea dx,msg4
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    mov num2,al
    
    cmp num1,al
    je equal
    
    lea dx,notequal
    mov ah,09h
    int 21h
    jmp even_odd
    
    equal:
    lea dx,msg3
    mov ah,09h
    int 21h
    
    even_odd:
    mov bl,num1
    mov cl,num2
    
    sub bl,'0'
    sub cl,'0'
    and bl,1
    jz even
    lea dx,msg1
    mov ah,09h
    int 21h
    even:
    lea dx,msg
    mov ah,09h
    int 21h
    jmp exit
    exit:
    mov ah,4ch
    int 21h
main endp
end main
    
    
    
    