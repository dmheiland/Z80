        org 40000
       ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
       ld (23693),a        ; set our screen colours.
       xor a               ; quick way to load accumulator with zero.
       call 8859           ; set permanent border colours.

; Set up the graphics.

       ld hl,blocks        ; address of user-defined graphics data.
       ld (23675),hl       ; make UDGs point to it.

; Okay, let's start the game.

       call 3503           ; ROM routine - clears screen, opens chan 2.

       xor a               ; zeroise accumulator.
       ld (dead),a         ; set flag to say player is alive.

; Initialise coordinates.

       ld hl,21+15*256     ; load hl pair with starting coords.
       ld (plx),hl         ; set player coords.
       ld hl,255+255*256   ; player's bullets default.
       ld (pbx),hl         ; set bullet coords.

       ld b,10             ; number of segments to initialise.
       ld hl,segmnt        ; segment table.
segint ld (hl),1           ; start off moving right.
       inc hl
       ld (hl),0           ; start at top.
       inc hl
       ld (hl),b           ; use B register as y coordinate.
       inc hl
       djnz segint         ; repeat until all initialised.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player base symbol.

; Now we want to fill the play area with mushrooms.

       ld a,68             ; green ink (4) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary colours.
       ld b,50             ; start with a few.
mushlp ld a,22             ; control code for AT character.
       rst 16
       call random         ; get a 'random' number.
       and 15              ; want vertical in range 0 to 15.
       rst 16
       call random         ; want another pseudo-random number.
       and 31              ; want horizontal in range 0 to 31.
       rst 16
       ld a,145            ; UDG 'B' is the mushroom graphic.
       rst 16              ; put mushroom on screen.
       djnz mushlp         ; loop back until all mushrooms displayed.

; This is the main loop.

mloop  equ $

; Delete the player.

       call basexy         ; set the x and y positions of the player.
       call wspace         ; display space over player.

; Now we've deleted the player we can move him before redisplaying him
; at his new coordinates.

       ld bc,63486         ; keyboard row 1-5/joystick port 2.
       in a,(c)            ; see what keys are pressed.
       rra                 ; outermost bit = key 1.
       push af             ; remember the value.
       call nc,mpl         ; it's being pressed, move left.
       pop af              ; restore accumulator.
       rra                 ; next bit along (value 2) = key 2.
       push af             ; remember the value.
       call nc,mpr         ; being pressed, so move right.
       pop af              ; restore accumulator.
       rra                 ; next bit (value 4) = key 3.
       push af             ; remember the value.
       call nc,mpd         ; being pressed, so move down.
       pop af              ; restore accumulator.
       rra                 ; next bit (value 8) reads key 4.
       push af             ; remember the value.
       call nc,mpu         ; it's being pressed, move up.
       pop af              ; restore accumulator.
       rra                 ; last bit (value 16) reads key 5.
       call nc,fire        ; it's being pressed, move up.

; Now he's moved we can redisplay the player.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player.

; Now for the bullet.  First let's check to see if it's hit anything.

       call bchk           ; check bullet position.

       call dbull          ; delete bullets.
       call moveb          ; move bullets.
       call bchk           ; check new position of bullets.
       call pbull          ; print bullets at new position.

; Now for the centipede segments.

       ld ix,segmnt        ; table of segment data.
       ld b,10             ; number of segments in table.
censeg push bc
       ld a,(ix)           ; is segment switched on?
       inc a               ; 255=off, increments to zero.
       call nz,proseg      ; it's active, process segment.
       pop bc
       ld de,3             ; 3 bytes per segment.
       add ix,de           ; get next segment in ix registers.
       djnz censeg         ; repeat for all segments.

       halt                ; delay.

       ld a,(dead)         ; was the player killed by a segment?
       and a
       ret nz              ; player killed - lose a life.

; Jump back to beginning of main loop.

       jp mloop

; Move player left.

mpl    ld hl,ply           ; remember, y is the horizontal coord!
       ld a,(hl)           ; what's the current value?
       and a               ; is it zero?
       ret z               ; yes - we can't go any further left.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       dec b               ; look 1 square to the left.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       dec (hl)            ; subtract 1 from y coordinate.
       ret

; Move player right.

mpr    ld hl,ply           ; remember, y is the horizontal coord!
       ld a,(hl)           ; what's the current value?
       cp 31               ; is it at the right edge (31)?
       ret z               ; yes - we can't go any further left.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       inc b               ; look 1 square to the right.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       inc (hl)            ; add 1 to y coordinate.
       ret

; Move player up.

mpu    ld hl,plx           ; remember, x is the vertical coord!
       ld a,(hl)           ; what's the current value?
       cp 4                ; is it at upper limit (4)?
       ret z               ; yes - we can go no further then.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       dec c               ; look 1 square up.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       dec (hl)            ; subtract 1 from x coordinate.
       ret

; Move player down.

mpd    ld hl,plx           ; remember, x is the vertical coord!
       ld a,(hl)           ; what's the current value?
       cp 21               ; is it already at the bottom (21)?
       ret z               ; yes - we can't go down any more.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       inc c               ; look 1 square down.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       inc (hl)            ; add 1 to x coordinate.
       ret

