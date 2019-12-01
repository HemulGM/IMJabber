unit IM.ChatRoom;

interface

uses
  Winapi.Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, Buttons, ExtDlgs,
  IniFiles, System.ImageList, System.Actions, Jabber.Types, Vcl.Grids,
  HGM.Controls.VirtualTable, HGM.Button, IM.Classes, HGM.Controls.Chat,
  HGM.Controls.Labels;

type
  TChatElement = class(TChatMessage)
    MessageItem: TJabberMessage;
  end;

  TMessages = class(TChatItems)
    FLastDate: TDateTime;
    function Add(Value: TChatItem): Integer;
    procedure Reads(MessageItem: TJabberMessage);
  end;

  TFormChatRoom = class(TForm)
    PanelSend: TPanel;
    ImageList24: TImageList;
    BalloonHint: TBalloonHint;
    PanelInfo: TPanel;
    LabelNick: TLabel;
    LabelStatus: TLabel;
    ButtonFlatAttachment: TButtonFlat;
    ImageListIcons: TImageList;
    RichEditSend: TRichEdit;
    hChatMessages: ThChat;
    PanelRight: TPanel;
    PanelConfOccups: TPanel;
    PanelConfInfo: TPanel;
    LabelNick2: TLabel;
    LabelStatus2: TLabel;
    LabelExAvatar: TLabelEx;
    ButtonFlat1: TButtonFlat;
    Panel1: TPanel;
    Label2: TLabel;
    ButtonFlat2: TButtonFlat;
    Splitter1: TSplitter;
    PanelClient: TPanel;
    procedure ButtonSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RichEditSendResizeRequest(Sender: TObject; Rect: TRect);
    procedure RichEditSendKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
  private
    FEnterSend: Boolean;
    FJID: string;
    FNick: string;
    FMessages: TMessages;
    procedure SetJID(const Value: string);
  public
    procedure MessageMarkers(Item: TJabberMessage);
    procedure NewMessage(Item: TJabberMessage);
    class procedure SwowPopupWnd(Text: string);
    property JID: string read FJID write SetJID;
    procedure SetItem(Item: TRosterItem);
  end;

var
  FormChatRoom: TFormChatRoom;

implementation

uses
  IM.Main, IM.Account, System.DateUtils, Jabber, Math;

{$R *.dfm}

class procedure TFormChatRoom.SwowPopupWnd(Text: string);
begin
  FormMain.TrayIcon.BalloonHint := Text;
  FormMain.TrayIcon.ShowBalloonHint;
end;

procedure TFormChatRoom.FormCreate(Sender: TObject);
begin
  FMessages := TMessages.Create(hChatMessages);
  FMessages.FLastDate := Now - 60;
  hChatMessages.Items := FMessages;
end;

procedure TFormChatRoom.FormShow(Sender: TObject);
begin
  RichEditSend.Focused;
end;

procedure TFormChatRoom.MessageMarkers(Item: TJabberMessage);
begin
  FMessages.Reads(Item);
end;

procedure TFormChatRoom.SetItem(Item: TRosterItem);
begin
  if JID.IsEmpty then
    JID := LoginFromJID(Item.JID);
  FNick := Item.Name;
  LabelNick.Caption := FNick;
  LabelStatus.Caption := Item.GetDisplayStatus;
  LabelNick2.Caption := LabelNick.Caption;
  LabelStatus2.Caption := LabelStatus.Caption;
  LabelExAvatar.Caption := CreateShortName(Item.JID, LabelNick2.Caption);
  LabelExAvatar.Brush.Color := CreateColorFromJID(Item.JID);
  LabelExAvatar.Pen.Color := LabelExAvatar.Brush.Color;
end;

procedure TFormChatRoom.SetJID(const Value: string);
begin
  FJID := Value;
end;

procedure TFormChatRoom.Splitter1CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  NewSize := Max(PanelRight.Constraints.MinWidth, Min(NewSize, PanelRight.Constraints.MaxWidth));
end;

procedure TFormChatRoom.ButtonSendClick(Sender: TObject);
var
  Item: TJabberMessage;
  ChatItem: TChatElement;
begin
  if (RichEditSend.Text <> '') and (RichEditSend.Text <> ' ') then
  begin
    Item.From := FormMain.JabberClient.JID;
    Item.Body := RichEditSend.Text;
    Item.ID := FormMain.JabberClient.SendMessage(JID, Item.Body, mtChat);
    RichEditSend.Clear;

    ChatItem := TChatElement.Create(FMessages);
    with ChatItem do
    begin
      MessageItem := Item;
      MessageItem.Displayed := False;
      MessageItem.Received := False;
      FromType := mtMe;
      ShowFrom := False;
      From := Item.Nick;
      Text := Item.Body;
      Date := Now;
    end;

    FMessages.Add(ChatItem);
    hChatMessages.Repaint;
  end;
end;

procedure TFormChatRoom.RichEditSendKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and not (ssShift in Shift) then
  begin
    ButtonSendClick(nil);
    Key := 0;
    Exit;
  end;
end;

procedure TFormChatRoom.RichEditSendResizeRequest(Sender: TObject; Rect: TRect);
begin
  PanelSend.Height := Min(200, Max(45, 24 + Rect.Height));
end;

procedure TFormChatRoom.NewMessage(Item: TJabberMessage);
var
  ChatItem: TChatElement;
begin
  ChatItem := TChatElement.Create(FMessages);
  ChatItem.MessageItem := Item;
  ChatItem.Date := Now;
  ChatItem.ShowFrom := False;
  ChatItem.From := Item.Nick;
  ChatItem.Text := Item.Body;
  FMessages.Add(ChatItem);
  hChatMessages.Repaint;
  if (not Active) or (not Visible) then
  begin
    FormMain.PlaySounds(sndMessage);
  end;
end;

{ TMessages }

function TMessages.Add(Value: TChatItem): Integer;
var
  Item: TChatInfo;
begin
  if DateOf(FLastDate) <> DateOf(Now) then
  begin
    Item := TChatInfo.Create(Self);
    FLastDate := Now;
    Item.Date := Now;
    Item.Text := FormatDateTime('D mmmm', Item.Date);
    Add(Item);
  end;
  Result := inherited Add(Value);
end;

procedure TMessages.Reads(MessageItem: TJabberMessage);
var
  i: Integer;
  Item: TChatElement;
begin
  for i := 0 to Count - 1 do
  begin
    if Items[i] is TChatElement then
    begin
      Item := Items[i] as TChatElement;
      if MessageItem.Displayed then
        Item.MessageItem.Displayed := True;
      if MessageItem.Received then
        Item.MessageItem.Received := True;
      if Item.MessageItem.ID = MessageItem.ID then
        Exit;
    end;
  end;
  Owner.Repaint;
end;

end.

