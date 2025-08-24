.model small
.stack 100h
.data
    msg db 'enter your name: $',0
    msg1 db 'enter your age: $',0
    msg2 db 'Your name is: $',0
    msg3 db 'Your age is: $',0
    namee db 50 DUP('$')
    age db 5 DUP('$')
    newline db 0ah,0dh,'$'
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    lea dx, namee
    mov ah, 0ah
    int 21h
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    lea dx,msg1
    mov ah,09h
    int 21h
    
    lea dx, age
    mov ah, 0ah
    int 21h
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    lea dx,msg2
    mov ah,09h
    int 21h
    
    lea dx, namee+2
    mov ah, 09h
    int 21h
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    lea dx,msg3
    mov ah,09h
    int 21h
    
    lea dx, age+2
    mov ah, 09h
    int 21h
    


main endp
end main
    
    
    
    