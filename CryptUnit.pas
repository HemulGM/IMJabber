unit CryptUnit;

interface

const
  Base64ABC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

const
  C1 = 52845;
  C2 = 22719;
  PKey = 33189;

type
  TBase64Buf = array[0..2] of Byte;

  TBase64 = record
    ByteArr: TBase64Buf;
    ByteCount: Byte;
  end;

function CodeBase64(Base64: TBase64): string;

function DecodeBase64(StringValue: string): TBase64;

function Base64ToSHA(Base64Value: string): string;

function ShaHASH(Value: string): string;

function Encrypt(const S: AnsiString; Key: Word): AnsiString;

function Decrypt(const S: AnsiString; Key: Word): AnsiString;

implementation

uses
  IdGlobal, IdHashSHA, System.SysUtils, System.NetEncoding;

function Base64ToSHA(Base64Value: string): string;
var
  Hasher: TIdHashSHA1;
  Base64Bytes: TBytes;
begin
  Hasher := TIdHashSHA1.Create;
  Base64Bytes := TNetEncoding.Base64.DecodeStringToBytes(Base64Value);
  Result := Hasher.HashBytesAsHex(TIdBytes(Base64Bytes));
  Hasher.Free;
end;

function ShaHASH(Value: string): string;
var
  Hasher: TIdHashSHA1;
begin
  Hasher := TIdHashSHA1.Create;
  Result := LowerCase(Hasher.HashStringAsHex(Trim(Value)));
  Hasher.Free;
end;

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

function Decrypt(const S: AnsiString; Key: Word): AnsiString;

  function Decode(const S: AnsiString): AnsiString;
  const
    Map: array[ansiChar] of Byte = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 0, 0, 0, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0, 0, 0, 0, 0, 0, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  var
    I: LongInt;
  begin
    case Length(S) of
      2:
        begin
          I := Map[S[1]] + (Map[S[2]] shl 6);
          SetLength(Result, 1);
          Move(I, Result[1], Length(Result))
        end;
      3:
        begin
          I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12);
          SetLength(Result, 2);
          Move(I, Result[1], Length(Result))
        end;
      4:
        begin
          I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12) + (Map[S[4]] shl 18);
          SetLength(Result, 3);
          Move(I, Result[1], Length(Result))
        end
    end
  end;

  function PreProcess(const S: AnsiString): AnsiString;
  var
    SS: AnsiString;
  begin
    SS := S;
    Result := '';
    while SS <> '' do
    begin
      Result := Result + Decode(Copy(SS, 1, 4));
      Delete(SS, 1, 4)
    end
  end;

  function InternalDecrypt(const S: AnsiString; Key: Word): AnsiString;
  var
    I: Word;
    Seed: Word;
  begin
    Result := S;
    Seed := Key;
    for I := 1 to Length(Result) do
    begin
      Result[I] := ansiChar(Byte(Result[I]) xor (Seed shr 8));
      Seed := (Byte(S[I]) + Seed) * Word(C1) + Word(C2)
    end
  end;

begin
  Result := InternalDecrypt(PreProcess(S), Key)
end;

function Encrypt(const S: AnsiString; Key: Word): AnsiString;

  function Encode(const S: AnsiString): AnsiString;
  const
    Map: array[0..63] of Char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + 'abcdefghijklmnopqrstuvwxyz0123456789+/';
  var
    I: LongInt;
  begin
    I := 0;
    Move(S[1], I, Length(S));
    case Length(S) of
      1:
        Result := Map[I mod 64] + Map[(I shr 6) mod 64];
      2:
        Result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64];
      3:
        Result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64] + Map[(I shr 18) mod 64]
    end
  end;

  function PostProcess(const S: AnsiString): AnsiString;
  var
    SS: AnsiString;
  begin
    SS := S;
    Result := '';
    while SS <> '' do
    begin
      Result := Result + Encode(Copy(SS, 1, 3));
      Delete(SS, 1, 3)
    end
  end;

  function InternalEncrypt(const S: AnsiString; Key: Word): AnsiString;
  var
    I: Word;
    Seed: Word;
  begin
    Result := S;
    Seed := Key;
    for I := 1 to Length(Result) do
    begin
      Result[I] := ansiChar(Byte(Result[I]) xor (Seed shr 8));
      Seed := (Byte(Result[I]) + Seed) * Word(C1) + Word(C2)
    end
  end;

begin
  Result := PostProcess(InternalEncrypt(S, Key))
end;

end.

