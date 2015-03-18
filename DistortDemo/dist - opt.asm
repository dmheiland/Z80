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


     org 26000


     ld (stack),sp

     ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
     ld (23693),a        ; set our screen colours.
     xor a               ; quick way to load accumulator with zero.
     call 8859           ; set permanent border colours.
     call 3503           ; ROM routine - clears screen, opens chan 2.

     call precalcbadger
     call precalcbadgertext



starmain:











      ld a,1
      out (254),a
      
      
     ei
     halt
     di

     ld hl, (starframe)
     xor a

     rept 81

     ld d, (hl)
     inc hl
     ld e, (hl)
     inc hl
     inc hl
     ld (de),a

     endm

     ld a,(hl)
     or a
     jp nz, nxt

     ld hl, stars

nxt: ld (starframe),hl










     ld hl, (starframe)


     rept 81

     ld d, (hl)
     inc hl
     ld e, (hl)
     inc hl
     ld a, (hl)
     inc hl
     ld (de),a

     endm


startframe:






           ld a,2
      out (254),a

     ld (stack),sp
     ld sp, (stacky)
     xor a
;1
      ld bc, 13
     pop de
     ld (de),a
     inc de
     pop hl              ; frame
     rept 13
     ldi             ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;2
     ld c, 15
     ld de,256
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl,bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;3
     ld c,30
     ld de, 512
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;4
     ld c,45
     ld de,768
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;5
     ld c,60            ;7
     ld de,1024       ;7
     pop hl             ;10
     add hl, de         ;11
     ld (hl),a          ;7
     inc l              ;4
     ex de,hl           ;4
     pop hl             ;10 frame
     add hl, bc         ;11
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm               ;7
     ld (de),a
;6
     ld c,75
     ld de,1280
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;7
     ld de, 1536
     ld c,90
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;8
     ld de, 1792
     ld c,105
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;9
     ld de, 32
     ld c,120
     ld e,32
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;10
     ld c,135
     ld de,288
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;11
     ld c,150
     ld de,544
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;12
     ld c,165
     ld de,800
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;13
     ld c,180
     ld de,1056
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;14
     ld c,195
     ld de,1312
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;15
     ld c,210
     ld de,1568
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;16
     ld c,225
     ld de,1824
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;17
     ld c,240
     ld de,64
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 12
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;18
     ld c,255
     ld de,320
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;19
     ld bc,270
     ld de,576
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;20
     ld bc,285
     ld de,832
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi               ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;21
     ld bc,300
     ld de,1088
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;22
     ld bc,315
     ld de,1344
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;23
     ld bc,330
     ld de,1600
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;24
     ld bc,345
     ld de,1856
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 13
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;25
     ld bc,360
     ld de,96
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;26
     ld bc,375
     ld de,352
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;27
     ld bc,390
     ld de,608
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;28
     ld bc,405
     ld de,864
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm 
     ld (de),a
;29
     ld bc,420
     ld de,1120
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;30
     ld bc,435
     ld de,1376
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm 
     ld (de),a
;31
     ld bc,450
     ld de,1632
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;32
     ld bc,465
     ld de,1888
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;33
     ld bc,480
     ld de,128
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 14
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;34
     ld bc,495
     ld de,384
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm 
     ld (de),a
;35
     ld bc,510
     ld de,640
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;36
     ld bc,525
     ld de,896
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;37
     ld bc,540
     ld de,1152
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;38
     ld bc,555
     ld de,1408
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm 
     ld (de),a
;39
     ld bc,570
     ld de,1664
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;40
     ld bc,585
     ld de,1920
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;41
     ld bc,600
     ld de,160
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;42
     ld bc,615
     ld de,416
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;43
     ld bc,630
     ld de,672
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;44
     ld bc,645
     ld de,928
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;45
     ld bc,660
     ld de,1184
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;46
     ld bc,675
     ld de,1440
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;47
     ld bc,675
     ld de,1696
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;48
     ld bc,690
     ld de,1952
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;49
     ld bc,705
     ld de,192
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;50
     ld bc,720
     ld de,448
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;51
     ld bc,735
     ld de,704
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;52
     ld bc,750
     ld de,960
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;53
     ld bc,765
     ld de,1216
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;54
     ld bc,780
     ld de,1472
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;55
     ld bc,795
     ld de,1728
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;56
     ld bc,810
     ld de,1984
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;57
     ld bc,825
     ld de,224
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;58
     ld bc,840
     ld de,480
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;59
     ld bc,855
     ld de,736
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi
     endm                ; copy (hl) -> (de), bc times  ' 16
     ld (de),a
;60
     ld bc,870
     ld de,992
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;61
     ld bc,885
     ld de,1248
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;62
     ld bc,900
     ld de,1504
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;63
     ld bc,915
     ld de,1760
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a
;63
     ld bc,930
     ld de,2016
     pop hl
     add hl, de
     ld (hl),a
     inc l
     ex de,hl
     pop hl              ; frame
     add hl, bc
     rept 15
     ldi                ; copy (hl) -> (de), bc times  ' 16
     endm
     ld (de),a


     ld hl, -(63*4)
     add hl, sp
     ld sp, hl


     ld (stacky),sp
     ld sp, (stack)





 scrollermain:


     ld hl, badgeranim
     ld c, (hl)
     inc hl
     ld b, (hl)
     dec hl
     dec bc
     ld (hl),c
     inc hl
     ld (hl),b
     
     ld a,b
     or c

     jp nz, scrollcopy
     ; ld a,7
     ; out (254),a

     ld bc, wavebytes
     dec hl
     ld (hl),c
     inc hl
     ld (hl),b

     ld hl, stacky
     ld de, distort

     ld (hl),e
     inc hl
     ld (hl),d


scrollcopy:
     ld hl, attr+1
     ld de, attr
     rept 8
     rept 31
     ldi
     endm
     inc l
     inc e
     endm

       ld a,4
      out (254),a

scrollingmessage:




     ld a,(bitnumber)    ; bitnumber 0-7
     dec a
     ld (bitnumber),a
     jp nz, continuecharacter

resetbit:
     ld a,8
     ld (bitnumber),a
newletter:
     ld hl, message
     inc hl
     ld a, (hl)
     or a
     jr nz, cont
     ld hl, message
     ld a, 32
cont:ld (newletter+1),hl

     ld hl,0
     ld l,a
     add hl, hl
     add hl, hl
     add hl, hl
     ld  bc, font
     add hl, bc

     ld de, character

     rept 8              ; copy character bitmap to character
     ldi
     endm




continuecharacter:


     ld hl, character
     ld de, attr+31

     ld bc, 32            ; 32

     rept 8
     rlc (hl)
     sbc a,a
     and scrollblock
     xor emptyblock
     ld (de), a
     inc hl
     ex de, hl
     add hl, bc
     ex de, hl
     endm


            ld a,6
      out (254),a




       ld a,2
      out (254),a



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






      ld a,7
      out (254),a

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

            ld a,3
      out (254),a

     jp starmain

quit:
     ; ld sp,(stack)
     ei
     ret
     
     
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



precalcbadger:

     ld hl, badger
     ld de, badger2
     ld a,8

begincopy:
     ld bc, badgerbytes   ; 15 bytes * 63
     ldir                  ; copy (hl) -> (de)

     ld c, 63
     push af
badgerline:

     and a
     rr (hl)
     inc hl
     rept 14
     rr (hl)
     inc hl
     endm
     dec c
     jr nz, badgerline

     push de
     ld de, -945
     add hl, de
     pop de
     pop af
     dec a
     jr nz, begincopy


badgerbeginoffsets:

     di
     ld (stack2),sp

     ld sp, distort
     ld de, badger
     ld bc, wavebytes+64
badgeroffsets:
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
     jp nz, badgeroffsets

     ld sp, (stack2)

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






starframe:
defw    stars
message:
defb    "    Big scrolly message.  Written with ~3 weeks knowledge of Z80.  Not bad I think...  25% processor time remaining per vertical sync, wonder what I'll do with that!     "
defb    0
stack:
defb    0,0
stack2:
defb    0,0
stacky:
defw    distort
swingloop:
defb    0,0
frame:
defb    0,0
bitnumber:
defb    8
character:
defb    0,0,0,0,0,0,0,0
charnum:
defb    0,0
badgeranim:
defw    wavebytes
distortstack:
defb 0,0
framestack:
defb 0,0
temp:
defb 6

