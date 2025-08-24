.model small
.stack 100h
.data
    var db 'Enter the first value $',0
    var1 db ,0ah,0dh,'Enter the second value $',0 
    var2 db ,0ah,0dh,'The result after addition of A and B: $',0
    num1 db ?
    num2 db ?
    res db ?
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,var
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    
    mov num1,al
    
    
    lea dx,var1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    
    mov num2,al
    
    
    
    sub num1,'0'
    sub num2,'0'
    
    mov dl, num1
    add dl,num2
    add dl ,'0'
    mov res,dl
    
    lea dx,var2
    mov ah,09h
    int 21h
    
    mov dl,res
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
    
main endp
end main
    