TITLE
.286
write MACRO letrero
      MOV AH,09H
      LEA dx,letrero
      INT 21H
      ENDM
      
spila SEGMENT stack
      DB 32 DUP ('stack____')
  spila ENDS
  
  sdatos SEGMENT
      msj DB 0AH, 'Hola Crack', 0AH,0H,'$'
      mensaje DB 0AH,'MACRO', 0AH,0H,'$'
      pide DB 0AH, 'Dame un numero: ', '$'
  sdatos ENDS
  

  
  scodigo SEGMENT 'CODE'
      Assume ss:spila,ds:sdatos,cs:scodigo
      
      
      main PROC FAR
        
      PUSH DS
      PUSH 0
      MOV AX,sdatos
      MOV ds,AX
     
      
      CALL limpia
      
      write mensaje
      
      mov AH,01H
      INT 21H
      
      write pide
      
      mov AH,01H
      INT 21H
      
      MOV AH,09H
      LEA dx,msj
      INT 21H
      
      mov AH,01H
      INT 21H
      
      CALL limpia
      
      CALL limpia2
           
      RET 
     
      main ENDP
      
      limpia PROC
      MOV AX,0700H
      MOV BH,35H  ;fondo y letras 
      MOV CX,0000H
      MOV DX,184FH
      INT 10H
            
      RET    
      
      limpia2 PROC
      MOV AX,0700H
      MOV BH,92H  ;fondo y letras 
      MOV CX,0000H
      MOV DX,184FH
      INT 10H
            
      RET 
      
  scodigo ENDS
  
  END main