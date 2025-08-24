.MODEL SMALL
.STACK 100H

.DATA
    var DB 'Enter the first value: $', 0
    var1 DB 0AH, 0DH, 'Enter the second value: $', 0
    var2 DB 0AH, 0DH, 'The result after multiplication is: $', 0
    num1 DB ?
    num2 DB ?
    res DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, var
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV num1, AL

    LEA DX, var1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV num2, AL

    MOV AL, num1
    MOV BL, num2
    MUL BL
    ADD AL, '0'
    MOV res, AL

    LEA DX, var2
    MOV AH, 09H
    INT 21H

    MOV DL, res
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
