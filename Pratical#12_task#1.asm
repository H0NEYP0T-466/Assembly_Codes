.model small
.stack 100h
.data
    string1 db 'First string$'
    string2 db 'Second string$'
    string3 db 'Third string$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print first string
    lea dx, string1
    mov ah, 9
    int 21h
    call enter_key

    ; Print second string
    lea dx, string2
    mov ah, 9
    int 21h
    call enter_key

    ; Print third string
    lea dx, string3
    mov ah, 9
    int 21h
    call enter_key

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

; Procedure to print a newline (enter key)
enter_key proc
    push ax
    push dx

    mov ah, 2
    mov dl, 0Dh  ; Carriage return
    int 21h
    mov dl, 0Ah  ; Line feed
    int 21h

    pop dx
    pop ax
    ret
enter_key endp

end main