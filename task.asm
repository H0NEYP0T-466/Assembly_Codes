.model small
.stack 100h
.data
    msg1 db 'the first var 1 is:$',0
    msg2 db ,0ah,0dh,'the first var 2 is:$',0
    var1 db ? 
    var2 db ? 
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,msg1
    mov ah,09h
    int 21h
    mov dl,'x'
    mov var1,dl
    mov ah,02h
    int 21h
    
    
    lea dx,msg2
    mov ah,09h
    int 21h
    mov dl,'y'
    mov var2,dl
    mov ah,02h
    int 21h 
    
    mov ah,04h
    int 21h
    main endp   
    
        