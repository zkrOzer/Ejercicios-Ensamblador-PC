TITLE
.286

spila SEGMENT stack
      DB 32 DUP ('stack____')
  spila ENDS
  
  sdatos SEGMENT
      msj DB 'HOLA ', 0AH,0AH,'$'
      aux DB ('?'),'$'
      msj2 DB 'NUMERO DE VECES', 0AH, 0AH,'$'
      msj3 DB '', 0AH, 0AH,'$'
      
  sdatos ENDS
  
  scodigo SEGMENT 'CODE'
      Assume ss:spila,ds:sdatos,cs:scodigo
      
      main PROC FAR
      PUSH DS
      PUSH 0
      MOV AX,sdatos
      MOV ds,AX
      
      MOV AH,09H
      LEA dx,msj2
      INT 21H
      
      mov aux,0
      mov AH,01H
      INT 21H
      SUB AL,30H
      
     MOV AH,09H
     LEA dx,msj3
      INT 21H
      
      ciclo:
      MOV AH,09H
      LEA dx,msj
      INT 21H
      inc aux
      
      cmp aux,AL
      jb ciclo
      RET
      
      main ENDP
      
  scodigo ENDS
  
  END main