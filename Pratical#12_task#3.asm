
.model small
.stack 100h
.data
    asterisk db '*$'
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 7  ; Number of rows
    mov bx, 1  ; Number of asterisks to print in each row

print_pattern:
    push cx    ; Save outer loop counter
    mov cx, bx ; Set inner loop counter to current row number

    ; Print asterisks for current row
    call print_String

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    inc bx     ; Increase number of asterisks for next row
    pop cx     ; Restore outer loop counter
    loop print_pattern

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

; Procedure to print a string of asterisks
print_String proc
    push cx    ; Save cx
    push dx    ; Save dx

print_loop:
    lea dx, asterisk
    mov ah, 9
    int 21h
    loop print_loop

    pop dx     ; Restore dx
    pop cx     ; Restore cx
    ret
print_String endp

end main

