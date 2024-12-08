mov ecx, [some_array_length]
; Check if ecx is 0, prevent division by zero
cmp ecx, 0
je error_handler

mov edx, 0
mov eax, [ebx]
cdq ;Sign extend EAX into EDX:EAX
idiv ecx ;EAX = eax / ecx; EDX = eax % ecx

; Check bounds before accessing memory 
mov eax, [ebx + ecx*4 + 0x10]
cmp eax, 0
je error_handler
;Access memory if eax is not zero

; ... rest of the code

error_handler:
; Handle error appropriately
;e.g., display an error message and exit
mov eax, 1 ;sys_exit
int 0x80