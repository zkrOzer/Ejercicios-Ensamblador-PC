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
      tmenu DB 0AH, 'MENU', 0AH,0H,'$'
      tordenar DB, 'ORDENAR', 0AH, 0h, '$'
      msj DB 0AH, 'Escriba una opcion: ', 0AH,0H,'$'
      m1opc1 DB '1.-Llenar', 0AH,0H,'$'
      opcsalir DB '2.-Salir', 0AH,0H,'$'
      opc2salir DB '3.-Salir', 0AH,0H,'$'
      m2opc1 DB '1.-Ordenar Acendente ', 0AH,0H,'$'
      m2opc2 DB '2.-Ordenar Decendente ', 0AH,0H,'$'
      llenarnum DB 'Escriba un numero: ', 0AH,0H,'$'

      arre DB 5 DUP ('?'),'$'
      arre2 DB 5 DUP ('?'),'$'
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
                  
      centrar 30,3
      
      imprimir m1opc1
      
      centrar 30,4
      
      imprimir opcsalir
      
      centrar 30,5
            
      imprimir msj
      
      CALL leerteclado
                
      cmp AL,1    
      JE menu2 
   
      cmp AL,2
      JE salir

      
      salir:
      RET
      
      menu2:
            
      centrar 30,0     
      imprimir tordenar     
      centrar 30,1
      imprimir m2opc1
      centrar 30,2
      imprimir m2opc2
      centrar 30,3
      imprimir opc2salir
      centrar 30,4
      imprimir msj
      
      cmp AL,1
      JE prueba
      
      cmp AL,2
      JE prueba
      
      cmp AL,3
      JE salir
      
      prueba:
      imprimir llenarnum 
      
      limpia PROC
      MOV AX,0700H
      MOV BH,05H  ;fondo y letras 
      MOV CX,0000H
      MOV DX,184FH
      INT 10H
      
      RET
      
      leerteclado PROC
      mov AH,01H
      INT 21H
      SUB AL,30H
      RET
      
      scodigo ENDS  
      END main
      