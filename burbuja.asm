ordenBurbuja:
 
  mov ebx,0     ;posici?n
  mov ecx,0     ;cambio
  mov eax,0     ;i
 
bucleExterno:      ; for (i=0; i<100; i++) 
 
  cmp eax,99
  je finBuble
 
  inc eax                       
  mov ebx,eax                   
  dec eax                       
 
bucleInterno:
  mov edx,0                     
  cmp ebx,100
  je bucleExterno 
 
     mov edx,dword[vector+eax*4]  
  cmp dword[vector+ebx*4],edx       
  jng incrementaPosicion                
 
  mov ecx,[vector+ebx*4]
      mov edx,dword[vector+eax*4]  
  mov dword[vector+ebx*4],edx
  mov dword[vector+eax*4], ecx
incrementaPosicion:
  inc ebx
 
  cmp ebx,100
  je  incrementa_i               
  jmp bucleInterno
incrementa_i:
  inc eax
  jmp bucleExterno
 
finBuble:  
  ret