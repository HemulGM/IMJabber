unit IM.Classes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Types, System.Classes, Jabber.Types, Jabber, GmXml,
  System.Generics.Collections, HGM.Controls.VirtualTable, Vcl.Imaging.pngimage,
  Vcl.Graphics, HGM.Common.Utils, MD5Hash;

type
  TSoundType = (sndError, sndOnline, sndMessage, sndOffline, sndSubscribe, sndWelcome, sndGroup);

  TRosterList = class(TTableData<TRosterItem>)
    procedure Delete(Index: Integer); overload;
    procedure Delete(JID: string); overload;
    function Update(Item: TRosterItem): Integer;
    procedure Clear; override;
    function Find(JID: string): TRosterItem;
    function GetNick(JID: string): string;
  end;

  TGroupItem = record
    Name: string;
  end;

  TGroupList = class(TTableData<TGroupItem>)
    function Add(Value: TGroupItem): Integer; overload; override;
    function Add(GroupName: string): Integer; overload;
    function Add(Groups: TStringList): Boolean; overload;
    function ToList(CheckedOnly: Boolean): TArray<string>;
  end;

  TBookmarkType = (btConference, btUrl);

  TBookmarkItem = record
    //Common
    BookmarkType: TBookmarkType;
    Name: string;
    //Conference
    JID: string;
    Nick: string;
    Password: string;
    Autojoin: Boolean;
    //Url
    Url: string;
  end;

  TBookmarkList = class(TTableData<TBookmarkItem>)
  end;

const
  DefaultColors: array[$0..$F] of TColor = ($00E6A330, $00B98843, $00874FCB, $00A6A441, $00C16579, $003B86DB, $005445DD, $0055AA63, $00D5D52B, $00AB5656, $00E6A330, $00B98843, $00874FCB, $00A6A441, $00C16579, $003B86DB);

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;

function CreateDefaultAvatar(JID, Name: string; Mask: TPngImage; Color: TColor = clNone): TPngImage;

function SetDefaultAvatar(Item: TRosterItem; Mask: TPngImage): Boolean;

function CreateColorFromJID(JID: string): TColor;

function CreateShortName(JID, Name: string): string;

implementation

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;
var
  BMPSmooth: TBitmap;
begin
  BMPSmooth := SmoothStrechDraw(Source, TRect.Create(0, 0, Mask.Width - 1, Mask.Height - 1));
  Result := TPngImage.CreateBlank(COLOR_RGB, 16, Mask.Width, Mask.Height);
  //DrawBitmapTo(0, 0, BMPSmooth, Result);
  Result.Canvas.Draw(0, 0, BMPSmooth);
  Result.CreateAlpha;
  BMPSmooth.Free;
  ApplyMask(0, 0, Mask, Result);
end;

function CreateShortName(JID, Name: string): string;
var
  i: Integer;
begin
  if Name.IsEmpty then
    Result := Copy(JID, 1, 2)
  else
  begin
    Result := Name[1];
    i := Pos(' ', Name);
    if (i > 0) and ((i + 1) < Length(Name)) then
      Result := Result + Name[i + 1] //Инициалы
    else if Name.Length > 1 then
      Result := Copy(Name, 1, 2); //Первые две буквы
  end;
  Result := AnsiUpperCase(Result);
end;

function CreateColorFromJID(JID: string): TColor;
var
  Hash: string;
begin
  Hash := MD5(JID);
  Result := DefaultColors[StrToInt('$' + Hash[Length(Hash)])];
end;

function CreateDefaultAvatar(JID, Name: string; Mask: TPngImage; Color: TColor): TPngImage;
var
  S: string;
  R: TRect;
begin
  if Color = clNone then
  begin
    Color := CreateColorFromJID(JID);
  end;
  Result := TPngImage.CreateBlank(COLOR_RGBALPHA, 16, Mask.Width, Mask.Height);
  PNGColored(0, 0, Mask, Result, Color);
  with Result.Canvas do
  begin
    R := TRect.Create(0, 0, Mask.Width, Mask.Height);
    R.Inflate(-4, -4);
    Brush.Style := bsClear;
    Font.Size := 16;
    Font.Color := clWhite;
    S := CreateShortName(JID, Name);
    TextRect(R, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
  end;
  ApplyMask(0, 0, Mask, Result);
end;

function SetDefaultAvatar(Item: TRosterItem; Mask: TPngImage): Boolean;
begin
  Item.Color := CreateColorFromJID(Item.JID);
  if Assigned(Item.Avatar) then
    Item.Avatar.Free;
  Item.Avatar := CreateDefaultAvatar(Item.JID, Item.Name, Mask, Item.Color);
  Result := True;
end;

{ TRosterList }

procedure TRosterList.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
  inherited Clear;
end;

procedure TRosterList.Delete(Index: Integer);
begin
  Items[Index].Free;
  inherited Delete(Index);
end;

procedure TRosterList.Delete(JID: string);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if Items[i].JID = JID then
    begin
      Delete(i);
      Exit
    end;
end;

function TRosterList.Find(JID: string): TRosterItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Items[i].JID = JID then
      Exit(Items[i]);
  end;
end;

function TRosterList.GetNick(JID: string): string;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if Items[i].JID = JID then
      Exit(Items[i].Name);
  Result := JID;
end;

function TRosterList.Update(Item: TRosterItem): Integer;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if Items[i].JID = Item.JID then
    begin
      Items[i].Name := Item.Name;
      Items[i].Subscription := Item.Subscription;
      Items[i].Groups.SetStrings(Item.Groups);
      UpdateTable;
      Exit(i);
    end;
  end;

  Result := Add(Item);
end;

{ TGropuList }

function TGroupList.Add(Value: TGroupItem): Integer;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if Items[i].Name = Value.Name then
      Exit(i);
  end;
  Result := inherited Add(Value);
end;

function TGroupList.Add(GroupName: string): Integer;
var
  Item: TGroupItem;
begin
  Item.Name := GroupName;
  Result := Add(Item);
end;

function TGroupList.Add(Groups: TStringList): Boolean;
var
  Item: TGroupItem;
  i: Integer;
begin
  Result := False;
  for i := 0 to Groups.Count - 1 do
  begin
    Item.Name := Groups[i];
    if Add(Item) >= 0 then
      Result := True;
  end;
end;

function TGroupList.ToList(CheckedOnly: Boolean): TArray<string>;
var
  i: Integer;
begin
  SetLength(Result, Count);
  for i := 0 to Count - 1 do
  begin
    if CheckedOnly then
    begin
      if Checked[i] then
        Result[i] := Items[i].Name;
    end
    else
      Result[i] := Items[i].Name;
  end;
end;

end.

