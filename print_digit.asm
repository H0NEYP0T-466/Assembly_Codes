.model small
.stack 100h
.data
.code
mian proc
    mov dl,'2'
    mov ah,02h
    int 21h 
    
    
    mov ax,4ch
    int 21h
mian endp