.MODEL SMALL
.STACK 100H

.DATA
    str1 DB 'Hello, this is the first string!$', 0
    str2 DB 'And this is the second string!$', 0
    newline DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    LEA DX, str1
    MOV AH, 09H
    INT 21H
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, str2
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
