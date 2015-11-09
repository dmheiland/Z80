 org 32768
start:
 ld a,2 ; upper screen
 call 5633 ; open channel

 ld a, 0
 ld (curink), a
 ld a,0 ; 2 is the code for red.
 call 8859 ; set border red
 call clear
loop:
 ld de,string ; address of string
 ld bc,eostr-string ; length of string to print
 call setink
 call setxy
 call setpap
 call 8252 ; print our string
 call delay
 jp loop ; repeat until screen is full
 ret

delay:
 ld b,10 ; length of delay.
delay0:
 halt ; wait for an interrupt.
 djnz delay0 ; loop.
 ret ; return.

setink:
 ld a, 16 ; ASCII control code for AT.
 rst 16 ; print it.
 ld a, (curink)
 rst 16 ; print it.
 ld a, (curink)
 inc a
 cp 7
 jr nz, dont_reset
 xor a
dont_reset:
 ld (curink), a
 ret

setpap:
 ld a, 17
 rst 16
 xor a
 rst 16
 ret

setxy:
 ld a, 22 ; ASCII control code for AT.
 rst 16 ; print it.
 ld a, (xcoord) ; vertical position.
 rst 16 ; print it.
 ld a, (ycoord) ; y coordinate.
 rst 16 ; print it.
 ret

clear:
 LD HL, 16384
 LD (HL), 1
 LD DE, 16385
 LD BC, 6912
 LDIR
 RET

string: defb "This is a test of how cool I am"
eostr: equ $

xcoord: defb 0
ycoord: defb 0
curink: defb 0

 end start