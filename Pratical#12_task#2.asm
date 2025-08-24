; Program to swap elements in arrays 1, 3, and 5
; for EMU 8086

.model small
.stack 100h
.data
    arr1 dw 1, 2
    arr2 dw 3, 4
    arr3 dw 5, 6
    arr4 dw 7, 8
    arr5 dw 9, 10
    msg_before db 'Before swapping:$'
    msg_after db 'After swapping:$'
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display arrays before swapping
    lea dx, msg_before
    mov ah, 9
    int 21h
    call print_newline
    call print_arrays

    ; Swap elements in arrays 1, 3, and 5
    lea si, arr1
    call swapping
    lea si, arr3
    call swapping
    lea si, arr5
    call swapping

    ; Display arrays after swapping
    lea dx, msg_after
    mov ah, 9
    int 21h
    call print_newline
    call print_arrays

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

; Procedure to swap elements in an array
swapping proc
    mov ax, [si]
    mov bx, [si+2]
    mov [si], bx
    mov [si+2], ax
    ret
swapping endp

; Procedure to print all arrays
print_arrays proc
    lea si, arr1
    mov cx, 5
print_loop:
    mov ax, [si]
    call print_number
    mov dl, ' '
    mov ah, 2
    int 21h
    mov ax, [si+2]
    call print_number
    call print_newline
    add si, 4
    loop print_loop
    ret
print_arrays endp

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
    div bx         ; Divide AX by 10, result in AX, remainder in DL
    push dx        ; Push the remainder (digit) to stack
    inc cx         ; Increment counter
    test ax, ax    ; Check if AX is zero
    jnz divide_loop

print_digits_loop:
    pop dx         ; Pop a digit
    add dl, '0'    ; Convert digit to ASCII
    mov ah, 2      ; DOS function to display a character
    int 21h
    loop print_digits_loop ; Print all digits

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

; Procedure to print a newline
print_newline proc
    push ax
    push dx
    lea dx, newline
    mov ah, 9
    int 21h
    pop dx
    pop ax
    ret
print_newline endp

end main

