.model small
.stack 100h
.data
    var db 'The value of first variable is: $',0
    var1 db ,0ah,0dh,'The value of second variable is: $',0
    var2 db ,0ah,0dh,'AFTER SWAPING: $',0
    val1 db '4',0
    val2 db '7',0
.code
main proc
    mov ax,@data  ;linking the data part with the main part
    mov ds,ax     ;acmulator cant hold for long so we mov it to data segemnt register
    lea dx,var    ;lea(loads the effective address of var)
    mov ah,09h    ;09h is the functional code to print a string
    int 21h
    
    mov dl,val1
    mov ah,02h
    int 21h
    
    lea dx,var1
    mov ah,09h
    int 21h
                               ;printing the string's and values stored in variables in data segment 
    mov dl,val2
    mov ah,02h
    int 21h
    
    lea dx,var2
    mov ah,09h
    int 21h 
    
    mov ah,02h
    mov dl,0dh                   ;line break(carrige return and line feed)
    int 21h  
    
    mov dl,0ah
    int 21h 
    
                
    mov al,val1    ; Load the value of val1 into AL
    xor al,val2    ; AL = AL XOR val2
    xor val2,al    ; val2 = val2 XOR AL (val2 now holds the original value of val1)
    xor al,val2    ; AL = AL XOR val2 (AL now holds the original value of val2)
    mov val1,al    ; Store the new value of val1 from AL 
     
                
    lea dx,var    
    mov ah,09h    
    int 21h

    mov dl,val1
    mov ah,02h
    int 21h 
                            ;after swaping printing the string's and values stored in variables in data segment 
    lea dx,var1
    mov ah,09h
    int 21h
    
    mov dl,val2
    mov ah,02h
    int 21h
    
       
    ; free up all the register occupied
    mov ah,4ch
    int 21h
main endp
end main
    