; Fire a missile.

fire   ld a,(pbx)          ; bullet vertical coord.
       inc a               ; 255 is default value, increments to zero.
       ret nz              ; bullet on screen, can't fire again.
       ld hl,(plx)         ; player coordinates.
       dec l               ; 1 square higher up.
       ld (pbx),hl         ; set bullet coords.
       ret

bchk   ld a,(pbx)          ; bullet vertical.
       inc a               ; is it at 255 (default)?
       ret z               ; yes, no bullet on screen.
       ld bc,(pbx)         ; get coords.
       call atadd          ; find attribute here.
       cp 68               ; mushrooms are bright (64) + green (4).
       jr z,hmush          ; hit a mushroom!
       ret

hmush  ld a,22             ; AT control code.
       rst 16
       ld a,(pbx)          ; bullet vertical.
       rst 16
       ld a,(pby)          ; bullet horizontal.
       rst 16
       call wspace         ; set INK colour to white.
kilbul ld a,255            ; x coord of 255 = switch bullet off.
       ld (pbx),a          ; destroy bullet.
       ret

; Move the bullet up the screen 1 character position at a time.

moveb  ld a,(pbx)          ; bullet vertical.
       inc a               ; is it at 255 (default)?
       ret z               ; yes, no bullet on screen.
       sub 2               ; 1 row up.
       ld (pbx),a
       ret

; Set up the x and y coordinates for the player's gunbase position,
; this routine is called prior to display and deletion of gunbase.

basexy ld a,22             ; AT code.
       rst 16
       ld a,(plx)          ; player vertical coord.
       rst 16              ; set vertical position of player.
       ld a,(ply)          ; player's horizontal position.
       rst 16              ; set the horizontal coord.
       ret

; Show player at current print position.

splayr ld a,69             ; cyan ink (5) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary screen colours.
       ld a,144            ; ASCII code for User Defined Graphic 'A'.
       rst 16              ; draw player.
       ret

pbull  ld a,(pbx)          ; bullet vertical.
       inc a               ; is it at 255 (default)?
       ret z               ; yes, no bullet on screen.
       call bullxy
       ld a,16             ; INK control char.
       rst 16
       ld a,6              ; 6 = yellow.
       rst 16
       ld a,147            ; UDG 'D' is used for player bullets.
       rst 16
       ret

dbull  ld a,(pbx)          ; bullet vertical.
       inc a               ; is it at 255 (default)?
       ret z               ; yes, no bullet on screen.
       call bullxy         ; set up bullet coordinates.
wspace ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary screen colours.
       ld a,32             ; SPACE character.
       rst 16              ; display space.
       ret

; Set up the x and y coordinates for the player's bullet position,
; this routine is called prior to display and deletion of bullets.

bullxy ld a,22             ; AT code.
       rst 16
       ld a,(pbx)          ; player bullet vertical coord.
       rst 16              ; set vertical position of player.
       ld a,(pby)          ; bullet's horizontal position.
       rst 16              ; set the horizontal coord.
       ret

segxy  ld a,22             ; ASCII code for AT character.
       rst 16              ; display AT code.
       ld a,(ix+1)         ; get segment x coordinate.
       rst 16              ; display coordinate code.
       ld a,(ix+2)         ; get segment y coordinate.
       rst 16              ; display coordinate code.
       ret

proseg call segcol         ; segment collision detection.
       ld a,(ix)           ; check if segment was switched off
       inc a               ; by collision detection routine.
       ret z               ; it was, so this segment is now dead.
       call segxy          ; set up segment coordinates.
       call wspace         ; display a space, white ink on black.
       call segmov         ; move segment.
       call segcol         ; new segment position collision check.
       ld a,(ix)           ; check if segment was switched off
       inc a               ; by collision detection routine.
       ret z               ; it was, so this segment is now dead.
       call segxy          ; set up segment coordinates.
       ld a,2              ; attribute code 2 = red segment.
       ld (23695),a        ; set temporary attributes.
       ld a,146            ; UDG 'C' to display segment.
       rst 16
       ret
segmov ld a,(ix+1)         ; x coord.
       ld c,a              ; GP x area.
       ld a,(ix+2)         ; y coord.
       ld b,a              ; GP y area.
       ld a,(ix)           ; status flag.
       and a               ; is the segment heading left?
       jr z,segml          ; going left - jump to that bit of code.

; so segment is going right then!

segmr  ld a,(ix+2)         ; y coord.
       cp 31               ; already at right edge of screen?
       jr z,segmd          ; yes - move segment down.
       inc a               ; look right.
       ld b,a              ; set up GP y coord.
       call atadd          ; find attribute address.
       cp 68               ; mushrooms are bright (64) + green (4).
       jr z,segmd          ; mushroom to right, move down instead.
       inc (ix+2)          ; no obstacles, so move right.
       ret

; so segment is going left then!

