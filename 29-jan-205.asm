.model small
.stack 100h
.data
    var db 'Itreation # $',0
    num db '0'
.code
mian proc
     mov ax,@data
     mov ds,ax
     loop:
     inc num
     lea dx,var
     mov ah,09h
     int 21h
     mov dl,num
     mov ah,02h
     int 21h
     call newline
     cmp num,'5'
     je exit
     jmp loop
     exit:
     mov ah,4ch
     int 21h
     newline proc
        mov dl,0ah
        mov ah,02h
        int 21h
        mov dl,0dh
        int 21h
        newline endp
     ret
 