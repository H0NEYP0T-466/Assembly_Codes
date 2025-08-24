.model small
.stack 100h
.data
    prompt1 db 'Enter the First number: $' 
    var1 db ?
    prompt2 db 10,13,'Enter the Second number: $'
    var2 db ?
    resultmsg db 10,13,'Sum of Numbers: $'  
    result db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, prompt1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    sub al,48
    mov var1, al
    lea dx, prompt2
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    mov var2, al
    
    ;adding var1 and var2 then storing in result
    mov al, var1
    add al, var2
    add al,48
    mov result, al
    lea dx, resultmsg
    mov ah, 9
    int 21h
    
    mov dl, result
    mov ah, 2
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp
end main