.MODEL SMALL
.STACK 100H

.DATA
    var DB '0$'
    newline DB 0DH, 0AH, '$'
    counter DB 1 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

OuterLoop:
    MOV CL, counter
    inc var        
InnerLoop:
    LEA DX, var       
    MOV AH, 09H            ; DOS function to print a string
    INT 21H
                    
    DEC CL                 ; Decrement CL (column counter)
    JNZ InnerLoop          

    LEA DX, newline        ; Print a newline after completing a row
    MOV AH, 09H            ; DOS function to print a string
    INT 21H

    INC counter            ; Increment the row counter
    CMP counter, 6         ; Compare the row counter with 6 (5 rows total)
    JNZ OuterLoop          ; If counter < 6, go to the next row

    ; Exit the program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
