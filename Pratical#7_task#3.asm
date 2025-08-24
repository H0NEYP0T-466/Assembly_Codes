.model small
.stack 100h
.data
    msg1 db 'Enter value for B: $'
    msg2 db 10,13,'Enter value for C: $'    
    msg3 db 10,13,'Enter value for D: $'
    msg4 db 10,13,'Enter value for E: $' 
    exp db 10,13,10,13,'Evaluating the Expression A= B+C-D*E$'
    result db 10,13,'Value of A: $'
    A db ?
    B db ?
    C db ?
    D db ?
    E db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, msg1
    mov ah, 9
    int 21h 
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov B, al
    lea dx, msg2
    mov ah, 9
    int 21h 
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov C, al
    
    lea dx, msg3
    mov ah, 9
    int 21h 
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov D, al
    
    lea dx, msg4
    mov ah, 9
    int 21h 
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov E, al
              
    ;multiply D and E stored in ax         
    mov al, D
    mul E
  
    ;move d*e into bx
    mov bl, al 
    
    ;move b to al and add c
    mov al, B
    add al, C  
    
    ;subtract BX (D*E) from AX (B+C)
    sub al, bl
    ;final result stored in al
    mov A, al
    lea dx, exp
    mov ah, 9
    int 21h  
    
    lea dx, result
    mov ah, 9
    int 21h 
    
    mov dl, A
    add dl, '0'
    mov ah, 2
    int 21h      
    
    mov ah, 4Ch
    int 21h
    
main endp
end main