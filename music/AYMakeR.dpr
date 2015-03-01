{
AY Make Russian Version.
(c)2001 Bulba S.V.
You can use this source as you want without any reference to author.
Originally compiled in Delphi 5.
Sergey Bulba, vorobey@mail.khstu.ru, http://bulba.at.kz/
}

program AYMakeR;

{$APPTYPE CONSOLE}

uses SysUtils;

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
  TAddresses = packed record
    Addr,Leng:word;
    Offs:smallint;
  end;
var
  AYFileHeader:TAYFileHeader;
  SongStructure:packed array of TSongStructure;
  SongData:packed array of TSongData;
  Points:packed array of TPoints;
  BlockFiles:array of string;
  Strings:array of record
    Value:string;
    Used:boolean;
  end;  
  Ripper:string;
  SongModel:array of record
    Name:integer;
    BlockFile:array of record
      Number:integer;
      Coords:TAddresses;
    end;
  end;
  Ini:text;
  WorkString:string;
  LineCounter,SongCounter,StringCounter,BlockFileCounter:integer;
  AuthorSt,MiscSt:integer;
const
  NTegs = 16;
  Tegs:array [0..NTegs - 1] of string =
    ('author','misc','ripper','name','firstsong','stack','hireg','loreg',
     'codeaddress','codename','interrupt','init','fileversion',
     'playerversion','songlength','fadelength');

function NewString(ns:string):integer;
 var
  Index:integer;
 begin
  for Index := 0 to StringCounter - 1 do
   if Strings[Index].Value = ns then
    begin
     Result := Index;
     exit
    end;
  Result := StringCounter;
  inc(StringCounter);
  SetLength(Strings,StringCounter);
  Strings[Result].Value := ns;
  Strings[Result].Used := False
 end;

function NewBlockFile(ns:string):integer;
 var
  Index:integer;
 begin
  for Index := 0 to BlockFileCounter - 1 do
   if BlockFiles[Index] = ns then
    begin
     Result := Index;
     exit
    end;
  Result := BlockFileCounter;
  inc(BlockFileCounter);
  SetLength(BlockFiles,BlockFileCounter);
  BlockFiles[Result] := ns
 end;

procedure ExitIniError(EN:integer);
 const
  Errors:array[0..7] of string =
    ('Bad line structure','Unknown key word','Song key words without "NewSong"',
     'Can not evalute numeric value','"CodeAddress" without "CodeName"',
     '"CodeAddress" can not be zero','Value out of range',
     'Can not evalute time value');
 begin
   Close(Ini);
   Writeln('Error in line number ' + IntToStr(LineCounter) + ': '+ Errors[EN]);
   Halt
 end;

function FindTegNumber(t:string):integer;
 var
  i:integer;
 begin
  Result := -1;
  i := 0;
  while i < NTegs do
   begin
    if Tegs[i] = t then
     begin
      Result := i;
      exit
     end;
    inc(i)
   end;
 end;

function MyStrToInt(s:string;sz:integer):longword;
 var
  ErCd,i:integer;
 begin
  Val(S,Result,ErCd);
  if ErCd <> 0 then
   if S[1] = '#' then
    begin
     if S = '#' then ExitIniError(3);
     s := UpperCase(s);
     i := 2;
     Result := 0;
     while i <= Length(s) do
      if s[i] in ['0'..'9'] then
       begin
        Result := Result * 16 + byte(s[i]) - $30;
        inc(i)
       end
      else if s[i] in ['A'..'F'] then
       begin
        Result := Result * 16 + byte(s[i]) - byte('A') + 10;
        inc(i)
       end
      else
       ExitIniError(3)
    end
   else
    ExitIniError(3);
  if ((sz = 1) and (Result > 255)) or
     ((sz = 2) and (Result > 65535)) then
   ExitIniError(6)
 end;

function MyTimeToInt(s:string):longword;
 var
  DotsPos:integer;
  Mins,ErrPos:integer;
  Secs:real;
 begin
  DotsPos := Pos(':',s);
  if DotsPos = 0 then
   begin
    Result := MyStrToInt(s,2);
    exit
   end;
  if (DotsPos = 1) or (DotsPos = Length(s)) then ExitIniError(7);
  Val(Copy(s,1,DotsPos - 1),Mins,ErrPos);
  if ErrPos <> 0 then ExitIniError(7);
  Val(Copy(s,DotsPos + 1,Length(s)),Secs,ErrPos);
  if ErrPos <> 0 then ExitIniError(7);
  Result := round((Mins * 60 + Secs) * 50);
  if Result > 65535 then ExitIniError(6)
 end;

