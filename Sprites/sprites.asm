font equ 15360
attr equ 22528
block equ 127
scrollblock equ 64+16 ; 56+64
emptyblock equ 7+64
badgerbytes equ 63*15
wavebytes equ 237*3
lda equ 26
ldhlwitha equ 119
waveloop equ 237*4



     org 35000


     ld (stack),sp

     ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
     ld (23693),a        ; set our screen colours.
     xor a               ; quick way to load accumulator with zero.
     call 8859           ; set permanent border colours.
     call 3503           ; ROM routine - clears screen, opens chan 2.


     call precalcbadgertext

     di



starmain:

 badgertexter:

;jp     now

     
     ld hl, letterb
     ld bc, 0
     call delletter
     ld hl, lettera
     ld bc, 1
     call delletter
     ld hl, letterd
     ld bc, 2
     call delletter
     ld hl, letterg
     ld bc, 3
     call delletter
     ld hl, lettere
     ld bc, 4
     call delletter
     ld hl, letterr
     ld bc, 5
     call delletter
     


     ld hl, letterb
     ld de, imgb
     ld bc, 0
     call letter

     ld hl, lettera
     ld de, imga
     ld bc, 1
     call letter

     ld hl, letterd
     ld de, imgd
     ld bc, 2
     call letter

     ld hl, letterg
     ld de, imgg
     ld bc, 3
     call letter

     ld hl, lettere
     ld de, imge
     ld bc, 4
     call letter

     ld hl, letterr
     ld de, imgr
     ld bc, 5
     call letter



     jp endy

delletter:

     push bc
     ld e, (hl)
     inc hl
     ld d, (hl)

     ld hl, badgertextwave
     add hl, de

     ld c,(hl)              ; address
     inc hl
     ld b,(hl)
     inc hl

     push bc

     ld a,b
     add a,a                ; high byte of screen address to test for 8 row offset of y
     and %1110
     ld e,a
     xor a
     ld d,a

     ld hl, jptable2+32
     add hl, de
     ld c,(hl)
     inc hl
     ld b,(hl)
     ld a,201
     ld (bc), a

     ld hl, jptable2
     add hl, de

     ld de, clear+1
     ldi                ;(hl)->(de)
     ldi
     inc bc             ;because LDI fucks about with BC annoyingly
     inc bc

     pop hl
     pop de
     add hl,de
     push bc
     ld bc, -1762
     xor a

clear:call d0

     pop hl
     ld (hl), ldhlwitha
     ret

d0:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d1:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d2:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d3:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d4:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d5:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d6:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d7:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     add hl, bc
d8:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d9:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d10:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d11:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d12:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d13:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d14:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d15:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     add hl, bc
d16:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d17:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d18:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d19:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d20:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d21:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d22:
     ld (hl),a
     inc l
     ld (hl),a
     inc l
     ld (hl),a
     dec l
     dec l
     inc h
d23:
     ret


letter:
       ; place in waveform in hl
       ;
     push bc
     push de                    ; push image for later
     ld e, (hl)
     inc hl
     ld d, (hl)
     dec hl
     ld a, d
     or e
     jr nz, noloop

     ld de, waveloop
     ld (hl),e
     inc hl
     ld (hl),d
     dec hl
noloop:
     dec de
     dec de
     dec de
     dec de
     ld (hl),e
     inc hl
     ld (hl),d
     dec hl

     ld hl, badgertextwave
     add hl, de

     ld c,(hl)              ; address
     inc hl
     ld b,(hl)
     inc hl
     ld e,(hl)              ; frame
     inc hl
     ld d,(hl)

     pop hl                 ; get graphics
     add hl,de

     push hl                ; source graphics, later for de
     push bc

     ld a,b
     add a,a                ; high byte of screen address to test for 8 row offset of y
     and %1110
     ld e,a
     xor a
     ld d,a

     ld hl, jptable+32
     add hl, de
     ld c,(hl)
     inc hl
     ld b,(hl)
     ld a,201
     ld (bc), a

     ld hl, jptable
     add hl, de

     ld de, poke+1
     ldi                ;(hl)->(de)
     ldi
     inc bc             ;because LDI fucks about with BC annoyingly
     inc bc

     pop hl
     pop de
     pop ix
     push bc
     ld b,ixh
     ld c,ixl

     add hl, bc
     ld bc, -1762


poke:call s0

     pop hl
     ld (hl), lda
     ret