stars:
defb	$4C,$5B, 16,	$4C,$0B, 2,	$4D,$67, 64,	$4F,$6A, 4,	$54,$13, 64,	$4D,$50, 32,	$49,$31, 4,	$48,$CD, 1,	$45,$B3, 16,	$4E,$CE, 8,	$4A,$95, 64,	$4D,$CF, 8,	$55,$36, 1,	$4B,$4C, 32,	$41,$19, 128,	$42,$AA, 1,	$49,$CE, 2,	$44,$31, 32,	$50,$AE, 128,	$50,$11, 64,	$42,$2A, 16,	$41,$66, 8,	$48,$AE, 8,	$52,$0B, 64,	$53,$58, 2,	$4B,$53, 8,	$48,$16, 1,	$47,$CF, 4,	$43,$E9, 32,	$55,$13, 2,	$4D,$31, 4,	$4C,$71, 8,	$48,$44, 4,	$44,$B3, 8,	$42,$94, 32,	$4B,$68, 2,	$4B,$CF, 1,	$42,$B7, 4,	$54,$0D, 128,	$4E,$6F, 16,	$51,$D3, 8,	$48,$6C, 8,	$4E,$69, 8,	$4C,$B4, 4,	$56,$32, 4,	$46,$D3, 32,	$41,$D4, 4,	$44,$CE, 128,	$4E,$32, 16,	$52,$C8, 64,	$4A,$8D, 16,	$4E,$3C, 1,	$4E,$6B, 8,	$54,$C6, 8,	$41,$EC, 64,	$4C,$8B, 64,	$4F,$CC, 8,	$47,$CA, 8,	$4B,$34, 32,	$55,$0B, 128,	$4F,$B1, 128,	$40,$ED, 128,	$44,$F4, 1,	$54,$8F, 2,	$4E,$15, 2,	$4C,$06, 2,	$56,$11, 32,	$48,$14, 8,	$4F,$B0, 16,	$47,$CA, 2,	$48,$CD, 4,	$48,$6C, 8,	$56,$74, 4,	$49,$2B, 4,	$47,$F4, 64,	$53,$6D, 16,	$4C,$CD, 16,	$4F,$8B, 4,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$5C, 64,	$4B,$0B, 4,	$4D,$66, 1,	$4F,$6A, 8,	$54,$13, 64,	$4D,$50, 32,	$48,$31, 4,	$48,$CD, 1,	$43,$B3, 8,	$4E,$CE, 8,	$4A,$95, 64,	$4D,$CF, 8,	$56,$37, 128,	$4B,$4C, 32,	$41,$AA, 2,	$4A,$CE, 2,	$41,$31, 16,	$52,$AD, 1,	$51,$11, 64,	$40,$2A, 64,	$47,$46, 32,	$48,$AE, 8,	$53,$0B, 128,	$55,$59, 128,	$4B,$53, 4,	$48,$17, 128,	$47,$CF, 8,	$42,$E9, 64,	$56,$13, 1,	$4D,$31, 2,	$4C,$71, 8,	$48,$44, 64,	$44,$B3, 4,	$40,$94, 16,	$4B,$68, 4,	$4B,$CF, 1,	$47,$98, 64,	$54,$0D, 128,	$4E,$6F, 16,	$54,$D3, 2,	$4F,$4C, 8,	$4E,$69, 32,	$4C,$B4, 4,	$57,$32, 2,	$45,$D3, 16,	$40,$D4, 4,	$43,$CD, 1,	$4D,$32, 8,	$57,$C7, 2,	$4A,$8D, 16,	$4D,$3D, 2,	$4E,$6B, 16,	$56,$C6, 32,	$41,$EC, 64,	$4C,$8B, 128,	$48,$EC, 8,	$46,$CA, 16,	$4B,$34, 16,	$56,$0B, 128,	$48,$D1, 64,	$47,$CD, 128,	$43,$F5, 128,	$49,$B1, 4,	$56,$8F, 2,	$4E,$15, 2,	$4B,$06, 8,	$57,$11, 32,	$47,$F4, 4,	$4F,$B0, 16,	$46,$CA, 8,	$49,$CD, 4,	$4F,$4C, 32,	$57,$74, 2,	$49,$2B, 4,	$46,$F4, 32,	$54,$6D, 16,	$4C,$CD, 16,	$4F,$8B, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4B,$5D, 64,	$4B,$0B, 4,	$4C,$66, 4,	$4F,$6A, 8,	$55,$13, 32,	$4D,$50, 32,	$48,$31, 4,	$48,$CD, 1,	$41,$B3, 4,	$4E,$CE, 8,	$4A,$95, 32,	$4D,$CF, 8,	$57,$37, 32,	$4B,$4C, 32,	$40,$AA, 4,	$4A,$CE, 2,	$45,$11, 16,	$54,$AD, 1,	$51,$11, 32,	$45,$0A, 128,	$45,$46, 128,	$48,$AE, 16,	$53,$0A, 1,	$56,$59, 32,	$4B,$53, 4,	$47,$F7, 64,	$46,$CF, 8,	$41,$E9, 128,	$57,$14, 128,	$4D,$31, 2,	$4C,$71, 8,	$4F,$23, 2,	$43,$B3, 4,	$47,$74, 16,	$4B,$68, 8,	$4C,$CF, 1,	$43,$98, 4,	$55,$0C, 1,	$4E,$6F, 16,	$51,$F3, 1,	$4F,$4C, 16,	$4E,$68, 1,	$4D,$B4, 2,	$50,$52, 2,	$44,$D3, 8,	$47,$B4, 2,	$42,$CD, 1,	$4C,$32, 4,	$54,$E7, 32,	$4A,$8D, 16,	$4B,$3E, 1,	$4E,$6B, 16,	$51,$E5, 1,	$40,$EC, 128,	$4C,$8A, 1,	$48,$EC, 8,	$45,$CA, 32,	$4A,$34, 8,	$56,$0A, 1,	$48,$D1, 64,	$47,$CD, 128,	$42,$F5, 128,	$49,$B1, 4,	$50,$AF, 2,	$4D,$15, 1,	$4A,$06, 32,	$50,$31, 32,	$47,$F4, 2,	$4F,$B0, 16,	$44,$CA, 16,	$49,$CD, 8,	$4F,$4C, 64,	$51,$94, 1,	$49,$2B, 8,	$45,$F4, 16,	$56,$6D, 32,	$4D,$CD, 16,	$4F,$8B, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4A,$5E, 32,	$4A,$0B, 8,	$4C,$66, 16,	$4F,$6A, 16,	$56,$13, 32,	$4C,$50, 32,	$48,$31, 4,	$48,$CD, 2,	$40,$B3, 2,	$4F,$CE, 16,	$4A,$95, 32,	$4E,$CF, 8,	$51,$57, 8,	$4B,$4C, 64,	$47,$8A, 8,	$4A,$CE, 4,	$42,$11, 8,	$56,$AD, 1,	$52,$11, 32,	$42,$09, 2,	$43,$45, 4,	$48,$AE, 16,	$54,$0A, 1,	$50,$79, 8,	$4B,$53, 4,	$47,$F7, 32,	$46,$CF, 8,	$41,$E8, 1,	$50,$34, 64,	$4D,$31, 2,	$4C,$71, 4,	$4E,$23, 32,	$42,$B3, 2,	$45,$74, 8,	$4B,$68, 16,	$4A,$11, 1,	$4C,$CF, 1,	$47,$79, 32,	$55,$0C, 1,	$4E,$6F, 16,	$56,$F4, 64,	$4F,$4C, 32,	$4E,$68, 8,	$4D,$B4, 1,	$51,$52, 1,	$42,$D3, 4,	$46,$B4, 1,	$42,$CD, 1,	$4B,$32, 2,	$4A,$8D, 32,	$52,$0B, 8,	$4E,$6B, 32,	$55,$E5, 8,	$40,$EC, 128,	$4D,$8A, 2,	$48,$EC, 16,	$45,$CA, 32,	$4A,$34, 8,	$57,$0A, 2,	$48,$D1, 64,	$46,$CC, 1,	$42,$F5, 64,	$4A,$B1, 4,	$52,$AF, 2,	$4D,$16, 128,	$49,$05, 1,	$50,$31, 32,	$46,$F4, 2,	$4F,$B0, 16,	$43,$CA, 64,	$49,$CD, 8,	$4F,$4C, 128,	$53,$95, 128,	$48,$2B, 16,	$44,$F4, 8,	$57,$6D, 32,	$4D,$CD, 16,	$4F,$8B, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$48,$5F, 8,	$4A,$0B, 16,	$4C,$66, 128,	$4F,$6A, 32,	$56,$13, 16,	$4C,$50, 16,	$4F,$11, 4,	$49,$CD, 2,	$46,$93, 1,	$4F,$CE, 16,	$4A,$95, 16,	$4E,$CF, 8,	$52,$57, 4,	$4A,$4C, 64,	$45,$8A, 16,	$4B,$CE, 4,	$50,$CD, 2,	$53,$11, 32,	$40,$45, 16,	$48,$AE, 16,	$55,$0A, 2,	$52,$79, 2,	$4B,$53, 2,	$46,$F7, 8,	$45,$CF, 8,	$40,$E8, 2,	$51,$34, 32,	$4C,$31, 2,	$4C,$71, 4,	$4E,$22, 2,	$41,$B3, 2,	$44,$74, 4,	$4A,$68, 32,	$49,$11, 1,	$4C,$CF, 1,	$42,$79, 1,	$56,$0C, 1,	$4E,$6F, 16,	$4F,$4C, 64,	$4E,$68, 64,	$4D,$B4, 1,	$52,$52, 1,	$41,$D3, 2,	$45,$B4, 1,	$41,$CD, 1,	$49,$33, 128,	$4B,$8D, 32,	$52,$0B, 8,	$4D,$6B, 64,	$47,$CB, 1,	$4D,$8A, 8,	$49,$EC, 16,	$44,$CA, 64,	$49,$34, 4,	$50,$2A, 2,	$48,$D1, 64,	$46,$CC, 1,	$41,$F5, 32,	$4A,$B1, 4,	$55,$AF, 2,	$4D,$16, 64,	$48,$05, 4,	$51,$31, 16,	$46,$F4, 1,	$48,$D0, 16,	$41,$CA, 128,	$4A,$CD, 16,	$4E,$4B, 2,	$54,$95, 128,	$48,$2B, 16,	$43,$F4, 2,	$50,$8D, 64,	$4D,$CD, 32,	$4F,$8B, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$49,$0B, 16,	$4C,$65, 2,	$4F,$6A, 32,	$57,$13, 16,	$4C,$50, 16,	$4F,$11, 2,	$49,$CD, 2,	$43,$94, 128,	$4F,$CE, 16,	$4A,$95, 8,	$4E,$CF, 8,	$54,$57, 1,	$4A,$4C, 128,	$44,$8A, 32,	$4B,$CE, 4,	$53,$CD, 2,	$53,$11, 32,	$46,$25, 128,	$49,$AE, 16,	$56,$0A, 4,	$54,$7A, 64,	$4A,$53, 2,	$45,$F7, 4,	$45,$CF, 8,	$47,$C8, 4,	$53,$34, 16,	$4C,$31, 1,	$4C,$71, 4,	$4D,$22, 64,	$40,$B3, 1,	$42,$74, 2,	$4A,$68, 128,	$49,$11, 1,	$4C,$CF, 1,	$45,$5A, 4,	$57,$0C, 2,	$4E,$6F, 16,	$4F,$4C, 64,	$4E,$67, 4,	$4D,$B5, 128,	$53,$53, 128,	$40,$D3, 1,	$45,$B5, 128,	$40,$CD, 2,	$48,$33, 64,	$4B,$8D, 32,	$44,$EE, 64,	$52,$0B, 16,	$4D,$6B, 128,	$46,$CB, 1,	$4D,$8A, 16,	$49,$EC, 32,	$43,$CA, 128,	$49,$34, 2,	$50,$2A, 4,	$49,$D1, 64,	$45,$CC, 1,	$40,$F5, 16,	$4A,$B1, 2,	$57,$AF, 2,	$4C,$16, 64,	$47,$E5, 32,	$51,$31, 16,	$45,$F4, 1,	$48,$D0, 16,	$40,$C9, 2,	$4A,$CD, 16,	$4E,$4B, 8,	$56,$95, 32,	$4F,$0B, 32,	$41,$F4, 1,	$52,$8D, 64,	$4E,$CD, 32,	$4F,$8B, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4F,$32, 32,	$48,$0B, 32,	$4C,$65, 16,	$4F,$6A, 64,	$50,$33, 8,	$4C,$50, 16,	$4F,$11, 2,	$49,$CD, 2,	$41,$94, 64,	$48,$EE, 16,	$4A,$95, 8,	$4F,$CF, 8,	$56,$58, 64,	$4A,$4C, 128,	$4E,$71, 16,	$43,$8A, 64,	$44,$F4, 2,	$4B,$CE, 4,	$55,$CD, 4,	$54,$11, 32,	$43,$24, 4,	$4E,$92, 1,	$49,$AE, 32,	$56,$0A, 8,	$56,$7A, 8,	$4A,$53, 1,	$44,$F7, 2,	$44,$CF, 8,	$46,$C8, 8,	$54,$34, 8,	$4C,$31, 1,	$4C,$71, 4,	$4C,$21, 8,	$47,$93, 1,	$40,$74, 1,	$4A,$67, 1,	$49,$11, 1,	$4D,$CF, 1,	$46,$3B, 8,	$57,$0C, 2,	$4E,$6F, 32,	$4E,$4C, 128,	$4E,$67, 64,	$4D,$B5, 64,	$54,$53, 128,	$46,$B4, 128,	$44,$B5, 64,	$47,$AD, 2,	$4E,$13, 16,	$4B,$8D, 32,	$44,$EE, 64,	$53,$0B, 16,	$4D,$6B, 128,	$46,$CB, 2,	$4D,$8A, 32,	$49,$EC, 32,	$43,$C9, 1,	$48,$34, 1,	$51,$2A, 8,	$49,$D1, 64,	$44,$CC, 2,	$47,$D5, 8,	$4A,$B1, 2,	$52,$CF, 2,	$4C,$16, 32,	$46,$E4, 1,	$52,$31, 16,	$44,$F5, 128,	$48,$D0, 16,	$46,$A9, 8,	$4B,$CD, 32,	$4D,$4B, 32,	$50,$B5, 16,	$4F,$0B, 32,	$47,$D5, 64,	$53,$8D, 128,	$4E,$CD, 32,	$48,$AB, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$32, 32,	$48,$0B, 64,	$4C,$65, 64,	$4F,$6A, 128,	$50,$33, 8,	$4C,$50, 16,	$4E,$11, 2,	$4A,$CD, 4,	$47,$74, 16,	$48,$EE, 16,	$4A,$95, 4,	$4F,$CF, 8,	$57,$58, 8,	$4A,$4B, 1,	$4E,$71, 16,	$41,$8A, 128,	$44,$F4, 2,	$4C,$CE, 4,	$50,$ED, 4,	$55,$11, 16,	$40,$24, 32,	$4E,$92, 1,	$49,$AE, 32,	$57,$0A, 16,	$50,$9A, 2,	$4A,$53, 1,	$44,$F7, 1,	$43,$CF, 8,	$46,$C8, 32,	$55,$34, 4,	$4B,$31, 1,	$4C,$71, 2,	$4B,$20, 2,	$46,$94, 128,	$46,$55, 128,	$4A,$67, 2,	$48,$11, 1,	$4D,$CF, 1,	$47,$1C, 4,	$50,$2C, 4,	$4E,$6F, 32,	$4E,$4B, 1,	$4E,$66, 4,	$4E,$B5, 32,	$55,$53, 64,	$44,$B4, 64,	$43,$B5, 64,	$46,$AD, 2,	$4D,$13, 4,	$4B,$8D, 64,	$43,$EE, 64,	$53,$0B, 32,	$4D,$6A, 1,	$45,$CB, 2,	$4D,$8A, 64,	$4A,$EC, 32,	$42,$C9, 1,	$48,$35, 128,	$52,$2A, 8,	$49,$D1, 64,	$44,$CC, 2,	$47,$D5, 8,	$4A,$B1, 2,	$55,$CF, 2,	$4B,$16, 16,	$45,$E4, 8,	$53,$31, 16,	$44,$F5, 64,	$49,$D0, 16,	$44,$A9, 32,	$4B,$CD, 32,	$4D,$4B, 128,	$52,$B5, 8,	$4F,$0B, 64,	$46,$D5, 16,	$55,$8D, 128,	$4E,$CD, 64,	$48,$AB, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$32, 32,	$47,$EB, 64,	$4C,$64, 2,	$4F,$6A, 128,	$51,$33, 4,	$4C,$50, 16,	$4E,$11, 2,	$4A,$CD, 4,	$44,$74, 8,	$49,$EE, 32,	$4A,$95, 2,	$4F,$CF, 16,	$51,$78, 2,	$4A,$4B, 1,	$4E,$71, 16,	$47,$69, 1,	$43,$F4, 1,	$4C,$CE, 8,	$52,$ED, 8,	$55,$11, 16,	$45,$03, 1,	$4E,$92, 1,	$49,$AE, 32,	$50,$2A, 32,	$52,$9B, 64,	$4A,$54, 128,	$43,$F8, 64,	$43,$CF, 8,	$45,$C8, 64,	$57,$34, 2,	$4B,$31, 1,	$4C,$71, 2,	$4A,$20, 128,	$45,$94, 64,	$44,$55, 64,	$4A,$67, 8,	$48,$12, 128,	$4E,$CF, 1,	$51,$2C, 4,	$4E,$6F, 32,	$4E,$4B, 2,	$4E,$65, 1,	$4E,$B5, 16,	$57,$53, 64,	$43,$B4, 32,	$42,$B5, 32,	$45,$AD, 4,	$4B,$13, 1,	$4B,$8D, 64,	$43,$EE, 64,	$54,$0B, 32,	$4D,$6A, 2,	$44,$CB, 4,	$4D,$89, 1,	$4A,$EC, 64,	$41,$C9, 2,	$4F,$15, 64,	$52,$2A, 16,	$49,$D1, 64,	$43,$CC, 4,	$46,$D5, 4,	$4A,$B1, 2,	$50,$EF, 2,	$4B,$16, 8,	$44,$E4, 128,	$53,$31, 16,	$43,$F5, 64,	$49,$D0, 8,	$42,$A8, 1,	$4C,$CD, 32,	$4C,$4A, 2,	$54,$B5, 4,	$4E,$0B, 64,	$44,$D5, 8,	$57,$8C, 1,	$4F,$CD, 64,	$48,$AB, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$32, 16,	$47,$EB, 128,	$4C,$64, 16,	$4C,$F0, 2,	$4F,$69, 1,	$52,$33, 4,	$4B,$50, 16,	$4E,$11, 2,	$4A,$CD, 4,	$41,$74, 2,	$49,$EE, 32,	$4A,$95, 2,	$48,$EF, 16,	$53,$79, 64,	$49,$4B, 1,	$4E,$71, 16,	$46,$69, 4,	$43,$F4, 1,	$4C,$CE, 8,	$55,$ED, 16,	$56,$11, 16,	$41,$03, 16,	$4E,$93, 128,	$49,$AE, 64,	$51,$2A, 64,	$54,$9B, 4,	$4A,$54, 128,	$42,$F8, 32,	$42,$CF, 8,	$44,$C8, 128,	$50,$54, 1,	$4B,$32, 128,	$4B,$71, 2,	$44,$94, 64,	$42,$55, 32,	$4A,$67, 16,	$47,$F2, 128,	$4E,$CF, 1,	$51,$2C, 4,	$4E,$6F, 32,	$4D,$4B, 4,	$4E,$65, 64,	$4E,$B5, 16,	$50,$73, 32,	$41,$B4, 16,	$41,$B5, 16,	$44,$AD, 4,	$48,$14, 32,	$4B,$8D, 64,	$42,$EE, 64,	$54,$0B, 64,	$4D,$6A, 4,	$44,$CB, 8,	$4E,$89, 2,	$4B,$EC, 64,	$40,$C9, 4,	$4F,$15, 32,	$53,$2A, 32,	$4A,$D1, 32,	$42,$CC, 4,	$45,$D5, 2,	$4A,$B1, 2,	$53,$EF, 2,	$4A,$16, 4,	$42,$E3, 4,	$54,$31, 16,	$43,$F5, 32,	$4A,$D0, 8,	$47,$88, 4,	$4C,$CD, 64,	$4B,$4A, 16,	$56,$B5, 2,	$4E,$0B, 128,	$42,$D5, 1,	$50,$AC, 2,	$4F,$CD, 128,	$48,$AB, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$32, 16,	$46,$EA, 1,	$4C,$63, 1,	$4D,$F0, 2,	$4F,$69, 2,	$52,$33, 2,	$4B,$50, 16,	$4D,$11, 1,	$4B,$CD, 8,	$46,$54, 1,	$49,$EE, 32,	$4A,$95, 1,	$48,$EF, 16,	$56,$79, 16,	$49,$4B, 2,	$4E,$71, 16,	$44,$69, 8,	$42,$F5, 128,	$4D,$CE, 8,	$57,$11, 16,	$4E,$93, 128,	$4A,$AE, 64,	$52,$2A, 128,	$57,$9C, 128,	$49,$54, 64,	$41,$F8, 8,	$41,$CF, 8,	$43,$C7, 2,	$52,$55, 64,	$4A,$32, 128,	$4B,$71, 1,	$42,$94, 32,	$40,$55, 8,	$4A,$67, 64,	$47,$F2, 128,	$4E,$CF, 1,	$52,$2C, 8,	$4E,$6F, 32,	$4D,$4B, 8,	$4E,$64, 32,	$4F,$B5, 8,	$51,$73, 16,	$47,$94, 8,	$49,$B4, 32,	$40,$B5, 8,	$43,$AD, 8,	$45,$F4, 4,	$4B,$8D, 128,	$42,$EE, 128,	$55,$0B, 64,	$4D,$6A, 8,	$43,$CB, 8,	$4E,$89, 8,	$4B,$EC, 128,	$47,$A9, 8,	$4E,$15, 16,	$54,$2A, 64,	$4A,$D1, 32,	$42,$CC, 4,	$44,$D5, 1,	$4B,$B1, 1,	$57,$EF, 2,	$4A,$16, 2,	$41,$E3, 64,	$55,$31, 8,	$42,$F5, 16,	$4A,$D0, 8,	$45,$88, 32,	$4D,$CD, 128,	$4A,$4A, 128,	$50,$D6, 128,	$4D,$0A, 1,	$47,$B6, 64,	$52,$AC, 2,	$48,$ED, 128,	$48,$AA, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$32, 16,	$45,$EA, 2,	$4B,$63, 8,	$4D,$F0, 2,	$4F,$69, 4,	$53,$33, 2,	$4B,$50, 16,	$4D,$11, 1,	$4B,$CD, 8,	$43,$55, 64,	$4A,$EE, 32,	$4A,$96, 128,	$49,$EF, 16,	$50,$99, 2,	$49,$4B, 2,	$4E,$71, 8,	$42,$69, 32,	$42,$F5, 128,	$4D,$CE, 8,	$50,$31, 16,	$4E,$93, 128,	$4A,$AE, 128,	$53,$29, 1,	$52,$BC, 8,	$49,$54, 64,	$40,$F8, 2,	$40,$CF, 8,	$42,$C7, 4,	$53,$55, 32,	$4A,$32, 128,	$4B,$71, 1,	$4D,$2D, 16,	$41,$94, 16,	$45,$35, 4,	$4A,$66, 1,	$46,$F2, 128,	$4F,$CF, 1,	$53,$2C, 8,	$4E,$6F, 32,	$4D,$4B, 16,	$4D,$63, 64,	$4F,$B5, 4,	$53,$73, 16,	$45,$94, 2,	$49,$B4, 16,	$47,$95, 4,	$42,$AD, 8,	$42,$F5, 64,	$4B,$8D, 128,	$41,$EE, 128,	$55,$0B, 128,	$4D,$6A, 16,	$42,$CB, 16,	$4E,$89, 32,	$4B,$EC, 128,	$47,$A9, 16,	$4D,$15, 8,	$55,$2A, 64,	$4A,$D1, 32,	$41,$CC, 8,	$43,$D6, 128,	$4B,$B1, 1,	$49,$16, 2,	$47,$C2, 8,	$56,$31, 8,	$41,$F5, 8,	$4A,$D0, 8,	$42,$87, 1,	$4D,$CD, 128,	$49,$49, 8,	$53,$D6, 64,	$4D,$0A, 1,	$45,$B6, 8,	$54,$AC, 4,	$48,$ED, 128,	$48,$AA, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$32, 16,	$45,$EA, 2,	$4B,$63, 128,	$4D,$F0, 2,	$4F,$69, 8,	$54,$33, 1,	$4B,$50, 16,	$4C,$11, 1,	$4B,$CD, 8,	$47,$35, 16,	$4A,$EE, 32,	$4A,$96, 64,	$49,$EF, 16,	$53,$9A, 64,	$49,$4B, 4,	$4E,$71, 8,	$40,$69, 64,	$41,$F5, 64,	$4E,$CE, 8,	$51,$31, 8,	$4E,$93, 128,	$4A,$AE, 128,	$54,$29, 2,	$55,$BD, 128,	$49,$54, 32,	$47,$D8, 1,	$40,$CF, 8,	$41,$C7, 16,	$55,$55, 16,	$49,$32, 64,	$4B,$71, 1,	$4C,$2D, 16,	$40,$94, 16,	$43,$35, 2,	$49,$66, 2,	$46,$F2, 128,	$4F,$CF, 1,	$54,$2C, 16,	$4E,$6F, 32,	$4C,$4B, 64,	$4D,$61, 1,	$4F,$B5, 2,	$54,$73, 8,	$42,$94, 1,	$49,$B4, 16,	$46,$95, 4,	$40,$AD, 8,	$46,$D5, 4,	$4B,$8D, 128,	$41,$EE, 128,	$56,$0B, 128,	$4D,$6A, 64,	$41,$CB, 16,	$4E,$89, 64,	$4C,$EB, 1,	$46,$A9, 32,	$4D,$15, 4,	$55,$2A, 128,	$4A,$D1, 32,	$40,$CC, 8,	$42,$D6, 32,	$4B,$B1, 1,	$49,$16, 1,	$45,$C1, 1,	$56,$31, 8,	$41,$F5, 8,	$4B,$D0, 8,	$47,$67, 8,	$4E,$CC, 1,	$48,$49, 128,	$55,$D6, 16,	$4D,$0A, 2,	$42,$B6, 2,	$56,$AC, 8,	$48,$EC, 1,	$48,$AA, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$32, 8,	$44,$EA, 4,	$4B,$62, 8,	$4E,$F0, 2,	$4F,$69, 8,	$55,$33, 1,	$4A,$50, 16,	$4C,$11, 1,	$4C,$CD, 16,	$43,$35, 4,	$4B,$EE, 64,	$4A,$96, 64,	$49,$EF, 16,	$55,$9A, 4,	$49,$4B, 8,	$4E,$71, 8,	$46,$48, 1,	$41,$F5, 64,	$4E,$CE, 16,	$51,$31, 8,	$4E,$93, 64,	$4B,$AE, 128,	$55,$29, 4,	$50,$DD, 8,	$49,$54, 16,	$46,$D9, 64,	$47,$AF, 8,	$40,$C7, 32,	$57,$55, 4,	$49,$32, 64,	$4B,$72, 128,	$4C,$2D, 16,	$46,$74, 8,	$40,$36, 128,	$49,$66, 8,	$45,$F2, 64,	$48,$EF, 1,	$54,$2C, 16,	$4E,$6F, 64,	$4C,$4B, 128,	$4D,$60, 32,	$48,$D5, 1,	$56,$73, 4,	$40,$95, 64,	$49,$B4, 8,	$44,$95, 2,	$47,$8D, 16,	$41,$D6, 16,	$49,$AB, 8,	$4B,$8C, 1,	$40,$EE, 128,	$56,$0A, 1,	$4D,$6A, 128,	$41,$CB, 32,	$4E,$88, 1,	$4C,$EB, 1,	$45,$A9, 64,	$4C,$15, 2,	$56,$29, 1,	$4B,$D1, 32,	$47,$AC, 16,	$41,$D6, 16,	$4B,$B1, 1,	$48,$17, 128,	$43,$C1, 32,	$57,$31, 8,	$40,$F5, 4,	$4B,$D0, 8,	$43,$67, 64,	$4E,$CC, 1,	$4F,$28, 16,	$50,$F6, 8,	$4C,$0A, 4,	$47,$97, 32,	$50,$CC, 8,	$49,$EC, 1,	$49,$AA, 4,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$32, 8,	$43,$EA, 8,	$4B,$61, 1,	$4E,$F0, 2,	$4F,$69, 16,	$56,$34, 128,	$4A,$50, 16,	$4C,$12, 128,	$4C,$CD, 16,	$46,$16, 128,	$4B,$EE, 64,	$4A,$96, 32,	$4A,$EF, 16,	$51,$BB, 64,	$48,$4B, 8,	$4E,$71, 8,	$44,$48, 2,	$40,$F5, 32,	$4E,$CE, 16,	$52,$31, 8,	$4E,$93, 64,	$4B,$AD, 1,	$56,$29, 8,	$53,$DE, 64,	$48,$54, 16,	$45,$D9, 16,	$46,$AF, 8,	$46,$A7, 128,	$51,$75, 1,	$49,$32, 64,	$4B,$72, 128,	$4C,$2D, 32,	$45,$74, 4,	$45,$16, 64,	$49,$66, 32,	$45,$F2, 64,	$48,$EF, 1,	$55,$2C, 32,	$4E,$6F, 64,	$4C,$4A, 1,	$48,$D6, 128,	$50,$93, 4,	$45,$75, 16,	$49,$B4, 8,	$43,$95, 1,	$46,$8D, 16,	$42,$B7, 32,	$49,$AB, 16,	$4B,$8C, 1,	$47,$CE, 128,	$57,$0A, 1,	$4D,$69, 1,	$40,$CB, 64,	$4F,$88, 4,	$4D,$EB, 2,	$44,$A9, 128,	$4B,$15, 1,	$57,$29, 2,	$4B,$D1, 32,	$46,$AC, 16,	$40,$D6, 8,	$4B,$B1, 1,	$48,$17, 64,	$41,$C0, 4,	$50,$51, 8,	$47,$D5, 2,	$4C,$D0, 8,	$40,$66, 4,	$4F,$CC, 2,	$4D,$27, 4,	$53,$F6, 2,	$4C,$0A, 8,	$43,$97, 4,	$53,$CC, 16,	$49,$EC, 2,	$49,$AA, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$32, 8,	$4D,$72, 128,	$42,$EA, 16,	$4B,$61, 32,	$4F,$F0, 1,	$4F,$69, 32,	$57,$34, 64,	$4A,$50, 16,	$4B,$12, 128,	$4C,$CD, 32,	$41,$16, 16,	$4C,$EE, 64,	$4A,$96, 16,	$4A,$EF, 16,	$54,$BB, 4,	$48,$4B, 16,	$4E,$71, 8,	$41,$48, 8,	$47,$D5, 32,	$4F,$CE, 16,	$53,$31, 4,	$4E,$93, 32,	$4B,$AD, 1,	$57,$29, 32,	$57,$DE, 2,	$48,$54, 8,	$44,$D9, 4,	$45,$AF, 8,	$45,$A6, 2,	$54,$76, 64,	$48,$32, 32,	$4B,$72, 128,	$4C,$2D, 32,	$44,$74, 2,	$42,$16, 16,	$49,$66, 128,	$44,$F2, 64,	$48,$EF, 1,	$56,$2C, 32,	$4E,$6F, 64,	$4B,$4A, 4,	$48,$D6, 64,	$51,$93, 2,	$42,$75, 8,	$4A,$B4, 4,	$42,$96, 128,	$45,$8D, 32,	$42,$98, 16,	$49,$AB, 16,	$4B,$8C, 1,	$47,$CD, 1,	$50,$2A, 2,	$4D,$69, 2,	$47,$AB, 64,	$4F,$88, 32,	$4D,$EB, 2,	$43,$A8, 1,	$4A,$16, 64,	$50,$49, 4,	$4B,$D1, 16,	$46,$AC, 32,	$47,$B6, 4,	$4B,$B2, 128,	$47,$F7, 16,	$51,$51, 4,	$47,$D5, 1,	$4C,$D0, 8,	$43,$46, 128,	$4F,$CC, 4,	$4B,$26, 2,	$56,$F7, 128,	$4B,$0A, 8,	$47,$78, 64,	$55,$CC, 32,	$4A,$EC, 2,	$49,$AA, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$32, 8,	$4D,$72, 64,	$42,$EA, 32,	$4B,$60, 4,	$4F,$F0, 1,	$4F,$69, 64,	$50,$54, 64,	$4A,$50, 16,	$4B,$12, 128,	$4D,$CD, 32,	$4C,$EE, 64,	$4A,$96, 8,	$4B,$EF, 16,	$50,$DC, 64,	$48,$4B, 16,	$4E,$71, 8,	$47,$28, 32,	$47,$D5, 16,	$4F,$CE, 16,	$54,$31, 4,	$4E,$93, 32,	$4C,$AD, 2,	$50,$49, 64,	$54,$FF, 8,	$48,$54, 4,	$43,$D9, 1,	$44,$AF, 8,	$44,$A6, 8,	$56,$76, 16,	$48,$32, 32,	$4B,$72, 64,	$4B,$2D, 32,	$42,$74, 1,	$49,$65, 2,	$44,$F2, 64,	$49,$EF, 1,	$57,$2C, 64,	$4E,$6F, 64,	$4B,$4A, 16,	$49,$D6, 32,	$53,$93, 1,	$47,$55, 1,	$4A,$B4, 4,	$41,$96, 64,	$43,$8D, 32,	$45,$5A, 64,	$49,$AB, 16,	$4B,$8C, 2,	$4C,$72, 8,	$46,$CD, 1,	$50,$2A, 4,	$4D,$69, 8,	$46,$AB, 128,	$4F,$88, 128,	$4E,$EB, 4,	$42,$A8, 2,	$49,$16, 32,	$51,$49, 8,	$4C,$D1, 16,	$45,$AC, 32,	$45,$B6, 2,	$4C,$B2, 128,	$46,$F7, 8,	$52,$51, 4,	$46,$D6, 128,	$4D,$D0, 8,	$46,$25, 16,	$48,$EC, 4,	$48,$25, 4,	$4A,$0A, 16,	$43,$78, 2,	$50,$EC, 64,	$4A,$EC, 4,	$49,$AA, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$32, 4,	$4D,$72, 64,	$41,$EA, 64,	$4F,$34, 32,	$50,$10, 1,	$4F,$69, 128,	$51,$54, 32,	$49,$50, 16,	$4A,$12, 128,	$4D,$CD, 64,	$4D,$EE, 128,	$4A,$96, 4,	$4B,$EF, 16,	$54,$DC, 2,	$48,$4B, 32,	$4E,$71, 4,	$44,$28, 128,	$46,$D5, 8,	$48,$EE, 32,	$55,$31, 4,	$4E,$93, 32,	$4C,$AD, 4,	$52,$48, 1,	$49,$11, 32,	$4F,$34, 4,	$42,$DA, 64,	$44,$AF, 8,	$43,$A6, 32,	$51,$96, 4,	$4F,$12, 32,	$4B,$72, 64,	$4B,$2D, 32,	$41,$74, 1,	$49,$65, 16,	$43,$F2, 32,	$49,$EF, 1,	$50,$4C, 128,	$4E,$6F, 64,	$4A,$4A, 32,	$49,$D6, 8,	$55,$94, 128,	$43,$56, 64,	$4A,$B4, 2,	$47,$76, 32,	$42,$8D, 64,	$43,$1C, 4,	$4A,$AB, 32,	$4B,$8C, 2,	$4C,$72, 8,	$46,$CD, 1,	$51,$2A, 4,	$4D,$69, 16,	$45,$AA, 1,	$48,$A7, 2,	$4E,$EB, 4,	$40,$A8, 8,	$49,$16, 8,	$52,$49, 16,	$4C,$D1, 16,	$44,$AC, 64,	$44,$B7, 128,	$4C,$B2, 128,	$46,$F7, 4,	$53,$51, 4,	$45,$D6, 64,	$4D,$D0, 8,	$41,$24, 2,	$49,$EC, 8,	$4D,$04, 64,	$4A,$0A, 32,	$46,$59, 8,	$53,$EC, 128,	$4B,$EC, 4,	$49,$AA, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$32, 4,	$4D,$72, 64,	$40,$EA, 128,	$4F,$34, 32,	$50,$10, 1,	$4F,$68, 1,	$52,$54, 16,	$49,$50, 16,	$4A,$12, 64,	$4E,$CD, 64,	$4E,$EE, 128,	$4A,$96, 2,	$4C,$EF, 16,	$50,$FD, 8,	$4F,$2B, 64,	$4E,$71, 4,	$41,$27, 4,	$46,$D5, 8,	$49,$EE, 32,	$56,$31, 4,	$4F,$93, 16,	$4D,$AD, 4,	$53,$48, 2,	$48,$11, 32,	$4F,$34, 2,	$40,$DA, 8,	$43,$AF, 8,	$41,$A6, 128,	$54,$96, 1,	$4F,$12, 16,	$4B,$72, 64,	$4B,$2D, 64,	$47,$55, 128,	$48,$65, 64,	$43,$F2, 32,	$4A,$EF, 1,	$4C,$51, 4,	$51,$4C, 128,	$4E,$6F, 128,	$4A,$4A, 128,	$4A,$D6, 4,	$57,$94, 64,	$40,$56, 16,	$4A,$B4, 2,	$46,$76, 8,	$40,$8D, 64,	$4A,$AB, 32,	$4B,$8C, 4,	$4C,$72, 4,	$45,$CD, 1,	$51,$2A, 8,	$4D,$69, 64,	$44,$AA, 2,	$48,$A7, 16,	$4F,$EB, 8,	$47,$88, 16,	$48,$16, 4,	$53,$49, 32,	$4C,$D1, 16,	$43,$AC, 64,	$43,$B7, 64,	$4C,$B2, 128,	$50,$14, 4,	$45,$F7, 2,	$54,$51, 4,	$44,$D6, 32,	$4E,$D0, 4,	$43,$03, 1,	$4A,$EC, 16,	$49,$02, 32,	$49,$0A, 64,	$40,$5A, 32,	$56,$EB, 1,	$4B,$EC, 8,	$49,$AA, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4B,$32, 4,	$4D,$72, 64,	$47,$C9, 1,	$4E,$34, 16,	$50,$10, 1,	$4F,$68, 2,	$53,$54, 16,	$49,$50, 8,	$49,$12, 64,	$4E,$CD, 128,	$4E,$EE, 128,	$4A,$96, 1,	$4C,$EF, 16,	$55,$FE, 32,	$4F,$2B, 64,	$4E,$71, 4,	$46,$07, 16,	$45,$D5, 4,	$49,$EE, 32,	$50,$51, 2,	$4F,$93, 16,	$4D,$AD, 8,	$55,$48, 8,	$48,$11, 32,	$4F,$34, 1,	$47,$BA, 2,	$42,$AF, 16,	$40,$A5, 2,	$57,$97, 32,	$4E,$12, 16,	$4A,$72, 32,	$4B,$2D, 64,	$45,$55, 64,	$48,$64, 2,	$42,$F2, 32,	$4A,$EF, 1,	$4B,$51, 4,	$52,$4B, 1,	$4D,$6F, 128,	$49,$49, 2,	$4A,$D6, 2,	$52,$B4, 32,	$43,$36, 2,	$4A,$B4, 1,	$44,$76, 4,	$46,$6D, 128,	$4B,$CE, 64,	$4A,$AB, 64,	$4B,$8C, 4,	$4C,$72, 4,	$44,$CD, 2,	$52,$2A, 16,	$4D,$69, 128,	$43,$AA, 2,	$48,$A7, 128,	$4F,$EB, 8,	$46,$88, 32,	$47,$F6, 1,	$54,$49, 64,	$4D,$D1, 16,	$42,$AC, 128,	$41,$B7, 16,	$4C,$B2, 64,	$50,$14, 4,	$44,$F7, 1,	$55,$51, 2,	$43,$D6, 16,	$4F,$D0, 4,	$4A,$EC, 32,	$49,$0A, 128,	$40,$3B, 64,	$4C,$EC, 8,	$4A,$AA, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4B,$32, 2,	$4D,$72, 32,	$46,$C9, 4,	$4E,$34, 16,	$51,$10, 1,	$4F,$68, 4,	$54,$54, 8,	$48,$50, 8,	$49,$12, 64,	$4F,$CD, 128,	$4F,$ED, 1,	$4A,$97, 128,	$4D,$EF, 16,	$4F,$2B, 128,	$4E,$71, 4,	$42,$07, 128,	$44,$D5, 2,	$4A,$EE, 64,	$51,$51, 2,	$4F,$93, 8,	$4D,$AD, 8,	$56,$48, 16,	$47,$F1, 32,	$4F,$34, 1,	$45,$BB, 64,	$41,$AF, 16,	$46,$85, 8,	$52,$B7, 4,	$4E,$12, 16,	$4A,$72, 32,	$4A,$2D, 64,	$43,$55, 32,	$48,$64, 8,	$42,$F2, 16,	$4B,$EF, 1,	$4B,$51, 2,	$53,$4B, 2,	$4D,$6F, 128,	$48,$49, 16,	$4A,$D7, 128,	$54,$B4, 16,	$46,$17, 64,	$4A,$B4, 1,	$43,$76, 2,	$45,$6C, 1,	$4B,$CE, 64,	$4A,$AB, 128,	$4B,$8C, 8,	$4C,$72, 4,	$44,$CD, 2,	$53,$2A, 16,	$4C,$68, 2,	$42,$AA, 4,	$49,$A6, 8,	$50,$0B, 16,	$45,$88, 64,	$46,$F7, 64,	$55,$49, 128,	$4D,$D1, 8,	$41,$AB, 1,	$40,$B7, 4,	$4C,$B2, 64,	$50,$14, 2,	$44,$F8, 64,	$56,$51, 2,	$42,$D6, 8,	$4F,$D0, 4,	$4B,$EC, 64,	$48,$09, 1,	$40,$1C, 32,	$4D,$EC, 16,	$4A,$AA, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4B,$32, 2,	$4D,$72, 32,	$45,$C9, 8,	$4E,$34, 8,	$41,$EE, 64,	$51,$10, 1,	$4F,$68, 8,	$55,$54, 4,	$48,$50, 8,	$48,$12, 32,	$4F,$CC, 1,	$4F,$ED, 1,	$4A,$97, 64,	$4D,$EF, 32,	$4E,$2A, 1,	$4E,$71, 4,	$44,$D5, 2,	$4A,$EE, 64,	$52,$51, 1,	$4F,$93, 8,	$4E,$AD, 16,	$50,$68, 64,	$47,$F1, 32,	$4E,$35, 128,	$44,$BB, 8,	$40,$AF, 16,	$44,$85, 64,	$56,$B8, 128,	$4D,$12, 8,	$4A,$72, 16,	$4A,$2D, 128,	$41,$55, 16,	$48,$64, 64,	$41,$F2, 16,	$4C,$EF, 1,	$4B,$51, 2,	$54,$4B, 2,	$4D,$6F, 128,	$48,$49, 64,	$4B,$D7, 64,	$57,$B4, 4,	$41,$17, 4,	$4A,$B5, 128,	$41,$76, 1,	$43,$6C, 1,	$4B,$70, 4,	$4C,$CE, 128,	$4A,$AB, 128,	$4B,$8C, 8,	$4C,$72, 4,	$43,$CD, 2,	$53,$2A, 32,	$4C,$68, 8,	$41,$AA, 8,	$49,$A6, 64,	$50,$0B, 32,	$43,$87, 1,	$44,$F7, 16,	$56,$48, 1,	$4D,$D1, 8,	$40,$AB, 1,	$46,$97, 2,	$4D,$B2, 64,	$51,$14, 2,	$43,$F8, 32,	$57,$51, 2,	$41,$D6, 4,	$48,$F0, 4,	$4C,$EC, 128,	$47,$E9, 2,	$4D,$EC, 32,	$4A,$A9, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4A,$32, 2,	$4D,$72, 32,	$44,$C9, 16,	$4E,$34, 8,	$40,$EE, 128,	$52,$10, 1,	$4F,$68, 32,	$56,$54, 2,	$48,$50, 8,	$48,$12, 32,	$48,$EC, 1,	$50,$0D, 1,	$4B,$97, 32,	$4E,$EF, 32,	$4E,$2A, 1,	$4E,$71, 2,	$43,$D5, 1,	$4B,$EE, 64,	$53,$51, 1,	$4F,$93, 8,	$4F,$AD, 32,	$52,$67, 1,	$47,$F1, 32,	$4E,$35, 64,	$42,$BB, 1,	$47,$8F, 16,	$43,$84, 1,	$53,$D8, 16,	$4C,$12, 8,	$4A,$72, 16,	$4A,$2D, 128,	$47,$35, 4,	$4F,$43, 2,	$40,$F2, 16,	$4C,$EF, 1,	$4B,$51, 2,	$55,$4B, 4,	$4D,$6E, 1,	$4E,$D0, 1,	$4F,$28, 2,	$4F,$6E, 32,	$4B,$D7, 16,	$52,$D4, 2,	$4B,$B5, 64,	$47,$57, 64,	$41,$6C, 2,	$4B,$70, 4,	$4C,$CE, 128,	$4A,$AA, 1,	$4B,$8C, 8,	$4C,$72, 2,	$42,$CD, 2,	$54,$2A, 64,	$4C,$68, 32,	$40,$AA, 16,	$4A,$A5, 4,	$51,$0B, 32,	$42,$87, 2,	$43,$F7, 4,	$57,$48, 4,	$4E,$D1, 8,	$47,$8B, 2,	$45,$98, 128,	$4D,$B2, 32,	$51,$14, 1,	$42,$F8, 16,	$50,$71, 1,	$40,$D6, 2,	$49,$F0, 4,	$4D,$EB, 1,	$47,$E9, 4,	$4E,$EC, 32,	$4A,$A9, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4A,$32, 1,	$4D,$72, 32,	$43,$C9, 32,	$4D,$34, 4,	$40,$EE, 128,	$52,$10, 1,	$4F,$68, 64,	$50,$74, 1,	$4F,$30, 8,	$47,$F2, 32,	$48,$EC, 2,	$51,$0D, 2,	$4B,$97, 16,	$4E,$EF, 32,	$4E,$2A, 2,	$4E,$71, 2,	$42,$D6, 128,	$4C,$EE, 128,	$55,$51, 1,	$4F,$93, 4,	$4F,$AD, 64,	$53,$67, 4,	$46,$F1, 16,	$4D,$35, 32,	$40,$BC, 32,	$46,$8F, 16,	$41,$84, 8,	$57,$D8, 1,	$4C,$12, 4,	$4A,$72, 8,	$49,$2D, 128,	$45,$35, 2,	$4F,$43, 32,	$40,$F2, 8,	$4D,$EF, 1,	$4B,$51, 2,	$56,$4B, 8,	$4D,$6E, 1,	$4E,$D0, 1,	$4E,$28, 16,	$4F,$6E, 64,	$4C,$D7, 8,	$55,$D4, 1,	$4B,$B5, 64,	$46,$57, 32,	$47,$4C, 4,	$4B,$70, 4,	$4C,$CE, 128,	$4A,$AA, 1,	$4C,$8C, 16,	$4C,$72, 2,	$42,$CD, 4,	$55,$2A, 128,	$4C,$68, 128,	$47,$8A, 32,	$4A,$A5, 128,	$51,$0B, 64,	$41,$87, 8,	$42,$F7, 1,	$51,$68, 8,	$4E,$D1, 8,	$45,$8B, 2,	$43,$98, 32,	$4D,$B2, 32,	$52,$14, 1,	$41,$F8, 4,	$51,$71, 1,	$47,$B6, 1,	$49,$F0, 4,	$4E,$EB, 2,	$46,$E9, 8,	$4F,$EC, 64,	$4A,$A9, 4,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4A,$32, 1,	$4D,$72, 16,	$42,$C9, 128,	$4D,$34, 4,	$47,$CE, 128,	$53,$10, 1,	$4F,$68, 128,	$51,$75, 128,	$4F,$30, 8,	$46,$F2, 16,	$49,$EC, 2,	$52,$0D, 2,	$4B,$97, 8,	$4F,$EF, 32,	$4D,$2A, 4,	$4E,$71, 2,	$42,$D6, 64,	$4C,$EE, 128,	$56,$52, 128,	$4F,$93, 4,	$48,$CD, 128,	$55,$67, 16,	$46,$F1, 16,	$4D,$35, 16,	$47,$9C, 4,	$44,$8F, 16,	$47,$64, 64,	$55,$F9, 8,	$4B,$12, 4,	$4A,$72, 4,	$49,$2C, 1,	$43,$35, 1,	$4F,$42, 1,	$47,$D2, 8,	$4D,$EF, 1,	$4B,$51, 2,	$50,$6B, 16,	$4D,$6E, 1,	$4E,$D1, 128,	$4D,$27, 1,	$4F,$6E, 64,	$4D,$D7, 2,	$50,$F5, 64,	$4B,$B5, 32,	$44,$57, 8,	$45,$4C, 8,	$4B,$70, 4,	$4C,$CE, 128,	$4B,$AA, 2,	$4C,$8C, 16,	$4C,$72, 2,	$41,$CD, 4,	$56,$2A, 128,	$4C,$67, 4,	$45,$8A, 64,	$4B,$A4, 16,	$52,$0B, 128,	$47,$67, 32,	$40,$F8, 32,	$52,$68, 16,	$4F,$D1, 4,	$44,$8B, 4,	$41,$98, 8,	$4D,$B2, 32,	$52,$15, 128,	$40,$F8, 2,	$52,$71, 1,	$46,$B7, 128,	$46,$F1, 2,	$4A,$F0, 2,	$4F,$EB, 4,	$45,$E9, 16,	$4F,$EC, 128,	$4B,$A9, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$49,$33, 128,	$4D,$72, 16,	$40,$C8, 1,	$4D,$34, 2,	$47,$CE, 128,	$54,$11, 128,	$4F,$67, 2,	$53,$75, 64,	$4E,$30, 8,	$46,$F2, 16,	$4A,$EC, 4,	$52,$0D, 4,	$4B,$97, 4,	$50,$0F, 32,	$4D,$2A, 8,	$4E,$71, 2,	$41,$D6, 64,	$4D,$EE, 128,	$50,$72, 128,	$4F,$93, 2,	$49,$CC, 1,	$57,$67, 128,	$45,$F1, 16,	$4D,$35, 8,	$44,$9D, 64,	$43,$8F, 16,	$45,$63, 2,	$4A,$12, 2,	$4A,$72, 4,	$49,$2C, 1,	$41,$36, 128,	$4F,$42, 16,	$46,$D2, 8,	$4E,$EF, 1,	$4A,$51, 2,	$51,$6B, 16,	$4D,$6E, 2,	$4E,$D1, 128,	$4C,$27, 8,	$4F,$6E, 64,	$4D,$D8, 128,	$53,$F5, 32,	$4B,$B5, 32,	$42,$57, 4,	$42,$4C, 8,	$4B,$70, 4,	$4D,$CE, 128,	$4B,$AA, 2,	$4C,$8C, 32,	$4C,$72, 1,	$40,$CD, 4,	$56,$29, 1,	$4C,$67, 16,	$44,$8A, 128,	$4B,$A3, 4,	$53,$0B, 128,	$46,$67, 64,	$47,$D8, 8,	$53,$68, 64,	$4F,$D1, 4,	$43,$8B, 8,	$47,$78, 2,	$4D,$B2, 16,	$53,$15, 128,	$40,$F9, 128,	$53,$72, 128,	$45,$B7, 32,	$46,$F1, 2,	$4B,$F0, 2,	$50,$0B, 16,	$4D,$6E, 1,	$45,$E9, 32,	$50,$0C, 128,	$4B,$A9, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$49,$33, 128,	$4D,$72, 16,	$47,$A8, 4,	$4D,$34, 2,	$46,$CE, 128,	$54,$11, 128,	$4F,$67, 4,	$54,$75, 32,	$4E,$30, 8,	$45,$F2, 8,	$4A,$EC, 8,	$53,$0D, 4,	$4B,$97, 2,	$50,$0F, 32,	$4D,$2A, 16,	$4E,$71, 1,	$40,$D6, 32,	$4E,$ED, 1,	$51,$72, 64,	$48,$B3, 2,	$49,$CC, 2,	$52,$86, 2,	$45,$F1, 16,	$4C,$35, 4,	$42,$9D, 4,	$42,$8F, 16,	$42,$63, 16,	$4A,$12, 1,	$49,$72, 2,	$48,$2C, 2,	$46,$16, 32,	$4E,$41, 1,	$46,$D2, 4,	$4F,$EF, 1,	$4A,$51, 1,	$52,$6B, 32,	$4D,$6E, 2,	$4F,$D1, 128,	$4B,$26, 1,	$4F,$6E, 64,	$45,$EC, 1,	$4E,$D8, 32,	$57,$F5, 8,	$4B,$B5, 16,	$47,$37, 1,	$40,$4C, 16,	$4A,$70, 4,	$4D,$CD, 1,	$4B,$AA, 4,	$4C,$8C, 64,	$4C,$72, 1,	$47,$AD, 8,	$57,$29, 2,	$41,$F4, 4,	$4C,$67, 128,	$43,$89, 1,	$4C,$A2, 1,	$53,$0A, 1,	$44,$66, 1,	$45,$D8, 1,	$56,$0C, 4,	$55,$68, 128,	$48,$F1, 4,	$42,$8B, 16,	$45,$79, 64,	$4E,$B2, 16,	$53,$15, 64,	$47,$D9, 32,	$55,$72, 128,	$44,$B7, 16,	$45,$F1, 2,	$4C,$F0, 2,	$52,$0B, 32,	$4D,$6E, 1,	$44,$E9, 128,	$51,$0B, 1,	$4B,$A9, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$49,$33, 128,	$4D,$72, 16,	$46,$A8, 16,	$4C,$34, 1,	$46,$CD, 1,	$55,$11, 128,	$4F,$67, 8,	$56,$75, 16,	$4D,$30, 8,	$44,$F2, 8,	$4B,$EC, 8,	$54,$0D, 4,	$4B,$98, 128,	$51,$0F, 32,	$4C,$2A, 16,	$4E,$71, 1,	$47,$B6, 16,	$4F,$ED, 1,	$53,$72, 64,	$48,$B3, 1,	$4A,$CC, 4,	$54,$86, 16,	$44,$F1, 16,	$4C,$35, 2,	$40,$9E, 64,	$41,$8F, 16,	$40,$62, 1,	$49,$12, 1,	$49,$72, 1,	$48,$2C, 2,	$43,$16, 16,	$4E,$41, 16,	$45,$D2, 4,	$50,$0F, 1,	$4A,$51, 1,	$54,$6B, 64,	$4D,$6E, 4,	$4F,$D1, 128,	$49,$26, 32,	$4F,$6E, 64,	$45,$EC, 1,	$4F,$D8, 8,	$4B,$B5, 8,	$45,$38, 64,	$45,$2C, 32,	$4A,$70, 4,	$4D,$CD, 1,	$4B,$AA, 8,	$4C,$8C, 64,	$4C,$72, 1,	$47,$AD, 8,	$50,$49, 4,	$40,$F4, 2,	$4C,$66, 4,	$41,$89, 2,	$4D,$A2, 128,	$54,$0A, 2,	$42,$66, 4,	$43,$D9, 32,	$57,$0C, 8,	$56,$67, 2,	$48,$F1, 4,	$40,$8B, 16,	$43,$79, 16,	$4E,$B2, 16,	$54,$15, 64,	$46,$D9, 8,	$56,$72, 128,	$43,$B7, 8,	$45,$F1, 1,	$4D,$F0, 2,	$53,$0B, 64,	$4D,$6E, 1,	$43,$E8, 1,	$52,$0B, 2,	$4B,$A9, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$48,$33, 64,	$4D,$72, 8,	$44,$A8, 64,	$4C,$34, 1,	$45,$CD, 1,	$55,$11, 128,	$4F,$67, 32,	$57,$75, 8,	$4D,$30, 4,	$44,$F2, 8,	$4C,$EC, 16,	$55,$0D, 8,	$4B,$98, 64,	$52,$0F, 32,	$4C,$2A, 32,	$4E,$71, 1,	$46,$B6, 8,	$50,$0D, 2,	$55,$72, 32,	$48,$B3, 1,	$4B,$CC, 16,	$57,$86, 128,	$44,$F1, 16,	$4B,$35, 1,	$45,$7E, 4,	$47,$6F, 16,	$45,$42, 8,	$48,$13, 128,	$49,$72, 1,	$4A,$6C, 128,	$48,$2C, 2,	$41,$16, 4,	$4E,$40, 2,	$44,$D2, 4,	$50,$0F, 1,	$4A,$51, 1,	$55,$6B, 128,	$4D,$6E, 4,	$4F,$D1, 128,	$48,$25, 4,	$4F,$6E, 128,	$44,$EC, 2,	$4F,$D8, 2,	$4C,$B5, 8,	$43,$38, 16,	$42,$2C, 64,	$4A,$70, 4,	$4E,$CD, 1,	$4B,$AA, 8,	$4C,$8C, 128,	$4B,$73, 128,	$46,$AD, 8,	$51,$49, 8,	$40,$F4, 2,	$4B,$66, 32,	$40,$89, 4,	$4E,$A1, 128,	$55,$0A, 4,	$40,$66, 16,	$41,$D9, 4,	$57,$0C, 8,	$50,$87, 4,	$49,$F1, 2,	$47,$6B, 32,	$40,$79, 2,	$4E,$B2, 8,	$54,$15, 32,	$45,$D9, 4,	$50,$92, 64,	$41,$B7, 2,	$45,$F1, 1,	$4E,$F0, 2,	$55,$0A, 1,	$4D,$6E, 1,	$42,$E8, 2,	$53,$0B, 4,	$4B,$A8, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$48,$33, 64,	$4D,$72, 8,	$42,$A7, 1,	$4C,$35, 128,	$45,$CD, 1,	$56,$11, 128,	$4F,$67, 64,	$51,$95, 4,	$4C,$30, 4,	$43,$F2, 4,	$4D,$EC, 32,	$56,$0D, 8,	$4B,$98, 32,	$52,$0F, 32,	$4C,$2A, 64,	$4E,$71, 1,	$46,$B6, 4,	$51,$0D, 2,	$4A,$10, 16,	$57,$72, 32,	$48,$B4, 128,	$4C,$CC, 32,	$51,$A5, 4,	$43,$F1, 8,	$4B,$36, 128,	$43,$7F, 32,	$46,$6F, 16,	$43,$41, 1,	$47,$F3, 128,	$49,$73, 128,	$4A,$6B, 1,	$4F,$0C, 4,	$4D,$40, 64,	$43,$D2, 2,	$51,$0F, 1,	$4A,$51, 1,	$57,$6A, 1,	$4C,$6E, 8,	$48,$F1, 128,	$4E,$04, 2,	$4F,$6E, 128,	$44,$EC, 2,	$48,$F9, 128,	$4C,$B5, 4,	$40,$38, 4,	$47,$0C, 128,	$4A,$70, 4,	$4E,$CD, 1,	$4B,$AA, 16,	$4C,$8C, 128,	$4B,$73, 128,	$45,$AD, 16,	$52,$49, 16,	$47,$D4, 1,	$4B,$65, 1,	$46,$69, 16,	$55,$0A, 8,	$46,$46, 64,	$47,$BA, 64,	$50,$2C, 8,	$51,$87, 16,	$49,$F1, 2,	$45,$6B, 64,	$46,$5A, 64,	$4F,$B2, 8,	$55,$15, 16,	$44,$D9, 1,	$51,$92, 64,	$40,$B7, 1,	$44,$F1, 1,	$4F,$F0, 1,	$56,$0A, 4,	$4D,$6E, 1,	$41,$E8, 8,	$53,$0B, 8,	$4C,$A8, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4F,$13, 32,	$4D,$72, 8,	$41,$A7, 4,	$4B,$35, 128,	$44,$CD, 1,	$57,$11, 128,	$4F,$66, 1,	$53,$95, 1,	$4C,$30, 4,	$42,$F2, 4,	$4E,$EC, 64,	$57,$0D, 16,	$4B,$98, 8,	$53,$0F, 64,	$4B,$2A, 128,	$4E,$72, 128,	$45,$B6, 2,	$52,$0D, 4,	$49,$10, 16,	$51,$92, 16,	$48,$B4, 64,	$4D,$CC, 128,	$55,$A5, 32,	$43,$F1, 8,	$4A,$36, 64,	$45,$6F, 16,	$40,$41, 16,	$46,$F3, 64,	$48,$73, 64,	$4A,$6B, 1,	$4F,$0C, 4,	$42,$D2, 2,	$52,$0F, 1,	$49,$52, 128,	$50,$8A, 2,	$4C,$6E, 8,	$48,$F1, 128,	$4B,$03, 1,	$4F,$6E, 128,	$43,$EC, 2,	$49,$F9, 16,	$4C,$B5, 2,	$46,$18, 1,	$44,$0B, 2,	$57,$12, 128,	$4A,$70, 4,	$4E,$CD, 2,	$4C,$AA, 32,	$4C,$8B, 1,	$4B,$73, 128,	$44,$AD, 16,	$53,$49, 32,	$47,$D4, 1,	$4B,$65, 16,	$45,$69, 32,	$56,$0A, 8,	$44,$45, 1,	$45,$BA, 4,	$50,$2C, 16,	$53,$87, 64,	$4A,$F1, 2,	$44,$6B, 128,	$43,$5A, 8,	$4F,$B2, 8,	$55,$15, 16,	$42,$DA, 32,	$53,$92, 64,	$47,$98, 64,	$44,$F1, 1,	$51,$10, 1,	$50,$2A, 16,	$4D,$6E, 1,	$40,$E8, 16,	$4B,$51, 8,	$54,$0B, 16,	$4C,$A8, 4,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4F,$13, 32,	$4D,$72, 4,	$47,$87, 16,	$4B,$35, 64,	$43,$CD, 2,	$57,$11, 128,	$4F,$66, 4,	$55,$96, 128,	$4B,$30, 4,	$41,$F2, 2,	$4E,$EC, 128,	$50,$2D, 16,	$4B,$98, 4,	$54,$0F, 64,	$4B,$29, 1,	$4E,$72, 128,	$43,$F3, 16,	$44,$B6, 1,	$53,$0D, 4,	$49,$10, 8,	$53,$92, 8,	$48,$B4, 64,	$4F,$CB, 2,	$50,$C4, 2,	$42,$F1, 8,	$4A,$36, 32,	$43,$6F, 32,	$44,$20, 2,	$45,$F3, 32,	$48,$73, 32,	$4A,$6B, 2,	$4E,$0C, 8,	$42,$D2, 1,	$53,$0F, 1,	$49,$52, 128,	$52,$8A, 4,	$4C,$6E, 16,	$48,$F1, 128,	$49,$02, 2,	$4F,$6E, 128,	$43,$EC, 4,	$4A,$F9, 4,	$4C,$B5, 1,	$43,$19, 64,	$41,$0B, 4,	$50,$32, 128,	$4A,$70, 4,	$4F,$CD, 2,	$4C,$AA, 32,	$4C,$8B, 2,	$4B,$73, 64,	$43,$AD, 16,	$54,$49, 64,	$46,$D5, 128,	$4B,$64, 1,	$43,$69, 64,	$57,$0A, 16,	$42,$45, 8,	$42,$BB, 64,	$51,$2C, 16,	$55,$86, 1,	$4A,$F1, 1,	$42,$6A, 1,	$40,$5A, 1,	$4F,$B2, 4,	$56,$15, 8,	$41,$DA, 8,	$54,$92, 32,	$45,$98, 16,	$43,$F1, 1,	$52,$10, 1,	$52,$2A, 64,	$4D,$6E, 2,	$47,$C8, 64,	$4B,$51, 8,	$55,$0B, 32,	$4C,$A8, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$13, 16,	$4D,$72, 4,	$45,$87, 64,	$4B,$35, 32,	$43,$CD, 2,	$50,$31, 64,	$4F,$66, 16,	$57,$96, 32,	$4B,$30, 4,	$40,$F2, 2,	$4F,$EB, 1,	$51,$2D, 32,	$4B,$98, 1,	$55,$0F, 64,	$4A,$29, 2,	$4E,$72, 128,	$43,$F3, 8,	$43,$B7, 128,	$54,$0D, 8,	$48,$10, 8,	$56,$92, 8,	$48,$B4, 32,	$48,$EB, 8,	$53,$C4, 32,	$42,$F1, 8,	$49,$36, 8,	$41,$6F, 32,	$41,$20, 64,	$44,$F3, 16,	$48,$73, 16,	$4A,$6B, 2,	$4E,$0C, 8,	$41,$D2, 1,	$54,$0F, 1,	$49,$52, 128,	$54,$8A, 16,	$4C,$6E, 32,	$49,$F1, 128,	$46,$E1, 16,	$4F,$6E, 128,	$42,$EC, 4,	$4B,$FA, 128,	$4C,$B6, 128,	$40,$19, 16,	$50,$32, 128,	$4A,$70, 2,	$4F,$CD, 2,	$4C,$AA, 64,	$4C,$8B, 2,	$4B,$73, 64,	$42,$AD, 32,	$55,$49, 128,	$46,$D5, 128,	$4B,$64, 32,	$50,$0C, 32,	$41,$68, 1,	$50,$2A, 32,	$40,$45, 32,	$47,$9B, 2,	$51,$2C, 32,	$57,$86, 4,	$4B,$F1, 1,	$40,$6A, 2,	$45,$3B, 16,	$4F,$B2, 4,	$56,$15, 4,	$40,$DA, 2,	$56,$92, 32,	$44,$98, 4,	$43,$F2, 128,	$53,$11, 128,	$4F,$2D, 1,	$54,$29, 1,	$4D,$6E, 2,	$46,$C7, 1,	$4B,$51, 8,	$57,$0B, 64,	$4D,$A8, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$13, 16,	$4D,$72, 4,	$43,$86, 2,	$4B,$35, 32,	$42,$CD, 2,	$51,$31, 64,	$4F,$66, 64,	$51,$B6, 16,	$4A,$30, 4,	$47,$D2, 1,	$50,$0B, 2,	$4B,$31, 16,	$52,$2D, 64,	$4B,$99, 64,	$56,$0F, 64,	$4A,$29, 8,	$4E,$72, 64,	$42,$F3, 8,	$42,$B7, 64,	$55,$0D, 16,	$48,$10, 8,	$50,$B2, 4,	$45,$ED, 4,	$49,$B4, 32,	$4A,$EB, 32,	$57,$C3, 2,	$41,$F1, 8,	$49,$36, 4,	$40,$6F, 32,	$43,$F3, 16,	$48,$73, 8,	$4A,$6B, 2,	$4D,$0C, 16,	$57,$13, 2,	$40,$D3, 128,	$55,$0F, 2,	$49,$52, 128,	$56,$8A, 32,	$4C,$6E, 64,	$49,$F1, 64,	$4F,$6D, 1,	$42,$EC, 4,	$4C,$FA, 16,	$4D,$B6, 128,	$51,$32, 128,	$4A,$70, 2,	$4F,$CD, 2,	$4C,$AA, 128,	$4C,$8B, 4,	$4B,$73, 32,	$41,$AD, 32,	$56,$48, 1,	$45,$D5, 64,	$4A,$63, 4,	$51,$0C, 32,	$47,$48, 2,	$51,$2A, 64,	$45,$24, 1,	$44,$9C, 16,	$52,$2C, 32,	$51,$A6, 16,	$4C,$F1, 1,	$47,$4A, 4,	$41,$3B, 1,	$48,$D2, 2,	$57,$15, 4,	$47,$BB, 128,	$50,$B2, 16,	$42,$98, 1,	$42,$F2, 128,	$55,$11, 128,	$4F,$2D, 1,	$57,$29, 8,	$4D,$6E, 2,	$45,$C7, 2,	$4B,$51, 8,	$50,$2B, 128,	$4D,$A8, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$13, 8,	$4D,$72, 2,	$41,$86, 8,	$4A,$35, 16,	$41,$CD, 2,	$51,$31, 64,	$4F,$65, 1,	$54,$B6, 4,	$49,$30, 4,	$46,$D2, 1,	$52,$0B, 4,	$4B,$31, 16,	$53,$2D, 64,	$4B,$99, 32,	$57,$0F, 64,	$49,$29, 16,	$4D,$72, 64,	$42,$F3, 4,	$41,$B7, 32,	$56,$0D, 16,	$48,$10, 8,	$53,$B2, 2,	$44,$ED, 4,	$49,$B4, 16,	$4C,$EA, 1,	$54,$E3, 64,	$40,$F1, 4,	$48,$36, 1,	$46,$4F, 32,	$42,$F3, 8,	$4F,$53, 4,	$4A,$6B, 4,	$4D,$0C, 16,	$57,$13, 2,	$47,$B3, 128,	$56,$0F, 2,	$49,$52, 64,	$50,$AA, 64,	$4B,$6E, 128,	$49,$F1, 64,	$4F,$6D, 1,	$41,$EC, 8,	$4D,$FA, 2,	$4D,$B6, 64,	$52,$32, 128,	$4A,$70, 2,	$48,$ED, 4,	$4C,$A9, 1,	$4D,$8B, 8,	$4B,$73, 32,	$40,$AD, 64,	$57,$48, 2,	$44,$D5, 32,	$4A,$63, 128,	$51,$0C, 32,	$45,$48, 8,	$52,$2A, 128,	$43,$24, 8,	$41,$9D, 32,	$52,$2C, 32,	$53,$A6, 64,	$4C,$F2, 128,	$45,$4A, 8,	$45,$1C, 16,	$48,$D2, 2,	$50,$35, 2,	$45,$BB, 16,	$52,$B2, 16,	$40,$99, 64,	$42,$F2, 128,	$57,$11, 128,	$4F,$2D, 2,	$51,$49, 64,	$4D,$6E, 2,	$44,$C7, 8,	$4B,$51, 4,	$51,$2A, 1,	$4D,$A7, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$13, 8,	$4D,$72, 2,	$46,$66, 64,	$4A,$35, 8,	$41,$CD, 4,	$52,$31, 64,	$4F,$65, 4,	$56,$B6, 1,	$49,$30, 2,	$45,$D3, 128,	$53,$0B, 8,	$4A,$31, 16,	$55,$2D, 128,	$4B,$99, 8,	$50,$2F, 64,	$49,$29, 32,	$4D,$72, 64,	$41,$F3, 4,	$40,$B7, 16,	$50,$2D, 32,	$47,$F0, 8,	$56,$B2, 1,	$44,$ED, 4,	$49,$B4, 8,	$4E,$EA, 8,	$40,$F1, 4,	$4F,$17, 128,	$44,$4F, 32,	$41,$F3, 4,	$4F,$53, 1,	$4A,$6B, 4,	$4D,$0C, 32,	$50,$33, 2,	$46,$B3, 64,	$57,$0F, 2,	$48,$52, 64,	$52,$A9, 1,	$4B,$6D, 1,	$4A,$F1, 64,	$4F,$6D, 1,	$41,$EC, 8,	$4E,$FB, 32,	$4D,$B6, 32,	$52,$32, 64,	$4A,$70, 2,	$48,$ED, 4,	$4D,$A9, 2,	$4D,$8B, 16,	$4B,$73, 32,	$47,$8D, 64,	$50,$68, 4,	$44,$D5, 32,	$4A,$62, 64,	$51,$0C, 64,	$43,$48, 16,	$53,$29, 1,	$40,$24, 64,	$45,$7E, 128,	$53,$2C, 64,	$55,$A5, 1,	$4D,$F2, 128,	$43,$4A, 16,	$41,$1D, 128,	$48,$D2, 1,	$50,$35, 1,	$4D,$EF, 1,	$44,$BB, 2,	$4C,$4C, 128,	$54,$B2, 8,	$46,$79, 16,	$41,$F2, 128,	$51,$31, 64,	$4F,$2D, 2,	$54,$48, 2,	$4D,$6E, 2,	$42,$C7, 32,	$4B,$51, 4,	$52,$2A, 2,	$4E,$A7, 4,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$13, 4,	$4D,$72, 2,	$44,$65, 2,	$4A,$35, 8,	$40,$CD, 4,	$53,$31, 64,	$4F,$65, 16,	$51,$D7, 128,	$48,$30, 2,	$44,$D3, 128,	$54,$0B, 16,	$4A,$31, 16,	$56,$2C, 1,	$4C,$99, 2,	$51,$2F, 64,	$48,$29, 64,	$4D,$72, 32,	$41,$F3, 4,	$47,$97, 8,	$51,$2D, 64,	$47,$F0, 8,	$51,$D3, 128,	$43,$ED, 4,	$48,$0B, 2,	$49,$B4, 8,	$50,$0A, 64,	$47,$D1, 4,	$4F,$17, 32,	$42,$4F, 32,	$40,$F3, 2,	$4F,$54, 128,	$4A,$6B, 8,	$4C,$0C, 32,	$50,$33, 1,	$45,$B3, 64,	$51,$2F, 2,	$48,$52, 64,	$54,$A9, 2,	$4B,$6D, 2,	$4A,$F1, 64,	$4F,$6D, 1,	$40,$EC, 8,	$4F,$FB, 2,	$4D,$B6, 16,	$53,$32, 64,	$4A,$70, 2,	$48,$ED, 4,	$4D,$A9, 2,	$4D,$8B, 16,	$4B,$73, 16,	$46,$8D, 128,	$51,$68, 16,	$43,$D5, 16,	$49,$61, 32,	$52,$0C, 64,	$41,$48, 64,	$54,$29, 4,	$45,$03, 2,	$40,$7F, 128,	$54,$2C, 64,	$57,$A5, 8,	$4E,$F2, 128,	$41,$4A, 64,	$49,$D2, 1,	$51,$35, 1,	$4E,$EF, 1,	$42,$BC, 64,	$4B,$4C, 128,	$56,$B2, 8,	$44,$79, 4,	$40,$F2, 64,	$53,$31, 64,	$4F,$2D, 2,	$50,$68, 32,	$4D,$6E, 2,	$41,$C7, 128,	$4A,$51, 4,	$53,$2A, 4,	$4E,$A7, 16,	$5B,$00, 0,	$5B,$00, 0
defb	$4C,$13, 4,	$4D,$72, 1,	$41,$65, 16,	$49,$35, 4,	$47,$AD, 4,	$54,$31, 64,	$4F,$65, 64,	$54,$D7, 16,	$4F,$10, 2,	$43,$D3, 64,	$55,$0B, 64,	$4A,$31, 16,	$57,$2C, 1,	$4C,$9A, 128,	$52,$2F, 128,	$4C,$D3, 64,	$48,$28, 1,	$4D,$72, 32,	$40,$F3, 2,	$45,$97, 2,	$53,$2D, 128,	$46,$F0, 8,	$55,$D3, 64,	$43,$ED, 8,	$48,$0B, 4,	$49,$B4, 4,	$53,$09, 8,	$46,$D1, 4,	$4F,$D4, 128,	$4E,$17, 8,	$40,$4F, 32,	$46,$D3, 1,	$4E,$54, 32,	$49,$6B, 8,	$4C,$0C, 64,	$51,$33, 1,	$44,$B3, 32,	$52,$2F, 2,	$48,$52, 64,	$57,$A9, 8,	$4A,$6D, 8,	$4B,$F1, 64,	$4F,$6D, 2,	$40,$EC, 16,	$51,$1C, 32,	$4E,$B6, 8,	$53,$32, 64,	$4A,$70, 2,	$49,$ED, 4,	$4D,$A9, 4,	$4D,$8B, 32,	$4B,$73, 16,	$44,$8D, 128,	$53,$68, 32,	$43,$D5, 16,	$49,$60, 32,	$52,$0C, 128,	$47,$27, 1,	$55,$29, 8,	$42,$03, 16,	$54,$2C, 128,	$52,$C5, 32,	$4E,$F2, 64,	$46,$2A, 128,	$49,$D3, 128,	$52,$36, 128,	$4E,$EF, 1,	$40,$BC, 8,	$4B,$4B, 1,	$50,$D2, 4,	$42,$7A, 128,	$40,$F2, 64,	$55,$31, 32,	$4E,$2D, 2,	$53,$67, 2,	$4D,$6E, 2,	$40,$C6, 2,	$4A,$51, 4,	$55,$2A, 16,	$4E,$A7, 64,	$5B,$00, 0
defb	$4B,$13, 2,	$4D,$72, 1,	$46,$44, 1,	$49,$35, 2,	$4E,$6B, 2,	$46,$AD, 4,	$55,$31, 32,	$4F,$64, 2,	$57,$D7, 4,	$4E,$10, 2,	$42,$D3, 32,	$57,$0B, 128,	$4A,$31, 16,	$51,$4C, 2,	$4C,$9A, 32,	$53,$2F, 128,	$4D,$D3, 64,	$4F,$08, 2,	$4D,$72, 32,	$40,$F3, 2,	$44,$97, 1,	$54,$2C, 1,	$46,$F0, 8,	$51,$F3, 32,	$42,$ED, 8,	$47,$EB, 4,	$4A,$B4, 2,	$57,$08, 1,	$46,$D1, 4,	$48,$F4, 128,	$4D,$17, 4,	$46,$2F, 64,	$45,$D4, 64,	$4E,$54, 16,	$49,$6B, 16,	$4B,$0C, 64,	$52,$34, 128,	$42,$B3, 32,	$53,$2F, 2,	$48,$52, 32,	$52,$C9, 16,	$4A,$6D, 32,	$4B,$F1, 64,	$4F,$6D, 2,	$47,$CC, 16,	$52,$1C, 1,	$4C,$31, 8,	$4E,$B6, 4,	$54,$32, 64,	$4A,$70, 2,	$49,$ED, 8,	$4D,$A9, 8,	$4D,$8B, 64,	$4B,$73, 8,	$43,$8C, 1,	$54,$68, 64,	$42,$D5, 8,	$53,$0C, 128,	$44,$27, 4,	$56,$29, 16,	$55,$2C, 128,	$55,$C4, 1,	$4F,$F2, 64,	$44,$29, 1,	$4A,$D3, 128,	$52,$36, 64,	$4F,$EF, 1,	$47,$9C, 1,	$4B,$4B, 1,	$53,$D2, 2,	$40,$7A, 32,	$47,$D2, 64,	$50,$51, 32,	$4E,$2D, 4,	$50,$87, 64,	$4D,$6E, 4,	$46,$A6, 16,	$4A,$51, 4,	$56,$2A, 32,	$4F,$A6, 1,	$5B,$00, 0
defb	$4B,$13, 1,	$4D,$73, 128,	$43,$44, 16,	$48,$35, 1,	$4E,$6B, 2,	$46,$AD, 8,	$56,$31, 32,	$4F,$64, 16,	$52,$F7, 1,	$4D,$10, 1,	$41,$D3, 16,	$50,$2A, 2,	$49,$31, 8,	$53,$4C, 4,	$4C,$9A, 4,	$54,$2F, 128,	$4D,$D3, 64,	$4E,$08, 8,	$4D,$72, 16,	$47,$D3, 1,	$43,$98, 128,	$56,$2C, 2,	$45,$F0, 8,	$55,$F3, 16,	$42,$ED, 8,	$47,$EB, 4,	$4A,$B4, 1,	$53,$28, 64,	$45,$D1, 2,	$48,$F4, 64,	$4C,$17, 1,	$44,$2F, 64,	$43,$D4, 32,	$4D,$54, 4,	$49,$6B, 16,	$4A,$0C, 128,	$52,$34, 128,	$41,$B3, 16,	$55,$2F, 2,	$4F,$32, 32,	$54,$C9, 64,	$49,$6D, 128,	$4B,$F1, 64,	$4F,$6D, 2,	$47,$CC, 32,	$54,$1D, 8,	$4C,$31, 8,	$4E,$B6, 2,	$54,$32, 32,	$49,$70, 2,	$4A,$ED, 8,	$4E,$A9, 16,	$4D,$8B, 128,	$4B,$73, 8,	$42,$8C, 1,	$55,$67, 1,	$41,$D5, 4,	$53,$0B, 1,	$41,$27, 16,	$57,$29, 32,	$56,$2B, 1,	$50,$E4, 8,	$50,$12, 32,	$41,$29, 4,	$4A,$D3, 64,	$53,$36, 32,	$4F,$EF, 1,	$45,$9D, 32,	$4B,$4B, 2,	$55,$D2, 2,	$45,$5A, 4,	$47,$D2, 64,	$53,$51, 16,	$4E,$2D, 4,	$55,$86, 16,	$4D,$6E, 4,	$45,$A6, 64,	$4A,$51, 4,	$50,$4A, 128,	$4F,$A6, 4,	$5B,$00, 0
defb	$4A,$13, 1,	$4C,$73, 128,	$47,$23, 1,	$48,$36, 128,	$4E,$6B, 4,	$45,$AD, 8,	$57,$31, 32,	$4F,$64, 128,	$56,$F8, 32,	$4C,$10, 1,	$40,$D3, 16,	$52,$2A, 4,	$49,$31, 8,	$54,$4C, 8,	$4C,$9A, 1,	$55,$2F, 128,	$4D,$D3, 32,	$4E,$08, 16,	$4D,$72, 16,	$46,$D3, 1,	$42,$98, 32,	$50,$4C, 4,	$45,$F0, 8,	$41,$ED, 16,	$46,$EB, 8,	$4A,$B5, 128,	$51,$47, 64,	$44,$D1, 2,	$48,$F4, 64,	$4C,$18, 64,	$41,$2F, 64,	$41,$D4, 16,	$4D,$54, 1,	$49,$6B, 32,	$4A,$0C, 128,	$53,$34, 128,	$40,$B3, 16,	$56,$2F, 2,	$4F,$32, 32,	$57,$C8, 1,	$48,$6C, 4,	$4C,$F1, 32,	$4F,$6D, 4,	$46,$CC, 32,	$56,$1E, 64,	$4B,$31, 8,	$4F,$B6, 1,	$55,$32, 32,	$49,$70, 2,	$4A,$ED, 8,	$4E,$A9, 32,	$4D,$8A, 1,	$4B,$73, 4,	$40,$8C, 2,	$57,$67, 2,	$40,$D5, 4,	$54,$0B, 1,	$47,$07, 128,	$50,$49, 128,	$56,$2B, 1,	$53,$E4, 64,	$51,$12, 32,	$47,$09, 8,	$4B,$D3, 32,	$54,$36, 16,	$4F,$EF, 1,	$43,$9D, 2,	$4B,$4B, 2,	$50,$F2, 1,	$43,$5B, 128,	$46,$D2, 32,	$56,$51, 8,	$4E,$2D, 4,	$53,$A5, 4,	$4D,$6E, 4,	$43,$A5, 2,	$4A,$51, 2,	$52,$49, 2,	$48,$C6, 16,	$5B,$00, 0,	$5B,$00, 0
defb	$49,$14, 128,	$4C,$73, 64,	$43,$23, 32,	$48,$36, 128,	$4E,$6B, 4,	$44,$AD, 8,	$50,$51, 32,	$4F,$63, 4,	$4B,$10, 1,	$46,$B3, 8,	$54,$2A, 16,	$49,$31, 8,	$56,$4C, 16,	$4C,$9B, 64,	$57,$2F, 128,	$4D,$D3, 32,	$4D,$08, 64,	$4D,$72, 8,	$46,$D3, 1,	$40,$98, 16,	$53,$4C, 8,	$44,$F0, 8,	$54,$0F, 128,	$41,$ED, 16,	$46,$EB, 8,	$4A,$B5, 64,	$50,$65, 2,	$43,$D1, 2,	$49,$F4, 64,	$4B,$18, 8,	$47,$0F, 64,	$4B,$D1, 1,	$47,$B4, 4,	$4C,$55, 32,	$49,$6B, 32,	$49,$0B, 1,	$53,$34, 64,	$47,$93, 8,	$50,$4F, 2,	$4F,$32, 16,	$53,$E8, 4,	$4F,$4C, 64,	$4C,$F1, 32,	$4F,$6D, 4,	$45,$CC, 64,	$50,$3E, 1,	$4B,$31, 4,	$4F,$B7, 128,	$56,$32, 32,	$49,$70, 2,	$4B,$ED, 16,	$4E,$A9, 64,	$4D,$8A, 2,	$4A,$73, 4,	$47,$6C, 2,	$50,$87, 8,	$40,$D5, 2,	$54,$0B, 1,	$43,$06, 2,	$52,$48, 1,	$57,$2B, 2,	$56,$E3, 4,	$52,$12, 16,	$44,$09, 32,	$4B,$D3, 32,	$54,$36, 8,	$50,$0F, 1,	$40,$9E, 32,	$4B,$4B, 4,	$53,$F3, 128,	$40,$5B, 16,	$45,$D2, 32,	$52,$71, 4,	$4D,$2D, 4,	$52,$C4, 4,	$4D,$6E, 4,	$41,$A5, 16,	$4A,$51, 2,	$54,$49, 4,	$48,$C6, 64,	$5B,$00, 0
defb	$49,$14, 64,	$4C,$73, 64,	$47,$02, 4,	$4F,$16, 64,	$4E,$6B, 8,	$43,$AD, 16,	$51,$51, 16,	$4F,$63, 32,	$4A,$11, 128,	$45,$B3, 4,	$56,$2A, 64,	$48,$31, 8,	$50,$6C, 32,	$4C,$9B, 8,	$50,$4E, 1,	$4E,$D3, 16,	$4C,$07, 1,	$4D,$72, 8,	$45,$D4, 128,	$47,$78, 4,	$55,$4C, 16,	$44,$F0, 8,	$55,$0E, 1,	$40,$ED, 16,	$45,$EB, 16,	$4A,$B5, 32,	$52,$84, 128,	$43,$D1, 2,	$49,$F4, 32,	$4A,$18, 2,	$44,$0F, 64,	$4B,$D1, 1,	$45,$B4, 2,	$4B,$55, 8,	$49,$6B, 64,	$49,$0B, 2,	$54,$34, 64,	$45,$93, 4,	$52,$4F, 2,	$4E,$32, 16,	$56,$E8, 16,	$4E,$4B, 8,	$4D,$F1, 32,	$4B,$6E, 64,	$4F,$6D, 4,	$45,$CC, 64,	$52,$3F, 2,	$4B,$31, 4,	$4F,$B7, 32,	$56,$32, 32,	$49,$70, 1,	$4B,$ED, 16,	$4F,$A9, 128,	$4E,$8A, 4,	$4A,$73, 2,	$45,$6C, 4,	$52,$87, 16,	$47,$B5, 1,	$55,$0B, 2,	$40,$06, 16,	$4A,$8D, 16,	$53,$48, 4,	$50,$4B, 2,	$53,$12, 16,	$41,$09, 128,	$4C,$D3, 16,	$55,$36, 4,	$50,$0F, 1,	$46,$7E, 1,	$4A,$4B, 4,	$56,$F3, 64,	$45,$3B, 1,	$45,$D2, 32,	$56,$71, 2,	$4D,$2D, 8,	$53,$E3, 16,	$4D,$6E, 4,	$47,$85, 128,	$49,$51, 2,	$56,$49, 16,	$49,$C5, 2
defb	$48,$14, 32,	$4C,$73, 64,	$42,$01, 1,	$4F,$16, 32,	$4E,$6B, 8,	$42,$AD, 16,	$52,$51, 16,	$4F,$62, 1,	$48,$11, 128,	$43,$B3, 2,	$50,$49, 1,	$48,$31, 8,	$53,$6C, 64,	$4C,$9B, 1,	$52,$4E, 1,	$4E,$D3, 16,	$4B,$07, 4,	$4D,$72, 4,	$45,$D4, 128,	$45,$78, 2,	$50,$6C, 64,	$43,$F0, 8,	$55,$0E, 1,	$40,$ED, 16,	$45,$EB, 16,	$4B,$B5, 32,	$50,$C1, 8,	$42,$D1, 1,	$49,$F4, 32,	$48,$19, 64,	$41,$0F, 128,	$4B,$D1, 1,	$43,$B5, 128,	$4A,$55, 1,	$49,$6B, 128,	$48,$0B, 2,	$55,$34, 32,	$44,$93, 2,	$54,$4F, 2,	$4E,$32, 16,	$4C,$4A, 4,	$4D,$F1, 32,	$4B,$6E, 64,	$4F,$6D, 4,	$44,$CC, 128,	$4B,$31, 4,	$48,$D7, 16,	$57,$32, 16,	$49,$70, 1,	$4C,$ED, 16,	$4F,$A8, 1,	$4E,$8A, 8,	$4A,$73, 2,	$44,$6C, 4,	$54,$87, 64,	$46,$B6, 128,	$55,$0B, 2,	$4A,$8D, 16,	$54,$48, 8,	$51,$4B, 4,	$54,$12, 8,	$4C,$D3, 8,	$56,$36, 2,	$51,$0F, 1,	$44,$7F, 16,	$4A,$4B, 8,	$42,$3C, 32,	$44,$D2, 32,	$53,$91, 1,	$4D,$2D, 8,	$4C,$6E, 4,	$45,$84, 4,	$49,$51, 2,	$50,$69, 128,	$49,$C5, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$47,$F4, 32,	$4C,$73, 32,	$4E,$16, 16,	$4E,$6B, 16,	$41,$AD, 16,	$53,$51, 16,	$4F,$62, 16,	$47,$F1, 128,	$42,$B3, 1,	$52,$49, 8,	$48,$31, 8,	$55,$6C, 128,	$4D,$9C, 32,	$53,$4E, 1,	$4E,$D3, 16,	$4A,$07, 16,	$4D,$72, 4,	$44,$D4, 64,	$44,$79, 128,	$53,$6C, 128,	$43,$F0, 8,	$56,$0E, 1,	$47,$CD, 32,	$45,$EB, 32,	$4B,$B5, 8,	$41,$D1, 1,	$4A,$F4, 16,	$47,$F9, 16,	$4B,$D2, 128,	$41,$B5, 32,	$49,$56, 16,	$49,$6B, 128,	$47,$EB, 4,	$55,$34, 32,	$42,$93, 2,	$56,$4F, 2,	$4E,$32, 8,	$49,$49, 32,	$4E,$F1, 32,	$4B,$6E, 64,	$4F,$6D, 8,	$43,$CC, 128,	$4A,$31, 4,	$48,$D7, 8,	$50,$52, 16,	$49,$70, 1,	$4C,$ED, 32,	$4F,$A8, 4,	$4E,$8A, 32,	$4A,$73, 1,	$42,$6C, 8,	$55,$86, 1,	$45,$B6, 128,	$56,$0B, 4,	$4A,$8D, 16,	$56,$48, 32,	$51,$4B, 4,	$55,$12, 4,	$4D,$D3, 8,	$57,$36, 1,	$51,$0F, 1,	$4A,$4B, 8,	$46,$1C, 2,	$43,$D2, 16,	$51,$B2, 128,	$4D,$2D, 8,	$4C,$6E, 8,	$42,$84, 64,	$49,$51, 1,	$52,$68, 2,	$4A,$C5, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$46,$F4, 16,	$4C,$73, 16,	$4E,$16, 8,	$4E,$6B, 16,	$40,$AD, 32,	$54,$51, 16,	$4F,$61, 1,	$45,$F1, 64,	$40,$B4, 128,	$55,$49, 32,	$4F,$11, 4,	$57,$6B, 2,	$4D,$9C, 4,	$55,$4E, 2,	$4F,$D3, 8,	$4A,$07, 64,	$4D,$72, 2,	$43,$D4, 64,	$42,$79, 32,	$56,$6B, 2,	$42,$F0, 8,	$56,$0E, 1,	$47,$CD, 32,	$44,$EB, 32,	$4B,$B5, 4,	$40,$D1, 1,	$4A,$F4, 16,	$46,$F9, 2,	$4C,$D2, 128,	$46,$95, 8,	$48,$56, 1,	$49,$6A, 1,	$47,$EB, 8,	$56,$34, 16,	$45,$F2, 16,	$41,$93, 1,	$50,$6F, 2,	$4D,$32, 8,	$4C,$27, 64,	$4E,$F1, 16,	$4B,$6E, 64,	$4F,$6D, 8,	$42,$CB, 1,	$4A,$31, 4,	$48,$D7, 4,	$51,$52, 16,	$49,$70, 1,	$4D,$ED, 32,	$4F,$A8, 8,	$4E,$8A, 64,	$4A,$74, 128,	$40,$6C, 16,	$57,$86, 4,	$45,$B6, 64,	$57,$0B, 4,	$4A,$8D, 16,	$57,$48, 128,	$52,$4B, 8,	$56,$12, 4,	$4D,$D3, 4,	$50,$57, 128,	$52,$0F, 1,	$4A,$4B, 16,	$43,$1D, 16,	$42,$D2, 16,	$50,$D2, 32,	$4C,$2D, 8,	$4C,$6E, 8,	$52,$12, 8,	$40,$83, 4,	$49,$51, 1,	$55,$68, 8,	$4B,$C4, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$46,$F4, 8,	$4C,$73, 16,	$4D,$16, 4,	$4E,$6B, 32,	$47,$8D, 32,	$55,$51, 8,	$4F,$61, 16,	$43,$F1, 64,	$46,$94, 64,	$50,$68, 1,	$4F,$11, 4,	$52,$8B, 4,	$4D,$9D, 64,	$57,$4E, 2,	$4F,$D3, 8,	$49,$06, 1,	$4D,$72, 2,	$43,$D4, 32,	$40,$79, 8,	$52,$8B, 8,	$42,$F0, 8,	$57,$0E, 1,	$46,$CD, 32,	$44,$EB, 64,	$4C,$B5, 2,	$47,$B2, 128,	$4A,$F4, 8,	$45,$FA, 64,	$4C,$D2, 128,	$43,$95, 2,	$4F,$37, 16,	$49,$6A, 2,	$46,$EB, 16,	$57,$34, 16,	$45,$F2, 16,	$47,$74, 128,	$53,$6F, 2,	$4D,$32, 4,	$4A,$02, 2,	$4F,$F1, 16,	$4B,$6E, 64,	$4F,$6D, 8,	$42,$CB, 1,	$4A,$31, 2,	$49,$D7, 1,	$51,$52, 8,	$49,$70, 1,	$4D,$ED, 64,	$48,$C8, 16,	$4E,$8A, 128,	$4A,$74, 128,	$47,$4C, 32,	$51,$A6, 16,	$44,$B6, 32,	$57,$0B, 8,	$4A,$8D, 32,	$51,$67, 2,	$53,$4B, 8,	$50,$32, 2,	$4E,$D3, 2,	$51,$57, 64,	$52,$0F, 1,	$4A,$4B, 16,	$42,$D2, 16,	$51,$F2, 8,	$4C,$2D, 16,	$4C,$6E, 8,	$53,$12, 8,	$45,$63, 64,	$48,$51, 1,	$50,$88, 64,	$4B,$C4, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$45,$F4, 4,	$4C,$73, 8,	$4D,$16, 2,	$4E,$6B, 32,	$46,$8D, 64,	$56,$51, 8,	$4F,$60, 2,	$41,$F1, 32,	$44,$94, 32,	$53,$68, 8,	$4F,$11, 4,	$55,$8B, 16,	$4D,$9D, 8,	$51,$6E, 2,	$4F,$D3, 8,	$47,$E6, 8,	$4D,$72, 1,	$42,$D4, 32,	$49,$0D, 128,	$47,$59, 2,	$56,$8B, 32,	$41,$F0, 4,	$57,$0E, 1,	$45,$CD, 64,	$43,$EB, 64,	$4C,$B5, 1,	$46,$B2, 128,	$4B,$F4, 8,	$43,$FA, 4,	$4C,$D2, 128,	$40,$96, 64,	$4E,$38, 64,	$48,$6A, 2,	$45,$EB, 16,	$57,$34, 8,	$44,$F2, 16,	$45,$74, 64,	$56,$6F, 2,	$4D,$32, 4,	$50,$11, 16,	$4B,$6E, 128,	$4F,$6D, 16,	$41,$CB, 2,	$4A,$31, 2,	$49,$D8, 128,	$52,$52, 8,	$49,$70, 1,	$4E,$ED, 64,	$48,$C8, 32,	$4E,$89, 2,	$4A,$74, 64,	$45,$4C, 32,	$53,$A6, 64,	$43,$B6, 16,	$50,$2B, 8,	$4A,$8D, 32,	$53,$67, 8,	$54,$4B, 16,	$51,$32, 1,	$4E,$D3, 1,	$52,$57, 32,	$53,$0F, 1,	$4A,$4B, 32,	$41,$D2, 8,	$4C,$2D, 16,	$4C,$6E, 8,	$53,$12, 4,	$42,$62, 4,	$48,$51, 1,	$53,$87, 2,	$4C,$C3, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$44,$F4, 2,	$4C,$73, 8,	$4C,$16, 1,	$4E,$6B, 64,	$45,$8D, 64,	$50,$71, 8,	$4F,$60, 64,	$47,$D1, 16,	$42,$94, 16,	$56,$68, 128,	$4E,$11, 4,	$51,$AB, 32,	$4D,$9E, 128,	$53,$6E, 4,	$48,$F3, 4,	$46,$E6, 32,	$4D,$72, 1,	$41,$D4, 16,	$48,$0D, 128,	$45,$5A, 128,	$52,$AA, 1,	$40,$F0, 4,	$50,$2E, 1,	$45,$CD, 64,	$42,$EB, 128,	$4C,$B6, 128,	$4C,$8F, 64,	$45,$B2, 128,	$4B,$F4, 4,	$42,$FB, 64,	$4C,$D2, 64,	$44,$76, 16,	$4C,$38, 1,	$48,$6A, 4,	$44,$EB, 32,	$50,$54, 4,	$44,$F2, 16,	$43,$74, 32,	$51,$8F, 2,	$4C,$32, 4,	$4F,$6F, 4,	$50,$11, 16,	$4B,$6E, 128,	$4F,$6D, 16,	$40,$CB, 2,	$49,$31, 2,	$49,$D8, 32,	$53,$52, 8,	$48,$70, 1,	$4E,$ED, 128,	$49,$C8, 128,	$4F,$89, 4,	$4A,$74, 32,	$43,$4C, 64,	$55,$A5, 1,	$42,$B6, 8,	$50,$2B, 16,	$4A,$8D, 32,	$55,$67, 32,	$55,$4B, 32,	$52,$33, 128,	$4F,$D4, 128,	$53,$57, 16,	$53,$0F, 1,	$49,$4B, 32,	$40,$D2, 8,	$4B,$2D, 16,	$4C,$6E, 8,	$54,$12, 4,	$47,$41, 1,	$48,$51, 1,	$56,$87, 32,	$4D,$C3, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$43,$F4, 1,	$4C,$73, 4,	$4C,$17, 64,	$4E,$6B, 64,	$44,$8D, 128,	$51,$71, 8,	$44,$D1, 16,	$40,$94, 8,	$53,$87, 8,	$4E,$11, 4,	$54,$AB, 128,	$4E,$9E, 8,	$55,$6E, 4,	$48,$F3, 4,	$45,$E5, 1,	$4D,$73, 128,	$41,$D4, 8,	$48,$0C, 1,	$43,$5A, 32,	$50,$CA, 8,	$40,$F0, 4,	$50,$2E, 1,	$44,$CD, 64,	$42,$EA, 1,	$4D,$B6, 64,	$4C,$8F, 128,	$44,$B2, 64,	$4B,$F4, 4,	$40,$FB, 4,	$4D,$D2, 64,	$40,$76, 1,	$4A,$39, 1,	$48,$6A, 8,	$44,$EB, 64,	$51,$54, 4,	$43,$F2, 8,	$41,$74, 16,	$54,$8F, 2,	$4C,$32, 2,	$4F,$6F, 4,	$51,$11, 16,	$4B,$6E, 128,	$4F,$6D, 32,	$47,$AB, 4,	$49,$31, 2,	$4A,$D8, 8,	$54,$52, 4,	$48,$70, 1,	$4F,$ED, 128,	$49,$C7, 1,	$4F,$89, 16,	$4A,$74, 32,	$41,$4C, 128,	$50,$C5, 4,	$41,$B6, 4,	$51,$2B, 32,	$4A,$8D, 64,	$57,$67, 128,	$56,$4B, 32,	$54,$33, 128,	$48,$F4, 64,	$54,$57, 8,	$54,$0F, 1,	$49,$4B, 64,	$47,$B2, 4,	$4B,$2D, 32,	$4C,$6E, 16,	$54,$12, 4,	$43,$41, 32,	$48,$52, 128,	$54,$0E, 16,	$52,$A6, 1,	$4E,$C3, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$42,$F5, 128,	$4C,$73, 2,	$4B,$17, 32,	$4E,$6B, 128,	$43,$8D, 128,	$53,$71, 4,	$41,$D1, 8,	$46,$74, 2,	$57,$86, 1,	$4D,$11, 2,	$50,$CA, 2,	$4E,$9F, 64,	$50,$8E, 4,	$48,$F3, 2,	$44,$E5, 8,	$4D,$73, 64,	$40,$D4, 8,	$47,$EC, 1,	$41,$5A, 8,	$56,$CA, 64,	$47,$D0, 4,	$51,$2E, 1,	$43,$CD, 128,	$41,$EA, 1,	$4D,$B6, 16,	$4C,$8F, 128,	$43,$B2, 64,	$4C,$F4, 2,	$46,$DC, 64,	$4D,$D2, 64,	$43,$57, 32,	$4F,$1B, 64,	$48,$6A, 8,	$43,$EB, 128,	$52,$54, 2,	$43,$F2, 8,	$47,$54, 8,	$50,$AF, 2,	$4C,$32, 2,	$4F,$6F, 4,	$51,$11, 8,	$4B,$6E, 128,	$4F,$6D, 32,	$46,$AB, 4,	$49,$31, 2,	$4A,$D8, 4,	$55,$52, 4,	$48,$71, 128,	$50,$0D, 128,	$49,$C7, 4,	$4F,$89, 64,	$4A,$74, 16,	$46,$2B, 1,	$52,$C5, 32,	$40,$B6, 2,	$52,$2B, 32,	$4A,$8D, 64,	$51,$86, 4,	$57,$4B, 64,	$56,$33, 64,	$49,$F4, 32,	$55,$57, 4,	$54,$0F, 1,	$49,$4B, 64,	$46,$B2, 4,	$4B,$2D, 32,	$4C,$6E, 16,	$55,$12, 2,	$40,$40, 8,	$4F,$32, 128,	$54,$0E, 16,	$56,$A6, 16,	$4E,$C2, 16,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$41,$F5, 64,	$4C,$73, 2,	$4A,$17, 16,	$4E,$6B, 128,	$42,$8D, 128,	$54,$71, 4,	$46,$B1, 4,	$43,$74, 1,	$55,$A6, 32,	$4D,$11, 2,	$55,$CA, 16,	$4E,$9F, 2,	$53,$8E, 8,	$49,$F3, 2,	$42,$E5, 64,	$4C,$73, 64,	$47,$B4, 4,	$47,$EC, 1,	$46,$3A, 2,	$55,$E9, 4,	$46,$D0, 4,	$51,$2E, 2,	$43,$CD, 128,	$41,$EA, 2,	$4D,$B6, 8,	$4D,$8F, 128,	$42,$B2, 64,	$4C,$F4, 1,	$44,$DC, 2,	$4D,$D2, 64,	$46,$37, 2,	$4C,$1C, 4,	$48,$6A, 16,	$42,$EA, 1,	$52,$54, 2,	$42,$F2, 8,	$45,$54, 4,	$54,$AF, 4,	$4B,$32, 1,	$4F,$6F, 4,	$52,$11, 8,	$4B,$6E, 128,	$4F,$6D, 32,	$46,$AB, 8,	$4D,$F1, 4,	$48,$31, 1,	$4B,$D8, 1,	$56,$52, 4,	$48,$71, 128,	$50,$0C, 1,	$4A,$C7, 8,	$4F,$89, 128,	$49,$74, 8,	$44,$2B, 2,	$55,$C4, 1,	$47,$96, 1,	$52,$2B, 64,	$4A,$8D, 64,	$54,$86, 32,	$4B,$52, 4,	$50,$6B, 128,	$57,$33, 32,	$4A,$F4, 16,	$56,$57, 1,	$55,$0F, 1,	$49,$4B, 128,	$45,$B2, 4,	$4A,$2D, 32,	$4C,$6E, 16,	$55,$12, 2,	$4F,$32, 128,	$55,$0E, 16,	$53,$C5, 2,	$48,$E1, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$40,$F5, 16,	$4C,$73, 1,	$4A,$17, 8,	$4E,$6A, 1,	$40,$8C, 1,	$56,$71, 2,	$42,$B1, 2,	$40,$75, 64,	$53,$C5, 16,	$4D,$11, 2,	$52,$EA, 64,	$56,$8E, 8,	$49,$F3, 1,	$41,$E4, 4,	$4C,$73, 32,	$46,$B4, 4,	$47,$EC, 2,	$44,$3B, 64,	$46,$D0, 4,	$52,$2E, 2,	$42,$CD, 128,	$40,$EA, 4,	$4E,$B6, 2,	$4D,$8F, 128,	$41,$B2, 32,	$4D,$F4, 1,	$42,$DD, 8,	$4E,$D2, 32,	$40,$38, 16,	$47,$FE, 2,	$48,$6A, 32,	$41,$EA, 2,	$53,$54, 1,	$42,$F2, 8,	$43,$54, 2,	$50,$CF, 4,	$4B,$32, 1,	$4F,$6F, 4,	$53,$11, 8,	$4B,$6D, 1,	$4F,$6D, 64,	$45,$AB, 16,	$4D,$F1, 4,	$48,$31, 1,	$4B,$D9, 64,	$57,$52, 2,	$48,$71, 128,	$51,$0C, 1,	$4A,$C7, 32,	$48,$A8, 2,	$49,$74, 4,	$41,$2B, 4,	$57,$C4, 4,	$46,$97, 128,	$4E,$6D, 64,	$53,$2B, 64,	$4A,$8D, 128,	$56,$85, 1,	$4A,$52, 2,	$51,$6B, 128,	$51,$53, 16,	$4A,$F4, 8,	$57,$58, 128,	$56,$0F, 1,	$48,$4A, 1,	$44,$B2, 2,	$4A,$2D, 64,	$4A,$AE, 8,	$4C,$6E, 16,	$56,$12, 2,	$4F,$32, 64,	$55,$0E, 32,	$51,$E5, 64,	$49,$E1, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$46,$D5, 8,	$4C,$74, 128,	$49,$17, 2,	$4E,$6A, 2,	$47,$6C, 1,	$50,$91, 2,	$45,$91, 1,	$45,$55, 16,	$52,$E4, 8,	$4C,$11, 2,	$51,$AE, 16,	$49,$F3, 1,	$47,$C4, 64,	$4C,$73, 16,	$45,$B4, 2,	$46,$EC, 2,	$41,$3B, 8,	$45,$D0, 4,	$53,$2E, 2,	$41,$CC, 1,	$40,$EA, 4,	$4E,$B7, 128,	$4D,$8F, 128,	$47,$92, 32,	$4D,$F5, 128,	$47,$BE, 32,	$4B,$34, 8,	$4E,$D2, 32,	$41,$19, 128,	$48,$6A, 64,	$40,$EA, 4,	$54,$55, 128,	$41,$F2, 4,	$4C,$6B, 32,	$40,$55, 128,	$56,$CF, 4,	$4A,$33, 128,	$4F,$6F, 4,	$53,$11, 8,	$4B,$6D, 1,	$4F,$6D, 64,	$44,$AB, 16,	$4E,$F1, 2,	$4F,$11, 1,	$4C,$D9, 16,	$50,$72, 2,	$48,$71, 128,	$52,$0C, 2,	$4B,$C7, 128,	$48,$A8, 16,	$49,$74, 2,	$47,$0B, 8,	$52,$E4, 64,	$45,$97, 64,	$4E,$6D, 128,	$54,$2B, 128,	$4A,$8D, 128,	$51,$A5, 8,	$4A,$52, 2,	$52,$6A, 1,	$53,$53, 4,	$4B,$F4, 2,	$50,$78, 32,	$56,$0F, 1,	$48,$4A, 1,	$43,$B2, 2,	$4A,$2D, 64,	$4B,$AE, 16,	$4C,$6E, 16,	$56,$12, 1,	$4F,$32, 64,	$56,$0E, 32,	$57,$E4, 16,	$4A,$E0, 8,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$45,$D5, 4,	$4B,$74, 128,	$48,$17, 1,	$4E,$6A, 2,	$46,$6C, 2,	$51,$91, 2,	$40,$92, 64,	$42,$55, 4,	$4C,$11, 1,	$54,$AE, 16,	$4A,$F4, 128,	$46,$C3, 4,	$4C,$73, 8,	$44,$B4, 1,	$46,$EC, 2,	$47,$1B, 1,	$44,$D0, 4,	$53,$2E, 2,	$40,$CC, 1,	$47,$CA, 8,	$4F,$B7, 64,	$4D,$8F, 128,	$46,$92, 16,	$4E,$F5, 128,	$44,$BF, 128,	$4B,$34, 4,	$4E,$D2, 32,	$48,$6A, 128,	$47,$CA, 8,	$55,$55, 128,	$41,$F2, 4,	$4C,$6B, 64,	$45,$35, 64,	$54,$EF, 4,	$4A,$33, 128,	$4F,$6F, 4,	$54,$11, 4,	$4B,$6D, 1,	$4F,$6D, 128,	$43,$AB, 32,	$4E,$F1, 2,	$4F,$11, 1,	$4C,$D9, 4,	$51,$72, 1,	$4F,$51, 128,	$52,$0C, 4,	$4B,$C6, 2,	$48,$A8, 64,	$49,$74, 1,	$44,$0B, 16,	$55,$E3, 2,	$44,$97, 32,	$4E,$6D, 128,	$55,$2A, 1,	$4A,$8D, 128,	$54,$A5, 64,	$4A,$52, 2,	$53,$6A, 2,	$56,$53, 2,	$4C,$F4, 1,	$52,$78, 16,	$57,$0F, 1,	$48,$4A, 2,	$42,$B2, 1,	$49,$2D, 128,	$4B,$AE, 16,	$4C,$6E, 32,	$57,$12, 1,	$4E,$32, 64,	$56,$0E, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$44,$D5, 1,	$4B,$74, 64,	$48,$18, 64,	$4E,$6A, 4,	$44,$6C, 4,	$53,$91, 1,	$42,$72, 32,	$46,$35, 1,	$4B,$11, 1,	$50,$CE, 32,	$4A,$F4, 128,	$44,$C3, 128,	$4C,$73, 4,	$43,$B4, 1,	$45,$EC, 4,	$44,$1C, 32,	$43,$D0, 4,	$54,$2E, 2,	$47,$AC, 2,	$46,$CA, 16,	$4F,$B7, 16,	$4D,$8F, 128,	$4F,$CC, 4,	$45,$92, 16,	$4E,$F5, 64,	$4A,$34, 4,	$4F,$D2, 32,	$4F,$49, 1,	$46,$CA, 32,	$56,$55, 64,	$40,$F2, 4,	$4C,$6B, 64,	$42,$35, 32,	$49,$33, 64,	$4F,$6F, 4,	$55,$11, 4,	$4B,$6D, 1,	$4F,$6D, 128,	$42,$AB, 64,	$4E,$F1, 2,	$4F,$12, 128,	$4D,$D9, 1,	$52,$72, 1,	$4F,$51, 64,	$53,$0C, 4,	$4C,$C6, 4,	$49,$A7, 1,	$49,$74, 1,	$41,$0B, 32,	$43,$97, 16,	$4E,$6D, 128,	$55,$2A, 2,	$4A,$8C, 1,	$57,$A4, 4,	$4A,$52, 2,	$54,$6A, 4,	$50,$73, 1,	$4E,$F5, 64,	$53,$78, 4,	$57,$0F, 1,	$48,$4A, 4,	$41,$B2, 1,	$49,$2D, 128,	$4B,$AE, 16,	$4C,$6E, 32,	$57,$12, 1,	$4E,$32, 32,	$57,$0E, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$42,$D6, 128,	$4B,$74, 32,	$47,$F8, 32,	$4E,$6A, 8,	$43,$6C, 4,	$55,$91, 1,	$42,$52, 4,	$42,$36, 64,	$4B,$11, 1,	$54,$CE, 64,	$4B,$F4, 64,	$42,$C2, 16,	$4C,$73, 2,	$43,$B5, 128,	$45,$EC, 4,	$41,$1C, 4,	$42,$D0, 4,	$55,$2E, 2,	$47,$AC, 2,	$46,$CA, 16,	$48,$D7, 4,	$4D,$8F, 128,	$4F,$CC, 4,	$43,$92, 8,	$4F,$F5, 32,	$4A,$34, 2,	$4E,$0B, 32,	$4F,$D2, 16,	$4F,$49, 1,	$44,$CA, 64,	$57,$55, 32,	$40,$F2, 2,	$4C,$6B, 128,	$47,$15, 8,	$49,$33, 32,	$4F,$6F, 4,	$56,$11, 4,	$4B,$6D, 2,	$4F,$6C, 1,	$41,$AB, 128,	$4F,$F1, 2,	$4E,$12, 128,	$4E,$DA, 32,	$53,$72, 1,	$4F,$51, 64,	$54,$0C, 8,	$4C,$C6, 16,	$49,$A7, 8,	$49,$75, 128,	$41,$97, 8,	$4E,$6D, 128,	$56,$2A, 2,	$4A,$8C, 1,	$53,$C4, 64,	$4A,$52, 1,	$55,$6A, 8,	$53,$74, 64,	$4F,$F5, 32,	$55,$78, 2,	$50,$2F, 1,	$4F,$2A, 4,	$40,$B3, 128,	$4A,$B0, 32,	$48,$2D, 128,	$4B,$AE, 16,	$4C,$6E, 32,	$50,$33, 128,	$4E,$32, 32,	$57,$0E, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$41,$D6, 32,	$4B,$74, 16,	$46,$F8, 8,	$4E,$6A, 8,	$41,$6C, 8,	$50,$B2, 128,	$47,$12, 1,	$46,$16, 8,	$4A,$11, 1,	$51,$EE, 128,	$4B,$F4, 64,	$47,$A1, 2,	$4C,$73, 1,	$42,$B5, 64,	$44,$EC, 4,	$42,$D0, 2,	$55,$2E, 2,	$46,$AC, 4,	$45,$CA, 32,	$48,$D7, 1,	$4D,$8F, 128,	$48,$EC, 4,	$42,$92, 8,	$4F,$F5, 32,	$4A,$34, 2,	$4E,$0B, 32,	$4F,$D2, 16,	$4F,$49, 2,	$43,$CA, 128,	$50,$75, 32,	$47,$D2, 2,	$4C,$6B, 128,	$44,$15, 2,	$48,$33, 32,	$4F,$6F, 8,	$57,$11, 4,	$4A,$6D, 2,	$4F,$6C, 1,	$47,$8B, 128,	$4F,$F1, 2,	$4E,$12, 128,	$4E,$DA, 8,	$54,$73, 128,	$4F,$51, 64,	$55,$0C, 8,	$4D,$C6, 128,	$4A,$A7, 64,	$48,$75, 32,	$40,$97, 4,	$4E,$6C, 1,	$57,$2A, 4,	$4B,$8C, 1,	$56,$C3, 4,	$49,$52, 1,	$57,$6A, 8,	$56,$74, 16,	$4E,$13, 16,	$50,$15, 8,	$56,$79, 128,	$51,$2F, 1,	$4F,$2A, 8,	$47,$93, 128,	$4A,$B0, 32,	$48,$2C, 1,	$4B,$AE, 16,	$4C,$6E, 64,	$50,$33, 128,	$4D,$32, 32,	$50,$2E, 32,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$47,$B6, 8,	$4B,$74, 8,	$45,$F8, 2,	$4E,$6A, 16,	$40,$6C, 8,	$52,$B2, 128,	$41,$16, 2,	$4A,$12, 128,	$56,$ED, 1,	$4C,$F4, 32,	$45,$A1, 128,	$4C,$74, 128,	$41,$B5, 32,	$44,$EC, 8,	$41,$D0, 2,	$56,$2E, 4,	$45,$AC, 4,	$44,$CA, 64,	$49,$D8, 32,	$4D,$8F, 128,	$48,$EC, 8,	$40,$92, 4,	$50,$15, 16,	$4A,$34, 1,	$4D,$0B, 64,	$48,$F2, 16,	$4D,$71, 64,	$4F,$49, 4,	$42,$C9, 2,	$51,$75, 16,	$46,$D2, 2,	$4C,$6A, 1,	$40,$16, 128,	$48,$33, 16,	$4F,$6F, 8,	$50,$31, 2,	$4A,$6D, 2,	$4F,$6C, 2,	$46,$8A, 1,	$50,$11, 1,	$4D,$12, 128,	$4F,$DA, 1,	$48,$0E, 8,	$55,$73, 128,	$4F,$51, 64,	$56,$0C, 16,	$4D,$C5, 2,	$4A,$A6, 2,	$48,$75, 16,	$47,$77, 1,	$4E,$6C, 1,	$50,$4A, 8,	$4B,$8C, 2,	$53,$E3, 128,	$49,$52, 1,	$50,$8A, 16,	$52,$94, 4,	$4E,$13, 8,	$51,$15, 2,	$50,$99, 32,	$52,$2F, 1,	$4F,$2A, 16,	$46,$93, 64,	$4A,$B0, 32,	$48,$2C, 1,	$4B,$AE, 16,	$4B,$6E, 64,	$51,$33, 128,	$4D,$32, 16,	$51,$2E, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$45,$B6, 2,	$4B,$74, 4,	$44,$F9, 128,	$4E,$6A, 32,	$46,$4C, 16,	$54,$B2, 64,	$49,$12, 128,	$4C,$F4, 32,	$42,$A0, 64,	$4C,$74, 64,	$47,$95, 16,	$43,$EC, 8,	$40,$D0, 2,	$57,$2E, 4,	$44,$AC, 8,	$43,$CA, 128,	$49,$D8, 8,	$4D,$8E, 1,	$48,$EC, 8,	$47,$72, 4,	$50,$15, 8,	$49,$34, 1,	$4D,$0B, 64,	$48,$F2, 8,	$4D,$71, 64,	$4F,$49, 8,	$40,$C9, 4,	$52,$75, 8,	$46,$D2, 1,	$4C,$6A, 1,	$4F,$13, 8,	$4F,$6F, 8,	$50,$31, 2,	$4A,$6D, 4,	$4F,$6C, 2,	$45,$8A, 2,	$50,$11, 1,	$4D,$12, 64,	$48,$FB, 64,	$48,$0E, 8,	$56,$73, 64,	$4F,$51, 64,	$57,$0C, 32,	$4E,$C5, 8,	$4A,$A6, 32,	$48,$75, 8,	$45,$78, 128,	$4E,$6C, 1,	$51,$4A, 16,	$4B,$8C, 2,	$57,$E2, 16,	$49,$53, 128,	$51,$8A, 32,	$55,$94, 1,	$4E,$13, 8,	$53,$16, 128,	$51,$99, 8,	$52,$2F, 1,	$4F,$2A, 32,	$44,$93, 64,	$4A,$B0, 32,	$4F,$0C, 2,	$4B,$AE, 32,	$4B,$6E, 64,	$52,$33, 64,	$4D,$32, 16,	$51,$2E, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$43,$B7, 128,	$4B,$74, 2,	$43,$F9, 32,	$4E,$6A, 64,	$44,$4C, 32,	$57,$B2, 64,	$48,$12, 128,	$4D,$F4, 16,	$4B,$74, 32,	$46,$95, 16,	$43,$EC, 16,	$47,$B0, 2,	$50,$4E, 4,	$48,$F0, 1,	$43,$AC, 8,	$43,$C9, 1,	$4A,$D8, 1,	$4D,$8E, 1,	$49,$EC, 16,	$45,$72, 2,	$51,$15, 4,	$49,$35, 128,	$4D,$0B, 128,	$48,$F2, 8,	$4D,$71, 64,	$4F,$49, 32,	$47,$A9, 16,	$53,$75, 4,	$45,$D2, 1,	$4C,$6A, 2,	$4E,$13, 8,	$4F,$6F, 8,	$51,$31, 2,	$4A,$6D, 4,	$4F,$6C, 4,	$44,$8A, 4,	$49,$B3, 16,	$50,$11, 1,	$4D,$12, 64,	$49,$FB, 8,	$48,$0E, 8,	$57,$73, 64,	$4E,$51, 32,	$50,$2C, 64,	$4F,$C5, 64,	$4B,$A5, 2,	$48,$75, 4,	$44,$78, 64,	$4E,$6C, 2,	$52,$4A, 16,	$4B,$8C, 4,	$49,$53, 128,	$53,$8A, 64,	$52,$B5, 64,	$4D,$13, 8,	$55,$16, 32,	$53,$99, 2,	$53,$2F, 1,	$4E,$2A, 32,	$43,$93, 32,	$4B,$B0, 32,	$4F,$0C, 2,	$4C,$AE, 32,	$4B,$6E, 64,	$52,$33, 64,	$4C,$32, 16,	$52,$2E, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$41,$B7, 32,	$4B,$74, 1,	$42,$F9, 8,	$4E,$6A, 64,	$42,$4C, 32,	$52,$D2, 32,	$48,$12, 64,	$4D,$F4, 8,	$4B,$74, 8,	$45,$95, 8,	$42,$EC, 16,	$46,$B0, 2,	$50,$4E, 4,	$48,$F0, 1,	$42,$AC, 16,	$42,$C9, 1,	$4B,$D9, 64,	$4D,$8E, 1,	$49,$EC, 16,	$43,$72, 2,	$51,$15, 2,	$49,$35, 128,	$4C,$0B, 128,	$49,$F2, 8,	$4D,$71, 64,	$4E,$49, 64,	$45,$A9, 64,	$54,$75, 2,	$41,$F2, 4,	$44,$D2, 1,	$4C,$6A, 2,	$4E,$13, 4,	$4F,$6F, 8,	$52,$31, 1,	$4A,$6D, 4,	$4F,$6C, 8,	$42,$8A, 8,	$49,$B3, 8,	$51,$11, 1,	$4C,$12, 64,	$49,$FC, 128,	$47,$EE, 8,	$51,$93, 32,	$4E,$51, 32,	$51,$2C, 64,	$4F,$C4, 1,	$4C,$A5, 32,	$48,$75, 2,	$43,$78, 16,	$4E,$6C, 2,	$53,$4A, 32,	$4B,$8C, 4,	$49,$53, 128,	$54,$8A, 128,	$56,$B5, 8,	$4D,$13, 4,	$57,$16, 4,	$55,$9A, 128,	$54,$2F, 1,	$4E,$2A, 64,	$42,$93, 32,	$4B,$B0, 32,	$4E,$0C, 4,	$4C,$AE, 32,	$4B,$6E, 128,	$53,$33, 64,	$4C,$32, 8,	$52,$2E, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$47,$97, 4,	$4A,$75, 128,	$4A,$2C, 2,	$41,$F9, 2,	$4E,$6A, 128,	$40,$4C, 64,	$55,$D2, 16,	$47,$F2, 64,	$4E,$F4, 8,	$4B,$74, 4,	$44,$95, 4,	$42,$EC, 16,	$45,$B0, 2,	$51,$4E, 4,	$49,$F0, 1,	$41,$AC, 16,	$41,$C9, 2,	$4C,$D9, 4,	$4D,$8E, 1,	$49,$EC, 16,	$41,$72, 1,	$52,$15, 2,	$48,$35, 64,	$4C,$0A, 1,	$49,$F2, 4,	$4D,$71, 64,	$4E,$49, 128,	$43,$A8, 1,	$55,$75, 1,	$40,$F2, 2,	$44,$D3, 128,	$4C,$6A, 4,	$4D,$13, 2,	$4F,$6F, 8,	$54,$31, 1,	$4A,$6D, 4,	$4F,$6C, 8,	$41,$8A, 16,	$49,$B3, 8,	$51,$11, 1,	$4C,$12, 32,	$4A,$FC, 16,	$47,$EE, 8,	$52,$93, 32,	$4E,$51, 32,	$52,$2C, 128,	$48,$E4, 8,	$4C,$A4, 4,	$4F,$56, 128,	$41,$78, 8,	$4E,$6C, 4,	$54,$4A, 64,	$4B,$8C, 4,	$48,$53, 64,	$56,$89, 1,	$54,$D5, 1,	$4D,$13, 4,	$51,$37, 128,	$57,$9A, 32,	$55,$2F, 1,	$4E,$2A, 128,	$40,$93, 16,	$4B,$B0, 32,	$4E,$0C, 4,	$4C,$AE, 32,	$4B,$6E, 128,	$54,$33, 32,	$4B,$32, 8,	$53,$2E, 64,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$45,$97, 1,	$4A,$75, 32,	$4A,$2C, 4,	$40,$FA, 128,	$4E,$69, 1,	$46,$2C, 128,	$50,$F2, 16,	$47,$F2, 64,	$4E,$F4, 4,	$4B,$74, 1,	$43,$95, 2,	$41,$EC, 32,	$4E,$AF, 128,	$44,$B0, 2,	$52,$4E, 4,	$49,$F0, 1,	$40,$AC, 32,	$40,$C9, 4,	$4C,$DA, 128,	$4D,$8E, 1,	$4A,$EC, 32,	$47,$53, 128,	$53,$15, 1,	$48,$35, 64,	$4C,$0A, 1,	$4A,$F2, 4,	$4D,$71, 64,	$4E,$48, 1,	$42,$A8, 4,	$57,$76, 128,	$40,$F2, 2,	$43,$D3, 128,	$4C,$6A, 8,	$4C,$13, 1,	$4F,$6F, 8,	$55,$32, 128,	$4A,$6D, 8,	$4F,$6C, 16,	$40,$8A, 32,	$49,$B3, 8,	$52,$12, 128,	$4B,$12, 32,	$4B,$FC, 1,	$43,$F3, 4,	$46,$EE, 8,	$53,$93, 16,	$4E,$51, 32,	$53,$2B, 1,	$49,$E4, 64,	$4D,$A4, 128,	$4F,$56, 64,	$47,$58, 2,	$4E,$6C, 4,	$55,$4A, 128,	$4B,$8C, 8,	$48,$53, 64,	$57,$89, 4,	$52,$F6, 32,	$4C,$13, 4,	$53,$37, 16,	$51,$BA, 8,	$56,$2F, 1,	$4D,$29, 1,	$47,$73, 8,	$4B,$B0, 32,	$4D,$0C, 8,	$4C,$AE, 32,	$4B,$6D, 1,	$54,$33, 32,	$4B,$32, 4,	$54,$2E, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$42,$98, 32,	$4A,$75, 16,	$49,$2C, 4,	$47,$DA, 16,	$4D,$69, 2,	$44,$2B, 1,	$54,$F2, 8,	$46,$F2, 32,	$4F,$F4, 2,	$4B,$75, 64,	$42,$95, 1,	$40,$EC, 32,	$4E,$AF, 128,	$42,$B0, 2,	$53,$4E, 8,	$49,$F0, 1,	$47,$8C, 32,	$47,$A9, 8,	$4D,$DA, 8,	$4E,$8E, 1,	$4A,$EC, 32,	$45,$53, 128,	$53,$16, 128,	$48,$35, 32,	$4B,$0A, 2,	$4A,$F2, 4,	$4D,$71, 64,	$4E,$48, 2,	$40,$A8, 16,	$50,$96, 64,	$47,$D2, 2,	$42,$D3, 64,	$4C,$6A, 8,	$4B,$14, 128,	$4F,$6F, 8,	$56,$32, 128,	$4A,$6D, 8,	$4F,$6C, 32,	$46,$6A, 64,	$49,$B3, 4,	$52,$12, 128,	$4B,$12, 32,	$4C,$FD, 16,	$42,$F3, 4,	$46,$EE, 16,	$55,$93, 8,	$4D,$51, 16,	$54,$2B, 2,	$4A,$E3, 4,	$4E,$A3, 32,	$4F,$56, 16,	$46,$59, 128,	$4E,$6C, 4,	$56,$49, 1,	$4B,$8C, 8,	$48,$53, 32,	$51,$A9, 8,	$4C,$13, 2,	$55,$37, 2,	$53,$BA, 1,	$56,$2F, 1,	$4D,$29, 2,	$45,$73, 8,	$4B,$B0, 32,	$4D,$0C, 8,	$4C,$AE, 64,	$4B,$6D, 1,	$55,$33, 16,	$4B,$32, 4,	$54,$2E, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$47,$78, 4,	$4A,$75, 4,	$49,$2C, 4,	$46,$DA, 4,	$4D,$69, 4,	$42,$2B, 2,	$4F,$50, 32,	$4C,$AE, 32,	$45,$F2, 32,	$4F,$F4, 2,	$4A,$75, 16,	$40,$96, 128,	$40,$EC, 64,	$4E,$AF, 128,	$41,$B0, 1,	$54,$4E, 8,	$4A,$F0, 1,	$45,$8C, 64,	$46,$A9, 16,	$4E,$DB, 128,	$4E,$8E, 1,	$4A,$EC, 64,	$42,$53, 64,	$54,$16, 64,	$4F,$15, 16,	$4B,$0A, 2,	$4B,$F2, 2,	$4D,$71, 64,	$4D,$48, 8,	$45,$88, 64,	$51,$96, 32,	$47,$D2, 2,	$42,$D3, 64,	$4C,$6A, 16,	$4B,$14, 64,	$4F,$6F, 8,	$57,$32, 128,	$4A,$6D, 8,	$4F,$6C, 64,	$45,$6A, 128,	$49,$B3, 4,	$53,$12, 128,	$4A,$12, 16,	$4E,$FD, 1,	$42,$F3, 4,	$45,$EE, 16,	$56,$93, 8,	$4D,$51, 16,	$56,$2B, 4,	$4B,$E3, 32,	$4F,$A2, 16,	$4F,$56, 8,	$44,$59, 64,	$4E,$6C, 8,	$57,$49, 2,	$4B,$8C, 16,	$48,$53, 32,	$53,$A9, 16,	$4C,$13, 2,	$50,$58, 32,	$55,$BB, 32,	$57,$2F, 1,	$4C,$29, 4,	$43,$73, 4,	$4B,$B0, 32,	$4C,$0C, 16,	$4D,$AE, 64,	$4B,$6D, 1,	$56,$33, 16,	$4A,$32, 2,	$55,$2E, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$44,$79, 64,	$4A,$75, 2,	$49,$2C, 8,	$44,$DB, 128,	$4D,$69, 8,	$47,$0B, 4,	$4D,$F2, 8,	$4F,$50, 32,	$4D,$AE, 32,	$44,$F2, 32,	$50,$14, 1,	$4A,$75, 4,	$47,$76, 64,	$47,$CC, 64,	$4E,$AF, 128,	$40,$B0, 1,	$55,$4E, 8,	$4A,$F0, 1,	$44,$8C, 128,	$45,$A9, 32,	$48,$FB, 8,	$4E,$8E, 1,	$4B,$EC, 64,	$40,$53, 32,	$55,$16, 32,	$4F,$15, 16,	$4A,$0A, 4,	$4B,$F2, 2,	$49,$51, 16,	$4D,$71, 32,	$4D,$48, 16,	$43,$87, 2,	$53,$96, 16,	$46,$D2, 1,	$41,$D3, 64,	$4C,$6A, 32,	$4A,$14, 32,	$4F,$6F, 8,	$50,$52, 64,	$4A,$6D, 16,	$4F,$6C, 128,	$43,$69, 1,	$4A,$B3, 4,	$54,$12, 128,	$49,$12, 16,	$4F,$FE, 8,	$41,$F3, 2,	$45,$EE, 16,	$50,$B3, 4,	$4D,$51, 16,	$57,$2B, 8,	$4C,$E2, 2,	$48,$C1, 8,	$4E,$56, 2,	$42,$59, 16,	$4E,$6C, 8,	$50,$69, 4,	$4B,$8C, 16,	$46,$EB, 8,	$48,$53, 32,	$55,$A9, 32,	$4B,$13, 1,	$54,$58, 1,	$50,$DB, 8,	$50,$4F, 1,	$4C,$29, 8,	$42,$73, 2,	$4B,$B0, 32,	$4B,$0C, 32,	$4D,$AE, 64,	$4B,$6D, 2,	$57,$33, 8,	$4A,$32, 2,	$56,$2E, 128,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$40,$79, 4,	$4A,$76, 128,	$49,$2C, 8,	$43,$DB, 16,	$4D,$69, 16,	$45,$0B, 8,	$4D,$F2, 4,	$4F,$50, 32,	$4D,$AE, 32,	$44,$F2, 16,	$51,$15, 128,	$4A,$75, 1,	$45,$76, 32,	$46,$CC, 128,	$4E,$AF, 128,	$47,$90, 1,	$56,$4E, 8,	$4B,$F1, 128,	$43,$8C, 128,	$44,$A9, 64,	$49,$FC, 64,	$4E,$8E, 2,	$4B,$EC, 64,	$45,$33, 16,	$56,$16, 16,	$4F,$15, 8,	$4A,$0A, 4,	$4C,$F2, 1,	$49,$51, 16,	$4D,$71, 32,	$4D,$48, 64,	$41,$87, 8,	$54,$96, 8,	$46,$D2, 1,	$40,$D3, 32,	$4C,$6A, 32,	$49,$14, 16,	$4F,$6F, 8,	$52,$52, 64,	$4A,$6D, 16,	$4F,$6C, 128,	$41,$69, 4,	$4A,$B3, 2,	$54,$12, 64,	$49,$12, 16,	$50,$1F, 64,	$41,$F3, 2,	$44,$EE, 16,	$52,$B3, 4,	$4C,$51, 8,	$51,$4B, 16,	$4D,$E2, 32,	$49,$C0, 16,	$4E,$57, 128,	$40,$59, 4,	$4E,$6C, 16,	$52,$69, 8,	$4B,$8C, 32,	$46,$EB, 16,	$4F,$33, 16,	$57,$A9, 128,	$4B,$13, 1,	$57,$59, 8,	$52,$DB, 1,	$51,$4F, 1,	$4C,$29, 16,	$40,$73, 1,	$4C,$B0, 32,	$4B,$0C, 32,	$4D,$AE, 64,	$4B,$6D, 2,	$57,$33, 8,	$49,$32, 1,	$56,$2D, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$44,$5A, 64,	$49,$76, 32,	$48,$2C, 16,	$41,$DB, 2,	$4D,$69, 32,	$42,$0B, 16,	$4E,$F2, 4,	$4F,$50, 32,	$4D,$AE, 32,	$43,$F2, 16,	$51,$15, 64,	$4A,$76, 32,	$44,$76, 8,	$46,$CC, 128,	$4F,$AE, 1,	$45,$90, 1,	$57,$4E, 8,	$4B,$F1, 128,	$42,$8B, 1,	$43,$A8, 1,	$4A,$FC, 2,	$4E,$8E, 2,	$4C,$EC, 128,	$42,$33, 8,	$56,$16, 8,	$4E,$15, 4,	$4A,$0A, 8,	$4C,$F2, 1,	$48,$51, 16,	$4D,$71, 32,	$4D,$48, 128,	$46,$67, 64,	$56,$96, 4,	$45,$D2, 1,	$47,$B3, 32,	$4C,$6A, 64,	$48,$14, 8,	$4F,$6F, 8,	$53,$52, 32,	$49,$6D, 32,	$4F,$6B, 1,	$47,$49, 8,	$4A,$B3, 2,	$55,$12, 64,	$48,$12, 8,	$52,$1F, 2,	$40,$F3, 1,	$44,$EE, 16,	$54,$B3, 2,	$4C,$51, 8,	$52,$4B, 32,	$4E,$E1, 2,	$4E,$57, 32,	$46,$39, 1,	$4E,$6C, 16,	$53,$69, 32,	$4B,$8C, 32,	$45,$EB, 16,	$4F,$33, 16,	$51,$C8, 1,	$4A,$14, 128,	$54,$7A, 32,	$55,$DC, 16,	$52,$4F, 1,	$4B,$29, 32,	$46,$54, 128,	$4C,$B0, 32,	$4A,$0C, 64,	$4D,$AE, 64,	$4A,$6D, 4,	$50,$53, 4,	$49,$32, 1,	$57,$2D, 1,	$49,$CD, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$40,$5A, 2,	$49,$76, 16,	$48,$2C, 16,	$40,$DC, 64,	$4D,$69, 64,	$4E,$F2, 4,	$4F,$50, 32,	$4D,$AE, 32,	$42,$F2, 8,	$4B,$CE, 2,	$52,$15, 32,	$49,$76, 4,	$42,$76, 4,	$45,$CB, 1,	$4F,$AE, 1,	$44,$90, 1,	$50,$6E, 16,	$4B,$F1, 128,	$40,$8B, 2,	$42,$A8, 2,	$4C,$FD, 8,	$4E,$8E, 2,	$4C,$EC, 128,	$47,$13, 4,	$57,$16, 4,	$4E,$15, 4,	$49,$0A, 16,	$4D,$F2, 1,	$48,$51, 16,	$4D,$71, 32,	$4C,$47, 2,	$43,$66, 2,	$57,$96, 2,	$44,$D3, 128,	$46,$B3, 16,	$4C,$6A, 128,	$48,$CF, 1,	$47,$F4, 4,	$4E,$ED, 8,	$4E,$6F, 8,	$55,$52, 16,	$49,$6D, 32,	$4F,$6B, 2,	$45,$49, 16,	$4A,$B3, 1,	$55,$12, 64,	$48,$12, 8,	$40,$F3, 1,	$43,$EE, 32,	$55,$B3, 1,	$4C,$51, 8,	$54,$4B, 128,	$4F,$E1, 64,	$4D,$57, 8,	$44,$3A, 64,	$4E,$6C, 16,	$54,$69, 64,	$4B,$8C, 64,	$45,$EB, 32,	$4F,$33, 8,	$53,$C8, 4,	$50,$0B, 2,	$4A,$14, 128,	$51,$9B, 128,	$50,$FC, 2,	$54,$4F, 2,	$4A,$34, 1,	$4B,$29, 64,	$4C,$13, 1,	$44,$54, 64,	$4C,$B0, 32,	$49,$0C, 128,	$4D,$AE, 128,	$4A,$6D, 4,	$51,$53, 4,	$48,$33, 128,	$50,$4D, 1,	$49,$CD, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$43,$3B, 16,	$49,$76, 2,	$48,$2C, 16,	$46,$BC, 4,	$4D,$69, 128,	$4F,$F2, 4,	$4E,$50, 32,	$4D,$AE, 32,	$41,$F2, 8,	$4B,$CE, 4,	$53,$15, 16,	$49,$77, 128,	$40,$76, 2,	$44,$CB, 2,	$4F,$AE, 1,	$42,$91, 128,	$51,$6E, 16,	$4C,$F1, 128,	$47,$6B, 2,	$41,$A8, 4,	$4E,$FE, 16,	$4E,$8E, 2,	$4D,$EB, 1,	$44,$13, 2,	$50,$36, 2,	$4D,$15, 2,	$49,$0A, 16,	$4D,$F3, 128,	$48,$51, 16,	$4D,$71, 32,	$4C,$47, 4,	$40,$66, 32,	$51,$B6, 1,	$44,$D3, 128,	$45,$B3, 16,	$4C,$6A, 128,	$48,$CF, 1,	$45,$F4, 1,	$4F,$ED, 16,	$4E,$6F, 8,	$57,$52, 16,	$49,$6D, 32,	$4F,$6B, 4,	$43,$49, 64,	$4A,$B3, 1,	$56,$12, 64,	$47,$F2, 4,	$47,$D3, 1,	$43,$EE, 32,	$57,$B4, 128,	$4B,$51, 4,	$56,$4A, 1,	$51,$00, 8,	$4D,$57, 1,	$41,$3A, 8,	$4E,$6C, 32,	$56,$69, 128,	$46,$EC, 4,	$4B,$8C, 128,	$44,$EB, 32,	$4F,$33, 8,	$55,$C8, 8,	$50,$0B, 4,	$49,$14, 64,	$57,$9C, 64,	$53,$FD, 32,	$55,$4F, 2,	$49,$35, 128,	$4A,$28, 1,	$4C,$14, 128,	$41,$54, 32,	$4C,$B0, 32,	$49,$0C, 128,	$4E,$AE, 128,	$4A,$6D, 8,	$52,$53, 2,	$4C,$2C, 32,	$4F,$13, 128,	$51,$4D, 2,	$49,$CD, 2,	$5B,$00, 0
defb	$45,$1C, 64,	$49,$77, 128,	$4F,$0C, 32,	$44,$BD, 64,	$4D,$68, 1,	$4F,$F2, 2,	$4E,$50, 32,	$4E,$AE, 64,	$40,$F2, 4,	$4B,$CE, 4,	$54,$15, 8,	$48,$77, 8,	$47,$56, 1,	$43,$CB, 2,	$4F,$AE, 1,	$41,$91, 128,	$52,$6E, 16,	$4C,$F1, 128,	$45,$6B, 4,	$40,$A8, 8,	$50,$1F, 16,	$4E,$8E, 2,	$4D,$EB, 1,	$41,$13, 1,	$51,$37, 128,	$4D,$53, 64,	$4D,$15, 1,	$48,$0A, 32,	$4E,$F3, 128,	$48,$51, 8,	$4D,$71, 32,	$4C,$47, 16,	$44,$45, 2,	$53,$B7, 64,	$43,$D3, 128,	$44,$B3, 8,	$4B,$69, 1,	$49,$CF, 1,	$44,$F5, 128,	$4F,$ED, 16,	$4E,$6F, 8,	$50,$72, 8,	$49,$6D, 64,	$4F,$6B, 16,	$41,$49, 128,	$4A,$B4, 128,	$57,$12, 32,	$46,$F2, 4,	$47,$D4, 128,	$42,$EE, 32,	$51,$D4, 64,	$4B,$51, 4,	$50,$6A, 2,	$4C,$58, 64,	$47,$1A, 2,	$4E,$6C, 32,	$57,$68, 2,	$46,$EC, 8,	$4B,$8C, 128,	$44,$EB, 64,	$4E,$33, 4,	$50,$E8, 32,	$51,$0B, 4,	$49,$14, 64,	$56,$BD, 32,	$56,$FD, 2,	$56,$4F, 2,	$49,$35, 128,	$4A,$28, 2,	$4B,$14, 128,	$47,$34, 16,	$4C,$B0, 32,	$48,$0B, 1,	$4E,$AE, 128,	$4A,$6D, 8,	$53,$53, 2,	$4C,$2C, 64,	$4F,$13, 64,	$52,$4D, 2,	$4A,$CD, 2,	$5B,$00, 0
defb	$48,$77, 32,	$4F,$0C, 32,	$42,$BD, 4,	$4D,$68, 4,	$4F,$F2, 2,	$4E,$50, 32,	$4E,$AE, 64,	$47,$D2, 4,	$4B,$CE, 4,	$54,$15, 4,	$48,$78, 128,	$45,$57, 64,	$43,$CB, 4,	$4F,$AE, 1,	$47,$71, 128,	$53,$6E, 16,	$4D,$F1, 128,	$44,$6B, 8,	$46,$88, 32,	$4E,$8E, 2,	$4D,$EB, 2,	$52,$37, 64,	$4D,$53, 64,	$4D,$16, 128,	$48,$0A, 64,	$4F,$F3, 64,	$48,$51, 8,	$4D,$71, 32,	$4C,$47, 64,	$40,$45, 32,	$54,$B7, 32,	$43,$D3, 64,	$43,$B3, 8,	$4B,$69, 2,	$49,$CF, 1,	$43,$F5, 32,	$50,$0D, 16,	$4E,$6F, 8,	$52,$72, 8,	$49,$6D, 64,	$4F,$6B, 32,	$47,$28, 2,	$4A,$B4, 128,	$57,$12, 32,	$46,$F2, 2,	$46,$D4, 128,	$42,$EE, 32,	$54,$D4, 64,	$4A,$51, 2,	$52,$6A, 8,	$4C,$58, 8,	$44,$1B, 64,	$4E,$6C, 64,	$51,$88, 4,	$45,$EC, 8,	$4B,$8B, 1,	$44,$EB, 64,	$4E,$33, 4,	$52,$E8, 128,	$51,$0B, 4,	$49,$14, 32,	$56,$DE, 2,	$57,$4F, 2,	$49,$35, 64,	$49,$28, 4,	$52,$11, 64,	$4B,$14, 128,	$44,$34, 8,	$4D,$B0, 32,	$47,$EB, 2,	$4E,$AE, 128,	$4A,$6D, 16,	$54,$53, 1,	$4C,$2C, 64,	$4E,$13, 32,	$53,$4D, 2,	$4A,$CD, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$48,$77, 4,	$4F,$0C, 64,	$40,$BE, 32,	$4D,$68, 8,	$4F,$6B, 64,	$50,$12, 2,	$4E,$50, 32,	$4E,$AE, 64,	$46,$D2, 2,	$4C,$CE, 4,	$55,$15, 2,	$4F,$58, 4,	$43,$57, 32,	$42,$CB, 4,	$48,$CE, 1,	$45,$71, 128,	$55,$6E, 32,	$4D,$F1, 128,	$42,$6B, 16,	$45,$88, 64,	$4F,$8E, 4,	$4E,$EB, 2,	$53,$37, 32,	$4C,$53, 32,	$4C,$16, 128,	$47,$EA, 128,	$4F,$F3, 64,	$4F,$31, 8,	$4C,$71, 16,	$4B,$46, 1,	$44,$24, 4,	$56,$B7, 8,	$42,$D3, 64,	$42,$B3, 4,	$4B,$69, 4,	$49,$CF, 1,	$41,$F5, 16,	$50,$0D, 16,	$4E,$6F, 8,	$54,$72, 4,	$49,$6D, 128,	$4F,$6B, 64,	$44,$28, 8,	$4B,$B4, 64,	$50,$32, 32,	$45,$F2, 2,	$45,$D4, 64,	$41,$EE, 32,	$56,$D4, 32,	$4A,$51, 2,	$54,$6A, 32,	$4C,$58, 1,	$41,$1B, 16,	$4E,$6C, 64,	$53,$88, 8,	$45,$EC, 8,	$4C,$8B, 1,	$43,$EB, 128,	$4E,$33, 2,	$55,$E7, 2,	$52,$0B, 8,	$44,$ED, 16,	$48,$14, 32,	$51,$6F, 2,	$49,$35, 64,	$49,$28, 16,	$53,$11, 64,	$4B,$14, 64,	$42,$34, 4,	$4D,$B0, 16,	$46,$EB, 4,	$4E,$AD, 1,	$4A,$6D, 32,	$55,$53, 1,	$4B,$2C, 128,	$4D,$13, 32,	$54,$4D, 2,	$4A,$CD, 4,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$48,$78, 128,	$4E,$0C, 64,	$45,$9E, 1,	$4D,$68, 16,	$4F,$6B, 128,	$50,$12, 1,	$4E,$50, 32,	$4E,$AE, 64,	$45,$D2, 2,	$4C,$CE, 4,	$56,$15, 1,	$4F,$59, 16,	$41,$57, 8,	$41,$CB, 8,	$48,$CE, 1,	$43,$71, 128,	$56,$6E, 32,	$4D,$F1, 128,	$40,$6B, 32,	$44,$87, 1,	$4F,$8E, 4,	$4E,$EB, 4,	$54,$37, 16,	$4C,$53, 32,	$4C,$16, 64,	$47,$EA, 128,	$50,$13, 32,	$4F,$31, 8,	$4C,$71, 16,	$4B,$46, 4,	$47,$04, 128,	$50,$D7, 4,	$41,$D3, 32,	$41,$B3, 4,	$4B,$69, 8,	$49,$CF, 1,	$40,$F5, 4,	$50,$0D, 32,	$4E,$6F, 8,	$56,$72, 2,	$49,$6D, 128,	$4F,$6B, 128,	$42,$28, 32,	$4B,$B4, 64,	$51,$32, 16,	$44,$F2, 1,	$45,$D4, 64,	$41,$EE, 64,	$50,$F4, 16,	$4A,$51, 1,	$56,$6A, 64,	$4B,$59, 32,	$4E,$6C, 128,	$54,$88, 32,	$44,$EC, 16,	$4C,$8B, 2,	$43,$EB, 128,	$4D,$33, 2,	$52,$0B, 8,	$43,$ED, 32,	$48,$14, 16,	$52,$6F, 2,	$48,$35, 32,	$48,$28, 32,	$53,$11, 64,	$4A,$14, 64,	$47,$14, 2,	$4D,$B0, 16,	$46,$EB, 8,	$4F,$AD, 1,	$49,$6D, 32,	$56,$54, 128,	$4B,$2C, 128,	$4D,$13, 16,	$54,$4D, 4,	$4A,$CD, 4,	$4E,$8B, 1,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4F,$58, 16,	$4E,$0C, 64,	$43,$9F, 8,	$4D,$68, 64,	$4F,$6B, 128,	$51,$12, 1,	$4E,$50, 32,	$4E,$AE, 64,	$44,$D2, 1,	$4C,$CE, 4,	$4C,$CF, 8,	$57,$16, 128,	$4E,$5A, 32,	$47,$37, 2,	$40,$CB, 16,	$48,$CE, 1,	$41,$71, 64,	$57,$6E, 32,	$4E,$F1, 64,	$46,$4B, 64,	$42,$87, 2,	$4F,$8E, 4,	$4F,$EB, 8,	$55,$37, 4,	$4C,$53, 32,	$4B,$16, 32,	$42,$EF, 4,	$46,$E9, 1,	$51,$13, 16,	$4F,$31, 8,	$4C,$71, 16,	$4A,$46, 32,	$41,$03, 32,	$52,$D7, 1,	$41,$D3, 32,	$40,$B3, 2,	$4B,$69, 16,	$4A,$CF, 1,	$46,$D5, 1,	$51,$0D, 32,	$4E,$6F, 16,	$51,$92, 1,	$49,$6C, 1,	$4F,$6A, 2,	$47,$08, 128,	$4B,$B4, 32,	$51,$32, 16,	$43,$F2, 1,	$44,$D4, 32,	$40,$EE, 64,	$53,$F4, 8,	$49,$51, 1,	$51,$89, 1,	$4A,$59, 2,	$4E,$6C, 128,	$56,$88, 128,	$44,$EC, 16,	$4C,$8B, 4,	$42,$EA, 1,	$4D,$33, 1,	$52,$0B, 16,	$43,$ED, 32,	$47,$F4, 16,	$53,$6F, 2,	$48,$35, 32,	$48,$28, 128,	$54,$11, 64,	$4A,$14, 32,	$44,$14, 1,	$4D,$B0, 16,	$45,$EB, 16,	$4F,$AD, 1,	$49,$6D, 64,	$57,$54, 64,	$4B,$2C, 128,	$4C,$13, 8,	$55,$4D, 4,	$4B,$CD, 4,	$4E,$8B, 1,	$5B,$00, 0,	$5B,$00, 0
defb	$4F,$58, 1,	$4D,$0C, 128,	$4D,$68, 128,	$4F,$6A, 1,	$51,$12, 1,	$4E,$50, 32,	$4F,$AE, 128,	$43,$D3, 128,	$4C,$CE, 4,	$4A,$94, 1,	$4C,$CF, 8,	$50,$36, 64,	$4D,$5B, 32,	$44,$37, 1,	$47,$AB, 16,	$48,$CE, 2,	$47,$51, 64,	$51,$8E, 64,	$4E,$F1, 64,	$44,$4B, 128,	$41,$87, 8,	$4F,$8E, 4,	$4F,$EB, 8,	$56,$37, 2,	$4C,$53, 16,	$4B,$16, 16,	$41,$EF, 4,	$46,$E9, 2,	$51,$13, 16,	$4F,$31, 4,	$4C,$71, 16,	$4A,$46, 128,	$55,$D8, 64,	$40,$D3, 32,	$47,$93, 1,	$4B,$69, 16,	$4A,$CF, 1,	$44,$D6, 64,	$51,$0D, 32,	$4E,$6F, 16,	$53,$93, 128,	$48,$6C, 1,	$4F,$6A, 4,	$44,$07, 2,	$4B,$B4, 32,	$52,$32, 16,	$42,$F3, 128,	$44,$D4, 32,	$47,$CE, 64,	$55,$F4, 4,	$48,$52, 128,	$54,$89, 8,	$4A,$5A, 64,	$4E,$6B, 1,	$50,$A7, 1,	$43,$EC, 16,	$4C,$8B, 8,	$41,$EA, 1,	$4D,$33, 1,	$53,$0B, 16,	$42,$ED, 32,	$46,$F4, 8,	$55,$6F, 2,	$48,$35, 16,	$4F,$07, 1,	$54,$11, 64,	$49,$14, 32,	$41,$15, 64,	$4D,$B0, 16,	$44,$EB, 32,	$4F,$AD, 2,	$49,$6D, 128,	$50,$74, 64,	$4B,$2B, 1,	$4B,$13, 4,	$56,$4D, 4,	$4B,$CD, 4,	$4F,$8B, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$59, 16,	$4D,$0C, 128,	$4D,$67, 2,	$4F,$6A, 1,	$52,$13, 128,	$4D,$50, 32,	$4A,$31, 8,	$4F,$AE, 128,	$42,$D3, 128,	$4D,$CE, 8,	$4A,$94, 1,	$4C,$CF, 8,	$51,$36, 32,	$4C,$4C, 8,	$4C,$5C, 8,	$42,$38, 64,	$46,$AB, 32,	$49,$CE, 2,	$45,$51, 64,	$52,$8E, 64,	$4F,$F1, 64,	$42,$4A, 1,	$47,$67, 16,	$4F,$8E, 4,	$50,$0B, 16,	$57,$38, 128,	$4C,$53, 16,	$4A,$16, 8,	$41,$EF, 4,	$45,$E9, 4,	$52,$13, 8,	$4E,$31, 4,	$4C,$71, 16,	$4A,$45, 4,	$57,$D8, 32,	$47,$B3, 16,	$46,$93, 1,	$4B,$69, 32,	$4A,$CF, 1,	$42,$D6, 8,	$52,$0D, 64,	$4E,$6F, 16,	$56,$93, 64,	$48,$6C, 2,	$4F,$6A, 16,	$41,$07, 8,	$4B,$B4, 16,	$53,$32, 8,	$41,$F3, 128,	$43,$D4, 16,	$47,$CE, 64,	$48,$52, 64,	$57,$89, 32,	$49,$5A, 2,	$4E,$6B, 2,	$52,$A7, 4,	$43,$EC, 32,	$4C,$8B, 8,	$41,$EA, 2,	$4C,$34, 128,	$53,$0B, 32,	$4F,$B1, 128,	$42,$ED, 64,	$46,$F4, 8,	$57,$6F, 2,	$4F,$15, 16,	$4E,$07, 4,	$55,$11, 64,	$49,$14, 16,	$4E,$B0, 16,	$43,$EB, 64,	$4F,$AD, 2,	$49,$6C, 1,	$51,$74, 32,	$4A,$2B, 1,	$4A,$13, 2,	$50,$6D, 8,	$4B,$CD, 8,	$4F,$8B, 2,	$5B,$00, 0,	$5B,$00, 0
defb	$4E,$59, 1,	$4D,$0B, 1,	$4D,$67, 4,	$4F,$6A, 2,	$52,$13, 128,	$4D,$50, 32,	$4A,$31, 8,	$4F,$AE, 128,	$40,$D3, 64,	$4D,$CE, 8,	$4A,$95, 128,	$4C,$CF, 8,	$52,$36, 16,	$4B,$4C, 16,	$4A,$5E, 64,	$47,$18, 16,	$45,$AB, 64,	$49,$CE, 2,	$42,$51, 32,	$54,$8E, 64,	$4F,$F1, 64,	$40,$4A, 2,	$45,$67, 64,	$4F,$8E, 8,	$51,$0B, 16,	$50,$58, 32,	$4C,$53, 16,	$4A,$16, 4,	$40,$EF, 4,	$44,$E9, 8,	$53,$13, 8,	$4E,$31, 4,	$4C,$71, 8,	$49,$45, 16,	$52,$F8, 8,	$46,$B3, 16,	$45,$94, 128,	$4B,$69, 64,	$4A,$CF, 1,	$40,$D6, 2,	$52,$0D, 64,	$4E,$6F, 16,	$51,$B3, 32,	$48,$6C, 2,	$4F,$6A, 64,	$4C,$B4, 16,	$54,$32, 8,	$40,$F3, 64,	$42,$D4, 16,	$46,$CE, 64,	$4F,$32, 32,	$52,$A9, 128,	$48,$5B, 16,	$4E,$6B, 2,	$54,$A7, 16,	$42,$EC, 32,	$4C,$8B, 16,	$40,$EA, 2,	$4C,$34, 128,	$54,$0B, 32,	$4F,$B1, 128,	$41,$ED, 64,	$45,$F4, 4,	$50,$8F, 2,	$4F,$15, 8,	$4E,$07, 16,	$55,$11, 32,	$49,$14, 16,	$4E,$B0, 16,	$42,$EB, 128,	$48,$CD, 2,	$49,$6C, 1,	$53,$74, 16,	$4A,$2B, 2,	$49,$13, 2,	$51,$6D, 8,	$4B,$CD, 8,	$4F,$8B, 2,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0
defb	$4D,$5A, 8,	$4C,$0B, 1,	$4D,$67, 16,	$4F,$6A, 2,	$53,$13, 128,	$4D,$50, 32,	$49,$31, 8,	$4F,$AE, 128,	$47,$B3, 32,	$4D,$CE, 8,	$4A,$95, 128,	$4D,$CF, 8,	$53,$36, 4,	$4B,$4C, 16,	$44,$18, 4,	$44,$AB, 128,	$49,$CE, 2,	$40,$51, 32,	$55,$8E, 128,	$50,$11, 64,	$46,$2A, 4,	$43,$66, 1,	$4F,$8E, 8,	$51,$0B, 32,	$52,$58, 16,	$4C,$53, 8,	$49,$16, 2,	$40,$EF, 4,	$44,$E9, 16,	$54,$13, 4,	$4E,$31, 4,	$4C,$71, 8,	$49,$45, 128,	$54,$F8, 2,	$45,$B3, 8,	$44,$94, 64,	$4B,$69, 128,	$4B,$CF, 1,	$45,$B7, 64,	$53,$0D, 64,	$4E,$6F, 16,	$54,$B3, 16,	$48,$6C, 4,	$4E,$69, 1,	$4C,$B4, 8,	$55,$32, 4,	$47,$D3, 64,	$42,$D4, 8,	$45,$CE, 128,	$4E,$32, 32,	$56,$A8, 4,	$4F,$3C, 128,	$4E,$6B, 4,	$57,$A7, 64,	$42,$EC, 64,	$4C,$8B, 32,	$4F,$CC, 4,	$40,$EA, 4,	$4C,$34, 64,	$54,$0B, 64,	$4F,$B1, 128,	$41,$ED, 64,	$45,$F4, 2,	$52,$8F, 2,	$4F,$15, 4,	$4D,$07, 64,	$56,$11, 32,	$48,$14, 8,	$4E,$B0, 16,	$40,$EA, 1,	$48,$CD, 4,	$48,$6C, 2,	$54,$74, 8,	$4A,$2B, 2,	$48,$13, 1,	$52,$6D, 16,	$4C,$CD, 8,	$4F,$8B, 4,	$5B,$00, 0,	$5B,$00, 0,	$5B,$00, 0


        rept 5
