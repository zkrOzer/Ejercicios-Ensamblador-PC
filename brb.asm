TITLE   SUMA_ASCII_BIN  programa que suma 2 n?meros
    .MODEL SMALL
;--------------------------------------------------------------------
    .STACK  64
;--------------------------------------------------------------------
    .DATA
; DEFINICION DE DATOS
    MENS1       DB  'Proporcione N: $'
    MENS2       DB  'Proporcione elemento: $'
    MENS3       DB  'Arreglo = $'
    N           DB  0
    I           DB  0
    COMPA       DB  0
    BAND        DB  0
    ARREGLO     DB  20  DUP 0
;---------------------------------------------------------------------
    .CODE
;   Programa Principal
MAIN    PROC    FAR
        MOV     AX,@data ; INICIALIZA APUNTADOR AL AREA DE DATOS
        MOV     DS,AX
 
        LEA     DX,MENS1 ; SE APUNTA AL PRIMER MENSAJE
        CALL    ESC_CAD  ; SE ESCRIBE
        CALL    EMPAQUETA     ; SE LEE
        MOV     N,AL     ; SE GUARDA EN LA VARIABLE N
        CALL    ALI_LIN  ; SE ESCRIBE UN ALIMENTO DE LINEA
 
        CALL    LEAARR   ; SE LLAMA A LA FUNCION QUE LEE EL ARREGLO
        CALL    ORDARR   ; SE LLAMA A LA FUNCION QUE ORDENA
        CALL    IMPARR   ; SE LLAMA A LA FUNCION QUE IMPRIME
 
        RET
MAIN    ENDP
 
 
 
 
LEAARR PROC NEAR
        PUSH    AX
        PUSH    BX
        PUSH    CX
        PUSH    DX
        PUSH SI
 
 
 
 
        MOV     CL,N
        MOV     CH,0
 
        CICLO:
        CMP     CH,CL
        JGE     TER_LEC
        CALL    ALI_LIN  ; SE INCREMENTA LINEA
        LEA     DX,MENS2 ; SE APUNTA MENSAJE "ELEMENTO"
        CALL    ESC_CAD  ; SE ESCRIBE EL MENSAJE
        CALL    LEE      ; SE LEE
        MOV     ARREGLO[SI],AL
        INC     SI
        INC     CH
        CALL    ALI_LIN  ; SE INCREMENTA LINEA
        JMP     CICLO
                TER_LEC:
 
        POP SI
        POP     AX
        POP     BX
        POP     CX
        POP     DX
        RET
 
LEAARR ENDP
 
ORDARR PROC NEAR
 
 
        PUSH    CX
        PUSH    SI
        PUSH    AX
 
 
        MOV  CL,0
        MOV  CH,0
        MOV  AL,N
 
        CICLO_OR2:
 
        CMP     CL,AL
        JGE     FIN_OR
        CICLO_OR1:
        CMP     CH,AL
        JGE     SALTO_OR2
        CMP     SI,[SI+1]
        JLE     FIN_DESICION
        XCHG    SI,[SI+1]
        FIN_DESICION:
        INC     CH
        INC     SI
        JMP CICLO_OR1
        SALTO_OR2:
        INC     CL
        JMP CICLO_OR2
        FIN_OR:
 
 
 
        POP     CX
        POP     SI
        POP     AX
        RET
ORDARR ENDP
 
 
IMPARR PROC NEAR
 
        PUSH    AX
        PUSH    BX
        PUSH    CX
 
        MOV     CL,N
        MOV     CH,0
 
 
CICLOIMP:
        CMP     CH,CL
        JGE     TER_IMP
        CALL    ALI_LIN  ; SE INCREMENTA LINEA
        CALL    ESC_VEC
 
        INC     CH
        JMP     CICLOIMP
TER_IMP:
 
 
        POP     AX
        POP     BX
        POP     CX
        RET
 
IMPARR ENDP
 
 
 
 ;RUTINAS
 
