AYMake Russian Version
Utility for creating AY-files.
Author Sergey Bulba
Idea James McKay
(c)2001 S.V. Bulba
2 of September 2001

Using.
------

AYMake designed as Win32 console command line-based tool.
For start working type in command line:

	AYMakeR [inifilename]

Inifilename is name of text file with special instructions for AYMakeR utility.
If inifilename was specified then AYMakeR generates AY-file with same name but
with extension .ay. If inifile is bad then AYMakeR outputs to the screen error
messages.

INI-file structure.
-------------------

There are 17 keywords are defined in AYMakeR (you can use both small and
capital chars, AYMakeR converts it to small in any way). All keywords
has default value, so you can miss some keys in INI-file.

1. Author
This keyword is used to define songs author string. Due to limitations of
AY-file specifications, Author string only one for whole AY-file. Default
value is empty string.

2. Misc
This keyword is used to define string called "Miscellaneous". Also, due to
limitations of AY-file specifications, Misc-string only one for whole AY-file.
Default value is empty string.

3. FileVersion
This keyword is used to define release version of AY-file. If you are doing
AY-file first time, you can to define FileVersion = 0. If you'll rebuild this
file in future, you can change FileVersion to 1 and so on. Range for this key
is from 0 to 255. Default value is 0.

4. PlayerVersion
This keyword defines required AY-files player version. If you do not know what
player version you need, use 0. Range is from 0 to 255. Default value is 0.
For more information, see AY-files specifications.

5. Ripper
Extra key for string with information about you (AY-files creator). If you want
write some words in AY-file about yourself, use this key. But I recommend do not
do it. Default value is empty string.

6. FirstSong
Song number from which playing starts. Song number 0 is 1st, 1 is 2nd and so on.
Range is from 0 to 255. Default value is 0. FirstSong can not be greater then
number of song in created AY-file.

7. NewSong
Special key to tell to AYMakeR that new song is defined from next line. No any
values for this key.

8. Name
This keyword is used to define song name string. Name string can be defined for
each song of AY-file. Default value is empty string.

9. Stack
Key for defining Z80 SP-register value for current song. Default value is 0.
Available range is from 0 to 65535.

10. INIT
Key defines address of initialization routine in Z80 memory. Default value is 0,
i.e. due to AY-file specification equal to first block loading address.
Available range is from 0 to 65535.

11. INTERRUPT
Key defines address of interrupt-handling routine. Default value is 0. Available
range is from 0 to 65535.

12. SongLength
Length of song in seconds or 1/50 of second (interrupts). Finally, value is
converted to the 1/50 of second. So, available range is from 1 to 65535
interrupts. No default value.

13. FadeLength
Length of fade at the end of song in seconds or interrupts. Available range is
from 0 to 65535 interrupts. Default value is 0 (recommended).

14. HiReg
Value for high part of all Z80 common registers (see AY-file specification).
Default value is 0.

15. LoReg
Value for low part of all Z80 common registers (see AY-file specification).
Default value is 0.

16. CodeName
String with block file name. This block contents part of Z80 memory. Each song
of AY-file can have one or more blocks. No default value.

17. CodeAddress
Address in Z80 memory of block defined by CodeName key. Available range is from
1 to 65535. No default value.

Some examples of key using:

----------------------------------[example begin]
Author=TAO of ACF
Misc=(c)Codemasters
NewSong
SongLength=8000
CodeName=Block1.bin
CodeAddress=32768
CodeName=Block2.bin
CodeAddress=#7F3E
NewSong
CodeName=Block3.bin
CodeAddress=32768
SongLength=1:30
----------------------------------[example end]

Some rules for creating INI-files.
1.  Use any text editor
2.  Empty lines are ignored
3.  One line can contain only one keyword and its value
4.  Use chars of keywords in any case
5.  Tabulators and spaces around of keywords and its values are ignored
6.  NewSong defines current (new) song
7.  Current song related keywords could be used only after NewSong keyword
8.  Each CodeName keyword defines new block for current song
9.  CodeAddress can and must be specified only after CodeName
10. Each block length is equal to corresponding file length
11. If several identical keywords are met then last value is used
12. Ripper keyword simply puts to AY-file corresponding string. You can see
    it only in text or hex viewer, for example
