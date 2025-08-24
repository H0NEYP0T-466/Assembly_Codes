.model small
.stack 100h
.data
    prompt1 db 'Eenter first value:$'
    prompt2 db 10, 13,'Enter second value:$'
    prompt3 db 10, 13,'Enter third value:$'
    prompt4 db 10, 13,'Enter fourth value:$'
    prompt5 db 10, 13,'Enter fifth value:$'
    
    message db 10,13,10, 13,'Printing the Values$'
    result1 db 10, 13,'First value: $'
    result2 db 10, 13,'Second value: $'
    result3 db 10, 13,'Third value: $'
    result4 db 10, 13,'Fourth value: $'
    result5 db 10, 13,'ifth value: $'
    value1 db ?
    value2 db ?
    value3 db ?
    value4 db ?
    value5 db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, prompt1
    mov ah, 9
    int 21h 
    ;input 1
    mov ah, 1
    int 21h
    mov value1, al
    lea dx, prompt2
    mov ah, 9
    int 21h 
    ;input 2
    mov ah, 1
    int 21h
    mov value2, al
    
    lea dx, prompt3
    mov ah, 9
    int 21h 
    ;input 3
    mov ah, 1
    int 21h
    mov value3, al
    
    lea dx, prompt4
    mov ah, 9
    int 21h 
    ;input 4
    mov ah, 1
    int 21h
    mov value4, al
    
    lea dx, prompt5
    mov ah, 9
    int 21h 
    ;input 5
    mov ah, 1
    int 21h
    mov value5, al
    
    ;printing values
    lea dx, message
    mov ah, 9
    int 21h
    
    ;display result 1
    lea dx, result1
    mov ah, 9
    int 21h
    mov dl, value1
    mov ah, 2
    int 21h
    
    ;display result 2
    lea dx, result2
    mov ah, 9
    int 21h
    mov dl, value2
    mov ah, 2
    int 21h
    
    ;display result 3
    lea dx, result3
    mov ah, 9
    int 21h
    mov dl, value3
    mov ah, 2
    int 21h
    
    ;display result 4
    lea dx, result4
    mov ah, 9
    int 21h
    mov dl, value4
    mov ah, 2
    int 21h
    
    ;display result 5
    lea dx, result5
    mov ah, 9
    int 21h
    mov dl, value5
    mov ah, 2
    int 21h     
    
    mov ah, 4Ch
    int 21h
main endp
end main