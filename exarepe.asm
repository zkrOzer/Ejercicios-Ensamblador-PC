TITLE
.286
down MACRO indice
           mov si,indice
           cmp cadena1[SI],3fh
           jle abr2222
           EscribeCHF cadena1[SI],71h
           jmp abr2222
ENDM
colores MACRO color
    mov ax, 0600H
    mov bh, color
    mov cx, 0000H
    mov dh, 18h
    mov dl, 4fh
    int 10H 
ENDM
centrar MACRO fila,columna
    mov ah, 02h
    mov dh, fila
    mov dl, columna
    mov bh, 00h
    int 10h 
ENDM
imprimir Macro letrero
    MOV AH, 09
    LEA dx, letrero
    int 21h
ENDM
llenar MACRO arreglo,metodo1,metodo2
call read
cmp al,0dh
je metodo1
mov arreglo[si],AL
INC SI
CMP SI,5
JE metodo1
jmp metodo2
ENDM

iniciarmouse MACRO
    mov ax,00
    int 33h
    mov ax,01h
    int 33h
ENDM
Limpiar MACRO a,b,a1,b1,color ;fini, c ini, f fin, c fin
    mov ax, 0600h
    mov bh,color
    mov cl,b
    mov ch,a
    mov dl,b1
    mov dh,a1
    int 10H
ENDM
convertir MACRO cox,coy
mov ax,cox
mov bl,8
div bl
mov columna,al
mov ax,coy
div bl 
mov fila,al
ENDM
EscribeCHF MACRO LET,COLOR
        MOV AL, LET
        MOV BL,COLOR
        MOV BH,0
        MOV CX,1
        MOV AH,09H
        INT 10H
ENDM

spila SEGMENT stack
    DB 32 DUP('stack___')
spila ENDS
sdatos SEGMENT 
    cadena1 DB 10 DUP (' '),'$'
   cadenita DB 5 DUP ('?'),'$'
   long EQU $-cadena1
   t5 db "Arreglo:","$"
   t6 db "Ingresa una cadena: ","$"
   regresar db "REGRESAR","$"
    agregar db "AGREGAR","$"
    btnsalir db "SALIR","$"
    espacio db (''),0AH,24H
  aux DB ('?'),'$'
   coorx DW ('?'),10,13,"$"
    coory DW ('?'),10,13,"$"
    columna DB ('?'),10,13,"$"
    fila DB ('?'),10,13,"$"
    var1DI DW (?),'$'
    var2CX DW (?),'$'
    pos db "posicion: ","$"
    var DB 5 DUP ('?'),'$'
    color db (00000001b)
    leercadena db "Leer Cadena: ","$"
    salirbtn db "salir", "$"
sdatos ENDS 
scodigo SEGMENT 'CODE' 
    Assume ss:spila,ds:sdatos,cs:scodigo
    