defb    0
        endm
        

; 63 lines * 15 bytes

distort:

defb $08,$50,$00,$0F,	$08,$50,$C0,$12,	$08,$50,$40,$1A,	$09,$50,$C0,$03,	$09,$50,$40,$0B,	$09,$50,$00,$0F,	$09,$50,$80,$16,	$0A,$50,$00,$00,	$0A,$50,$80,$07,	$0A,$50,$00,$0F,	$0A,$50,$C0,$12,	$0A,$50,$40,$1A,	$0B,$50,$C0,$03,	$0B,$50,$80,$07,	$0B,$50,$00,$0F,	$0B,$50,$80,$16,	$0C,$50,$00,$00,	$0C,$50,$C0,$03,	$0C,$50,$40,$0B,	$0C,$50,$00,$0F,	$0C,$50,$80,$16,	$0C,$50,$40,$1A,	$0D,$50,$C0,$03,	$0D,$50,$80,$07,	$0D,$50,$00,$0F,	$0D,$50,$C0,$12,	$0D,$50,$40,$1A,	$0E,$50,$00,$00,	$0E,$50,$C0,$03,	$0E,$50,$40,$0B,	$0E,$50,$00,$0F,	$0E,$50,$C0,$12,	$0E,$50,$40,$1A,	$0F,$50,$00,$00,	$0F,$50,$C0,$03,	$0F,$50,$80,$07,	$0F,$50,$40,$0B,	$0F,$50,$00,$0F,	$0F,$50,$C0,$12,	$0F,$50,$80,$16,	$0F,$50,$40,$1A,	$10,$50,$00,$00,	$10,$50,$C0,$03,	$10,$50,$C0,$03,	$10,$50,$80,$07,	$10,$50,$40,$0B,	$10,$50,$40,$0B,	$10,$50,$00,$0F,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$00,$0F,	$10,$50,$00,$0F,	$10,$50,$40,$0B,	$10,$50,$80,$07,	$10,$50,$80,$07,	$10,$50,$C0,$03,	$10,$50,$00,$00,	$0F,$50,$40,$1A,	$0F,$50,$80,$16,	$0F,$50,$C0,$12,	$0F,$50,$00,$0F,	$0F,$50,$40,$0B,	$0F,$50,$80,$07,	$0F,$50,$C0,$03,	$0F,$50,$00,$00,	$0E,$50,$40,$1A,	$0E,$50,$80,$16,	$0E,$50,$C0,$12,	$0E,$50,$40,$0B,	$0E,$50,$80,$07,	$0E,$50,$C0,$03,	$0D,$50,$40,$1A,	$0D,$50,$80,$16,	$0D,$50,$C0,$12,	$0D,$50,$40,$0B,	$0D,$50,$80,$07,	$0D,$50,$00,$00,	$0C,$50,$40,$1A,	$0C,$50,$C0,$12,	$0C,$50,$40,$0B,	$0C,$50,$80,$07,	$0C,$50,$00,$00,	$0B,$50,$40,$1A,	$0B,$50,$C0,$12,	$0B,$50,$40,$0B,	$0B,$50,$80,$07,	$0B,$50,$00,$00,	$0A,$50,$80,$16,	$0A,$50,$00,$0F,	$0A,$50,$40,$0B,	$0A,$50,$C0,$03,	$09,$50,$40,$1A,	$09,$50,$C0,$12,	$09,$50,$40,$0B,	$09,$50,$80,$07,	$09,$50,$00,$00,	$08,$50,$80,$16,	$08,$50,$00,$0F,	$08,$50,$80,$07,	$08,$50,$C0,$03,	$07,$50,$40,$1A,	$07,$50,$C0,$12,	$07,$50,$40,$0B,	$07,$50,$C0,$03,	$07,$50,$00,$00,	$06,$50,$80,$16,	$06,$50,$00,$0F,	$06,$50,$80,$07,	$06,$50,$C0,$03,	$05,$50,$40,$1A,	$05,$50,$C0,$12,	$05,$50,$00,$0F,	$05,$50,$80,$07,	$05,$50,$00,$00,	$04,$50,$40,$1A,	$04,$50,$C0,$12,	$04,$50,$40,$0B,	$04,$50,$80,$07,	$04,$50,$00,$00,	$03,$50,$40,$1A,	$03,$50,$C0,$12,	$03,$50,$00,$0F,	$03,$50,$80,$07,	$03,$50,$C0,$03,	$02,$50,$40,$1A,	$02,$50,$80,$16,	$02,$50,$C0,$12,	$02,$50,$40,$0B,	$02,$50,$80,$07,	$02,$50,$C0,$03,	$02,$50,$00,$00,	$01,$50,$40,$1A,	$01,$50,$80,$16,	$01,$50,$00,$0F,	$01,$50,$40,$0B,	$01,$50,$80,$07,	$01,$50,$C0,$03,	$01,$50,$C0,$03,	$01,$50,$00,$00,	$00,$50,$40,$1A,	$00,$50,$80,$16,	$00,$50,$C0,$12,	$00,$50,$C0,$12,	$00,$50,$00,$0F,	$00,$50,$40,$0B,	$00,$50,$40,$0B,	$00,$50,$80,$07,	$00,$50,$80,$07,	$00,$50,$C0,$03,	$00,$50,$C0,$03,	$00,$50,$C0,$03,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$C0,$03,	$00,$50,$C0,$03,	$00,$50,$80,$07,	$00,$50,$80,$07,	$00,$50,$40,$0B,	$00,$50,$40,$0B,	$00,$50,$00,$0F,	$00,$50,$00,$0F,	$00,$50,$C0,$12,	$00,$50,$80,$16,	$00,$50,$40,$1A,	$00,$50,$40,$1A,	$01,$50,$00,$00,	$01,$50,$C0,$03,	$01,$50,$80,$07,	$01,$50,$40,$0B,	$01,$50,$00,$0F,	$01,$50,$C0,$12,	$01,$50,$80,$16,	$01,$50,$40,$1A,	$02,$50,$C0,$03,	$02,$50,$80,$07,	$02,$50,$40,$0B,	$02,$50,$00,$0F,	$02,$50,$80,$16,	$02,$50,$40,$1A,	$03,$50,$00,$00,	$03,$50,$80,$07,	$03,$50,$40,$0B,	$03,$50,$C0,$12,	$03,$50,$80,$16,	$04,$50,$00,$00,	$04,$50,$C0,$03,	$04,$50,$40,$0B,	$04,$50,$00,$0F,	$04,$50,$80,$16,	$05,$50,$00,$00,	$05,$50,$C0,$03,	$05,$50,$40,$0B,	$05,$50,$C0,$12,	$05,$50,$80,$16,	$06,$50,$00,$00,	$06,$50,$80,$07,	$06,$50,$00,$0F,	$06,$50,$C0,$12,	$06,$50,$40,$1A,	$07,$50,$C0,$03,	$07,$50,$40,$0B,	$07,$50,$C0,$12,	$07,$50,$80,$16,	$08,$50,$00,$00,	$08,$50,$80,$07
defb $08,$50,$40,$0B,		$08,$50,$00,$0F,		$08,$50,$C0,$03,		$08,$50,$80,$16,		$08,$50,$00,$00,		$09,$50,$00,$00,		$07,$50,$80,$16,		$09,$50,$C0,$03,		$07,$50,$C0,$12,		$09,$50,$40,$0B,		$07,$50,$40,$0B,		$09,$50,$00,$0F,		$07,$50,$80,$07,		$09,$50,$80,$16,		$07,$50,$00,$00,		$09,$50,$40,$1A,		$06,$50,$40,$1A,		$0A,$50,$00,$00,		$06,$50,$80,$16,		$0A,$50,$C0,$03,		$06,$50,$C0,$12,		$0A,$50,$80,$07,		$06,$50,$C0,$12,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$C0,$12,		$0A,$50,$80,$07,		$06,$50,$C0,$12,		$0A,$50,$80,$07,		$06,$50,$80,$16,		$0A,$50,$C0,$03,		$06,$50,$40,$1A,		$0A,$50,$00,$00,		$07,$50,$00,$00,		$09,$50,$80,$16,		$07,$50,$C0,$03,		$09,$50,$C0,$12,		$07,$50,$40,$0B,		$09,$50,$00,$0F,		$07,$50,$00,$0F,		$09,$50,$80,$07,		$07,$50,$80,$16,		$09,$50,$C0,$03,		$07,$50,$40,$1A,		$08,$50,$40,$1A,		$08,$50,$C0,$03,		$08,$50,$C0,$12,		$08,$50,$40,$0B,		$08,$50,$00,$0F,		$08,$50,$C0,$12,		$08,$50,$80,$07,		$08,$50,$80,$16,		$08,$50,$00,$00,		$09,$50,$00,$00,		$07,$50,$40,$1A,		$09,$50,$C0,$03,		$07,$50,$C0,$12,		$09,$50,$40,$0B,		$07,$50,$00,$0F,		$09,$50,$00,$0F,		$07,$50,$80,$07,		$09,$50,$80,$16,		$07,$50,$C0,$03,		$09,$50,$40,$1A,		$07,$50,$00,$00,		$0A,$50,$00,$00,		$06,$50,$40,$1A,		$0A,$50,$C0,$03,		$06,$50,$80,$16,		$0A,$50,$80,$07,		$06,$50,$C0,$12,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$40,$0B,		$06,$50,$00,$0F,		$0A,$50,$80,$07,		$06,$50,$C0,$12,		$0A,$50,$C0,$03,		$06,$50,$80,$16,		$0A,$50,$C0,$03,		$06,$50,$40,$1A,		$0A,$50,$00,$00,		$07,$50,$00,$00,		$09,$50,$80,$16,		$07,$50,$C0,$03,		$09,$50,$C0,$12,		$07,$50,$80,$07,		$09,$50,$00,$0F,		$07,$50,$00,$0F,		$09,$50,$80,$07,		$07,$50,$C0,$12,		$09,$50,$C0,$03,		$07,$50,$40,$1A,		$08,$50,$40,$1A,		$08,$50,$C0,$03,		$08,$50,$C0,$12,		$08,$50,$80,$07,		$08,$50,$00,$0F
defb $08,$50,$00,$0F,		$08,$50,$40,$1A,		$09,$50,$40,$0B,		$09,$50,$80,$16,		$0A,$50,$80,$07,		$0A,$50,$C0,$12,		$0B,$50,$C0,$03,		$0B,$50,$00,$0F,		$0C,$50,$00,$00,		$0C,$50,$40,$0B,		$0C,$50,$80,$16,		$0D,$50,$C0,$03,		$0D,$50,$00,$0F,		$0D,$50,$40,$1A,		$0E,$50,$C0,$03,		$0E,$50,$00,$0F,		$0E,$50,$40,$1A,		$0F,$50,$C0,$03,		$0F,$50,$40,$0B,		$0F,$50,$C0,$12,		$0F,$50,$40,$1A,		$10,$50,$C0,$03,		$10,$50,$80,$07,		$10,$50,$40,$0B,		$10,$50,$C0,$12,		$10,$50,$C0,$12,		$10,$50,$80,$16,		$10,$50,$40,$1A,		$10,$50,$40,$1A,		$10,$50,$40,$1A,		$10,$50,$40,$1A,		$10,$50,$40,$1A,		$10,$50,$40,$1A,		$10,$50,$80,$16,		$10,$50,$80,$16,		$10,$50,$C0,$12,		$10,$50,$00,$0F,		$10,$50,$80,$07,		$10,$50,$C0,$03,		$0F,$50,$40,$1A,		$0F,$50,$C0,$12,		$0F,$50,$40,$0B,		$0F,$50,$C0,$03,		$0E,$50,$40,$1A,		$0E,$50,$C0,$12,		$0E,$50,$80,$07,		$0D,$50,$40,$1A,		$0D,$50,$C0,$12,		$0D,$50,$80,$07,		$0C,$50,$40,$1A,		$0C,$50,$40,$0B,		$0C,$50,$00,$00,		$0B,$50,$C0,$12,		$0B,$50,$80,$07,		$0A,$50,$80,$16,		$0A,$50,$40,$0B,		$09,$50,$40,$1A,		$09,$50,$40,$0B,		$09,$50,$00,$00,		$08,$50,$00,$0F,		$08,$50,$C0,$03,		$07,$50,$C0,$12,		$07,$50,$C0,$03,		$06,$50,$80,$16,		$06,$50,$80,$07,		$05,$50,$40,$1A,		$05,$50,$00,$0F,		$05,$50,$00,$00,		$04,$50,$C0,$12,		$04,$50,$80,$07,		$03,$50,$40,$1A,		$03,$50,$00,$0F,		$03,$50,$C0,$03,		$02,$50,$80,$16,		$02,$50,$40,$0B,		$02,$50,$C0,$03,		$01,$50,$40,$1A,		$01,$50,$00,$0F,		$01,$50,$80,$07,		$01,$50,$C0,$03,		$00,$50,$40,$1A,		$00,$50,$C0,$12,		$00,$50,$00,$0F,		$00,$50,$40,$0B,		$00,$50,$80,$07,		$00,$50,$C0,$03,		$00,$50,$00,$00,		$00,$50,$00,$00,		$00,$50,$00,$00,		$00,$50,$00,$00,		$00,$50,$00,$00,		$00,$50,$00,$00,		$00,$50,$00,$00,		$00,$50,$C0,$03,		$00,$50,$80,$07,		$00,$50,$40,$0B,		$00,$50,$00,$0F,		$00,$50,$80,$16,		$00,$50,$40,$1A,		$01,$50,$C0,$03,		$01,$50,$40,$0B,		$01,$50,$C0,$12,		$01,$50,$40,$1A,		$02,$50,$80,$07,		$02,$50,$00,$0F,		$02,$50,$40,$1A,		$03,$50,$80,$07,		$03,$50,$C0,$12,		$04,$50,$00,$00,		$04,$50,$40,$0B,		$04,$50,$80,$16,		$05,$50,$C0,$03,		$05,$50,$C0,$12,		$06,$50,$00,$00,		$06,$50,$00,$0F,		$06,$50,$40,$1A,		$07,$50,$40,$0B,		$07,$50,$80,$16,		$08,$50,$80,$07
defb $08,$50,$00,$0F,	$08,$50,$C0,$12,	$08,$50,$40,$1A,	$09,$50,$C0,$03,	$09,$50,$40,$0B,	$09,$50,$00,$0F,	$09,$50,$80,$16,	$0A,$50,$00,$00,	$0A,$50,$80,$07,	$0A,$50,$00,$0F,	$0A,$50,$C0,$12,	$0A,$50,$40,$1A,	$0B,$50,$C0,$03,	$0B,$50,$80,$07,	$0B,$50,$00,$0F,	$0B,$50,$80,$16,	$0C,$50,$00,$00,	$0C,$50,$C0,$03,	$0C,$50,$40,$0B,	$0C,$50,$00,$0F,	$0C,$50,$80,$16,	$0C,$50,$40,$1A,	$0D,$50,$C0,$03,	$0D,$50,$80,$07,	$0D,$50,$00,$0F,	$0D,$50,$C0,$12,	$0D,$50,$40,$1A,	$0E,$50,$00,$00,	$0E,$50,$C0,$03,	$0E,$50,$40,$0B,	$0E,$50,$00,$0F,	$0E,$50,$C0,$12,	$0E,$50,$40,$1A,	$0F,$50,$00,$00,	$0F,$50,$C0,$03,	$0F,$50,$80,$07,	$0F,$50,$40,$0B,	$0F,$50,$00,$0F,	$0F,$50,$C0,$12,	$0F,$50,$80,$16,	$0F,$50,$40,$1A,	$10,$50,$00,$00,	$10,$50,$C0,$03,	$10,$50,$C0,$03,	$10,$50,$80,$07,	$10,$50,$40,$0B,	$10,$50,$40,$0B,	$10,$50,$00,$0F,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$00,$0F,	$10,$50,$00,$0F,	$10,$50,$40,$0B,	$10,$50,$80,$07,	$10,$50,$80,$07,	$10,$50,$C0,$03,	$10,$50,$00,$00,	$0F,$50,$40,$1A,	$0F,$50,$80,$16,	$0F,$50,$C0,$12,	$0F,$50,$00,$0F,	$0F,$50,$40,$0B,	$0F,$50,$80,$07,	$0F,$50,$C0,$03,	$0F,$50,$00,$00,	$0E,$50,$40,$1A,	$0E,$50,$80,$16,	$0E,$50,$C0,$12,	$0E,$50,$40,$0B,	$0E,$50,$80,$07,	$0E,$50,$C0,$03,	$0D,$50,$40,$1A,	$0D,$50,$80,$16,	$0D,$50,$C0,$12,	$0D,$50,$40,$0B,	$0D,$50,$80,$07,	$0D,$50,$00,$00,	$0C,$50,$40,$1A,	$0C,$50,$C0,$12,	$0C,$50,$40,$0B,	$0C,$50,$80,$07,	$0C,$50,$00,$00,	$0B,$50,$40,$1A,	$0B,$50,$C0,$12,	$0B,$50,$40,$0B,	$0B,$50,$80,$07,	$0B,$50,$00,$00,	$0A,$50,$80,$16,	$0A,$50,$00,$0F,	$0A,$50,$40,$0B,	$0A,$50,$C0,$03,	$09,$50,$40,$1A,	$09,$50,$C0,$12,	$09,$50,$40,$0B,	$09,$50,$80,$07,	$09,$50,$00,$00,	$08,$50,$80,$16,	$08,$50,$00,$0F,	$08,$50,$80,$07,	$08,$50,$C0,$03,	$07,$50,$40,$1A,	$07,$50,$C0,$12,	$07,$50,$40,$0B,	$07,$50,$C0,$03,	$07,$50,$00,$00,	$06,$50,$80,$16,	$06,$50,$00,$0F,	$06,$50,$80,$07,	$06,$50,$C0,$03,	$05,$50,$40,$1A,	$05,$50,$C0,$12,	$05,$50,$00,$0F,	$05,$50,$80,$07,	$05,$50,$00,$00,	$04,$50,$40,$1A,	$04,$50,$C0,$12,	$04,$50,$40,$0B,	$04,$50,$80,$07,	$04,$50,$00,$00,	$03,$50,$40,$1A,	$03,$50,$C0,$12,	$03,$50,$00,$0F,	$03,$50,$80,$07,	$03,$50,$C0,$03,	$02,$50,$40,$1A,	$02,$50,$80,$16,	$02,$50,$C0,$12,	$02,$50,$40,$0B,	$02,$50,$80,$07,	$02,$50,$C0,$03,	$02,$50,$00,$00,	$01,$50,$40,$1A,	$01,$50,$80,$16,	$01,$50,$00,$0F,	$01,$50,$40,$0B,	$01,$50,$80,$07,	$01,$50,$C0,$03,	$01,$50,$C0,$03,	$01,$50,$00,$00,	$00,$50,$40,$1A,	$00,$50,$80,$16,	$00,$50,$C0,$12,	$00,$50,$C0,$12,	$00,$50,$00,$0F,	$00,$50,$40,$0B,	$00,$50,$40,$0B,	$00,$50,$80,$07,	$00,$50,$80,$07,	$00,$50,$C0,$03,	$00,$50,$C0,$03,	$00,$50,$C0,$03,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$00,$00,	$00,$50,$C0,$03,	$00,$50,$C0,$03,	$00,$50,$80,$07,	$00,$50,$80,$07,	$00,$50,$40,$0B,	$00,$50,$40,$0B,	$00,$50,$00,$0F,	$00,$50,$00,$0F,	$00,$50,$C0,$12,	$00,$50,$80,$16,	$00,$50,$40,$1A,	$00,$50,$40,$1A,	$01,$50,$00,$00,	$01,$50,$C0,$03,	$01,$50,$80,$07,	$01,$50,$40,$0B,	$01,$50,$00,$0F,	$01,$50,$C0,$12,	$01,$50,$80,$16,	$01,$50,$40,$1A,	$02,$50,$C0,$03,	$02,$50,$80,$07,	$02,$50,$40,$0B,	$02,$50,$00,$0F,	$02,$50,$80,$16,	$02,$50,$40,$1A,	$03,$50,$00,$00,	$03,$50,$80,$07,	$03,$50,$40,$0B,	$03,$50,$C0,$12,	$03,$50,$80,$16,	$04,$50,$00,$00,	$04,$50,$C0,$03,	$04,$50,$40,$0B,	$04,$50,$00,$0F,	$04,$50,$80,$16,	$05,$50,$00,$00,	$05,$50,$C0,$03,	$05,$50,$40,$0B,	$05,$50,$C0,$12,	$05,$50,$80,$16,	$06,$50,$00,$00,	$06,$50,$80,$07,	$06,$50,$00,$0F,	$06,$50,$C0,$12,	$06,$50,$40,$1A,	$07,$50,$C0,$03,	$07,$50,$40,$0B,	$07,$50,$C0,$12,	$07,$50,$80,$16,	$08,$50,$00,$00,	$08,$50,$80,$07,	$08,$50,$00,$0F,	$08,$50,$80,$16,	$08,$50,$40,$1A,	$09,$50,$C0,$03,	$09,$50,$40,$0B,	$09,$50,$C0,$12,	$09,$50,$40,$1A,	$0A,$50,$00,$00,	$0A,$50,$80,$07,	$0A,$50,$00,$0F,	$0A,$50,$80,$16,	$0A,$50,$40,$1A,	$0B,$50,$C0,$03,	$0B,$50,$40,$0B,	$0B,$50,$00,$0F,	$0B,$50,$80,$16,	$0C,$50,$00,$00,	$0C,$50,$C0,$03,	$0C,$50,$40,$0B,	$0C,$50,$C0,$12,	$0C,$50,$80,$16,	$0D,$50,$00,$00,	$0D,$50,$C0,$03,	$0D,$50,$40,$0B,	$0D,$50,$00,$0F,	$0D,$50,$80,$16,	$0D,$50,$40,$1A,	$0E,$50,$00,$00,	$0E,$50,$80,$07,	$0E,$50,$40,$0B,	$0E,$50,$00,$0F,	$0E,$50,$C0,$12,	$0E,$50,$40,$1A,	$0F,$50,$00,$00,	$0F,$50,$C0,$03,	$0F,$50,$80,$07,	$0F,$50,$40,$0B,	$0F,$50,$00,$0F,	$0F,$50,$C0,$12,	$0F,$50,$80,$16,	$0F,$50,$40,$1A,	$10,$50,$00,$00,	$10,$50,$C0,$03,	$10,$50,$C0,$03,	$10,$50,$80,$07,	$10,$50,$40,$0B,	$10,$50,$40,$0B,	$10,$50,$00,$0F,	$10,$50,$C0,$12,	$10,$50,$C0,$12,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$80,$16,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A,	$10,$50,$40,$1A



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




