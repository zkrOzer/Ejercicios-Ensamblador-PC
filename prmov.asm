TITLE
.286
IF 1
    INCLUDE 1lib.lib
ENDIF

spila SEGMENT stack

DB 32 DUP ('stack___')
spila ENDS
 sdatos SEGMENT
     letrero1 DB 'Holas',0AH,0DH,'$'
     letrero2 DB 'Holas',0AH,0DH,'$'
     sdatos ENDS
 scodigo SEGMENT 'CODE'
    Assume ss:spila,ds:sdatos,cs:scodigo

Princ PROC FAR
    PUSH DS
    PUSH 0
    MOV AX,sdatos
    MOV DS,AX
    MOV ES,AX
    
    MOV cx,4
    LEA SI,letrero2
    LEA DI,letrero1
    REP CMPSB  ;MOVSB
    INC SI
    INC DI
    DEC cx ;cx = 0, termina el rep son iguales, cx =/ 0 no son iguales

    movah,02h
    mov dl,cl
    add dl,30h
    int 21h
          
    imprimir letrero1
    imprimir letrero2
    
     
    Princ ENDP
           
scodigo ENDS
END Princ