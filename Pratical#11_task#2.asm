
.model small
.stack 100h
.data
    max_length equ 50
    prompt db 'Enter uppercase letters (max 50): $'
    original_msg db 'Original string: $'
    converted_msg db 'Lowercase string: $'
    input_string db max_length + 1 dup('$')
    lowercase_string db max_length + 1 dup('$')
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

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Display original string message
    lea dx, original_msg
    mov ah, 9
    int 21h

    ; Display original string
    lea dx, input_string + 2
    mov ah, 9
    int 21h

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Convert to lowercase and store
    xor cx, cx
    mov cl, input_string[1] ; Get actual input length
    lea si, input_string + 2 ; Start of actual string data
    lea di, lowercase_string

convert_loop:
    mov al, [si]
    cmp al, 'A'
    jb skip_convert
    cmp al, 'Z'
    ja skip_convert
    add al, 32 ; Convert to lowercase
skip_convert:
    mov [di], al
    inc si
    inc di
    loop convert_loop

    ; Display converted string message
    lea dx, converted_msg
    mov ah, 9
    int 21h

    ; Display converted string
    lea dx, lowercase_string
    mov ah, 9
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp

end main