badger:

defb	0,	0,	0,	0,	0,	0,	0,	0,	1,	255,	240,	0,	0,	0,	0
defb	0,	0,	0,	0,	0,	0,	0,	0,	127,	0,	24,	0,	0,	0,	0
defb	63,	240,	0,	0,	0,	0,	0,	1,	192,	0,	8,	0,	0,	0,	0
defb	96,	31,	224,	0,	0,	0,	0,	7,	0,	0,	8,	0,	0,	0,	0
defb	64,	0,	63,	0,	0,	0,	0,	28,	0,	0,	8,	0,	0,	0,	0
defb	96,	0,	1,	240,	63,	255,	255,	240,	0,	0,	8,	0,	0,	0,	0
defb	48,	0,	0,	31,	224,	0,	0,	64,	0,	0,	24,	0,	0,	0,	0
defb	24,	0,	0,	0,	0,	0,	0,	0,	0,	0,	16,	0,	0,	0,	0
defb	14,	0,	0,	0,	0,	0,	0,	0,	0,	0,	48,	0,	0,	0,	0
defb	3,	0,	0,	0,	0,	0,	0,	7,	128,	0,	32,	0,	0,	0,	0
defb	1,	192,	0,	0,	0,	0,	0,	15,	240,	0,	96,	0,	0,	0,	0
defb	0,	96,	0,	0,	0,	0,	0,	7,	254,	0,	192,	0,	0,	0,	0
defb	0,	48,	0,	0,	0,	0,	0,	1,	255,	128,	224,	0,	0,	0,	0
defb	0,	24,	0,	0,	0,	0,	0,	0,	127,	224,	48,	0,	0,	0,	0
defb	0,	8,	0,	0,	0,	0,	0,	0,	31,	248,	28,	0,	0,	0,	0
defb	0,	24,	0,	0,	0,	0,	0,	0,	7,	252,	6,	0,	0,	0,	0
defb	0,	112,	0,	0,	0,	0,	0,	0,	3,	255,	3,	0,	0,	0,	0
defb	0,	192,	0,	0,	0,	0,	0,	0,	0,	255,	129,	128,	0,	0,	0
defb	1,	128,	0,	0,	0,	0,	0,	0,	0,	63,	224,	224,	0,	0,	0
defb	1,	1,	192,	0,	0,	0,	0,	0,	0,	31,	240,	48,	0,	0,	0
defb	3,	7,	224,	0,	0,	0,	0,	0,	0,	7,	248,	24,	0,	0,	0
defb	6,	15,	224,	0,	0,	0,	0,	0,	0,	1,	252,	12,	0,	0,	0
defb	12,	31,	192,	0,	0,	0,	0,	0,	0,	0,	255,	6,	0,	0,	0
defb	8,	63,	128,	0,	0,	0,	0,	56,	0,	0,	127,	131,	0,	0,	0
defb	24,	63,	0,	0,	0,	0,	0,	63,	0,	0,	31,	193,	128,	0,	0
defb	16,	126,	0,	0,	0,	0,	0,	31,	192,	0,	15,	224,	192,	0,	0
defb	48,	254,	0,	0,	124,	0,	0,	31,	224,	0,	3,	240,	96,	0,	0
defb	32,	252,	0,	7,	255,	192,	0,	15,	240,	0,	1,	248,	48,	0,	0
defb	33,	252,	0,	31,	255,	248,	0,	15,	128,	0,	0,	252,	24,	0,	0
defb	97,	248,	0,	63,	255,	255,	128,	0,	0,	0,	0,	62,	12,	0,	0
defb	67,	248,	0,	127,	255,	255,	240,	0,	0,	0,	0,	31,	4,	0,	0
defb	67,	248,	0,	255,	255,	255,	254,	0,	0,	0,	0,	15,	134,	0,	0
defb	67,	248,	0,	255,	255,	255,	255,	192,	0,	0,	0,	3,	195,	0,	0
defb	67,	248,	0,	255,	255,	255,	255,	248,	0,	0,	0,	1,	225,	128,	0
defb	67,	248,	1,	255,	255,	255,	255,	254,	0,	0,	0,	0,	240,	192,	0
defb	67,	248,	1,	255,	255,	255,	255,	255,	192,	0,	0,	0,	112,	96,	0
defb	67,	248,	1,	255,	255,	255,	255,	255,	248,	0,	0,	0,	56,	48,	0
defb	67,	248,	1,	255,	255,	255,	255,	255,	255,	0,	0,	0,	28,	16,	0
defb	67,	248,	0,	255,	255,	254,	0,	15,	255,	224,	0,	0,	6,	24,	0
defb	67,	248,	0,	255,	255,	248,	0,	0,	63,	248,	0,	0,	3,	12,	0
defb	67,	252,	0,	255,	255,	240,	124,	0,	1,	255,	0,	0,	1,	134,	0
defb	65,	252,	0,	127,	255,	224,	254,	124,	0,	31,	192,	0,	0,	130,	0
defb	97,	254,	0,	127,	255,	226,	253,	124,	120,	3,	248,	0,	0,	3,	0
defb	33,	255,	0,	63,	255,	198,	125,	61,	60,	0,	255,	0,	0,	1,	0
defb	32,	255,	0,	31,	255,	207,	123,	187,	187,	112,	127,	192,	0,	1,	0
defb	48,	255,	128,	15,	255,	143,	123,	187,	187,	118,	63,	240,	125,	129,	0
defb	16,	127,	192,	7,	255,	143,	51,	151,	151,	47,	31,	248,	1,	161,	0
defb	24,	127,	224,	3,	255,	159,	183,	215,	199,	143,	31,	254,	0,	33,	0
defb	8,	63,	240,	1,	255,	159,	183,	206,	0,	0,	31,	255,	128,	1,	0
defb	12,	31,	252,	0,	127,	143,	143,	128,	0,	0,	31,	255,	252,	1,	0
defb	4,	31,	255,	0,	63,	143,	192,	0,	63,	255,	255,	255,	255,	1,	0
defb	6,	15,	255,	224,	15,	195,	0,	31,	255,	255,	255,	255,	255,	193,	0
defb	3,	7,	255,	255,	3,	192,	3,	255,	255,	255,	255,	255,	255,	195,	0
defb	1,	129,	255,	255,	255,	240,	63,	255,	15,	255,	255,	255,	255,	130,	0
defb	0,	192,	255,	255,	255,	255,	248,	0,	0,	0,	255,	255,	255,	130,	0
defb	0,	96,	63,	255,	255,	254,	0,	0,	0,	0,	1,	255,	255,	6,	0
defb	0,	48,	15,	255,	255,	224,	0,	0,	0,	0,	0,	15,	248,	4,	0
defb	0,	24,	1,	255,	254,	0,	0,	0,	0,	0,	0,	0,	0,	12,	0
defb	0,	14,	0,	0,	0,	0,	1,	255,	255,	240,	0,	0,	0,	24,	0
defb	0,	3,	128,	0,	0,	0,	255,	0,	0,	31,	240,	0,	0,	48,	0
defb	0,	0,	224,	0,	0,	31,	128,	0,	0,	0,	31,	192,	3,	224,	0
defb	0,	0,	62,	0,	3,	240,	0,	0,	0,	0,	0,	127,	254,	0,	0
defb	0,	0,	3,	255,	254,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0
defb	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0



badger2:

