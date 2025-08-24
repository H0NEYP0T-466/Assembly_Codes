.model small
.stack 100h
.data
    div2 db 'the number is divisible by 2.$'
    div3 db 'the number is divisible by 3.$'
    divboth db 'the number is divisible by both 2 and 3.$'
    notdivisible db 'the number is not divisible by 2 or 3.$'
    msg db 'enter an integer: $'
    number db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,'0'
    mov number,al
    mov al,number
    mov ah,0
    mov bl,2
    div bl
    cmp ah,0
    jne check3
    mov al,number
    mov ah,0
    mov bl,3
    div bl
    cmp ah,0
    je divbyboth
    lea dx,div2
    jmp display
check3:
    mov al,number
    mov ah,0
    mov bl,3
    div bl
    cmp ah,0
    je divby3
    lea dx,notdivisible
    jmp display
divbyboth:
    lea dx,divboth
    jmp display
divby3:
    lea dx,div3
display:
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
main endp
end main