s0:
     ld a, (de)              ;17 bytes
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s1:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s2:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s3:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s4:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s5:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s6:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s7:
     ld a, (de)                ;15 bytes
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     add hl, bc


s8:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s9:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
 s10:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s11:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s12:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s13:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s14:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h
s15:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     add hl, bc


s16:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

 s17:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s18:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s19:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s20:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s21:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s22:
     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     inc l

     ld a, (de)
     or (hl)
     ld (hl),a
     inc de
     dec l
     dec l
     inc h

s23:
     ret


endy:

     ld a,0
     out (254),a
     ei


     halt
     di

     ld a,1
     out (254),a


     jp starmain

quit:
     ; ld sp,(stack)
     ei
     ret
     
     





precalcbadgertext:


     di
     ld hl, imgb


begintextcopy:

     ld bc, 3*16
     push hl
     pop de
     add hl,bc
     ex de, hl
     ld a,7

begincharr:

     ld bc, 3*16   ; 3 bytes * 16
     ldir          ; copy (hl) -> (de)

     ld bc, 16
     push af
badgertextline:

     and a
     rr (hl)
     inc hl
     rept 2
     rr (hl)
     inc hl
     endm
     dec c
     jr nz, badgertextline

     push de
     ld de, -3*16
     add hl, de
     pop de
     pop af
     dec a
     jr nz, begincharr

     ; push de
     ld de, 3*16
     add hl, de

     ld a, (temp)
     dec a
     ld (temp),a
     jr nz, begintextcopy

     ret

badgertextoffsets:

     di
     ld (stack2),sp

     ld sp, badgertextwave
     ld de, imgb
     ld bc, 236
txtoffsets:
     inc sp
     inc sp
     pop hl
     add hl, de                  ; add badger offset to frame
     push hl
     inc sp
     inc sp

     dec bc
     ld a,b
     or c
     jp nz, txtoffsets

     ld sp, (stack2)
     ei

     ret




stack:
defb    0,0
stack2:
defb    0,0
temp:
defb 6
letterb:
defw 4*(1*8)
lettera:
defw 4*(2*8)
letterd:
defw 4*(3*8)
letterg:
defw 4*(4*8)
lettere:
defw 4*(5*8)
letterr:
defw 4*(6*8)
b1:
defb 0
b2:
defb 0
storebyte:
defb 0
c9:
defb 201

badgertextwave:  ; address then frame

