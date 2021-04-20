TITLE
.286

spila SEGMENT stack
      DB 32 DUP ('stack____')
  spila ENDS
  
  sdatos SEGMENT
      msj DB 0AH, 'Hola Crack', 0AH,0H,'$'
  sdatos ENDS
  
  scodigo SEGMENT 'CODE'
      Assume ss:spila,ds:sdatos,cs:scodigo
      
      
      main PROC FAR
      
     
      
      PUSH DS
      PUSH 0
      MOV AX,sdatos
      MOV ds,AX
      
      CALL limpia
      
      MOV AH,09H
      LEA dx,msj
      INT 21H
      
      
      
      RET 
     
      main ENDP
      
      limpia PROC
      MOV AX,0700H
      MOV BH,05H  ;fondo y letras 
      MOV CX,0000H
      MOV DX,184FH
      INT 10H
      
      RET
      
      
      
  scodigo ENDS
  
  END main