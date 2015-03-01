{
AY Splitter for AYMakeR.
(c)2001 Bulba S.V.
You can use this source as you want without any reference to author.
Originally compiled in Delphi 5.
Main procedures are originally used in Micro Speccy an AY-files player.
Sergey Bulba, vorobey@mail.khstu.ru, http://bulba.at.kz/
}
{$APPTYPE CONSOLE}
type
  TAYFileHeader = packed record
    FileID,TypeID:longword;
    FileVersion,PlayerVersion:byte;
    PSpecialPlayer,PAuthor,PMisc:smallint;
    NumOfSongs,FirstSong:byte;
    PSongsStructure:smallint;
  end;
  TSongStructure = packed record
    PSongName,PSongData:smallint;
  end;
  TSongData = packed record
    ChanA,ChanB,ChanC,Noise:byte;
    SongLength:word;
    FadeLength:word;
    HiReg,LoReg:byte;
    PPoints,PAddresses:smallint;
  end;
  TPoints = packed record
    Stek,Init,Inter:word;
  end;
  TBlock = record
    Offs:integer;
    Len:word;
    Name:string;
  end;

var
  AYFile:file;
  CurPos,CurPos2:integer;
  AYFileHeader:TAYFileHeader;
  SongStructure:TSongStructure;
  SongData:TSongData;
  AuthorString,MiscString:string;
  Ch:Char;
  Wrd:word;
  SongName:array of string;
  SongPoints:array of record
    Points:TPoints;
    HReg,LReg:byte;
    Len,Fade:word;
    NumOfBlocks:longword;
    Code,Leng:array of word;
    Offs:array of integer
  end;
  FileIsOpened:boolean;
  Z80_RAM:array[0..65535] of byte;
  FINI:textfile;
  FilName,ShortFName:string;
  Block:array of TBlock;
  Blocks:integer;

 function IntelWord(Wrd:word):word;
 asm
  xchg al,ah
 end;

 function IntelSmallInt(SmI:smallint):smallint;
 asm
  xchg al,ah
 end;

 function OpenAYFile(FName:string):boolean;
 Var
  i:integer;
  SmI:smallint;
 begin
  Result := False;
  AssignFile(AYFile,FName);
  FileMode := 0;
  Reset(AYFile,1);
  BlockRead(AYFile,AYFileHeader,SizeOf(AYFileHeader));
  if AYFileHeader.FileID <> $5941585A then
   Writeln('Error: Not .AY file')
  else if AYFileHeader.TypeID <> $4C554D45 then
   Writeln('Error: Not Z80 emulation .AY file')
  else
   begin
    seek(AYFile,IntelSmallInt(AYFileHeader.PAuthor) + 12);
    AuthorString := '';
    repeat
     BlockRead(AYFile,Ch,1);
     if Ch <> #0 then AuthorString := AuthorString + Ch;
    until Ch = #0;
    seek(AYFile,IntelSmallInt(AYFileHeader.PMisc) + 14);
    MiscString := '';
    repeat
     BlockRead(AYFile,Ch,1);
     if Ch <> #0 then MiscString := MiscString + Ch;
    until Ch = #0;
    seek(AYFile,IntelSmallInt(AYFileHeader.PSongsStructure) + 18);
    for i := 0 to AYFileHeader.NumOfSongs do
     begin
      BlockRead(AYFile,SongStructure,4);
      CurPos := FilePos(AYFile);
      Seek(AYFile,IntelSmallInt(SongStructure.PSongName) + CurPos - 4);
      SetLength(SongName,i + 1);
      SongName[i]:='';
      repeat
       BlockRead(AYFile,Ch,1);
       if Ch <> #0 then SongName[i] := SongName[i] + Ch;
      until Ch = #0;
      Seek(AYFile,IntelSmallInt(SongStructure.PSongData) + CurPos - 2);
      BlockRead(AYFile,SongData,SizeOf(SongData));
      CurPos2 := FilePos(AYFile);
      Seek(AYFile,IntelSmallInt(SongData.PPoints) + CurPos2 - 4);
      SetLength(SongPoints,i + 1);
      BlockRead(AYFile,SongPoints[i].Points,SizeOf(TPoints));
      SongPoints[i].Points.Stek := IntelWord(SongPoints[i].Points.Stek);
      SongPoints[i].Points.Init := IntelWord(SongPoints[i].Points.Init);
      SongPoints[i].Points.Inter := IntelWord(SongPoints[i].Points.Inter);
      SongPoints[i].NumOfBlocks := 0;
      Seek(AYFile,IntelSmallInt(SongData.PAddresses) + CurPos2 - 2);
      SongPoints[i].Len := IntelWord(SongData.SongLength);
      SongPoints[i].Fade := IntelWord(SongData.FadeLength);
      SongPoints[i].HReg := SongData.HiReg;
      SongPoints[i].LReg := SongData.LoReg;
      BlockRead(AYFile,Wrd,2);
      While Wrd<>0 do
       begin
        inc(SongPoints[i].NumOfBlocks);
        SetLength(SongPoints[i].Code,SongPoints[i].NumOfBlocks);
        SetLength(SongPoints[i].Leng,SongPoints[i].NumOfBlocks);
        SetLength(SongPoints[i].Offs,SongPoints[i].NumOfBlocks);
        SongPoints[i].Code[SongPoints[i].NumOfBlocks - 1] := IntelWord(Wrd);
        if SongPoints[i].Points.Init = 0 then
         SongPoints[i].Points.Init := IntelWord(Wrd);
        BlockRead(AYFile,Wrd,2);
        SongPoints[i].Leng[SongPoints[i].NumOfBlocks - 1] := IntelWord(Wrd);
        if SongPoints[i].Leng[SongPoints[i].NumOfBlocks - 1] +
            SongPoints[i].Code[SongPoints[i].NumOfBlocks - 1] > 65536 then
         SongPoints[i].Leng[SongPoints[i].NumOfBlocks - 1] :=
            65536 - SongPoints[i].Code[SongPoints[i].NumOfBlocks - 1];
        BlockRead(AYFile,SmI,2);
        SongPoints[i].Offs[SongPoints[i].NumOfBlocks - 1] :=
                   IntelSmallInt(SmI) + FilePos(AYFile) - 2;
        if SongPoints[i].Offs[SongPoints[i].NumOfBlocks - 1] +
            SongPoints[i].Leng[SongPoints[i].NumOfBlocks-1] >
                    FileSize(AYFile) then
         SongPoints[i].Leng[SongPoints[i].NumOfBlocks - 1] :=
           FileSize(AYFile) -
           SongPoints[i].Offs[SongPoints[i].NumOfBlocks - 1];
        BlockRead(AYFile,Wrd,2)
       end;
      Seek(AYFile,CurPos)
     end;
    Result := True
   end;
  if Result then FileIsOpened := True else CloseFile(AYFile)
 end;

 procedure SplitSong(Num:integer);
  function BlockExist(Offs:integer;Leng:word;var Name:string):boolean;
  var
   i:integer;
  begin
   for i := 0 to Blocks - 1 do
    begin
     if (Block[i].Offs = Offs) and (Block[i].Len = Leng) then
      begin
       Name := Block[i].Name;
       Result := True;
       Exit
      end;
    end;
   Result := False;
  end;
 var
  i:integer;
  s1,s2:string;
  FL:file;
 begin
  Str(SongPoints[Num].Points.Stek,s1);
  Writeln(FINI,'Stack=' + s1);
  Str(SongPoints[Num].Points.Init,s1);
  Writeln(FINI,'INIT=' + s1);
  Str(SongPoints[Num].Points.Inter,s1);
  Writeln(FINI,'INTERRUPT=' + s1);
  Str(SongPoints[Num].HReg,s1);
  Writeln(FINI,'HiReg=' + s1);
  Str(SongPoints[Num].LReg,s1);
  Writeln(FINI,'LoReg=' + s1);
  Str(SongPoints[Num].Len,s1);
  Writeln(FINI,'SongLength=' + s1);
  Str(SongPoints[Num].Fade,s1);
  Writeln(FINI,'FadeLength=' + s1);
  for i := 0 to SongPoints[Num].NumOfBlocks - 1 do
   begin
    Str(i + 1,s1);
    if not BlockExist(SongPoints[Num].Offs[i],SongPoints[Num].Leng[i],s2) then
     begin
      Str(Num,s2);
      s2 := ShortFName + '_' + s2 + '_' + s1 + '.BIN';
      inc(Blocks);
      SetLength(Block,Blocks);
      Block[Blocks - 1].Offs := SongPoints[Num].Offs[i];
      Block[Blocks - 1].Len := SongPoints[Num].Leng[i];
      Block[Blocks - 1].Name := s2;
      Seek(AYFile,SongPoints[Num].Offs[i]);
      BlockRead(AYFile,Z80_RAM[SongPoints[Num].Code[i]],SongPoints[Num].Leng[i]);
      AssignFile(FL,s2);
      Rewrite(FL,1);
      BlockWrite(FL,Z80_RAM[SongPoints[Num].Code[i]],SongPoints[Num].Leng[i]);
      CloseFile(FL)
     end;
    Writeln(FINI,'CodeName=' + s2);
    Str(SongPoints[Num].Code[i],s2);
    Writeln(FINI,'CodeAddress=' + s2);
   end;
 end;

