.model small
.stack 100h
.data
    msg db ,0ah,0dh,'the number is even.$'
    msg1 db ,0ah,0dh,'the number is odd.$'
    msg2 db 'enter an integer: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    mov bl, 2
    div bl
    cmp ah, 0
    je even
    lea dx, msg1
    jmp display
even:
    lea dx, msg
display:
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h
main endp
end main
