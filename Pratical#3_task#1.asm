.MODEL SMALL
.STACK 100H

.DATA
    string1 DB 'Hello, World!$', 0
    string2 DB 'Welcome to Assembly Language Programming!$', 0
    newline DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV DX, OFFSET string1
    MOV AH, 09H
    INT 21H
    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H
    MOV DX, OFFSET string2
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
