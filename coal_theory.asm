.model small
.stack 100h
.data
    msg db 'Enter a number (1 to 999):$', 0
    newline db 0Ah, 0Dh, '$', 0
    positive db ' is a positive number$', 0
    single_digit db ' is a one-digit number$', 0
    double_digit db ' is a two-digit number$', 0
    triple_digit db ' is a three-digit number$', 0
    num dw ?         
    
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, msg
    mov ah, 09h
    int 21h
    xor cx, cx         

read_digit:
    mov ah, 01h        
    int 21h
    cmp al, 0Dh        
    je validate_input 

    sub al, '0'        

    mov dl, al         
    add cx, cx         
    add cx, dx         
    jmp read_digit     

validate_input:
    mov num, cx        
    lea dx, newline
    mov ah, 09h
    int 21h
    
    cmp num,0
    jl exit

    lea dx, positive
    mov ah, 09h
    int 21h
    cmp num, 10
    jl single_digit_message

    cmp num, 100
    jl double_digit_message

    cmp num, 1000
    jl triple_digit_message

    jmp exit

single_digit_message:
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, single_digit
    mov ah, 09h
    int 21h

double_digit_message:
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, double_digit
    mov ah, 09h
    int 21h

triple_digit_message:
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, triple_digit
    mov ah, 09h
    int 21h


exit:
    mov ah, 4Ch 
    int 21h
main endp
end main
