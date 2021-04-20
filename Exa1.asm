PANTALLA equ 0B800h

;------------------------------------------------------------------------------
;Definicion del segmento de pila
;------------------------------------------------------------------------------
PILA SEGMENT STACK "STACK"
     db   40h dup(0)
PILA ENDS

;------------------------------------------------------------------------------
;Definicion del segmento de codigo
;------------------------------------------------------------------------------
CODE SEGMENT
     assume CS:code, SS:pila

START:
     mov  ax,PANTALLA
     mov  ds,ax
     mov  bx,(80*24+5)*2+1      ;Ultima linea, caracter 5   
                                ;Utilizamos el '+1' para acceder
                                ;directamente al fondo

     cmp  byte ptr [bx],07h     ;Vemos si el fondo es negro
     jz   CambiaFondo
     
     mov  byte ptr [bx],07h     ;Si no es negro lo ponemos
     jmp  fin

CambiaFondo:
     mov  byte ptr [bx],70h     ;Ponemos el fondo blanco

fin:
     mov  ax,4C00h
     int  21h

CODE ENDS
     END START