procedure RecognizeString(ws:string);
 var
  Teg,Parameter:string;
  EqPos,Index,TegNumber:integer;
 begin
   ws := Trim(ws);
   if ws = '' then exit;
   EqPos := Pos('=',ws);
   if EqPos = 0 then
    if LowerCase(ws) = 'newsong' then
     begin
      Index := SongCounter;
      inc(SongCounter);
      SetLength(SongModel,SongCounter);
      SetLength(SongStructure,SongCounter);
      SetLength(SongData,SongCounter);
      SetLength(Points,SongCounter);
      SongModel[Index].Name := 0;
      SetLength(SongModel[Index].BlockFile,0);
      SongData[Index].ChanA := 0;
      SongData[Index].ChanB := 1;
      SongData[Index].ChanC := 2;
      SongData[Index].Noise := 3;
      SongData[Index].SongLength := 0;
      SongData[Index].FadeLength := 0;
      SongData[Index].HiReg := 0;
      SongData[Index].LoReg := 0;
      Points[Index].Stek := 0;
      Points[Index].Init := 0;
      Points[Index].Inter := 0;
      exit
     end;
   if (EqPos < 2) or (EqPos = Length(ws)) then ExitIniError(0);
   Teg := LowerCase(Trim(Copy(ws,1,EqPos - 1)));
   Parameter := Trim(Copy(ws,EqPos + 1,Length(ws)));
   TegNumber := FindTegNumber(Teg);
   case TegNumber of
    -1:ExitIniError(1);
    0 :AuthorSt := NewString(Parameter);
    1 :MiscSt := NewString(Parameter);
    2 :Ripper := Parameter;
    3 :if SongCounter = 0 then
        ExitIniError(2)
       else
        SongModel[SongCounter - 1].Name := NewString(Parameter);
    4 :AYFileHeader.FirstSong := MyStrToInt(Parameter,1);
    5 :if SongCounter = 0 then
        ExitIniError(2)
       else
        Points[SongCounter - 1].Stek := MyStrToInt(Parameter,2);
    6 :if SongCounter = 0 then
        ExitIniError(2)
       else
        SongData[SongCounter - 1].HiReg := MyStrToInt(Parameter,1);
    7 :if SongCounter = 0 then
        ExitIniError(2)
       else
        SongData[SongCounter - 1].LoReg := MyStrToInt(Parameter,1);
    8 :if SongCounter = 0 then
        ExitIniError(2)
       else
        begin
         Index := Length(SongModel[SongCounter - 1].BlockFile);
         if Index = 0 then
          ExitIniError(4)
         else
          begin
           EqPos := MyStrToInt(Parameter,2);
           if EqPos = 0 then ExitIniError(5);
           SongModel[SongCounter - 1].BlockFile[Index - 1].Coords.Addr := EqPos
          end;
        end;
    9 :if SongCounter = 0 then
        ExitIniError(2)
       else
        begin
         Index := Length(SongModel[SongCounter - 1].BlockFile);
         SetLength(SongModel[SongCounter - 1].BlockFile,Index + 1);
         SongModel[SongCounter - 1].BlockFile[Index].Number :=
                                                 NewBlockFile(Parameter);
         SongModel[SongCounter - 1].BlockFile[Index].Coords.Addr := 0
        end;
    10:if SongCounter = 0 then
        ExitIniError(2)
       else
        Points[SongCounter - 1].Inter := MyStrToInt(Parameter,2);
    11:if SongCounter = 0 then
        ExitIniError(2)
       else
        Points[SongCounter - 1].Init := MyStrToInt(Parameter,2);
    12:AYFileHeader.FileVersion := MyStrToInt(Parameter,1);
    13:AYFileHeader.PlayerVersion := MyStrToInt(Parameter,1);
    14:if SongCounter = 0 then
        ExitIniError(2)
       else
        begin
         SongData[SongCounter - 1].SongLength := MyTimeToInt(Parameter);
         if SongData[SongCounter - 1].SongLength = 0 then
          ExitIniError(6)
        end;
    15:if SongCounter = 0 then
        ExitIniError(2)
       else
        SongData[SongCounter - 1].FadeLength := MyTimeToInt(Parameter);
   end;
 end;

