.model small
.stack 100h
.data
    msg db 'fezan$',0   
.code
main proc  
    mov ax,@data
    mov ds,ax    
    mov ah,09h
    lea dx, msg  
    int 21h 
    mov ah,4ch
    int 21h
main endp
end main
