TITLE.286
IF 1
     INCLUDE lbn.LIB 
ENDIF

spila SEGMENT stack
     DB 32 DUP ('stack___')
 spila ENDS

sdatos SEGMENT
    msg1 DB 'INICIAR',0AH,0DH,'$'
    msgS DB 'SALIR',0AH,0DH,'$'
    msg3 DB 'CADENA: ',0AH,0DH,'$'
    msg4 DB 'INGRESANDO: ',0AH,0DH,'$'
    cadena DB 10 DUP (?),'$'    
    colores DB 1 DUP (1,2,3,4,5,6,7,8,9),'$'
    aux DB 0AH,0DH,'$'
    color DB 1,'$'
    cont DB 0,'$'   
sdatos ENDS

scodigo SEGMENT 'CODE'
    Assume ss:spila,ds:sdatos,cs:scodigo

    Princ PROC FAR
        PUSH DS
        PUSH 0
        MOV AX,sdatos
        MOV DS,AX

        c1:
        CALL ESCONDER
        CALL CLS
        centrar 0,0
        imprimir msg1
        centrar 6,22
        imprimir msgS
        CALL MOUSE
        limites 0,55,0,8
        JZ c2
        limites 176,216,48,56
        JZ salir
        JMP c1
        
        salir:
         CALL ESCONDER
         CALL CLS        
         RET
  
        c2:
        CALL ESCONDER
        CALL CLS
        centrar 0,16
        limpia cadena
        CALL CLS
        imprimir msg4
        centrar 0,12
        LLENAR cadena
        CALL CLS
        centrar 1,10
        imprimir cadena
        centrar 5,16
        imprimir msgs
        centrar 1,0
        imprimir msg3
        JMP regresa
        
        mid:
        JMP c1
        
        regresa:
        CALL mousea
        CMP BX,1
        JNZ regresa
        
        CALL cambiarcolor
        limites 128,168,40,48
        JZ mid
        limites 80,88,8,16
        JZ pos0
        limites 88,96,8,16
        JZ pos1
        limites 96,104,8,16
        JZ pos2
        JMP sigue
        pos0:
        JMP pos00
        pos1:
        JMP pos11
        sigue:
        limites 104,112,8,16
        JZ pos3
        limites 112,120,8,16
        JZ pos4
        limites 120,128,8,16
        JZ pos5
        JMP sigg
        pos2:
        JMP pos22
        pos3:
        JMP pos33
        pos4:
        JMP pos44
        sigg:
        limites 128,136,8,16
        JZ pos6
        limites 136,144,8,16
        JZ pos7
        limites 144,152,8,16
        JZ pos8
        JMP next
        pos5:
        JMP pos55
        pos6:
        JMP pos66
        next:
        limites 152,160,8,16
        JZ pos9
        JMP regresa
        
        pos7:
        JMP pos77
        
        pos00:
        CALL ESCONDER
        centrar 1,10
        imprimirc cadena[0],color
        centrar 2,10
        printcar cadena[0]
        JMP regresa
        pos8:
        JMP pos88
        pos11:
        CALL ESCONDER
        centrar 1,11
        imprimirc cadena[1],color
        centrar 2,11
        printcar cadena[1]
        JMP regresa
        pos9:
        JMP pos99
        pos22:
        CALL ESCONDER
        centrar 1,12
        imprimirc cadena[2],color
        centrar 2,12
        printcar cadena[2]
        JMP regresa
        pos33:
        CALL ESCONDER
        centrar 1,13
        imprimirc cadena[3],color
        centrar 2,13
        printcar cadena[3]
        JMP regresa
        pos44:
        CALL ESCONDER
        centrar 1,14
        imprimirc cadena[4],color
        centrar 2,14
        printcar cadena[4]
        JMP regresa
        pos55:
        CALL ESCONDER
        centrar 1,15
        imprimirc cadena[5],color
        centrar 2,15
        printcar cadena[5]
        JMP regresa
        pos66:
        CALL ESCONDER
        centrar 1,16
        imprimirc cadena[6],color
        centrar 2,16
        printcar cadena[6]
        JMP regresa
        pos77:
        CALL ESCONDER
        centrar 1,17
        imprimirc cadena[7],color
        centrar 2,17
        printcar cadena[7]
        JMP regresa
        pos88:
        CALL ESCONDER
        centrar 1,18
        imprimirc cadena[8],color
        centrar 2,18
        printcar cadena[8]
        JMP regresa
        pos99:
        CALL ESCONDER
        centrar 1,19
        imprimirc cadena[9],color
        centrar 2,19
        printcar cadena[9]
        JMP regresa

Princ ENDP   

cambiarcolor PROC NEAR
    ADD color,1
    CMP color,9
    JBE exit
    MOV color,1
    exit:
RET
ENDP
scodigo ENDS
END Princ