Princ PROC FAR 
    PUSH DS
    PUSH 0
    MOV AX,sdatos
    MOV ds,AX
    MOV ES,ax
    
    
    menu11:
    call menu1
    call menu2
   
        RET
        Princ ENDP
 rotar PROC
 ADD color,1
 CMP color,8
 JBE escapar
 MOV color,1
 escapar:    RET
 rotar ENDP
 
 eleccion proc 
   iniciarmouse
  

        abr:
        
            mov ax,03h
            int 33h
            cmp bx,1
            jz actualizar
            je seguir
            jmp abr

            actualizar: iniciarmouse   
         seguir:
            mov coorx,cx
            mov coory,dx
            convertir coorx,coory
            
         very:
            cmp fila,0ah
            je verx
            ja verxB
            jmp abr
          verxB:
          cmp columna,22
          jge verxB2
          jmp abr
          verxB2:
          cmp columna,35
          jle menu11
          jmp abr
          letra22:jmp letra2
         verx:
         cmp columna,02d
            je letra1
            cmp columna,03d
            je letra22
            cmp columna,04d
            je letra333
            cmp columna,05d
            je letra44
            cmp columna,06d
            je letra55
            cmp columna,07d
            je letra66
            cmp columna,08d
            je letra77
            cmp columna,09d
            je letra88
            cmp columna,10d
            je letra99
            cmp columna,11d
            je letra100
            jmp abr
            
           abr2: jmp abr 
          letra333: jmp letra33 
      letra1:
      call rotar
      centrar 0ch,02d
           mov si,0
           cmp cadena1[SI],3fh
           jle abr2
           EscribeCHF cadena1[SI],06h
           centrar 10d,02d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           letra33:jmp letra3
           letra44:jmp letra4
           letra55:jmp letra5
           letra66:jmp letra6
           letra77:jmp letra7
           letra88:jmp letra8aux
           letra99:jmp letra9aux
           letra100:jmp letra10aux

         
           
            abr22:jmp abr2 
            
            
            
            
      letra2:
      call rotar
      centrar 0ch,03d
           mov si,1
           cmp cadena1[SI],3fh
           jle abr2
           EscribeCHF cadena1[SI],06h
           centrar 10d,03d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
      letra3:
            call rotar
            centrar 0ch,04d
            mov si,2
           cmp cadena1[SI],3fh
           jle abr22
           EscribeCHF cadena1[SI],06h
           centrar 10d,04d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
         abr222:jmp abr22
      letra4:
            call rotar
            centrar 0ch,05d
            mov si,3
           cmp cadena1[SI],3fh
           jle abr222
           EscribeCHF cadena1[SI],06h
           centrar 10d,05d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
          abr2222:jmp abr222
          
          letra8aux:jmp letra8
          letra9aux:jmp letra9
          letra10aux:jmp letra10

      letra5:
            call rotar
            centrar 0ch,06d
            mov si,4
           cmp cadena1[SI],3fh
           jle abr222
           EscribeCHF cadena1[SI],06h
           centrar 10d,06d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           abr22225:jmp abr2222
                      
       letra6:
            call rotar
            centrar 0ch,07d
            mov si,5
           cmp cadena1[SI],3fh
           jle abr22225
           EscribeCHF cadena1[SI],06h
           centrar 10d,07d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           
           
           
                     
           letra7:
            call rotar
            centrar 0ch,08d
            mov si,6
           cmp cadena1[SI],3fh
           jle abr22225
           EscribeCHF cadena1[SI],06h
           centrar 10d,08d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           
           auxsalto: jmp abr22225
           
           letra8:
            call rotar
            centrar 0ch,09d
            mov si,7
           cmp cadena1[SI],3fh
           jle auxsalto
           EscribeCHF cadena1[SI],06h
           centrar 10d,09d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           
           auxsaltosalto: jmp auxsalto
           
           letra9:
            call rotar
            centrar 0ch,10d
            mov si,8
           cmp cadena1[SI],3fh
           jle auxsalto
           EscribeCHF cadena1[SI],06h
           centrar 10d,10d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           
           letra10:
            call rotar
            centrar 0ch,11d
            mov si,9
           cmp cadena1[SI],3fh
           jle auxsaltosalto
           EscribeCHF cadena1[SI],06h
           centrar 10d,11d
           EscribeCHF cadena1[SI],color
            mov ax,02h
            int 33h
           jmp abr
           
           RET  
 eleccion ENDP 
        
 
 
 
 menu3 proc
 colores 0000
 limpiar 01d,5d,01d,50d,0010
 imprimir leercadena
 imprimir salir
 
 ret
 menu3 endp
 
 
 menu1 proc
            
            colores 0000
            limpiar 01d,5d,01d,50d,0010
            call boton
            centrar 01d,5d
            imprimir t6
            
            mov ah,3fh
            mov bx,0
            mov cx,10
            lea dx,cadena1
            int 21h
            
            
            
         RET  
    menu1 ENDP
    menu2 proc 
    colores 0010
    limpiar 01d,5d,01d,50d,0010
            call boton
            centrar 01d,5d
            imprimir t5
            centrar 0ah,02d
         imprimir cadena1
            call eleccion          
            
          RET  
      menu2 ENDP
    
    read proc 
    MOV AH, 01H 
        INT 21H 
        RET
    read ENDP
    
     enterr PROC NEAR
           MOV AH,08 
           INT 21H
          RET
       enterr ENDP
       ;boton agregar
boton2 proc near
    limpiar 0bh,30,0bh,39,0010
    centrar 0bh,1fh
    imprimir agregar
    ret
boton2 ENDP
       ;BOT?N DE SALIDA
boton proc near
    limpiar 0eh,30,0eh,35,0010
    centrar 0eh,1fh
    imprimir btnsalir
    ret
boton ENDP


       
salir PROC NEAR
        ;colores 71h
        centrar 10h,20h
        mov ah,4ch   
        xor al,al
        int 21h
        RET
salir ENDP
       
scodigo ENDS
END Princ


   