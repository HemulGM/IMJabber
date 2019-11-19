unit IM.Classes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Types, System.Classes, Jabber.Types, Jabber, GmXml,
  System.Generics.Collections, HGM.Controls.VirtualTable;

type
  TSoundType = (sndError, sndOnline, sndMessage, sndOffline, sndSubscribe, sndWelcome, sndGroup);

  TRosterList = class(TTableData<TRosterItem>)
    procedure Delete(Index: Integer);
    function Update(Item: TRosterItem): Integer;
    procedure Clear;
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

implementation

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

end.

