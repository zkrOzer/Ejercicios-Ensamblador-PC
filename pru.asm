.model small
.data
    msg db "asd", "$"
.code
    main proc
    mov AX, SEG msg
    mov DS, AX
    mov AH, 09H
    LEA DX,msg
    INT 21H
    .exit
    main ENDP
    
    
   END main