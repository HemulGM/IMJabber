unit Base64Unit;

interface

const
  Base64ABC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

type
  TBase64 = record
    ByteArr: array[0..2] of Byte;
    ByteCount: Byte;
  end;

function CodeBase64(Base64: TBase64): string;

function DecodeBase64(StringValue: string): TBase64;

implementation

function CodeBase64(Base64: TBase64): string;
var
  i, j: Byte;
  Dest, Sour: Byte;
  NextNum: Byte;
  Temp: Byte;
begin
  Result := '';
  NextNum := 1;
  Dest := 0;
  for i := 0 to 2 do
  begin
    Sour := Base64.ByteArr[i];
    for j := 0 to 7 do
    begin
      Temp := Sour;
      //Побитный сдвиг влево для байта-источника и байта-приемника
      Temp := Temp shl j;
      Dest := Dest shl 1;
      //Если старший бит байта-источника равен 1, то в байте приемнике устанавливаем младший бит в 1
      if (Temp and 128) = 128 then
        Dest := Dest or 1;
      Inc(NextNum);
      if NextNum > 6 then
      begin
        Result := Result + Base64ABC[Dest + 1];
        NextNum := 1;
        Dest := 0;
      end;
    end;
  end;
  //добавим конечный знак = (равно)
  //один знак, если обрабатываются два байта и два знака, если обрабатывается 1 байт
  //не забываем, что кодированный стринг состоит из 4 символов
  if Base64.ByteCount < 3 then
    for i := 0 to (2 - Base64.ByteCount) do
      Result[4 - i] := '=';
end;

function DecodeBase64(StringValue: string): TBase64;
var
  i, j: Integer;
  Dest, Sour: Byte;
  NextNum: Byte;
  CurPos: Byte;
begin
  CurPos := 0;
  Dest := 0;
  NextNum := 1;
  FillChar(Result, SizeOf(Result), #0);
  for i := 1 to 4 do
  begin
    for j := 0 to 5 do
    begin
      if StringValue[i] = '=' then
        Sour := 0
      else
        Sour := Pos(StringValue[i], Base64ABC) - 1;
      Sour := Sour shl j;
      Dest := Dest shl 1;
      if (Sour and 32) = 32 then
        Dest := Dest or 1;
      Inc(NextNum);
      if NextNum > 8 then
      begin
        NextNum := 1;
        Result.ByteArr[CurPos] := Dest;
        if StringValue[i] = '=' then
          Result.ByteArr[CurPos] := 0
        else
          Result.ByteCount := CurPos + 1;
        Inc(CurPos);
        Dest := 0;
      end;
    end;
  end;
end;

end.

