.MODEL SMALL
.STACK 100H

.DATA
    prompt DB 'Enter a character: $'
    message DB 0DH, 0AH, 'You entered: $'
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

    LEA DX, newline
    MOV AH, 09H
    INT 21H

    LEA DX, message
    MOV AH, 09H
    INT 21H

    MOV DL, char
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
