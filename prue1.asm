TITLE
.286
IF 1
    include lib.lib
endif

spila SEGMENT stack

DB 32 DUP ('stack___')
 spila ENDS
 sdatos SEGMENT
     titulo1 DB '**********MENU**********',0AH,0DH,'$'
     o1m1 DB '1.- LLENAR',0AH,0DH,'$'
     o2m2 DB '2.- SALIR',0AH,0DH,'$'
     msj1 DB 'INGRESA LOS NUMEROS',0AH,0DH,'$'
     msj2 DB ' ',0AH,0DH,'$'
        s DB '',0AH,0DH,'$'
     arre DB 5 DUP ('?'),'$'
     arre2 DB 5 DUP ('?'),'$'
     opcion DB 'OPCION: ', 0AH,0DH,'$'
     let1 DB '**********ORDENAR**********',0AH,0DH,'$'
     let2 DB '1.- ascendente',0AH,0DH,'$'
     let3 DB '2.- descendente',0AH,0DH,'$'
     let4 DB '3.- Salir',0AH,0DH,'$'
 sdatos ENDS
 scodigo SEGMENT 'CODE'
    Assume ss:spila,ds:sdatos,cs:scodigo

Princ PROC FAR
    PUSH DS
    PUSH 0
    MOV AX,sdatos
    MOV ds,AX

    inicio:
    call limpia
    centrar  1,28
    imprimir titulo1
    centrar  2,34     
    imprimir o1m1
    centrar  3,34    
    imprimir o2m2
    centrar 4,34
    imprimir opcion
    centrar 4,41   
    CALL leerteclado
    SUB AL,30H
    
    CMP AL,1
    JE op1
    CMP AL,2
    JE salir
    JNE inicio
    
    salir:
    CALL limpia
    RET
    
    aux2:
    JMP inicio
    
    op1:
    
   call limpia
   centrar 2,30
    imprimir msj1
    
    MOV SI,0
    LEA BX,arre
    LEA DX,arre2
    
    forsito:
    imprimir msj2
    CALL leerteclado
    MOV BX[SI],AL
    MOV arre2[SI],AL
    INC SI
    CMP SI,4
    JBE forsito
    JMP menu2
    
    aux:
    JMP aux2
    
    menu2:
    call limpia
    centrar 1,24
    imprimir let1
    centrar 2,31
    imprimir let2
    centrar 3,31
    imprimir let3
    centrar 4,31
    imprimir let4
    centrar 5, 31
    imprimir opcion
    centrar 5,38    
    CALL leerteclado
    MOV AH,09H
    LEA DX,s
    INT 21H
    
    SUB AL,30H
    CMP AL,1
    JE ascendenteendente
    CMP AL,2
    JE descendenteendente
    CMP AL,3
    JE aux
    JNE menu2
    
  
    ascendenteendente:
    ;LEA BX,arre
    MOV DI,0
        repite:  
                MOV SI,0
                
                repite2: 
                cmp SI,4
                JB  comparacion
                JGE inc
                
                comparacion:  
                MOV AH,arre[SI+1] 
                cmp arre[SI],AH
                JG cambia1
                JBE sigue
                
                cambia1:
                MOV AL,arre[SI]
                MOV arre[SI],AH
                MOV arre[SI+1],AL
                
                sigue:              
                INC SI
                JMP repite2
                
        inc:     
        INC DI       
        cmp DI,4
        JBE repite
        imprimir arre
        CALL leerteclado
        JMP menu2
    
        descendenteendente:
        ;BX,arre
        MOV DI,0
        ci1a:  
                MOV SI,0
                ci2a: 
                cmp SI,4
                JB  comparacion1a
                JGE incA
                
                comparacion1a:  
                MOV AH,arre[SI+1] 
                cmp arre[SI],AH
                JB cambiaA
                JGE sigueA
                
                cambiaA:
                MOV AL,arre[SI]
                MOV arre[SI],AH
                MOV arre[SI+1],AL
                
                sigueA:              
                INC SI
                JMP ci2a             
        incA:     
        INC DI
        cmp DI,4
        JBE ci1a
    imprimir arre
    CALL leerteclado
    JMP menu2
Princ ENDP
           
scodigo ENDS
END Princ