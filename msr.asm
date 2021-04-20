TITLE
.286

spila SEGMENT stack
    DB 32 DUP('stack___')
spila ENDS

sdatos SEGMENT
    T DB 'Menu',0AH,0DH,'$'
   op1 DB '1.- Suma',0AH,0DH,'$'
   op2 DB '2.- Resta',0AH,0DH,'$'
   s DB '3.- Salir',0AH,0DH,'$'
   aux DB '0' , '$'
   res DB 0AH,0DH,'El resultado es: ',0AH,0DH,'$'
   let DB 0AH,0DH,'Ingresa algun numero: ',0AH,0DH,'$'
    
sdatos ENDS

scodigo SEGMENT 'CODE'
    Assume ss:spila,ds:sdatos,cs:scodigo
    main PROC FAR
        PUSH DS       
        PUSH 0
        MOV AX,sdatos
        MOV ds,AX
        
        menu:      
        MOV AX,0600H
        MOV BH,03H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        
        MOV AH,02H
        MOV BH,00
        MOV DH,0
        MOV DL,37
        INT 10H
        
        MOV AH,09H
        LEA DX,T
        INT 21H
        
        MOV AH,02H
        MOV BH,00
        MOV DH,1
        MOV DL,34
        INT 10H
        
        MOV AH,09H
        LEA DX,op1
        INT 21H
        
        MOV AH,02H
        MOV BH,00
        MOV DH,2
        MOV DL,34
        INT 10H
        
        MOV AH,09H
        LEA DX,op2
        INT 21H
        
        MOV AH,02H
        MOV BH,00
        MOV DH,3
        MOV DL,34
        INT 10H
        
        MOV AH,09H
        LEA DX,s
        INT 21H
        
        MOV AH,01H
        INT 21H
        SUB AL,30H
        
        
        CMP AL,1
        JE suma
        CMP AL,2
        JE resta
        CMP AL,3
        JE salir
        JNE menu
        salir:
        MOV AX,0600H
        MOV BH,02H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        RET
        
        suma:
        MOV AX,0600H
        MOV BH,03H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        
        MOV AH,09H
        LEA DX,let
        INT 21H
        
        MOV AH,01H
        INT 21H
        
        MOV aux,AL
        
        MOV AH,09H
        LEA DX,let
        INT 21H
        
        MOV AH,01H
        INT 21H
        
        ADD aux,AL
        SUB aux,30H
        
        MOV AH,09H
        LEA DX,res
        INT 21H
        
        MOV AH,09H
        LEA DX,aux
        INT 21H
        
        MOV AH,01H
        INT 21H
        
        JMP menu
        
        resta:
        MOV AX,0600H
        MOV BH,03H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        
        MOV AH,09H
        LEA DX,let
        INT 21H
        
        MOV AH,01H
        INT 21H
        
        MOV aux,AL
        
        MOV AH,09H
        LEA DX,let
        INT 21H
        
        MOV AH,01H
        INT 21H
        
        SUB aux,AL
        ADD aux,30H
        
        MOV AH,09H
        LEA DX,res
        INT 21H
        
        MOV AH,09H
        LEA DX,aux
        INT 21H
        
        MOV AH,01H
        INT 21H
        JMP menu
              
main ENDP
scodigo ENDS
END main
        
        
    