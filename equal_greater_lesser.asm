.model small
.stack 100h
.data
    prompt1 db 'Enter first number: $'
    prompt2 db ,0ah,0dh,'Enter second number: $'
    equal_msg db ,0ah,0dh,'The numbers are equal.$'
    greater_msg db ,0ah,0dh,'The first number is greater.$'
    lesser_msg db ,0ah,0dh,'The first number is lesser.$'
.code
main:
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    lea dx, prompt1
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al
    mov ah, 09h
    lea dx, prompt2
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov dl, al
    cmp bl, dl
    je equal
    ja greater
    jb lesser
equal:
    mov ah, 09h
    lea dx, equal_msg
    int 21h
    jmp done
greater:
    mov ah, 09h
    lea dx, greater_msg
    int 21h
    jmp done
lesser:
    mov ah, 09h
    lea dx, lesser_msg
    int 21h
done:
    mov ah, 4Ch
    int 21h
end main
