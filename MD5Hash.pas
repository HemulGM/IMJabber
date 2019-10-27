unit MD5Hash;

interface

uses
  Windows, SysUtils;

function MD5(Value: string): string;

implementation

var
  HEX: array[Word] of string;

function MD5(Value: string): string;
type
  Pint = ^Integer;

  TData = array[0..15] of DWORD;
var
  Len: Integer;
  Data: ^TData;
  CurrentHash: array[0..3] of DWord;
  P: array[0..7] of Word absolute CurrentHash;
  A, B, C, D: DWord;

  function LRot32(a, b: LongWord): LongWord;
  asm
        mov     ecx, edx
        rol     eax, cl
  end;

begin
  Len := Length(Value);
  SetLength(Value, 64);
  Value[Len + 1] := #$80;
  FillChar(Value[Len + 2], 63 - Len, 0);
  Pint(@Value[57])^ := Len * 8;

  CurrentHash[0] := $67452301;
  CurrentHash[1] := $efcdab89;
  CurrentHash[2] := $98badcfe;
  CurrentHash[3] := $10325476;

  A := CurrentHash[0];
  B := CurrentHash[1];
  C := CurrentHash[2];
  D := CurrentHash[3];

  Data := Addr(Value[1]);

  A := B + LRot32(A + (D xor (B and (C xor D))) + Data^[0] + $d76aa478, 7);
  D := A + LRot32(D + (C xor (A and (B xor C))) + Data^[1] + $e8c7b756, 12);
  C := D + LRot32(C + (B xor (D and (A xor B))) + Data^[2] + $242070db, 17);
  B := C + LRot32(B + (A xor (C and (D xor A))) + Data^[3] + $c1bdceee, 22);
  A := B + LRot32(A + (D xor (B and (C xor D))) + Data^[4] + $f57c0faf, 7);
  D := A + LRot32(D + (C xor (A and (B xor C))) + Data^[5] + $4787c62a, 12);
  C := D + LRot32(C + (B xor (D and (A xor B))) + Data^[6] + $a8304613, 17);
  B := C + LRot32(B + (A xor (C and (D xor A))) + Data^[7] + $fd469501, 22);
  A := B + LRot32(A + (D xor (B and (C xor D))) + Data^[8] + $698098d8, 7);
  D := A + LRot32(D + (C xor (A and (B xor C))) + Data^[9] + $8b44f7af, 12);
  C := D + LRot32(C + (B xor (D and (A xor B))) + Data^[10] + $ffff5bb1, 17);
  B := C + LRot32(B + (A xor (C and (D xor A))) + Data^[11] + $895cd7be, 22);
  A := B + LRot32(A + (D xor (B and (C xor D))) + Data^[12] + $6b901122, 7);
  D := A + LRot32(D + (C xor (A and (B xor C))) + Data^[13] + $fd987193, 12);
  C := D + LRot32(C + (B xor (D and (A xor B))) + Data^[14] + $a679438e, 17);
  B := C + LRot32(B + (A xor (C and (D xor A))) + Data^[15] + $49b40821, 22);

  A := B + LRot32(A + (C xor (D and (B xor C))) + Data^[1] + $f61e2562, 5);
  D := A + LRot32(D + (B xor (C and (A xor B))) + Data^[6] + $c040b340, 9);
  C := D + LRot32(C + (A xor (B and (D xor A))) + Data^[11] + $265e5a51, 14);
  B := C + LRot32(B + (D xor (A and (C xor D))) + Data^[0] + $e9b6c7aa, 20);
  A := B + LRot32(A + (C xor (D and (B xor C))) + Data^[5] + $d62f105d, 5);
  D := A + LRot32(D + (B xor (C and (A xor B))) + Data^[10] + $02441453, 9);
  C := D + LRot32(C + (A xor (B and (D xor A))) + Data^[15] + $d8a1e681, 14);
  B := C + LRot32(B + (D xor (A and (C xor D))) + Data^[4] + $e7d3fbc8, 20);
  A := B + LRot32(A + (C xor (D and (B xor C))) + Data^[9] + $21e1cde6, 5);
  D := A + LRot32(D + (B xor (C and (A xor B))) + Data^[14] + $c33707d6, 9);
  C := D + LRot32(C + (A xor (B and (D xor A))) + Data^[3] + $f4d50d87, 14);
  B := C + LRot32(B + (D xor (A and (C xor D))) + Data^[8] + $455a14ed, 20);
  A := B + LRot32(A + (C xor (D and (B xor C))) + Data^[13] + $a9e3e905, 5);
  D := A + LRot32(D + (B xor (C and (A xor B))) + Data^[2] + $fcefa3f8, 9);
  C := D + LRot32(C + (A xor (B and (D xor A))) + Data^[7] + $676f02d9, 14);
  B := C + LRot32(B + (D xor (A and (C xor D))) + Data^[12] + $8d2a4c8a, 20);

  A := B + LRot32(A + (B xor C xor D) + Data^[5] + $fffa3942, 4);
  D := A + LRot32(D + (A xor B xor C) + Data^[8] + $8771f681, 11);
  C := D + LRot32(C + (D xor A xor B) + Data^[11] + $6d9d6122, 16);
  B := C + LRot32(B + (C xor D xor A) + Data^[14] + $fde5380c, 23);
  A := B + LRot32(A + (B xor C xor D) + Data^[1] + $a4beea44, 4);
  D := A + LRot32(D + (A xor B xor C) + Data^[4] + $4bdecfa9, 11);
  C := D + LRot32(C + (D xor A xor B) + Data^[7] + $f6bb4b60, 16);
  B := C + LRot32(B + (C xor D xor A) + Data^[10] + $bebfbc70, 23);
  A := B + LRot32(A + (B xor C xor D) + Data^[13] + $289b7ec6, 4);
  D := A + LRot32(D + (A xor B xor C) + Data^[0] + $eaa127fa, 11);
  C := D + LRot32(C + (D xor A xor B) + Data^[3] + $d4ef3085, 16);
  B := C + LRot32(B + (C xor D xor A) + Data^[6] + $04881d05, 23);
  A := B + LRot32(A + (B xor C xor D) + Data^[9] + $d9d4d039, 4);
  D := A + LRot32(D + (A xor B xor C) + Data^[12] + $e6db99e5, 11);
  C := D + LRot32(C + (D xor A xor B) + Data^[15] + $1fa27cf8, 16);
  B := C + LRot32(B + (C xor D xor A) + Data^[2] + $c4ac5665, 23);

  A := B + LRot32(A + (C xor (B or (not D))) + Data^[0] + $f4292244, 6);
  D := A + LRot32(D + (B xor (A or (not C))) + Data^[7] + $432aff97, 10);
  C := D + LRot32(C + (A xor (D or (not B))) + Data^[14] + $ab9423a7, 15);
  B := C + LRot32(B + (D xor (C or (not A))) + Data^[5] + $fc93a039, 21);
  A := B + LRot32(A + (C xor (B or (not D))) + Data^[12] + $655b59c3, 6);
  D := A + LRot32(D + (B xor (A or (not C))) + Data^[3] + $8f0ccc92, 10);
  C := D + LRot32(C + (A xor (D or (not B))) + Data^[10] + $ffeff47d, 15);
  B := C + LRot32(B + (D xor (C or (not A))) + Data^[1] + $85845dd1, 21);
  A := B + LRot32(A + (C xor (B or (not D))) + Data^[8] + $6fa87e4f, 6);
  D := A + LRot32(D + (B xor (A or (not C))) + Data^[15] + $fe2ce6e0, 10);
  C := D + LRot32(C + (A xor (D or (not B))) + Data^[6] + $a3014314, 15);
  B := C + LRot32(B + (D xor (C or (not A))) + Data^[13] + $4e0811a1, 21);
  A := B + LRot32(A + (C xor (B or (not D))) + Data^[4] + $f7537e82, 6);
  D := A + LRot32(D + (B xor (A or (not C))) + Data^[11] + $bd3af235, 10);
  C := D + LRot32(C + (A xor (D or (not B))) + Data^[2] + $2ad7d2bb, 15);
  B := C + LRot32(B + (D xor (C or (not A))) + Data^[9] + $eb86d391, 21);

  Inc(CurrentHash[0], A);
  Inc(CurrentHash[1], B);
  Inc(CurrentHash[2], C);
  Inc(CurrentHash[3], D);

  Result := HEX[P[0]];
  for Len := 1 to 7 do
    Result := Concat(Result, HEX[P[Len]]);
end;

var
  DEC: Integer;

initialization
  for DEC := 0 to $FFFF do
  begin
    HEX[DEC] := Concat(IntToHex(DEC and $FF, 2), IntToHex(DEC shr 8, 2));
  end;

end.

