org 32768


;\ 5c    01011100
;/ 2f    00101111

;        01110011
        
        
;         01011100


loop
 in a,(255)
 and 1
 rrc a
 sbc a,a
 and %01110011
 xor %01011100

 RST #10 ;print character
 jr loop ;loop forever
 rept 100
 defb 0
 endm
 end 32768

