unit CryptUnit;

interface

uses
  IdGlobal;

const
  Base64ABC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

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

function HexStrToBytes(Value: string): TIdBytes;

implementation

uses
  IdHashSHA, System.SysUtils, System.NetEncoding;

function HexStrToBytes(Value: string): TIdBytes;
var
  i: Integer;
begin
  if Value.Length > 0 then
    for i := 1 to Value.Length div 2 do
      AppendByte(Result, StrToInt('$' + Copy(Value, ((i - 1) * 2) + 1, 2)));
end;

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
      //�������� ����� ����� ��� �����-��������� � �����-���������
      Temp := Temp shl j;
      Dest := Dest shl 1;
      //���� ������� ��� �����-��������� ����� 1, �� � ����� ��������� ������������� ������� ��� � 1
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
  //������� �������� ���� = (�����)
  //���� ����, ���� �������������� ��� ����� � ��� �����, ���� �������������� 1 ����
  //�� ��������, ��� ������������ ������ ������� �� 4 ��������
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

