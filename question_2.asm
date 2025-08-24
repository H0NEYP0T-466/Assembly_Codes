.model small
.stack 100h
.data
    msgA db 'Enter a value for A: $', 0
    msgB db 'Enter a value for B: $', 0
    msgC db 'Enter a value for C: $', 0
    msgFinal db 13, 10, 'Final values:', 13, 10, 'A = $', 0
    msgBResult db 'B = $', 0
    msgCResult db 'C = $', 0
    inputA db ?, 0
    inputB db ?, 0
    inputC db ?, 0
    temp db ?, 0   ; Temporary variable for swap

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt for A
    lea dx, msgA
    mov ah, 09h
    int 21h
    mov ah, 01h      ; DOS function to read a character
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov [inputA], al

    ; Prompt for B
    lea dx, msgB
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov [inputB], al

    ; Prompt for C
    lea dx, msgC
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov [inputC], al
    ; Swap A and B using registers
    mov al, [inputA]  ; Load A into AL
    mov bl, [inputB]  ; Load B into BL
    xchg al, bl       ; Swap values of AL and BL
    mov [inputA], al  ; Store swapped value back to A
    mov [inputB], bl  ; Store swapped value back to B
    ; Swap B and C using a temporary register
    mov al, [inputB]  ; Load B into AL
    mov bl, [inputC]  ; Load C into BL
    mov [inputB], bl  ; Store C in B
    mov [inputC], al  ; Store B in C
    ; Swap A and C using a temporary variable
    mov al, [inputA]  ; Load A into AL
    mov bl, [inputC]  ; Load C into BL
    mov [temp], al    ; Store A in temp
    mov [inputA], bl  ; Store C in A
    mov al, [temp]    ; Load temp (original A)
    mov [inputC], al  ; Store original A in C
    ; Display final values
    lea dx, msgFinal
    mov ah, 09h
    int 21h
    ; Display A
    mov al, [inputA]
    add al, '0'       ; Convert integer back to ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    lea dx, msgBResult
    mov ah, 09h
    int 21h
    mov al, [inputB]
    add al, '0'       ; Convert integer back to ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    lea dx, msgCResult
    mov ah, 09h
    int 21h
    mov al, [inputC]
    add al, '0'       ; Convert integer back to ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    mov ah, 4Ch
    int 21h
main endp
end main