segml  ld a,(ix+2)         ; y coord.
       and a               ; already at left edge of screen?
       jr z,segmd          ; yes - move segment down.
       dec a               ; look right.
       ld b,a              ; set up GP y coord.
       call atadd          ; find attribute address at (dispx,dispy).
       cp 68               ; mushrooms are bright (64) + green (4).
       jr z,segmd          ; mushroom to left, move down instead.
       dec (ix+2)          ; no obstacles, so move left.
       ret

; so segment is going down then!

segmd  ld a,(ix)           ; segment direction.
       xor 1               ; reverse it.
       ld (ix),a           ; store new direction.
       ld a,(ix+1)         ; y coord.
       cp 21               ; already at bottom of screen?
       jr z,segmt          ; yes - move segment to the top.

; At this point we're moving down regardless of any mushrooms that 
; may block the segment's path.  Anything in the segment's way will
; be obliterated.

       inc (ix+1)          ; haven't reached the bottom, move down.
       ret

; moving segment to the top of the screen.

segmt  xor a               ; same as ld a,0 but saves 1 byte.
       ld (ix+1),a         ; new x coordinate = top of screen.
       ret

; Segment collision detection.
; Checks for collisions with player and player's bullets.

segcol ld a,(ply)          ; bullet y position.
       cp (ix+2)           ; is it identical to segment y coord?
       jr nz,bulcol        ; y coords differ, try bullet instead.
       ld a,(plx)          ; player x coord.
       cp (ix+1)           ; same as segment?
       jr nz,bulcol        ; x coords differ, try bullet instead.

; So we have a collision with the player.

killpl ld (dead),a         ; set flag to say that player is now dead.
       ret

; Let's check for a collision with the player's bullet.

bulcol ld a,(pbx)          ; bullet x coords.
       inc a               ; at default value?
       ret z               ; yes, no bullet to check for.
       cp (ix+1)           ; is bullet x coord same as segment x coord?
       ret nz              ; no, so no collision.
       ld a,(pby)          ; bullet y position.
       cp (ix+2)           ; is it identical to segment y coord?
       ret nz              ; no - no collision this time.

; So we have a collision with the player's bullet.

       call dbull          ; delete bullet.
       ld a,22             ; AT code.
       rst 16
       ld a,(pbx)          ; player bullet vertical coord.
       inc a               ; 1 line down.
       rst 16              ; set vertical position of mushroom.
       ld a,(pby)          ; bullet's horizontal position.
       rst 16              ; set the horizontal coord.
       ld a,16             ; ASCII code for INK control.
       rst 16
       ld a,4              ; 4 = colour green.
       rst 16              ; we want all mushrooms in this colour!
       ld a,145            ; UDG 'B' is the mushroom graphic.
       rst 16              ; put mushroom on screen.
       call kilbul         ; kill the bullet.
       ld (ix),a           ; kill the segment.
       ld hl,1        ; number of segments.
       dec (hl)            ; decrement it.
       ret

; Simple pseudo-random number generator.
; Steps a pointer through the ROM (held in seed), returning
; the contents of the byte at that location.

random ld hl,(seed)        ; Pointer
       ld a,h
       and 31              ; keep it within first 8k of ROM.
       ld h,a
       ld a,(hl)           ; Get "random" number from location.
       inc hl              ; Increment pointer.
       ld (seed),hl
       ret
seed   defw 0

; Calculate address of attribute for character at (dispx, dispy).

atadd  ld a,c              ; vertical coordinate.
       rrca                ; multiply by 32.
       rrca                ; Shifting right with carry 3 times is
       rrca                ; quicker than shifting left 5 times.
       ld e,a
       and 3
       add a,88            ; 88x256=address of attributes.
       ld d,a
       ld a,e
       and 224
       ld e,a
       ld a,b              ; horizontal position.
       add a,e
       ld e,a              ; de=address of attributes.
       ld a,(de)           ; return with attribute in accumulator.
       ret

plx    defb 0              ; player's x coordinate.
ply    defb 0              ; player's y coordinate.
pbx    defb 255            ; player's bullet coordinates.
pby    defb 255
dead   defb 0              ; flag - player dead when non-zero.

; UDG graphics.

blocks defb 16,16,56,56,124,124,254,254    ; player base.
       defb 24,126,255,255,60,60,60,60     ; mushroom.
       defb 24,126,126,255,255,126,126,24  ; segment.
       defb 0,102,102,102,102,102,102,0    ; player bullet.

; Table of segments.
; Format: 3 bytes per entry, 10 segments.
; byte 1: 255=segment off, 0=left, 1=right.
; byte 2 = x (vertical) coordinate.
; byte 3 = y (horizontal) coordinate.

segmnt defb 0,0,0          ; segment 1.
       defb 0,0,0          ; segment 2.
       defb 0,0,0          ; segment 3.
       defb 0,0,0          ; segment 4.
       defb 0,0,0          ; segment 5.
       defb 0,0,0          ; segment 6.
       defb 0,0,0          ; segment 7.
       defb 0,0,0          ; segment 8.
       defb 0,0,0          ; segment 9.
       defb 0,0,0          ; segment 10.