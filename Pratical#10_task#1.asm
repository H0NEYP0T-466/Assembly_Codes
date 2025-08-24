.model small
.stack 100h
.data
    prompt db 'Enter a digit (0-9): $'
    result db 'Factorial is: $'
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    lea dx, prompt
    mov ah, 9
    int 21h

    ; Read digit from user
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to number

    ; Calculate factorial
    mov cl, al   ; Store input in CL
    mov ax, 1    ; Initialize result to 1
    
    cmp cl, 0
    je print_result  ; If input is 0, factorial is 1

factorial_loop:
    mul cl       ; Multiply AX by CL
    dec cl       ; Decrement CL
    jnz factorial_loop  ; Continue loop if CL is not zero

print_result:
    ; Store result in memory
    mov bx, ax

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Display result message
    lea dx, result
    mov ah, 9
    int 21h

    ; Convert result to ASCII and print
    mov ax, bx
    call print_num

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp

; Procedure to print a number in AX
print_num proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

divide_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz divide_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop print_loop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num endp

end main