.model small
.stack 100h
.data
    msg1 db 'my first name is:$',0
    msg2 db ,0ah,0dh,'my last name is:$',0
    msg3 db ,0ah,0dh,'my complete name is:$',0
    var1 db 'faizan$',0 
    var2 db 'abdul rehman$',0 
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,msg1
    mov ah,09h
    int 21h
    lea dx,var1
    mov ah,09h
    int 21h
    
    
    lea dx,msg2
    mov ah,09h
    int 21h
    lea dx,var2
    mov ah,09h
    int 21h
    lea dx,msg3
    mov ah,09h
    int 21h
    lea dx,var1
    mov ah,09h
    int 21h
    lea dx,var2
    mov ah,09h
    int 21h 
    
    mov ah,04h
    int 21h
    main endp   
    
        