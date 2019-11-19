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
    procedure Button2Click(Sender: TObject);
    procedure TableExMessagesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
  IM.Main, IM.Notifycation, IM.Account, System.DateUtils, Jabber, Math;

{$R *.dfm}

class procedure TFormChatRoom.SwowPopupWnd(text: string);
begin
  FormMain.TrayIcon.BalloonHint := text;
  FormMain.TrayIcon.ShowBalloonHint;
end;

procedure HidePopupWnd;
begin
  FormNotify.Hide;
end;

procedure TFormChatRoom.Button2Click(Sender: TObject);
begin
  HidePopupWnd;
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
      text := Item.Body;
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
    FormMain.TrayIcon.Animate := True;
    FormMain.PlaySound(sndMessage);
  end;
end;

procedure TFormChatRoom.TableExMessagesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  R, TxtRect: TRect;
  S: string;
begin
  {if not FMessages.IndexIn(ARow) then
    Exit;

  R := Rect;
  with TableExMessages.Canvas do
  begin
    Font.Color := clWhite;
    Font.Name := 'Segoe UI Emoji';
    Font.Size := 10;
    Brush.Style := bsSolid;
    case FMessages[ARow].ElementType of
      etChat:
        begin
          S := FMessages[ARow].MessageItem.Body;
          //Если не от нас
          if FMessages[ARow].MessageItem.From <> FormMain.JabberClient.JID then
          begin
            Brush.Color := $00332518;
            R.Width := (TableExMessages.Width div 3) * 2;
            TxtRect := R;
            TextRect(TxtRect, S, [tfCalcRect, tfWordBreak, tfEndEllipsis]);

            R.Width := TxtRect.Width;
            R.Height := TxtRect.Height;
            R.Inflate(5, 5);
            R.Location := Point(Rect.Left, Rect.Top);

            if TableExMessages.GetRowHeight(ARow) <> R.Height then
            begin
              TableExMessages.SetRowHeight(ARow, R.Height);
              Exit;
            end;

            R.Width := R.Width + 40;
            RoundRect(R, 5, 5);
            Font.Color := $00847F7C;
            TextOut(R.Right - 40, R.Bottom - 20, FormatDateTime('HH:MM', FMessages[ARow].Date));
            TxtRect.Location := Point(R.Left + 4, R.CenterPoint.Y - TxtRect.Height div 2);
            Brush.Style := bsClear;
            Font.Color := clWhite;
            TextRect(TxtRect, S, [tfWordBreak, tfEndEllipsis]);
          end
          else
          begin
            Brush.Color := $0078522B;
            R.Width := (TableExMessages.Width div 3) * 2;
            TxtRect := R;
            TextRect(TxtRect, S, [tfCalcRect, tfWordBreak]);

            R.Width := TxtRect.Width;
            R.Height := TxtRect.Height;
            R.Inflate(5, 5);
            R.Location := Point(Rect.Width - R.Width, Rect.Top);

            if TableExMessages.GetRowHeight(ARow) <> R.Height then
            begin
              TableExMessages.SetRowHeight(ARow, R.Height);
              Exit;
            end;
            R.Width := R.Width + 16 + 40;
            R.Offset(-56, 0);
            RoundRect(R, 5, 5);
            Font.Color := $00B48E6A;
            TextOut(R.Right - 56, R.Bottom - 20, FormatDateTime('HH:MM', FMessages[ARow].Date));
            TxtRect.Location := Point(R.Left + 4, R.CenterPoint.Y - TxtRect.Height div 2);
            Brush.Style := bsClear;
            Font.Color := clWhite;
            TextRect(TxtRect, S, [tfWordBreak]);
            if FMessages[ARow].MessageItem.Received then
            begin
              if not FMessages[ARow].MessageItem.Displayed then
                ImageList24.Draw(TableExMessages.Canvas, R.Right - 24, R.Bottom - 18, 0, True)
              else
                ImageList24.Draw(TableExMessages.Canvas, R.Right - 24, R.Bottom - 18, 1, True);
            end
            else
              ImageList24.Draw(TableExMessages.Canvas, R.Right - 24, R.Bottom - 18, 2, True);
          end;
        end;
      etDate:
        begin
          Brush.Color := $003A2C1D;
          R.Width := 80;
          R.Height := 25;
          TxtRect.Location := Point(R.Left + 3, R.Top + 3);
          R.Location := TPoint.Create(Rect.CenterPoint.X - R.Width div 2, Rect.CenterPoint.Y - R.Height div 2);
          RoundRect(R, 20, 20);
          S := FormatDateTime('D mmmm', FMessages[ARow].Date);
          Brush.Style := bsClear;
          TextRect(R, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
        end;
    end;
  end;   }
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

