.model small
.stack 100h
.data
    prompt1 db 'Enter first number: $'
    prompt2 db 'Enter second number: $'
    result_msg db 'Numbers after swapping:$'
    num1 db ?
    num2 db ?
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt for first number
    lea dx, prompt1
    mov ah, 9
    int 21h

    ; Read first number
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to number
    mov num1, al

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Display prompt for second number
    lea dx, prompt2
    mov ah, 9
    int 21h

    ; Read second number
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to number
    mov num2, al

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Swap numbers using stack
    mov al, num1
    push ax      ; Push first number onto stack
    mov al, num2
    push ax      ; Push second number onto stack

    pop ax       ; Pop second number into AX
    mov num1, al ; Store it in num1
    pop ax       ; Pop first number into AX
    mov num2, al ; Store it in num2

    ; Display result message
    lea dx, result_msg
    mov ah, 9
    int 21h

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Display swapped numbers
    mov ah, 2    ; Function to display character
    mov dl, num1
    add dl, '0'  ; Convert number to ASCII
    int 21h

    mov dl, ' '  ; Print space
    int 21h

    mov dl, num2
    add dl, '0'  ; Convert number to ASCII
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main