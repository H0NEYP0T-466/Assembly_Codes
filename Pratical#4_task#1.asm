.MODEL SMALL
.STACK 100H

.DATA
    var1 DB 1, 0
    var2 DB ? 
    msg DB 'The value in the variable 2 is: $', 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    MOV Al, var1
    add al,'0'
    MOV var2, Al
    LEA DX, msg
    MOV AH, 09H
    INT 21H
    MOV DL, var2
    MOV AH, 02H
    INT 21H
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
