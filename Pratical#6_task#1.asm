.MODEL SMALL
.STACK 100H

.DATA
    prompt1 DB 'Enter the first number: $'
    prompt2 DB 0AH, 0DH, 'Enter the second number: $'
    resultMsg DB 0AH, 0DH, 'The sum is: $'
    newline DB 0AH, 0DH, '$'
    num1 DB ?
    num2 DB ?
    sum DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, prompt1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV num1, AL

    LEA DX, prompt2
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV num2, AL

    MOV AL, num1
    ADD AL, num2
    ADD AL, '0'
    MOV sum, AL

    LEA DX, resultMsg
    MOV AH, 09H
    INT 21H

    MOV DL, sum
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