13. Before creating AY-files, please, read AY-file specifications
14. Numeric values can be decimal (ex.: 32768) and hex (ex.: #8000)
15. Time values can be ordinary numbers for defining 1/50 of seconds (ex: 15000
    or #13E) or special time format: 1:50.2465, that means "1 minut and 50.2465
    seconds"

Due to described rules, you can see next completely identical lines:

----------------------------------[example begin]
SongLength=1:30
SongLength      =	1:30.000
	SongLength	=4500
SONGLENGTH = #1194
 Songlength      =	0:90.000
----------------------------------[example end]

AY-file specifications.
-----------------------

This is text from readme.txt of Micro Speccy (an AY-files player)

- AY-file format (thanks to Patrik Rak for help).

  Originally this format was supporting on Amiga's DeliTracker (DeliAY plug-in).
  Therefore, all word data is in Motorola order (from hi to low). Also, all
  pointers are signed and relative (from current position in file to pointed
  data). So, AY-file is sequences of records. First record is header. Here you
  are:

  TAYFileHeader=packed record
   FileID,			//'ZXAY'
   TypeID:longword;		//'EMUL'
   FileVersion,			//Version of song file (release version)
   PlayerVersion:byte;		//Required player version. Micro Speccy
				//works as player of version 3.
				//Now available values:
				//0       Use zero, if you do not
				//        know what player version
				//        you need
				//All other player versions and short
				//description of these players next:
				//1       initial player version
				//2       first 256 bytes is
				//        filled with 0xC9 (ret),
				//        not just last init byte
				//3       PC rewrite, different
				//        Z80 init routine, full
				//        Z80 emulation, supports
				//        48k tunes.
   PSpecialPlayer,		//It's for tunes which contained "custom
				//player" in m68k assembly. As Patrik Rak
				//is saying, exists only one AY-file of this
				//kind. So, can be simply ignored.
   PAuthor,PMisc:smallint;	//Relative pointers to the
				//Author and Misc NTStrings
   NumOfSongs,FirstSong:byte;	//Number of songs and first song values, both
				//are decreased by 1
   PSongsStructure:smallint;	//Relative pointer to song structure
  end;

  Next is song structure (repeated NumOfSongs + 1 times):

  TSongStructure=packed record
   PSongName,PSongData:smallint;//Relative pointers to NTStr song
				//name and song data
   end;

  All described above is rightly for any AY-file. Following data only for
  TypeID = 'EMUL'. Next is song data:
 
  TSongData=packed record
   AChan,BChan,
   CChan,Noise:byte;		//These are actually four bytes which specify
				//which Amiga channels will play which AY
				//channel (A,B,C and Noise, respectively). The
				//legal value is any permutation of 0,1,2,3.
				//The most common is 0,1,2,3. Not used in
				//Micro Speccy, of course
   SongLength:word;		//Song duration in 1/50 of second. If ZERO then
				//length is unknown (infinitely). Not used in
				//Micro Speccy
   FadeLength:word;		//Duration of volume fade after end of song in
				//1/50 of second. Not used in Micro Speccy
   HiReg,LoReg:byte;		//HiReg and LoReg for all common registers:
				//AF,AF',HL,HL',DE,DE',BC,BC',IX and IY
   PPoints,			//Relative pointer to points data
   PAddresses:smallint;		//Relative pointer to blocks data
  end;

  Next is points data:

  TPoints = packed record
   Stack,Init,Inter:word;	//Values for SP, INIT and INTERRUPT addresses
  end;

  Next is blocks data (words, offsets are signed):

      Address1			//Address of 1st block in Z80 memory
      Length1			//Length of 1st block
      Offset1			//Relative offset in AY-file to this block
      Address2                  //and for 2nd block
      Length2
      Offset2
      ...
      AddressN			//and for Nth (last) block
      LengthN
      OffsetN
      ENDWORD                   //ZERO word (end of blocks data)
				//so block can't have ZERO
				//address

  Notes from Patrik Rak:
  The word values should be always aligned at 2 byte offsets. Otherwise the
  DeliAY will crash (it's the limitation of the m68000).

  In case Address+Length > 65536, DeliAY decreases the size to make it
  == 65536.

  From me:
  In case CurrPositionInAYFile+Offset+Length > AYFileSize, MicroSpeccy
  and AYPlay decreases the size to make it == AYFileSize. I must to say,
  that if it is then this is broken AY-file. But there are many that ones
  in the world.

- How player of version 3 must play one of songs of AY File

    a) Fill #0000-#00FF range with #C9 value
    b) Fill #0100-#3FFF range with #FF value
    c) Fill #4000-#FFFF range with #00 value
    d) Place to #0038 address #FB value
    e) if INIT equal to ZERO then place to first CALL instruction address of
       first AY file block instead of INIT (see next f) and g) steps)
    f) if INTERRUPT equal to ZERO then place at ZERO address next player:

		DI
		CALL    INIT
	LOOP:	IM      2
		EI
		HALT
		JR      LOOP

    g) if INTERRUPT not equal to ZERO then place at ZERO address next player:

		DI
		CALL    INIT
	LOOP:	IM      1
		EI
		HALT
		CALL INTERRUPT
		JR      LOOP

    h) Load all blocks for this song
    i) Load all common lower registers with LoReg value (including AF
       register)
    j) Load all common higher registers with HiReg value
    k) Load into I register 3 (this player version)
    l) load to SP stack value from points data of this song
    m) Load to PC ZERO value
    n) Disable Z80 interrupts and set IM0 mode
    o) Emulate resetting of AY chip
    p) Start Z80 emulation

  As you can see, blocks of AY files can to rewrite standard player routine
  with own one. So, if you can not adapt some of tunes to standard player,
  you can write own player and place it at INIT address or even at 0x0001
  address (block of AY-file can be loaded at any address except 0x0000).

Links.
------

- AYMakeR supporting site
  http://bulba.at.kz/
- AYMakeR author
  Sergey Bulba, vorobey@mail.khstu.ru
- .AY files and AYmake V0.11 by James McKay (24/05/2000)
  http://www.void.jump.org/projectay
- Amstrad CPC .AY files (1.3 Mb archive)
  http://cracktros.planet-d.net/cpc/emulcpc.zip
- Project AY site developer
  bcass, bcass01@hotmail.com

Source text.
------------

AYMakeR comes together with its source text in Pascal. You can use it as free
as you want.

Understanding AY-files ideology.
--------------------------------

For understanding AY-files ideology, I am recommending to split several already
existing AY-files. I had wrote special tool called "aysplitr". You can download
it from http://bulba.at.kz/. There are also old "aysplit" for old James McKay's
AYMake.
