.MODEL SMALL
.STACK 100H

.DATA
    asterisk DB '* $', 0
    newline DB 0DH, 0AH, '$'
    counter DB 7

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

OuterLoop:
    MOV CL, counter        
InnerLoop:
    LEA DX, asterisk
    MOV AH, 09H
    INT 21H
    DEC CL
    CMP CL, 0
    JNZ InnerLoop         

    LEA DX, newline        
    MOV AH, 09H
    INT 21H

    DEC counter            
    CMP counter, 0
    JNZ OuterLoop          

    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
