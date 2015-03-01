     org 61240-3

     jp     go

init:
       incbin "cyb_0_1.bin"
music:
      incbin "cyb_0_2.bin"


go:
      ld hl, music
      ld de, 65000
      ld bc, 20

      ldir


       ei
       call 65000

loop:
       halt
        call 61240
       jp loop