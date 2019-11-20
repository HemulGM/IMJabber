unit IM.Conference;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Menus, Buttons, inifiles, ExtDlgs,
  MD5Hash, ImgList, System.ImageList, System.Actions, HGM.Button, Vcl.Grids,
  HGM.Controls.VirtualTable, Jabber.Types, IM.Classes, GmXml,
  HGM.Controls.Labels, HGM.Controls.Chat;

type
  TChatElement = class(TChatMessage)
    MessageItem: TJabberMessage;
    Color: TColor;
  end;

  TMessages = class(TChatItems)
    FLastDate: TDateTime;
    function Add(Value: TChatItem): Integer;
    procedure Reads(MessageItem: TJabberMessage);
  end;

  TFormConference = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    MenuItemSound: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    BalloonHint: TBalloonHint;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    PanelInfo: TPanel;
    PanelSend: TPanel;
    ButtonFlatAttachment: TButtonFlat;
    RichEditSend: TRichEdit;
    PanelClient: TPanel;
    PanelRight: TPanel;
    ImageList24: TImageList;
    PanelConfOccups: TPanel;
    PanelConfInfo: TPanel;
    TableExRoster: TTableEx;
    PanelMembers: TPanel;
    Label2: TLabel;
    LabelConfName: TLabel;
    LabelConfSubject: TLabel;
    LabelExConf: TLabelEx;
    Panel6: TPanel;
    LabelSubject: TLabel;
    LabelName: TLabel;
    PanelControls: TPanel;
    ButtonFlatLeave: TButtonFlat;
    hChatMessages: ThChat;
    ButtonFlat1: TButtonFlat;
    Panel1: TPanel;
    ButtonFlat2: TButtonFlat;
    Label1: TButtonFlat;
    ButtonFlatInvite: TButtonFlat;
    ButtonFlatSend: TButtonFlat;
    ButtonFlat5: TButtonFlat;
    Splitter1: TSplitter;
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure MenuItemSoundClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TableExRosterDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure RichEditSendKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonFlatLeaveClick(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
    procedure ButtonFlatInviteClick(Sender: TObject);
  private
    FMessages: TMessages;
    FRosterList: TRosterList;
    FJID: string;
    FNick: string;
    FLoading: Boolean;
    FDiconnected: Boolean;
    procedure SetJID(const Value: string);
    procedure ButtonSendClick(Sender: TObject);
    procedure MessageMarkers(Item: TJabberMessage);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  public
    procedure OnDisconnect;
    procedure OnConnect;
    procedure NewMessage(Item: TJabberMessage);
    procedure SetData(AJID, ANick: string);
    procedure OnPresence(Sender: TObject; QueryNode: TGmXmlNode);
    property JID: string read FJID write SetJID;
  end;

var
  FormConference: TFormConference;

implementation

uses
  IM.Conference.Invite, IM.Main, IM.ChatRoom, ActiveX, IM.Account.Card,
  IM.Account, System.DateUtils, Math, Jabber, IM.Roster;

{$R *.dfm}

procedure TFormConference.NewMessage(Item: TJabberMessage);
var
  ChatItem: TChatElement;
  From: TRosterItem;
begin
  //Если это про нас
  if Item.From = FJID + '/' + FNick then
  begin
    if not Item.Delay then
    begin
      //Значит сообщение ушло, ставим маркер
      MessageMarkers(Item);
      Exit;
    end
    else
    begin
      Item.Displayed := True;
      Item.Received := True;
      Item.From := FormMain.JabberClient.JID;
    end;
  end;

  if not Item.Subject.IsEmpty then
  begin
    //Смена темы
    LabelSubject.Caption := Item.Subject;
    LabelConfSubject.Caption := Item.Subject;
    Exit;
  end;
  From := FRosterList.Find(Item.From);
  ChatItem := TChatElement.Create(FMessages);
  if Assigned(From) then
  begin
    ChatItem.FromColor := From.Color;
  end
  else
    ChatItem.FromColor := $00FFDD9B;
  ChatItem.MessageItem := Item;
  ChatItem.From := Item.Nick;
  if Item.From = FormMain.JabberClient.JID then
    ChatItem.FromType := mtMe
  else
    ChatItem.FromType := mtOpponent;
  ChatItem.Text := Item.Body;
  if Item.Delay then
    ChatItem.Date := Item.DelayDate
  else
    ChatItem.Date := Now;
  FMessages.Add(ChatItem);
  hChatMessages.Repaint;
  if (not Active) or (not Visible) then
  begin
    FormMain.TrayIcon.Animate := True;
    FormMain.PlaySound(sndMessage);
  end;
end;

procedure TFormConference.MessageMarkers(Item: TJabberMessage);
begin
  FMessages.Reads(Item);
end;

procedure TFormConference.FormCreate(Sender: TObject);
begin
  FDiconnected := True;
  FLoading := True;
  LabelSubject.Caption := '';
  LabelConfSubject.Caption := '';
  FMessages := TMessages.Create(hChatMessages);
  hChatMessages.Items := FMessages;
  FRosterList := TRosterList.Create(TableExRoster);
end;

procedure TFormConference.FormDestroy(Sender: TObject);
begin
  FRosterList.Free;
end;

procedure TFormConference.FormShow(Sender: TObject);
begin
  FLoading := False;
end;

procedure TFormConference.N10Click(Sender: TObject);
begin
//Отнять права модератора
  N20.Click;
end;

procedure TFormConference.N12Click(Sender: TObject);
begin
  N20.Click;
end;

procedure TFormConference.N14Click(Sender: TObject);
begin
  N20.Click;
end;

procedure TFormConference.N15Click(Sender: TObject);
begin
//Дать голос  (participant)
  {if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="participant"></item></query></iq>');
  end; }
end;

procedure TFormConference.N16Click(Sender: TObject);
begin
//Дать права модератора
 { if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="moderator"></item></query></iq>');
  end;   }
end;

procedure TFormConference.N17Click(Sender: TObject);
begin
//Дать права администратора
 { if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="admin"></item></query></iq>');
  end; }
end;

procedure TFormConference.N18Click(Sender: TObject);
begin
//Дать права владельца
  {if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="owner"></item></query></iq>');
  end; }
end;

procedure TFormConference.N1Click(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if FormMain.JabberClient.Connected then
    begin
      TFormAccountCard.ShowCard(FormMain.JabberClient.GetVCard(FRosterList[TableExRoster.ItemIndex].JID));
    end;
  end;
end;

procedure TFormConference.N20Click(Sender: TObject);
begin
//Дать права учасника
  {if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="member"></item></query></iq>');
  end; }
end;

procedure TFormConference.N21Click(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if FormMain.JabberClient.Connected then
    begin
      FormMain.JabberClient.GetVersion(FRosterList[TableExRoster.ItemIndex].JID);
    end;
  end;
end;

procedure TFormConference.N2Click(Sender: TObject);
begin
  //FormMain.groupchat_jid := sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '/' + conferenceusers.Items[conferenceusers.ItemIndex].Caption;
  //FormMain.ActionListMain.Actions[0].Execute;
end;

procedure TFormConference.N4Click(Sender: TObject);
var
  reasone: string;
begin
 { if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if inputquery('Кик', 'Причина:', reasone) then
    begin
      if FormMain.JabberClient.Connected then
        FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '">' + '<query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="none"><reason>' + reasone + '</reason></item></query></iq>');
    end;
  end;  }
end;

procedure TFormConference.MenuItemSoundClick(Sender: TObject);
begin
//Визитер
 { if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="visitor"></item></query></iq>');
  end;  }
end;

procedure TFormConference.RichEditSendKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and not (ssShift in Shift) then
  begin
    ButtonSendClick(nil);
    Key := 0;
    Exit;
  end;
end;

procedure TFormConference.ButtonFlatInviteClick(Sender: TObject);
var
  RItem: Integer;
begin
  if TFormRosterList.Execute(FormMain.RosterList, RItem) then
  begin
    if FormMain.RosterList.IndexIn(RItem) then
      FormMain.JabberClient.SendInvite(FormMain.RosterList[RItem].JID, JID);
  end;
end;

procedure TFormConference.ButtonFlatLeaveClick(Sender: TObject);
begin
  FormMain.JabberClient.SendPresenceUnavailable(FJID);
  OnDisconnect;
  Close;
end;

procedure TFormConference.ButtonSendClick(Sender: TObject);
var
  Item: TJabberMessage;
  ChatItem: TChatElement;
begin
  if (RichEditSend.Text <> '') and (RichEditSend.Text <> ' ') then
  begin
    Item.From := FormMain.JabberClient.JID;
    Item.Body := RichEditSend.Text;
    Item.ID := FormMain.JabberClient.SendMessage(JID, Item.Body, mtGroupChat);
    RichEditSend.Clear;
    ChatItem := TChatElement.Create(FMessages);
    ChatItem.MessageItem := Item;
    ChatItem.FromType := mtMe;
    ChatItem.MessageItem.Displayed := False;
    ChatItem.MessageItem.Received := False;
    ChatItem.Date := Now;
    ChatItem.Text := Item.Body;
    FMessages.Add(ChatItem);
    hChatMessages.Repaint;
  end;
end;

procedure TFormConference.OnConnect;
begin
  FDiconnected := False;
  SetData(FJID, FNick);
end;

procedure TFormConference.OnDisconnect;
begin
  FDiconnected := True;
end;

procedure TFormConference.OnPresence(Sender: TObject; QueryNode: TGmXmlNode);
var
  Item: TChatInfo;
  RItem: TRosterItem;
  tmpItem, xmlItem2: TGmXmlNode;
  a: integer;
  fromTYPE, fromJID, JID, conf_nick, confONLY, ErrorCode: string;
begin
  fromJID := QueryNode.Params.Values['from'];
  conf_nick := copy(fromJID, Pos('/', fromJID) + 1, length(fromJID));
  fromTYPE := LowerCase(QueryNode.Params.Values['type']);

  RItem := FRosterList.Find(fromJID);
  if not Assigned(RItem) then
  begin
    RItem := TRosterItem.Create;
    RItem.JID := fromJID;
    RItem.Name := NickFromConfJID(fromJID);
    SetDefaultAvatar(RItem, FormMain.FStatusMask);
    FRosterList.Add(RItem);
  end;
  if QueryNode.Params.Values['type'] = 'unavailable' then
  begin
    RItem.Status := stOffline;
    Item := TChatInfo.Create(FMessages);
    Item.Date := Now;
    Item.Text := 'Отключился ' + conf_nick;
    FMessages.Add(Item);
    hChatMessages.Repaint;
  end
  else
  begin
    if not FLoading then
      if RItem.Status = stOffline then
      begin
        Item := TChatInfo.Create(FMessages);
        Item.Date := Now;
        Item.Text := 'Подключился ' + conf_nick;
        FMessages.Add(Item);
        hChatMessages.Repaint;
      end;

    if QueryNode.Children.NodeExists('show') then
      RItem.Status := StrToShowType(QueryNode.Children.NodeByName['show'].AsString)
    else
      RItem.Status := stNormal;

    if QueryNode.Children.NodeExists('status') then
      RItem.StatusText := FromEscaping(QueryNode.Children.NodeByName['status'].AsString);

    //Получаем права юзеров в конфе
    if QueryNode.Children.NodeWithParamExists('x', 'xmlns', XMLNS_MUCUSER) then
      with QueryNode.Children.NodeWithParam('x', 'xmlns', XMLNS_MUCUSER) do
      begin
        RItem.GroupData.Affiliation := Params.Values['affiliation'];
        RItem.GroupData.Affiliation := Params.Values['role'];
      end;
  end;
  FRosterList.UpdateTable;
end;

procedure TFormConference.SetData(AJID, ANick: string);
var
  Respone: TConfPresence;
begin
  FJID := AJID;
  FNick := ANick;
  LabelName.Caption := NickFromJID(AJID);
  LabelConfName.Caption := LabelName.Caption;
  LabelExConf.Caption := CreateShortName(AJID, LabelName.Caption);
  LabelExConf.Brush.Color := CreateColorFromJID(AJID);
  LabelExConf.Pen.Color := LabelExConf.Brush.Color;
  Respone := FormMain.JabberClient.ConferenceEnter(FJID, ANick);
  if Respone.Error then
  begin
    ShowMessage(Respone.ErrorData.Text);
    Exit;
  end;
end;

procedure TFormConference.SetJID(const Value: string);
begin
  FJID := Value;
end;

procedure TFormConference.Splitter1CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  NewSize := Max(PanelRight.Constraints.MinWidth, Min(NewSize, PanelRight.Constraints.MaxWidth));
end;

procedure TFormConference.sSpeedButton2Click(Sender: TObject);
var
  i: integer;
begin
  {if (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and FormMain.JabberClient.Connected then
  begin
    randomize;
    i := random(777);
    FormMain.JabberClient.SendData('<message type="groupchat" id="' + inttostr(i) + '" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '">' + '<subject>' + EditSubject.text + '</subject><body>/me изменил тему на: ' + EditSubject.text + '</body></message>');
  end;   }
end;

procedure TFormConference.TableExRosterDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if not FRosterList.IndexIn(ARow) then
    Exit;
  with TableExRoster.Canvas do
  begin
    case ACol of
      0:
        begin
          Rect.Inflate(-4, -4);
          if Assigned(FRosterList[ARow].Avatar) then
            Draw(Rect.Left, Rect.Top, FRosterList[ARow].Avatar);
          FormMain.ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 15, Rect.Bottom - 15, Ord(FRosterList[ARow].Status), True);
        end;
      1:
        begin
          Font.Name := 'Segoe UI';
          Font.Color := clWhite;
          if FRosterList[ARow].Name.IsEmpty then
            TextOut(Rect.Left, Rect.Top + 3, FRosterList[ARow].JID)
          else
            TextOut(Rect.Left, Rect.Top + 3, FRosterList[ARow].Name);
          Font.Color := $00CFCFCF;
          if FRosterList[ARow].LastMessage.Unread then
          begin
            TextOut(Rect.Left, Rect.Top + 22, FRosterList[ARow].LastMessage.Body);
            FormMain.ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 20, Rect.Top + 2, 7, True);
          end
          else
          begin
            TextOut(Rect.Left, Rect.Top + 22, FRosterList[ARow].StatusText);
          end;
        end;
    end;
  end;
end;

procedure TFormConference.WMSize(var Message: TWMSize);
begin
  inherited;
  Invalidate;
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
      Item.MessageItem.Displayed := True;
      Item.MessageItem.Received := True;
      if Item.MessageItem.ID = MessageItem.ID then
        Exit;
    end;
  end;
  Owner.Repaint;
end;

end.

