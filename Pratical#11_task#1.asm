.model small
.stack 100h
.data
    array dw 5 dup(?)
    prompt_input db 'Enter 5 integers (0-9999):$'
    prompt_search db 'Enter a number to search: $'
    msg_found db 'Number found in the array.$'
    msg_not_found db 'Number not found in the array.$'
    msg_largest db 'Largest number in the array: $'
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input 5 integers
    lea dx, prompt_input
    mov ah, 9
    int 21h
    call print_newline  ; Print a newline after the prompt

    mov cx, 5
    lea si, array
input_loop:
    call read_number
    mov [si], ax
    add si, 2
    call print_newline  ; Print a newline after each input
    loop input_loop

    call print_newline  ; Print a newline after input loop

    ; Prompt for search number
    lea dx, prompt_search
    mov ah, 9
    int 21h
    call print_newline  ; Print a newline after the search prompt

    ; Read search number
    call read_number
    push ax  ; Save search number

    ; Perform sequential search
    mov cx, 5
    lea si, array
    pop ax   ; Restore search number
search_loop:
    cmp ax, [si]
    je number_found
    add si, 2
    loop search_loop

    ; Number not found
    lea dx, msg_not_found
    jmp print_result

number_found:
    lea dx, msg_found

print_result:
    mov ah, 9
    int 21h
    call print_newline  ; Print a newline after the result message

    ; Find largest number
    mov cx, 4
    lea si, array
    mov bx, [si]  ; Initialize largest with first element
find_largest:
    add si, 2
    cmp bx, [si]
    jge skip_update
    mov bx, [si]
skip_update:
    loop find_largest

    ; Display largest number
    lea dx, msg_largest
    mov ah, 9
    int 21h
    call print_newline  ; Print a newline after largest number message

    mov ax, bx
    call print_number
    call print_newline  ; Print a newline after the largest number

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

; Procedure to print a newline
print_newline proc
    lea dx, newline
    mov ah, 9
    int 21h
    ret
print_newline endp

; Procedure to read a number (0-9999)
read_number proc
    push bx
    push cx
    push dx

    mov bx, 0
    mov cx, 4  ; Max 4 digits

read_digit:
    mov ah, 1
    int 21h

    cmp al, 0Dh  ; Check for Enter key
    je end_read

    sub al, '0'
    cbw  ; Convert byte in AL to word in AX
    push ax

    mov ax, 10
    mul bx
    mov bx, ax

    pop ax
    add bx, ax

    loop read_digit

end_read:
    mov ax, bx
    pop dx
    pop cx
    pop bx
    ret
read_number endp

; Procedure to print a number
print_number proc
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
print_number endp

end main
