font equ 15360           ; address of font in Spectrum ROM
attr equ 22528           ; start of attributes
scrollblock equ 56+64    ; full block
emptyblock equ 7+64      ; empty block

     ; http://clrhome.org/table       <--- use this awesome resource for z80 instruction explanation

     org 50000           ; address to call, e.g. let a = usr 50000

     ld a,71             ; white ink (7) on black paper (0), bright (64).
     ld (23693),a        ; set our screen colours.
     xor a               ; quick way to load accumulator with zero.
     call 8859           ; set permanent border colours.
     call 3503           ; ROM routine - clears screen, opens chan 2.

     di                  ; disable interrupts

 main:

     ld hl, attr+1       ; point to start of attributes + 1
     ld de, attr         ; point to start of attributes
     rept 8              ; macro 8 rows
     rept 31             ; macro 31 characters
     ldi                 ; (hl) -> (de)
     endm
     inc hl              ; skip character
     inc de              ; "
     endm



scrollingmessage:

     ld a,(bitnumber)    ; bitnumber 0-7
     dec a               ; decrement
     ld (bitnumber),a    ; store back
     jp nz, continuecharacter  ; last bit?  If not, jump

resetbit:
     ld a,8              ; last bit copied in byte, so reset back to new character
     ld (bitnumber),a    ; and store
newletter:
     ld hl, message      ; 2nd and 3rd byte of this instruction is poked back to keep a tally on where we are in the message
     inc hl              ; next char
     ld a, (hl)          ; load next character of message
     or a                ; set zero flag if a=0 (e.g. if last byte of message)
     jr nz, cont         ; if non-zero, jump and carry on
     ld hl, message      ; if zero, loop message back to beginning
     ld a, 32            ; and set first char to space
cont:ld (newletter+1),hl ; store the incremented message pointer back in newletter+1

     ld hl,0             ;clear hl
     ld l,a              ;l = a
     add hl, hl          ;multiply hl * 8
     add hl, hl          ;to get bitmap offset
     add hl, hl          ;of character in Spectrum ROM
     ld  bc, font        ;address of charset in ROM
     add hl, bc          ;add offset to get the address of the 8*8 bitmap
     ld de, character    ;store the character we're working on
     rept 8              ;desintation of 8*8 character bitmap to character
     ldi                 ;(hl) -> (de)
     endm




continuecharacter:


     ld hl, character    ;location of stored 8*8 bitmap of character we're working on
     ld de, attr+31      ;location of end of first attribute line

     ld bc, 32           ;for quick addition later

     rept 8              ;macro it 8 times
     rlc (hl)            ;rotate left through carry, getting left-most bit of character bitmap
     sbc a,a             ;a is 255 when a bit is present, or 0 when not present
     and scrollblock     ;and and XOR with to produce full
     xor emptyblock      ;or empty block
     ld (de), a          ;write or clear block to screen
     inc hl              ;next row down in 8*8 bitmap
     ex de, hl           ;swap so that we can add 32 to hl
     add hl, bc
     ex de, hl
     endm



     ; ld a,0
     ; out (254),a
     
     ei                  ;enable interrupts
     halt                ;wait for VBL
     di                  ;disabled interrupts

     jp main             ;loop

quit:

     ei
     ret
     



message:
defb    " Big scrolly message....           "
defb    0
bitnumber:
defb    8
character:
defb    0,0,0,0,0,0,0,0