ESC_VEC PROC NEAR ;SUBPROGRAMA QUE ESCRIBE 1 ELEMENTO DE 1 VECTOR
        MOV     DL,ARREGLO[SI]
        CALL    ESC
        INC     SI
        RET
ESC_VEC ENDP
 
 
ESC_CAD PROC    NEAR     ;SUBPROGRAMA QUE ESCRIBE CADENA APUNTADA POR DX
        PUSH    AX
        PUSH    BX
        PUSH    CX
        PUSH    DX
        MOV     AH,09H
        INT     21H
        POP     DX
        POP     CX
        POP     BX
        POP     AX
        RET
ESC_CAD ENDP
 
EMPAQUETA   PROC    NEAR  ;SUBPROGRAMA QUE LEE DOS DIGITOS Y LOS EMPAQUETA
        PUSH    CX        ;PARA DEVOLVERV UN NUMERO DE DOS DIGITOS EN AL
        CALL    LEE
        CALL    ASCII_BIN
        MOV     CH,AL
        MOV     CL,4
        SHL     CH,CL
        CALL    LEE
        CALL    ASCII_BIN
        ADD     AL,CH
        POP     CX
        RET
EMPAQUETA   ENDP
 
ASCII_BIN   PROC    NEAR  ; SUBPROGRAMA QUE ESCRIBE A PANTALLA UN
        CMP     AL,'0'    ; N?MERO DE DOS DIGITOS HEXADECIMALES
        JL      ERROR
        CMP     AL,'9'
        JG      SIGUE
        SUB     AL,30H
        JMP     FIN
SIGUE:  CMP     AL,'A'
        JL      ERROR
        CMP     AL,'F'
        JG      SIGUE1
        SUB     AL,37H
        JMP     FIN
SIGUE1: CMP     AL,'a'
        JL      ERROR
        CMP     AL,'f'
        JG      ERROR
        SUB     AL,57H
        JMP     FIN
ERROR:  MOV     AL,0
FIN:    RET
ASCII_BIN  ENDP
 
 
 
LEE     PROC    NEAR    ; RUTINA QUE LEE UN CARACTER DE TECLADO
        PUSH    BX  ; Y LO DEJA EN AL
        PUSH    CX
        PUSH    DX
        MOV     AH,01H
        INT     21H
        POP     DX
        POP     CX
        POP     BX
        RET
LEE     ENDP
 
DESEMPAQUETA    PROC  NEAR ; RUTINA QUE LEE DOS CARACTERES Y LOS GUARDA
        PUSH    CX     ; JUNTOS EN UN SOLO BYTE
        PUSH    DX
        MOV     DH,DL   ;PARA NO PERDERLO
        MOV     CL,4
        SHR     DL,CL
        CALL    BIN_ASCII
        CALL    ESC
        MOV     DL,DH
        AND     DL,0FH
        CALL    BIN_ASCII
        CALL    ESC
        POP     DX
        POP     CX
        RET
DESEMPAQUETA   ENDP
 
BIN_ASCII   PROC    NEAR; RUTINA QUE CONVIERTE DE BINARIO A ASCII
        CMP     DL,9     ; SUMANDO 30H SI ES NUMERO Y 37H
        JL      SUMA30H  ; SI ES CARACTER
        ADD     DL,37H
        JMP     FIN2
SUMA30H:ADD     DL,30H
FIN2:    RET
BIN_ASCII  ENDP
 
 
 
ESC     PROC    NEAR    ; RUTINA QUE ESCRIBE A PANTALLA EL CARACTER
        PUSH    AX      ; CONTENIDO EN DL
        PUSH    BX
        PUSH    CX
        PUSH    DX
        MOV     AH,02H
        INT     21H
        POP     DX
        POP     CX
        POP     BX
        POP     AX
        RET
ESC     ENDP
 
ALI_LIN PROC    NEAR
        PUSH    DX
        MOV     DL,0AH  ; ALIMENTO DE LINEA
        CALL    ESC
        MOV     DL,0DH  ; CONTROL DE CARRO
        CALL    ESC
        POP     DX
        RET
ALI_LIN ENDP
 
        END MAIN