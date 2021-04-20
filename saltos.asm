TITLE
.286

spila SEGMENT stack
DB 32 DUP ('stack___')
spila ENDS

sdatos SEGMENT
    lt DB '?Cuantas veces?',0AH,0DH,'$'
    let DB 'Hola',0AH,0DH,'$'
    aux DB ('?'),'$'
sdatos ENDS


scodigo SEGMENT 'CODE'
Assume ss:spila,ds:sdatos,cs:scodigo

Princ PROC FAR
PUSH DS
PUSH 0
MOV AX,sdatos
MOV ds,AX

MOV AH,09H
LEA DX,lt
INT 21H

    MOV aux,0
    MOV AH,01H
    INT 21H
    SUB AL,30H

for1:

MOV AH,09H
LEA dx,let
INT 21H

INC aux

CMP aux,AL
JB for1

RET
Princ ENDP
scodigo ENDS
END Princ


