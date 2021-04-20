TITLE
.286

spila SEGMENT stack
      DB 32 DUP ('stack____')
  spila ENDS
  
  sdatos SEGMENT
      msj DB 0AH, 'Escriba un numero: ', 0AH,0H,'$'
      aux DB ('2'),'$'
      aux2 DB ('3'),'$'
      resultado DB ('?'),'$'
  sdatos ENDS
  
  scodigo SEGMENT 'CODE'
      Assume ss:spila,ds:sdatos,cs:scodigo
      
      main PROC FAR
      PUSH DS
      PUSH 0
      MOV AX,sdatos
      MOV ds,AX
      
      MOV AL,aux
      ADD AL,aux2
      MOV resultado,AL
      SUB resultado,30H
      
      MOV AH,09H
      LEA dx,resultado
      INT 21H
      RET
      
      main ENDP
      
  scodigo ENDS
  
  END main