procedure CheckAll;
 var
  i,j:integer;
 begin
  AYFileHeader.NumOfSongs := SongCounter - 1;
  if AYFileHeader.FirstSong >= SongCounter then
   begin
    Writeln('"FirstSong" parameter must be in range from 0 '
                + 'to number of song minus 1');
    halt
   end;
  if BlockFileCounter = 0 then
   begin
    Writeln('No any files was defined');
    halt
   end;
  for i := 0 to SongCounter - 1 do
   begin
    if Length(SongModel[i].BlockFile) = 0 then
     begin
      Writeln('No files was defined for song number ' + IntToStr(i) + '.');
      halt
     end;
    if SongData[i].SongLength = 0 then
     begin
      Writeln('"SongLength" was not defined for song number ' +
                                                        IntToStr(i) + '.');
      halt
     end;
    for j := 0 to Length(SongModel[i].BlockFile) - 1 do
     if SongModel[i].BlockFile[j].Coords.Addr = 0 then
      begin
       Writeln('"CodeAddress" not defined for song number ' +
                                                        IntToStr(i) + '.');
       halt
      end                                                  
   end;
 end;

function IntelWord(a:word):word;
asm
xchg ah,al
end;

procedure ExitError(EN:integer);
 const
  Errors:array[0..3] of string =
    ('Relative offset out of range',
     'One of block files not found or can not be open',
     'One of block file size greater than 65535 bytes',
     '"CodeAddress" plus its code length greater then 65536');
 begin
   Writeln('Error: '+ Errors[EN]);
   Halt
 end;

procedure NormalizeAll;
 var
  CurrentOffset,RO,i,j:integer;
  StOfs,Lens:array of integer;
  BlockFile:file;
 begin
  AYFileHeader.PSongsStructure := $200;
  CurrentOffset := SizeOf(TAYFileHeader) + SizeOf(TSongStructure) * SongCounter;
  for i := 0 to SongCounter - 1 do
   begin
    RO := CurrentOffset - (SizeOf(TAYFileHeader) +
                                        SizeOf(TSongStructure) * i + 2);
    if RO > 32767 then ExitError(0);
    SongStructure[i].PSongData := IntelWord(RO);
    inc(CurrentOffset,SizeOf(TSongData))
   end;
  for i := 0 to SongCounter - 1 do
   begin
    RO := CurrentOffset - (SizeOf(TAYFileHeader) + SizeOf(TSongStructure) *
                SongCounter + SizeOf(TSongData) * i + 10);
    if RO > 32767 then ExitError(0);
    SongData[i].PPoints := IntelWord(RO);
    inc(CurrentOffset,SizeOf(TPoints))
   end;
  for i := 0 to SongCounter - 1 do
   begin
    RO := CurrentOffset - (SizeOf(TAYFileHeader) + SizeOf(TSongStructure) *
                SongCounter + SizeOf(TSongData) * i + 12);
    if RO > 32767 then ExitError(0);
    SongData[i].PAddresses := IntelWord(RO);
    inc(CurrentOffset,SizeOf(TAddresses) * Length(SongModel[i].BlockFile) + 2)
   end;
  Strings[AuthorSt].Used := True;
  Strings[MiscSt].Used := True;
  for i := 0 to SongCounter - 1 do
   Strings[SongModel[i].Name].Used := True;
  SetLength(StOfs,StringCounter);
  for i := 0 to StringCounter - 1 do
   if Strings[i].Used then
    begin
     StOfs[i] := CurrentOffset;
     inc(CurrentOffset,Length(Strings[i].Value) + 1)
    end;
  RO := StOfs[AuthorSt] - 12;
  if RO > 32767 then ExitError(0);
  AYFileHeader.PAuthor := IntelWord(RO);
  RO := StOfs[MiscSt] - 14;
  if RO > 32767 then ExitError(0);
  AYFileHeader.PMisc := IntelWord(RO);
  for i := 0 to SongCounter - 1 do
   begin
    RO := StOfs[SongModel[i].Name] - (SizeOf(TAYFileHeader) +
                                        SizeOf(TSongStructure) * i);
    if RO > 32767 then ExitError(0);
    SongStructure[i].PSongName := IntelWord(RO);
   end;
  inc(CurrentOffset,Length(Ripper));
  SetLength(StOfs,BlockFileCounter);
  SetLength(Lens,BlockFileCounter);
  FileMode := 0;
  for i := 0 to BlockFileCounter - 1 do
   begin
    StOfs[i] := CurrentOffset;
    AssignFile(BlockFile,BlockFiles[i]);
    {$i-}
    Reset(BlockFile,1);
    {$i+}
    if IOResult <> 0 then ExitError(1);
    RO := FileSize(BlockFile);
    CloseFile(BlockFile);
    if RO > 65535 then ExitError(2);
    Lens[i] := RO;
    inc(CurrentOffset,RO);
   end;
  CurrentOffset := SizeOf(TAYFileHeader) +
        (SizeOf(TSongStructure) + SizeOf(TSongData) +
         SizeOf(TPoints)) * SongCounter + 4;
  for i := 0 to SongCounter - 1 do
   begin
    for j := 0 to Length(SongModel[i].BlockFile) - 1 do
     begin
      RO := StOfs[SongModel[i].BlockFile[j].Number] - CurrentOffset;
      if RO > 32767 then ExitError(0);
      SongModel[i].BlockFile[j].Coords.Offs := IntelWord(RO);
      if SongModel[i].BlockFile[j].Coords.Addr +
        Lens[SongModel[i].BlockFile[j].Number] > 65536 then ExitError(3);
      SongModel[i].BlockFile[j].Coords.Addr :=
        IntelWord(SongModel[i].BlockFile[j].Coords.Addr);
      SongModel[i].BlockFile[j].Coords.Leng :=
        IntelWord(Lens[SongModel[i].BlockFile[j].Number]);
      inc(CurrentOffset,SizeOf(TAddresses))
     end;
    inc(CurrentOffset,2)
   end;
  for i := 0 to SongCounter - 1 do
   begin
    Points[i].Stek := IntelWord(Points[i].Stek);
    Points[i].Init := IntelWord(Points[i].Init);
    Points[i].Inter := IntelWord(Points[i].Inter);
    SongData[i].SongLength := IntelWord(SongData[i].SongLength);
    SongData[i].FadeLength := IntelWord(SongData[i].FadeLength)
   end;
 end;

