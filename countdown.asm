.model small
.stack 100h
.data
    done_msg db 'Done!', 13, 10, '$'  
.code
    PRINTNUM MACRO num
        mov dl, num      
        add dl, 30h      
        mov ah, 02h      
        int 21h          
        
        mov dl, 13       
        int 21h
        mov dl, 10       
        int 21h
    ENDM

main proc
    mov ax, @data        
    mov ds, ax
    
    call COUNTDOWN       
    
    mov ah, 4Ch          
    int 21h
main endp

COUNTDOWN proc
    mov cx, 5            
    
print_loop:
    PRINTNUM cl          
    dec cx               
    jnz print_loop       
    mov ah, 09h
    lea dx, done_msg
    int 21h
    
    ret
COUNTDOWN endp

end main