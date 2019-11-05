unit IM.ChatRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, Buttons, ExtDlgs, IniFiles,
  System.ImageList, System.Actions, Jabber.Types, Vcl.Grids,
  HGM.Controls.VirtualTable, HGM.Button;

type
  TChatElementType = (etChat, etDate);

  TChatElement = record
    MessageItem: TJabberMessage;
    Date: TDate;
    ElementType: TChatElementType;
  end;

  TMessages = class(TTableData<TChatElement>)
    FLastDate: TDateTime;
    function Add(Value: TChatElement): Integer; override;
    procedure Reads(MessageItem: TJabberMessage);
  end;

  TFormChatRoom = class(TForm)
    PanelSend: TPanel;
    ImageList24: TImageList;
    BalloonHint1: TBalloonHint;
    MemoSend: TMemo;
    Panel1: TPanel;
    LabelNick: TLabel;
    TableExMessages: TTableEx;
    LabelStatus: TLabel;
    Shape1: TShape;
    ButtonFlatAttachment: TButtonFlat;
    ImageListIcons: TImageList;
    procedure ButtonSendClick(Sender: TObject);
    procedure MemoSendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TableExMessagesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
  IM.Main, IM.Notifycation, IM.Account, System.DateUtils, Jabber;

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
  TableExMessages.CursorActive := crDefault;
  FMessages := TMessages.Create(TableExMessages);
  FMessages.FLastDate := Now - 60;
end;

procedure TFormChatRoom.FormDestroy(Sender: TObject);
begin
  FMessages.Free;
end;

procedure TFormChatRoom.FormShow(Sender: TObject);
begin
  MemoSend.Focused;
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
  if Item.StatusText.IsEmpty then
    LabelStatus.Caption := ShowTypeText[Item.Status]
  else
    LabelStatus.Caption := Item.StatusText;
end;

procedure TFormChatRoom.SetJID(const Value: string);
begin
  FJID := Value;
end;

procedure TFormChatRoom.ButtonSendClick(Sender: TObject);
var
  Item: TJabberMessage;
  ChatItem: TChatElement;
begin
  if (MemoSend.Text <> '') and (MemoSend.Text <> ' ') then
  begin
    Item.ID := FormMain.JabberClient.SendMessage(JID, MemoSend.Text, mtChat);
    Item.From := FormMain.JabberClient.JID;
    Item.Body := MemoSend.Text;
    MemoSend.Clear;
    ChatItem.MessageItem := Item;
    ChatItem.ElementType := etChat;
    ChatItem.MessageItem.Displayed := False;
    ChatItem.MessageItem.Received := False;
    ChatItem.Date := Now;
    FMessages.Add(ChatItem);
    FMessages.UpdateTable;
  end;
end;

procedure TFormChatRoom.MemoSendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and not (ssCtrl in Shift) then
  begin
    ButtonSendClick(nil);
  end;
end;

procedure TFormChatRoom.NewMessage(Item: TJabberMessage);
var
  ChatItem: TChatElement;
begin
  ChatItem.MessageItem := Item;
  ChatItem.ElementType := etChat;
  ChatItem.Date := Now;
  FMessages.Add(ChatItem);
  FMessages.UpdateTable;
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
  if not FMessages.IndexIn(ARow) then
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
            TextRect(TxtRect, S, [tfCalcRect, tfWordBreak]);

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
            TextRect(TxtRect, S, [tfWordBreak]);
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

  end;
end;

procedure TFormChatRoom.WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
begin
  if Text <> 'about:blank' then
    MemoSend.Text := MemoSend.Text + ' ' + Text + ' ';
end;

{ TMessages }

function TMessages.Add(Value: TChatElement): Integer;
var
  Item: TChatElement;
begin
  if MonthOf(FLastDate) <> MonthOf(Now) then
  begin
    FLastDate := Now;
    Item.ElementType := etDate;
    Item.Date := Now;
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
    if Items[i].MessageItem.ID = MessageItem.ID then
    begin
      Item := Items[i];
      if MessageItem.Displayed then
        Item.MessageItem.Displayed := True;
      if MessageItem.Received then
        Item.MessageItem.Received := True;
      Items[i] := Item;
      UpdateTable;
      Exit;
    end;

end;

end.

