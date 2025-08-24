.model small
.stack 100h
.data
    msg1 db 'enter a small to convert into capital a-z:$',0 
    msg2 db ,0ah,0dh,'enter a capital to convert into small A_Z:$',0 
    var1 db ?
    var2 db ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,msg1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    
    mov dl,al
    sub dl,32
    mov var1,dl
    
    
 
    mov ah,02h
    int 21h  
           
           
           
    lea dx,msg2
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    
    mov dl,al
    add dl,32
    mov var2,dl
   
    

    mov ah,02h
    int 21h


   
    
    
    mov ah,04h
    int 21h
    main endp   
    
        