defb $AC,$4F,$00,$00,	$AC,$4E,$60,$00,	$AC,$4E,$F0,$00,	$AC,$4E,$50,$01,	$AD,$4E,$60,$00,	$AD,$4E,$C0,$00,	$AD,$4E,$50,$01,	$AE,$4E,$30,$00,	$AE,$4E,$C0,$00,	$AE,$4E,$20,$01,	$AF,$4E,$30,$00,	$AF,$4E,$90,$00,	$AF,$4D,$20,$01,	$B0,$4D,$00,$00,	$B0,$4D,$60,$00,	$B0,$4D,$F0,$00,	$B0,$4C,$50,$01,	$B1,$4C,$30,$00,	$B1,$4C,$C0,$00,	$B1,$4C,$20,$01,	$B2,$4B,$00,$00,	$B2,$4B,$60,$00,	$B2,$4B,$C0,$00,	$B2,$4A,$50,$01,	$B3,$4A,$30,$00,	$B3,$4A,$90,$00,	$B3,$49,$F0,$00,	$B3,$49,$50,$01,	$B4,$48,$00,$00,	$B4,$48,$60,$00,	$94,$4F,$C0,$00,	$94,$4F,$20,$01,	$95,$4F,$00,$00,	$95,$4E,$30,$00,	$95,$4E,$90,$00,	$95,$4D,$C0,$00,	$95,$4D,$20,$01,	$95,$4C,$50,$01,	$96,$4C,$30,$00,	$96,$4B,$60,$00,	$96,$4A,$90,$00,	$96,$4A,$F0,$00,	$96,$49,$20,$01,	$96,$49,$50,$01,	$97,$48,$00,$00,	$97,$48,$30,$00,	$77,$4F,$60,$00,	$77,$4E,$90,$00,	$77,$4E,$90,$00,	$77,$4D,$C0,$00,	$77,$4D,$F0,$00,	$77,$4C,$F0,$00,	$77,$4B,$20,$01,	$77,$4B,$20,$01,	$77,$4A,$50,$01,	$77,$4A,$50,$01,	$77,$49,$50,$01,	$77,$48,$50,$01,	$77,$48,$50,$01,	$57,$4F,$50,$01,	$57,$4F,$50,$01,	$57,$4E,$50,$01,	$57,$4D,$50,$01,	$57,$4D,$50,$01,	$57,$4C,$50,$01,	$57,$4B,$20,$01,	$57,$4B,$20,$01,	$57,$4A,$F0,$00,	$57,$4A,$F0,$00,	$57,$49,$C0,$00,	$57,$48,$C0,$00,	$57,$48,$90,$00,	$37,$4F,$60,$00,	$37,$4F,$30,$00,	$37,$4E,$00,$00,	$36,$4D,$50,$01,	$36,$4D,$20,$01,	$36,$4C,$F0,$00,	$36,$4C,$C0,$00,	$36,$4B,$90,$00,	$36,$4B,$30,$00,	$36,$4A,$00,$00,	$35,$4A,$20,$01,	$35,$49,$F0,$00,	$35,$49,$90,$00,	$35,$48,$60,$00,	$35,$48,$00,$00,	$14,$4F,$50,$01,	$14,$4F,$F0,$00,	$14,$4E,$90,$00,	$14,$4E,$30,$00,	$13,$4D,$50,$01,	$13,$4D,$F0,$00,	$13,$4D,$90,$00,	$13,$4C,$30,$00,	$12,$4C,$50,$01,	$12,$4C,$F0,$00,	$12,$4B,$90,$00,	$12,$4B,$30,$00,	$11,$4B,$50,$01,	$11,$4A,$F0,$00,	$11,$4A,$60,$00,	$11,$4A,$00,$00,	$10,$49,$20,$01,	$10,$49,$90,$00,	$10,$49,$30,$00,	$0F,$49,$50,$01,	$0F,$49,$C0,$00,	$0F,$48,$60,$00,	$0E,$48,$50,$01,	$0E,$48,$F0,$00,	$0E,$48,$60,$00,	$0E,$48,$00,$00,	$0D,$48,$F0,$00,	$0D,$48,$90,$00,	$0D,$48,$00,$00,	$0C,$48,$20,$01,	$0C,$48,$90,$00,	$0C,$48,$30,$00,	$0B,$48,$20,$01,	$0B,$48,$C0,$00,	$0B,$48,$30,$00,	$0A,$48,$20,$01,	$0A,$48,$C0,$00,	$0A,$48,$30,$00,	$09,$48,$50,$01,	$09,$48,$C0,$00,	$09,$48,$60,$00,	$08,$48,$50,$01,	$08,$48,$F0,$00,	$08,$49,$90,$00,	$08,$49,$00,$00,	$07,$49,$20,$01,	$07,$49,$90,$00,	$07,$49,$30,$00,	$06,$4A,$50,$01,	$06,$4A,$C0,$00,	$06,$4A,$60,$00,	$06,$4B,$00,$00,	$05,$4B,$20,$01,	$05,$4B,$C0,$00,	$05,$4C,$30,$00,	$04,$4C,$50,$01,	$04,$4C,$F0,$00,	$04,$4D,$90,$00,	$04,$4D,$30,$00,	$03,$4E,$50,$01,	$03,$4E,$20,$01,	$03,$4E,$C0,$00,	$03,$4F,$60,$00,	$03,$4F,$00,$00,	$22,$48,$50,$01,	$22,$48,$F0,$00,	$22,$49,$90,$00,	$22,$49,$60,$00,	$22,$4A,$00,$00,	$21,$4A,$50,$01,	$21,$4B,$20,$01,	$21,$4B,$C0,$00,	$21,$4C,$90,$00,	$21,$4C,$60,$00,	$21,$4D,$30,$00,	$21,$4E,$00,$00,	$20,$4E,$50,$01,	$20,$4F,$20,$01,	$20,$4F,$F0,$00,	$40,$48,$C0,$00,	$40,$48,$90,$00,	$40,$49,$90,$00,	$40,$4A,$60,$00,	$40,$4A,$30,$00,	$40,$4B,$30,$00,	$40,$4B,$30,$00,	$40,$4C,$00,$00,	$40,$4D,$00,$00,	$40,$4D,$00,$00,	$40,$4E,$00,$00,	$40,$4F,$00,$00,	$40,$4F,$00,$00,	$60,$48,$00,$00,	$60,$48,$00,$00,	$60,$49,$00,$00,	$60,$4A,$00,$00,	$60,$4A,$00,$00,	$60,$4B,$30,$00,	$60,$4C,$30,$00,	$60,$4C,$60,$00,	$60,$4D,$60,$00,	$60,$4D,$90,$00,	$60,$4E,$C0,$00,	$60,$4F,$F0,$00,	$60,$4F,$F0,$00,	$80,$48,$20,$01,	$80,$48,$50,$01,	$81,$49,$00,$00,	$81,$49,$30,$00,	$81,$4A,$90,$00,	$81,$4B,$C0,$00,	$81,$4B,$F0,$00,	$81,$4C,$20,$01,	$82,$4C,$00,$00,	$82,$4D,$30,$00,	$82,$4D,$90,$00,	$82,$4E,$C0,$00,	$82,$4E,$20,$01,	$83,$4F,$00,$00,	$83,$4F,$30,$00,	$A3,$48,$90,$00,	$A3,$48,$F0,$00,	$A3,$48,$50,$01,	$A4,$49,$30,$00,	$A4,$49,$90,$00,	$A4,$4A,$F0,$00,	$A4,$4A,$50,$01,	$A5,$4A,$30,$00,	$A5,$4B,$90,$00,	$A5,$4B,$F0,$00,	$A5,$4B,$50,$01,	$A6,$4C,$30,$00,	$A6,$4C,$C0,$00,	$A6,$4C,$20,$01,	$A7,$4C,$00,$00,	$A7,$4D,$90,$00,	$A7,$4D,$F0,$00,	$A7,$4D,$50,$01,	$A8,$4D,$60,$00,	$A8,$4E,$C0,$00,	$A8,$4E,$50,$01,	$A9,$4E,$30,$00,	$A9,$4E,$C0,$00,	$A9,$4E,$20,$01,	$AA,$4E,$30,$00,	$AA,$4E,$90,$00,	$AA,$4E,$20,$01,	$AB,$4E,$00,$00,	$AB,$4E,$90,$00,	$AB,$4E,$F0,$00

