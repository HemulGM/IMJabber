unit IM.Conference;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Menus, Buttons, ExtDlgs, ImgList,
  System.ImageList, System.Actions, HGM.Button, Vcl.Grids,
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
    LabelExAff: TLabelEx;
    LabelExRole: TLabelEx;
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
    procedure TableExRosterItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
  private
    FMessages: TMessages;
    FRosterList: TRosterList;
    FJID: string;
    FNick: string;
    FLoading: Boolean;
    FDiconnected: Boolean;
    procedure ButtonSendClick(Sender: TObject);
    procedure MessageMarkers(Item: TJabberMessage);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    function GetFullJID: string;
  public
    procedure OnDisconnect;
    procedure OnConnect;
    procedure NewMessage(Item: TJabberMessage);
    procedure SetData(AJID, ANick: string);
    procedure OnPresence(Sender: TObject; QueryNode: TGmXmlNode);
    procedure OnKickYou(Reason, ErrorCode, Actor: string);
    property JID: string read FJID; //room@conference.jabber.ru
    property Nick: string read FNick; //Пупка
    property FullJID: string read GetFullJID;
    property Disconnected: Boolean read FDiconnected;
  end;

var
  FormConference: TFormConference;

implementation

uses
  IM.Conference.Invite, IM.Main, IM.ChatRoom, IM.Account.Card, IM.Account,
  System.DateUtils, Math, Jabber, IM.Roster, HGM.Common.Utils,
  Vcl.Imaging.pngimage;

{$R *.dfm}

procedure TFormConference.NewMessage(Item: TJabberMessage);
var
  ChatItem: TChatElement;
  From: TRosterItem;
begin
  //Если от комнаты
  if Item.From = JID then
  begin
    if Item.MessageType = 'error' then
    begin
      with FMessages.AddInfo do
      begin
        Date := Now;
        Text := Item.Error.Text;
      end;
      Exit;
    end
  end;
  //Если это про нас
  if Item.From = FullJID then
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
  //Добавление сообщения
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
  //////////
  if ((not Active) or (not Visible)) and (not FLoading) then
  begin
    FormMain.TrayIcon.Animate := True;
    FormMain.PlaySounds(sndGroup);
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

function TFormConference.GetFullJID: string;
begin
  Result := FJID + '/' + FNick;
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
  if FDiconnected then
    SetData(FJID, FNick);
end;

procedure TFormConference.OnDisconnect;
begin
  FDiconnected := True;

  LabelExAff.Visible := False;
  LabelExRole.Visible := False;
end;

procedure TFormConference.OnKickYou(Reason, ErrorCode, Actor: string);
begin
  Reason := Actor + ' выгнал вас из комнаты. Причина: ' + Reason;
  if ErrorCode = '307' then
    Reason := Reason + '. Временно! Вы можете читать сообщения, но не можете писать';

  LabelExAff.Pen.Color := $00D8E218;
  LabelExAff.Caption := 'Бан';
  LabelExAff.Visible := True;
  LabelExRole.Visible := False;
  with FMessages.AddInfo do
  begin
    Date := Now;
    Text := Reason;
    FillColor := $005454B7;
  end;
  hChatMessages.Repaint;
end;

procedure TFormConference.OnPresence(Sender: TObject; QueryNode: TGmXmlNode);
var
  Item: TChatInfo;
  RItem: TRosterItem;
  Pic: TPicture;
  PNG: TPngImage;
  PresenceType, PresenceFrom, PresenceNick, ErrorCode, Reason, Actor, S: string;
