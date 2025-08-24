.model small
.stack 100h
.data
    msg db 'faizan$',0    
    abc db ' abdulrehman$',0
    x db ?
.code
main proc  
    mov ax,@data
    mov ds,ax
    ;lea dx, msg  
    mov bx,offset msg 
    mov dx,bx
    mov ah,09h
    int 21h
    mov bx,offset abc 
    mov dx,bx
    int 21h
    
    mov ah,4ch
    int 21h
main endp
end main
    
    