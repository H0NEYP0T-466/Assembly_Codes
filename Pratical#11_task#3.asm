.model small
.stack 100h

.data
    prompt_input db 'Enter a number: $'
    msg_sum db 'The sum of the numbers is: $'
    newline db 0Dh, 0Ah, '$'
    sum dw 0
    counter db 10  ; Maximum number of inputs (10 numbers)
    number_input db 5 dup(0)  ; Temporary storage for the entered number (max 5 digits)

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print prompt to enter numbers
    lea dx, prompt_input
    mov ah, 9
    int 21h

    ; Initialize sum to 0
    mov ax, 0
    mov sum, ax

    ; Input loop (up to 10 numbers)
    mov cx, 10  ; Maximum 10 numbers
input_loop:
    call read_number  ; Read a number from the user
    add sum, ax      ; Add the number to the sum

    ; Print newline after each input
    call print_newline

    loop input_loop

    ; Print the result message
    lea dx, msg_sum
    mov ah, 9
    int 21h

    ; Print the sum of the numbers
    mov ax, sum
    call print_number

    ; Print newline after result
    call print_newline

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp

; Procedure to read a number (0-9999)
read_number proc
    push bx
    push cx
    push dx

    mov bx, 0      ; Initialize number accumulator to 0
    mov cx, 4      ; Max 4 digits

read_digit:
    mov ah, 1      ; Wait for user input
    int 21h

    cmp al, 0Dh    ; Check for Enter key (Carriage Return)
    je end_read

    sub al, '0'    ; Convert ASCII to integer (AL = AL - '0')
    cbw            ; Convert byte in AL to word in AX
    push ax        ; Save AX

    mov ax, 10     ; Multiply current number by 10 (Shift left by 1 decimal place)
    mul bx
    mov bx, ax     ; Store the result in BX

    pop ax         ; Retrieve the digit
    add bx, ax     ; Add the digit to the current result

    loop read_digit

end_read:
    mov ax, bx     ; Return the number in AX
    pop dx
    pop cx
    pop bx
    ret
read_number endp

; Procedure to print a newline (carriage return + line feed)
print_newline proc
    lea dx, newline
    mov ah, 9
    int 21h
    ret
print_newline endp

; Procedure to print a number
print_number proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0      ; Initialize counter for digits
    mov bx, 10     ; Set divisor to 10

divide_loop:
    xor dx, dx     ; Clear DX before division
    div bx         ; Divide AX by 10, result in AX, remainder in DL
    push dx        ; Push the remainder (digit) to stack
    inc cx         ; Increment counter
    test ax, ax    ; Check if AX is zero
    jnz divide_loop

print_loop:
    pop dx         ; Pop a digit
    add dl, '0'    ; Convert digit to ASCII
    mov ah, 2      ; DOS function to display a character
    int 21h
    loop print_loop ; Print all digits

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

end main
