.model small
.stack 100h
.data
    msg db 'f$',0
    msg1 db 'e$',0
    msg2 db 'z$',0
    msg3 db 'a$',0
    msg4 db 'n$',0    
.code
main proc  
    mov ax,@data
    mov ds,ax    
    mov ah,2
    mov dl, msg  
    int 21h 
    mov dl, msg1  
    int 21h
    mov dl, msg2  
    int 21h
    mov dl, msg3  
    int 21h
    mov dl, msg4  
    int 21h
    mov ah,4ch
    int 21h
main endp
end main
    
    