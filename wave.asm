        OUTPUT 2500AD
        ORG 2000H
        MOV AX,0000H
        MOV CS,AX
        MOV ES,AX
        MOV DX,0FFE6H
        MOV AL,80H
        OUT DX,AL
        CALL FAR 0FE00:01EDH
        JMP SHORT START
MES:    DB 0AH,0DH,'DUAL DAC INTERFACE'
        DB 0AH,0DH,'S-SQUARE WAVE',0H
START:  LEA DX,MES
        MOV AX,DX
        CALL FAR 0FE00:0013H
GETKEY: CALL FAR 0FE00:00A9H
        CMP AL,53H
        JE SQUARE
        JMP SHORT GETKEY
SQUARE: CALL FAR 0FE00:0031H
RPT2:   MOV AL,0FFH
        MOV DX,0FFE0H
        OUT DX,AL
        MOV DX,0FFE2H
        OUT DX,AL
        MOV CX,FFH
DLY1:   LOOP DLY1
        MOV AL,00H
        MOV DX,0FFE0H
        OUT DX,AL
        MOV DX,0FFE2H
        OUT DX,AL
        MOV CX,FFH
DLY2:   LOOP DLY2
        JMP SHORT RPT2
        END
        OUT DX,AL
        LOOP DOWN
        JMP SHORT RPT1
        END
