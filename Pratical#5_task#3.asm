.MODEL SMALL
.STACK 100H

.DATA
    prompt DB 'Enter a lowercase letter: $'
    resultMsg DB 0DH, 0AH, 'The capital letter is: $'
    newline DB 0DH, 0AH, '$'
    char DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, prompt
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV char, AL

    sub char, 20H

    LEA DX, newline
    MOV AH, 09H
    INT 21H

    LEA DX, resultMsg
    MOV AH, 09H
    INT 21H

    MOV DL, char
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