begin
  PresenceFrom := QueryNode.Params.Values['from'];
  PresenceNick := NickFromConfJID(PresenceFrom);
  PresenceType := LowerCase(QueryNode.Params.Values['type']);

  if PresenceFrom = FullJID then
  begin
    if PresenceType = 'unavailable' then
    begin
      if QueryNode.Children.NodeWithParamExists('x', 'xmlns', XMLNS_MUCUSER) then
        with QueryNode.Children.NodeWithParam('x', 'xmlns', XMLNS_MUCUSER) do
        begin
          if Children.NodeExists('item') then
            with Children.NodeByName['item'] do
            begin
              if Children.NodeExists('actor') then
                Actor := Children.NodeByName['actor'].Params.Values['nick'];
              if Children.NodeExists('reason') then
                Reason := Children.NodeByName['reason'].AsString;
            end;
          if Children.NodeExists('status') then
            with Children.NodeByName['status'] do
            begin
              ErrorCode := Params.Values['code'];
            end;
        end;
      OnKickYou(Reason, ErrorCode, Actor);
      Exit;
    end;
    //Получаем права юзеров в конфе
    if QueryNode.Children.NodeWithParamExists('x', 'xmlns', XMLNS_MUCUSER) then
      with QueryNode.Children.NodeWithParam('x', 'xmlns', XMLNS_MUCUSER) do
      begin
        if Children.NodeExists('item') then
          with Children.NodeByName['item'] do
          begin
            S := Params.Values['affiliation'];
            if (not S.IsEmpty) and (S <> 'none') then
            begin
              LabelExAff.Pen.Color := AffiliationInfo(S, S);
              LabelExAff.Caption := S;
              LabelExAff.Visible := True;
            end;
            S := Params.Values['role'];
            if (not S.IsEmpty) and (S <> 'none') then
            begin
              LabelExRole.Pen.Color := RoleInfo(S, S);
              LabelExRole.Caption := S;
              LabelExRole.Visible := True;
            end;
          end;
      end;
    Exit;
  end;
  RItem := FRosterList.Find(PresenceFrom);
  if not Assigned(RItem) then
  begin
    RItem := TRosterItem.Create;
    RItem.JID := PresenceFrom;
    RItem.Name := NickFromConfJID(PresenceFrom);
    SetDefaultAvatar(RItem, FormMain.FStatusMask);
    FRosterList.Add(RItem);
  end;
  if PresenceType = 'unavailable' then
  begin
    RItem.Status := stOffline;
    with FMessages.AddInfo do
    begin
      Date := Now;
      Text := 'Отключился ' + PresenceNick;
    end;
    hChatMessages.Repaint;
  end
  else
  begin
    if not FLoading then
      if RItem.Status = stOffline then
      begin
        with FMessages.AddInfo do
        begin
          Date := Now;
          Text := 'Подключился ' + PresenceNick;
        end;
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
        if Children.NodeExists('item') then
          with Children.NodeByName['item'] do
          begin
            RItem.GroupData.Affiliation := Params.Values['affiliation'];
            RItem.GroupData.Role := Params.Values['role'];
          end;
      end;
    if QueryNode.Children.NodeWithParamExists('x', 'xmlns', XMLNS_VCARDUPDATE) then
      with QueryNode.Children.NodeWithParam('x', 'xmlns', XMLNS_VCARDUPDATE) do
        if Children.NodeExists('photo') then
          with Children.NodeByName['photo'] do
            if RItem.Photo <> AsString then
            begin
              RItem.Photo := AsString;
              with FormMain.JabberClient.GetVCard(RItem.JID) do
              begin
                if Photo.PhotoType <> '' then
                begin
                  Pic := TPicture.Create;
                  if SetImageFromBinVal(Photo.BinVal, Photo.PhotoType, Pic) then
                  begin
                    PNG := CreateAvatar(Pic.Graphic, FormMain.FStatusMask);
                    RItem.Avatar.Assign(PNG);
                    PNG.Free;
                  end;
                  Pic.Free;
                end
                else
                  RItem.Photo := '';
              end;
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
  FDiconnected := False;
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
var
  R, RT: TRect;
  Offset: Integer;
  S: string;
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
          Brush.Style := bsClear;
          //Ник
          Font.Name := 'Segoe UI';
          Font.Color := clWhite;
          if FRosterList[ARow].Name.IsEmpty then
            S := FRosterList[ARow].JID
          else
            S := FRosterList[ARow].Name;
          R := TRect.Create(Rect.Left, Rect.Top + 3, Rect.Right, Rect.Bottom);
          TextRect(R, S, [tfSingleLine, tfCalcRect, tfLeft]);
          Offset := R.Right + 10;
          TextRect(R, S, [tfSingleLine, tfLeft]);
          //Субтекст
          Font.Color := $00CFCFCF;
          R := TRect.Create(Rect.Left, Rect.Top + 22, Rect.Right, Rect.Bottom);
          if FRosterList[ARow].LastMessage.Unread then
          begin
            S := FRosterList[ARow].LastMessage.Body;
            FormMain.ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 20, Rect.Top + 2, 7, True);
          end
          else
          begin
            S := FRosterList[ARow].StatusText;
          end;
          TextRect(R, S, [tfSingleLine, tfLeft, tfEndEllipsis]);
          //Affiliation
          R := Rect;
          R.Top := R.Top + 4;
          R.Bottom := R.Top + 20;
          R.Left := Offset;
          S := FRosterList[ARow].GroupData.Affiliation;
          if (not S.IsEmpty) and (S <> 'none') then
          begin
            Pen.Color := AffiliationInfo(S, S);

            TextRect(R, S, [tfSingleLine, tfLeft, tfCalcRect]);
            Offset := R.Right + 15;
            Brush.Color := ColorDarker(Pen.Color);
            Brush.Style := bsClear;

            RT := R;
            RT.Inflate(5, 0);
            //Brush.Style := bsSolid;
            RoundRect(RT, 2, 2);
            R.Offset(0, -2);
            TextRect(R, S, [tfSingleLine, tfLeft]);
          end;
          //role
          R := Rect;
          R.Top := R.Top + 4;
          R.Bottom := R.Top + 20;
          R.Left := Offset;
          S := FRosterList[ARow].GroupData.Role;
          if (not S.IsEmpty) and (S <> 'none') then
          begin
            Pen.Color := RoleInfo(S, S);
            TextRect(R, S, [tfSingleLine, tfLeft, tfCalcRect]);
            //Offset := R.Right + 10;
            Brush.Color := ColorDarker(Pen.Color);
            Brush.Style := bsClear;

            RT := R;
            RT.Inflate(5, 0);
            //Brush.Style := bsSolid;
            RoundRect(RT, 2, 2);
            R.Offset(0, -2);
            TextRect(R, S, [tfSingleLine, tfLeft]);
          end;
        end;
    end;
  end;
end;

procedure TFormConference.TableExRosterItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  TableExRoster.ItemIndex := -1;
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

