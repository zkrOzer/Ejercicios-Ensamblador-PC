TITLE
.286

color MACRO c
    MOV AX,0600H
    MOV BH,c
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
ENDM 

spila SEGMENT stack

DB 32 DUP ('stack___')
 spila ENDS
 sdatos SEGMENT
     let1 DB 'Hola primer programa ensamblador',0AH,0DH,'$'
    let2 DB 0AH,0DH,'hello there',0AH,0DH,'$'
    let3 DB 0AH,0DH,'everyone',0AH,0DH,'$'
 sdatos ENDS
 scodigo SEGMENT 'CODE'
    Assume ss:spila,ds:sdatos,cs:scodigo

Princ PROC FAR
PUSH DS
PUSH 0
MOV AX,sdatos
MOV ds,AX

CALL CLS
        
LEA dx,let1
CALL Imprime
LEA dx,let2
CALL Imprime
LEA dx,let3
CALL Imprime
MOV AH,01H
INT 21H
color 03H
RET
Princ ENDP

Imprime PROC NEAR
    MOV AH,09H
    
    INT 21H
    RET
Imprime ENDP

CLS PROC NEAR
    MOV AX,0600H
    MOV BH,40H
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
    RET
CLS ENDP
    
scodigo ENDS
END Princ