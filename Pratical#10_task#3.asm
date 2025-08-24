; Program to input a string, reverse it, and count its length
; for EMU 8086

.model small
.stack 100h
.data
    max_length equ 50
    prompt db 'Enter a string (max 50 characters): $'
    length_msg db 'String length: $'
    reversed_msg db 'Reversed string: $'
    input_string db max_length + 1 dup('$')
    reversed_string db max_length + 1 dup('$')
    string_length dw ?
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    lea dx, prompt
    mov ah, 9
    int 21h

    ; Input string
    lea dx, input_string
    mov ah, 0Ah
    mov input_string, max_length ; Set maximum length
    int 21h

    ; Calculate string length
    xor cx, cx
    mov cl, input_string[1] ; Get actual input length
    mov string_length, cx

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Display length
    lea dx, length_msg
    mov ah, 9
    int 21h

    mov ax, string_length
    call print_num

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Reverse the string
    lea si, input_string + 2 ; Start of actual string data
    lea di, reversed_string
    add di, cx
    dec di ; Point to last character position of reversed string

reverse_loop:
    mov al, [si]
    mov [di], al
    inc si
    dec di
    loop reverse_loop

    ; Display reversed string message
    lea dx, reversed_msg
    mov ah, 9
    int 21h

    ; Display reversed string
    lea dx, reversed_string
    mov ah, 9
    int 21h

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