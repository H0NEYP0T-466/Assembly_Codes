.MODEL SMALL
.STACK 100H

.DATA
    sentence DB 100 DUP ('$')  ; Buffer to store user input (max 100 chars)
    prompt DB 'Enter a sentence: $'
    result_msg DB 0DH, 0AH, 'Total uppercase letters: $'
    uppercase_count DB 0        ; Counter for uppercase letters

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt the user to enter a sentence
    LEA DX, prompt
    MOV AH, 09H
    INT 21H

    ; Read the sentence
    LEA DX, sentence
    MOV AH, 0AH
    INT 21H

    ; Initialize variables
    MOV SI, OFFSET sentence + 2 ; Start after the length byte
    MOV CL, [sentence + 1]      ; Length of the input string
    MOV CH, 0                  ; Clear upper byte for comparison

    ; Loop to process each character
CheckLoop:
    CMP CL, 0                  ; Check if all characters are processed
    JE Done                    ; Exit loop if done

    MOV AL, [SI]               ; Load the current character
    CMP AL, 'A'                ; Check if >= 'A'
    JB NextChar                ; If below 'A', skip
    CMP AL, 'Z'                ; Check if <= 'Z'
    JA NextChar                ; If above 'Z', skip

    ; Increment uppercase counter
    INC BYTE PTR uppercase_count

NextChar:
    INC SI                     ; Move to the next character
    DEC CL                     ; Decrement character count
    JMP CheckLoop              ; Repeat the loop

Done:
    ; Display the result message
    LEA DX, result_msg
    MOV AH, 09H
    INT 21H

    ; Convert counter to ASCII and display
    MOV AL, uppercase_count
    ADD AL, '0'                ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
