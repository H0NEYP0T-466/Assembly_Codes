.model
.stack 100h
.data
   msg db 'faizan',0ah,0dh,'abdul rehman$',0
   mmm db ,0ah,0dh,'faizan',0ah,'abdul rehman$',0
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,09h
    int 21h
    lea dx,mmm
    int 21h
    
    mov ax,4ch
    int 21h
main endp
end main                                                                                  
