TITLE
.286

centrar MACRO x,y
      MOV AH,02H
      MOV BH,00
      MOV DH,y
      MOV DL,x
      INT 10H
ENDM
      
imprimir MACRO letrero
      MOV AH,09H
      LEA dx,letrero
      INT 21H

ENDM

  spila SEGMENT stack
      DB 32 DUP ('stack____')
  spila ENDS
  
  sdatos SEGMENT
      
      titulo DB 0AH, 'INGRESE UNA CADENA', 0AH,0H,'$'
      salir DB, 'SALIR', 0AH, 0h, '$'
      

      arre DB 5 DUP ('?'),'$'

      
  sdatos ENDS

  
  scodigo SEGMENT 'CODE'
      Assume ss:spila,ds:sdatos,cs:scodigo
      main PROC FAR
      PUSH DS
      PUSH 0
      MOV AX,sdatos
      MOV ds,AX
      
      menu:
      
      CALL limpia
      centrar 30,2
      imprimir titulo
      MOV AH,01H
        INT 21H
        SUB AL,30H
      
      
      main ENDP
      
      limpia PROC
      MOV AX,0700H
      MOV BH,05H  ;fondo y letras 
      MOV CX,0000H
      MOV DX,184FH
      INT 10H
      
      RET
      
      leerteclado PROC
      MOV AH,01H
        INT 21H
        SUB AL,30H
      RET
            
      
        scodigo ENDS  
  END main