jptable
defw s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23
jptable2
defw d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23


imgb:
defb 63,	224,0,		64,	24,0,		159,	4,0,		184,	10,0,		176,	2,0,		176,	66,0,		177,	132,0,		176,	2,0,		176,	1,0,		160,	1,0,		160,	65,0,		161,	133,0,		128,	9,0,		128,	2,0,		64,	12,0,		63,	240,0
rept 3*16*7
defb 0
endm
imga:
defb 7,	224,0,		24,	24,0,		39,	4,0,		88,	10,0,		80,	2,0,		176,	65,0,		176,	65,0,		176,	65,0,		177,	129,0,		160,	1,0,		160,	1,0,		160,	1,0,		129,	133,0,		133,	137,0,		66,	66,0,		60,	60,0
rept 3*16*7
defb 0
endm
imgd:
defb 63,	224,0,		64,	24,0,		159,	4,0,		184,	2,0,		176,	18,0,		176,	129,0,		176,	65,0,		176,	65,0,		176,	65,0,		160,	65,0,		160,	129,0,		161,	2,0,		128,	34,0,		128,	68,0,		64,	24,0,		63,	224,0
rept 3*16*7
defb 0
endm
imgg:
defb 7,	248,0,		24,	4,0,		35,	2,0,		76,	10,0,		88,	4,0,		144,	252,0,		177,	130,0,		177,	33,0,		161,	65,0,		161,	1,0,		144,	129,0,		80,	65,0,		64,	9,0,		32,	18,0,		24,	4,0,		7,	248,0
rept 3*16*7
defb 0
endm
imge:
defb 63,	252,0,		64,	2,0,		158,	1,0,		184,	5,0,		176,	2,0,		177,	252,0,		176,	16,0,		176,	200,0,		176,	8,0,		160,	16,0,		161,	252,0,		160,	2,0,		128,	9,0,		128,	17,0,		64,	2,0,		63,	252,0
rept 3*16*7
defb 0
endm
imgr:
defb 63,	240,0,		64,	12,0,		159,	2,0,		184,	1,0,		176,	1,0,		176,	65,0,		176,	65,0,		176,	65,0,		177,	129,0,		160,	6,0,		160,	2,0,		160,	1,0,		133,	133,0,		129,	73,0,		66,	34,0,		60,	28,0
rept 3*16*7
defb 0
endm