procedure SaveAYFile;
 const
  Zero:integer = 0;
 var
  AYFile,BlockFile:file;
  FN:string;
  i,j:integer;
  buff:array of byte;
 begin
  FN := ParamStr(1);
  i := Length(FN);
  while (i > 0) and (FN[i] <> '.') do dec(i);
  if i > 0 then FN := Copy(FN,1,i - 1);
  FN := FN + '.ay';
  AssignFile(AYFile,FN);
  Rewrite(AYFile,1);
  BlockWrite(AYFile,AYFileHeader,SizeOf(TAYFileHeader));
  for i := 0 to SongCounter - 1 do
   BlockWrite(AYFile,SongStructure[i],SizeOf(TSongStructure));
  for i := 0 to SongCounter - 1 do
   BlockWrite(AYFile,SongData[i],SizeOf(TSongData));
  for i := 0 to SongCounter - 1 do
   BlockWrite(AYFile,Points[i],SizeOf(TPoints));
  for i := 0 to SongCounter - 1 do
   begin
    for j := 0 to Length(SongModel[i].BlockFile) - 1 do
     BlockWrite(AYFile,SongModel[i].BlockFile[j].Coords,SizeOf(TAddresses));
    BlockWrite(AYFile,Zero,2)
   end;
  for i := 0 to StringCounter - 1 do
   if Strings[i].Used then
    begin
     if Length(Strings[i].Value) > 0 then
      BlockWrite(AYFile,Strings[i].Value[1],Length(Strings[i].Value));
     BlockWrite(AYFile,Zero,1);
    end;
  if Length(Ripper) > 0 then
   BlockWrite(AYFile,Ripper[1],Length(Ripper));
  for i := 0 to BlockFileCounter - 1 do
   begin
    AssignFile(BlockFile,BlockFiles[i]);
    Reset(BlockFile,1);
    j := FileSize(BlockFile);
    SetLength(buff,j);
    BlockRead(BlockFile,buff[0],j);
    CloseFile(BlockFile);
    BlockWrite(AYFile,buff[0],j);
   end;
  CloseFile(AYFile);
 end;

begin
if ParamCount <> 1 then
 begin
  Writeln('    Usage:');
  Writeln('  AYMakeR [inifilename]')
 end
else
 begin
  AssignFile(Ini,ParamStr(1));
  Reset(Ini);
  LineCounter := 0;
  SongCounter := 0;
  StringCounter := 0;
  NewString('');
  BlockFileCounter := 0;
  AYFileHeader.FileID := $5941585A;
  AYFileHeader.TypeID := $4C554D45;
  AYFileHeader.FileVersion := 0;
  AYFileHeader.PlayerVersion := 0;
  AYFileHeader.PSpecialPlayer := 0;
  AYFileHeader.FirstSong := 0;
  AuthorSt := 0;
  MiscSt := 0;
  Ripper := '';
  while not eof(Ini) do
   begin
    Readln(Ini,WorkString);
    inc(LineCounter);
    RecognizeString(WorkString);
   end;
  Close(Ini);
  CheckAll;
  NormalizeAll;
  SaveAYFile
 end
end.
