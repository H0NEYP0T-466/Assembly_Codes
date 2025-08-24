.model small
.stack 100h
.data   
    prompt1 db 'Enter the First number: $'
    prompt2 db 10, 13,'Enter the Second number: $'
    input1 db ? 
    input2 db ?
    result_msg db 10, 13, 'Result after Division: $'  
    result db ?
.code 
main proc
    mov ax, @data
    mov ds, ax
      
    ; display prompt1
    lea dx, prompt1
    mov ah, 09h
    int 21h
    
    ; input first variable 
    mov ah, 1
    int 21h
    sub al, 30h        ; convert from ASCII to number
    mov input1, al
    
    ; display prompt2
    lea dx, prompt2
    mov ah, 09h
    int 21h
 
    ; input second variable 
    mov ah, 1
    int 21h
    sub al, 30h        ; convert from ASCII to number
    mov input2, al
    
    ; display the result message
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    ; perform division
    xor ah, ah         ; clear AH before division
    mov al, input1     ; move dividend to AL
    mov bl, input2     ; move divisor to BL
    div bl             ; divide AL by BL, result in AL
    
    mov result, al     ; store result
    
    ; display result
    mov dl, result
    add dl, '0'        ; convert back to ASCII
    mov ah, 2
    int 21h    
    
    ; exit program
    mov ah, 4Ch
    int 21h
main endp           
end main