var
 i:integer;
 s:string;
begin
if ParamCount <> 1 then
 begin
  Writeln('    Usage:');
  Writeln('  aysplitr [ayfilename]')
 end
else
 begin
  s := ParamStr(1);
  i := Length(s);
  while (i > 0) and (s[i] <> '.') do dec(i);
  if i < 2 then
   begin
    Writeln('    Usage:');
    Writeln('  aysplitr [ayfilename]');
    Exit
   end;
  FilName := Copy(s,1,i - 1);
  if Length(FilName) < 4 then
   ShortFName := FilName
  else
   ShortFName := Copy(FilName,1,3);
  if OpenAYFile(ParamStr(1)) then
   begin
    Assign(FINI,FilName + '.INI');
    Rewrite(FINI);
    Writeln('Author: ' + AuthorString);
    Writeln('Misc: ' + MiscString);
    Writeln(FINI,'Author=' + AuthorString);
    Writeln(FINI,'Misc=' + MiscString);
    Str(AYFileHeader.FirstSong,s);
    Writeln(FINI,'FirstSong=' + s);
    Str(AYFileHeader.FileVersion,s);
    Writeln(FINI,'FileVersion=' + s);
    Str(AYFileHeader.PlayerVersion,s);
    Writeln(FINI,'PlayerVersion=' + s);
    Blocks := 0;
    for i := 0 to AYFileHeader.NumOfSongs do
     begin
      Str(i,s);
      Writeln('Song #' + s + ' Title: ' + SongName[i]);
      Writeln(FINI,'NewSong');
      Writeln(FINI,'Name=' + SongName[i]);
      SplitSong(i);
     end;
    CloseFile(FINI);
    CloseFile(AYFile)
   end
 end  
end.
