unit IM.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Types, System.UITypes, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  Winapi.MMSystem, System.ImageList, System.Actions, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.ImgList, Vcl.Controls, Vcl.Imaging.jpeg, Jabber.Types,
  Jabber, GmXml, MD5Hash, System.Generics.Collections, HGM.Controls.VirtualTable,
  HGM.Button, Vcl.WinXCtrls, Vcl.Imaging.pngimage, IM.ChatRoom, Direct2D,
  IM.Classes, IM.Conference, Vcl.Grids;

type
  TFormMain = class(TForm)
    ImageListStatuses: TImageList;
    TrayIcon: TTrayIcon;
    PopupMenuSys: TPopupMenu;
    MenuItemAccount: TMenuItem;
    MenuItemSettings: TMenuItem;
    MenuItemQuit: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemSound: TMenuItem;
    MenuItemConsole: TMenuItem;
    MenuItemBookmarks: TMenuItem;
    PopupMenuContacts: TPopupMenu;
    MenuItemContactVCard: TMenuItem;
    MenuItemContactRename: TMenuItem;
    MenuItemContactDelete: TMenuItem;
    MenuItemContactAuth: TMenuItem;
    MenuItemContactAuthAccept: TMenuItem;
    MenuItemContactAuthRemove: TMenuItem;
    MenuItemContactAuthRequest: TMenuItem;
    MenuItemStatuses: TMenuItem;
    MenuItemStOnline: TMenuItem;
    MenuItemStChat: TMenuItem;
    MenuItemStAway: TMenuItem;
    MenuItemStXA: TMenuItem;
    MenuItemStDND: TMenuItem;
    MenuItemStInvisible: TMenuItem;
    MenuItemStOffline: TMenuItem;
    MenuItemConfList: TMenuItem;
    MenuItemUserVCard: TMenuItem;
    MenuItemAddContactSys: TMenuItem;
    MenuItemGetVersion: TMenuItem;
    MenuItemContactGroup: TMenuItem;
    MenuItemContactGroupAdd: TMenuItem;
    MenuItemAddToGroup: TMenuItem;
    PanelMenu: TPanel;
    PanelContacts: TPanel;
    PanelClient: TPanel;
    PanelLeft: TPanel;
    TableExRoster: TTableEx;
    ButtonFlatMenu: TButtonFlat;
    ImageListNormal: TImageList;
    ImageListOver: TImageList;
    MenuItemRemoveGroup: TMenuItem;
    PanelAccountInfo: TPanel;
    ImageAvatar: TImage;
    LabelNick: TLabel;
    LabelStatusText: TLabel;
    ImageShowType: TImage;
    N2: TMenuItem;
    MenuItemSendAttontion: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Button1: TButtonFlat;
    Button2: TButtonFlat;
    PanelSearch: TPanel;
    EditSearch: TEdit;
    ButtonFlatSearchClear: TButtonFlat;
    ActivityIndicatorWork: TActivityIndicator;
    ImageList16: TImageList;
    Splitter1: TSplitter;
    N1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure MenuItemQuitClick(Sender: TObject);
    procedure MenuItemAccountClick(Sender: TObject);
    procedure MenuItemSettingsClick(Sender: TObject);
    procedure OnAddToGroupClick(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemConsoleClick(Sender: TObject);
    procedure JabberClientConnect(Sender: TObject);
    procedure JabberClientConnectError(Sender: TObject);
    procedure JabberClientDisconnect(Sender: TObject);
    procedure JabberClientGetBookMarks(Sender: TObject; QueryNode: TGmXmlNode);
    procedure JabberClientGetRoster(Sender: TObject; QueryNode: TGmXmlNode);
    procedure JabberClientIQ(Sender: TObject; QueryNode: TGmXmlNode);
    procedure JabberClientJabberOnline(Sender: TObject);
    procedure JabberClientLoginError(Sender: TObject; Error: string);
    procedure JabberClientSubscribe(Sender: TObject; From, Nick: string);
    procedure JabberClientRosterSet(Sender: TObject; Item: TRosterItem);
    procedure JabberClientWorkState(Sender: TObject; State: Boolean);
    procedure JabberClientMessage(Sender: TObject; Item: TJabberMessage);
    procedure JabberClientPresence(Sender: TObject; QueryNode: TGmXmlNode);
    procedure JabberClientReceiveData(Sender: TObject; SendStr: string; Handled: Boolean);
    procedure JabberClientSendData(Sender: TObject; SendStr: string);
    procedure TrayIconClick(Sender: TObject);
    procedure MenuItemStChatClick(Sender: TObject);
    procedure MenuItemStAwayClick(Sender: TObject);
    procedure MenuItemStXAClick(Sender: TObject);
    procedure MenuItemStDNDClick(Sender: TObject);
    procedure MenuItemStInvisibleClick(Sender: TObject);
    procedure MenuItemStOfflineClick(Sender: TObject);
    procedure MenuItemConfListClick(Sender: TObject);
    procedure OnIviteToConfClick(Sender: TObject);
    procedure OnBookmarkClick(Sender: TObject);
    procedure MenuItemContactRenameClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuItemUserVCardClick(Sender: TObject);
    procedure MenuItemSoundClick(Sender: TObject);
    procedure MenuItemContactDeleteClick(Sender: TObject);
    procedure MenuItemContactAuthRequestClick(Sender: TObject);
    procedure MenuItemContactAuthAcceptClick(Sender: TObject);
    procedure MenuItemContactAuthRemoveClick(Sender: TObject);
    procedure MenuItemContactVCardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItemAddContactSysClick(Sender: TObject);
    procedure MenuItemGetVersionClick(Sender: TObject);
    procedure PopupMenuContactsPopup(Sender: TObject);
    procedure MenuItemContactGroupAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure JabberClientConnecting(Sender: TObject);
    procedure TableExRosterItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure TableExRosterEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
    procedure TableExRosterEditOk(Sender: TObject; Value: string; ItemValue, ACol, ARow: Integer);
    procedure TableExRosterMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonFlatMenuClick(Sender: TObject);
    procedure PopupMenuSysPopup(Sender: TObject);
    procedure OnRemoveFromGroupClick(Sender: TObject);
    procedure TableExRosterDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure MenuItemSendAttontionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonFlatSearchClearClick(Sender: TObject);
    procedure LabelStatusTextClick(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
    procedure MenuItemStOnlineClick(Sender: TObject);
  private
    FActiveChatForm: TForm;
    FRosterList: TRosterList;
    FGroupList: TGroupList;
    FBookmarkList: TBookmarkList;
    BytesSend, BytesReceive: integer;
    procedure SetImageStatus(Status: TShowType; Picture: TPicture);
    function GetChatByJID(AJID: string; var Form: TFormChatRoom): Boolean;
    function GetGroupChatByJID(AJID: string; var Form: TFormConference): Boolean;
    procedure UpdateUserInfo(Card: TVCard);
    procedure OnAttention(Item: TJabberMessage);
    procedure EnterToGroupchat(ConfJID, Nick: string);
    procedure Load;
  public
    JabberClient: TJabberClient;
    FStatusMask: TPNGImage;
    FFullMask: TPNGImage;
    procedure PlaySounds(Sound: TSoundType); overload;
    function CheckAccount: Boolean;
    function CheckConnect: Boolean;
    procedure Start;
    procedure Open;
    procedure Save;
    function SetAccount: Boolean;
    property RosterList: TRosterList read FRosterList;
  end;

var
  FormMain: TFormMain;

implementation

uses
  IM.Account, IM.Config, IM.About, IM.Tool.Console, IM.Conference.Invite,
  IM.Contact.Add, IM.Account.Card, IM.Tool.Captcha, HGM.Common.Utils,
  System.NetEncoding, D2D1, System.DateUtils, IM.Core, HGM.Common.Settings,
  System.Math;

{$R *.dfm}

procedure TFormMain.OnAttention(Item: TJabberMessage);
begin
  ShowMessage('Вас окликнули ' + Item.From + #13#10 + Item.Body);
end;

procedure TFormMain.OnAddToGroupClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
  Item: TRosterItem;
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if FGroupList.IndexIn(MenuItem.Tag) then
    begin
      Item := FRosterList[TableExRoster.ItemIndex];
      Item.Groups.Add(FGroupList[MenuItem.Tag].Name);
      JabberClient.RenameContact(Item);
    end;
  end;
end;

procedure TFormMain.OnRemoveFromGroupClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
  Item: TRosterItem;
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    Item := FRosterList[TableExRoster.ItemIndex];
    if MenuItem.Tag < Item.Groups.Count then
    begin
      Item.Groups.Delete(MenuItem.Tag);
      JabberClient.RenameContact(Item);
    end;
  end;
end;

procedure TFormMain.Open;
begin
  ShowWindow(Application.Handle, SW_SHOW);
  FormMain.Show;
  FormMain.BringToFront;
end;

procedure TFormMain.OnBookmarkClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
begin
  ShowMessage(FBookmarkList[MenuItem.Tag].Name + ' ' + FBookmarkList[MenuItem.Tag].JID);
end;

procedure TFormMain.OnIviteToConfClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
begin
  if FBookmarkList.IndexIn(MenuItem.Tag) then
  begin
    EnterToGroupchat(FBookmarkList[MenuItem.Tag].JID, FBookmarkList[MenuItem.Tag].nick);
  end;
end;

procedure TFormMain.PlaySounds(Sound: TSoundType);
var
  SoundFile: string;
begin
  if not MenuItemSound.Checked then
    Exit;
  SoundFile := ExtractFilePath(Application.ExeName) + 'sounds\' + Core.Settings.GetStr('System', 'Sounds', 'icq');
  case Sound of
    sndError:
      SoundFile := SoundFile + '\warning.wav';
    sndOnline:
      SoundFile := SoundFile + '\online.wav';
    sndOffline:
      begin
        //А здесь воспроизведём не асинхронно
        SoundFile := SoundFile + '\disconnect.wav';
        if FileExists(SoundFile) then
          PlaySound(PChar(SoundFile), 0, SND_FILENAME);
        Exit;
      end;
    sndSubscribe:
      SoundFile := SoundFile + '\subscr.wav';
    sndWelcome:
      SoundFile := SoundFile + '\welcome.wav';
    sndMessage:
      SoundFile := SoundFile + '\msg.wav';
    sndGroup:
      SoundFile := SoundFile + '\group.wav';
  end;

  if FileExists(SoundFile) then
    PlaySound(PChar(SoundFile), 0, SND_FILENAME or SND_ASYNC);
end;

function TFormMain.GetChatByJID(AJID: string; var Form: TFormChatRoom): Boolean;
var
  i: Integer;
begin
  Result := False;
  AJID := AnsiLowerCase(AJID);
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TFormChatRoom) then
      if AnsiLowerCase((Components[i] as TFormChatRoom).JID) = AJID then
      begin
        Form := Components[i] as TFormChatRoom;
        Exit(True);
      end;
  end;
end;

function TFormMain.GetGroupChatByJID(AJID: string; var Form: TFormConference): Boolean;
var
  i: Integer;
begin
  Result := False;
  AJID := AnsiLowerCase(AJID);
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TFormConference) then
      if AnsiLowerCase((Components[i] as TFormConference).JID) = AJID then
      begin
        Form := Components[i] as TFormConference;
        Exit(True);
      end;
  end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  Hide;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FRosterList := TRosterList.Create(TableExRoster);
  FGroupList := TGroupList.Create;
  FBookmarkList := TBookmarkList.Create;
  FStatusMask := TPngImage.Create;
  FStatusMask.LoadFromResourceName(HInstance, 'statusmask');
  FFullMask := TPngImage.Create;
  FFullMask.LoadFromResourceName(HInstance, 'fullmask');

  ImageListOver.AddImages(ImageListNormal);
  for i := 0 to ImageListOver.Count - 1 do
    ColorImages(ImageListOver, i, clWhite);

  ColorImages(ImageList16, 0, $00C18852);
  ColorImages(ImageList16, 1, $00C18852);
  ColorImages(ImageList16, 2, $00C18852);

  LabelNick.Caption := '';
  LabelStatusText.Caption := 'Загрузка...';

  JabberClient := TJabberClient.Create(nil);
  JabberClient.Name := 'JabberClient';
  JabberClient.OnConnect := JabberClientConnect;
  JabberClient.OnConnecting := JabberClientConnecting;
  JabberClient.OnDisconnect := JabberClientDisconnect;
  JabberClient.OnConnectError := JabberClientConnectError;
  JabberClient.OnReceiveData := JabberClientReceiveData;
  JabberClient.OnSendData := JabberClientSendData;
  JabberClient.OnJabberOnline := JabberClientJabberOnline;
  JabberClient.OnGetRoster := JabberClientGetRoster;
  JabberClient.OnGetBookMarks := JabberClientGetBookMarks;
  JabberClient.OnMessage := JabberClientMessage;
  JabberClient.OnPresence := JabberClientPresence;
  JabberClient.OnIQ := JabberClientIQ;
  JabberClient.OnLoginError := JabberClientLoginError;
  JabberClient.OnSubscribe := JabberClientSubscribe;
  JabberClient.OnRosterSet := JabberClientRosterSet;
  JabberClient.OnWorkState := JabberClientWorkState;

  JabberClient.JabberPort := 5222;
  JabberClient.UserServer := 'jabber.ru';
  JabberClient.Resource := 'jabbrel';

  Load;

  //Звук запуска
  PlaySounds(sndWelcome);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  Save;

  FStatusMask.Free;
  FFullMask.Free;
  FBookmarkList.Free;
  FGroupList.Free;
  FRosterList.Free;
  JabberClient.Free;
end;

procedure TFormMain.JabberClientConnect(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientConnect: Connected to server!' + #10#13, $00FEB043);
  TFormChatRoom.SwowPopupWnd('Подключено!');
end;

procedure TFormMain.JabberClientConnecting(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientConnecting: Connecting' + #10#13, $00FEB043);
  ActivityIndicatorWork.Animate := True;
end;

procedure TFormMain.JabberClientConnectError(Sender: TObject);
begin
  ActivityIndicatorWork.Animate := False;
  PlaySounds(sndError);
  FormConsole.AddLog('JabberClientConnectError: Connect error!' + #10#13, $00FEB043);
  TFormChatRoom.SwowPopupWnd('Ошибка подключения!');
end;

procedure TFormMain.JabberClientDisconnect(Sender: TObject);
var
  i: Integer;
begin
  FormConsole.AddLog('JabberClientDisconnect: Disconnected!' + #10#13, $00FEB043);
  ActivityIndicatorWork.Animate := False;
  BytesSend := 0;
  BytesReceive := 0;
  PlaySounds(sndOffline);
  FRosterList.Clear;
  MenuItemAddContactSys.Enabled := False;
  MenuItemUserVCard.Enabled := False;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TFormConference then
    begin
      (Components[i] as TFormConference).OnDisconnect;
    end;
  TFormChatRoom.SwowPopupWnd('Отключен(а)!');
end;

procedure TFormMain.JabberClientGetBookMarks(Sender: TObject; QueryNode: TGmXmlNode);
var
  ItemStorage, ItemBookmarker: TGmXmlNode;
  i: integer;
  Item: TBookmarkItem;
begin
  ItemStorage := QueryNode.Children.NodeByName['storage'];
  if Assigned(ItemStorage) then
  begin
    FBookmarkList.BeginUpdate;
    FBookmarkList.Clear;
    for i := 0 to ItemStorage.Children.Count - 1 do
    begin
      ItemBookmarker := ItemStorage.Children.Node[i];
      if ItemBookmarker.Name = 'conference' then
      begin
        Item.BookmarkType := btConference;
        Item.Name := ItemBookmarker.Params.Values['name'];
        Item.JID := ItemBookmarker.Params.Values['jid'];
        Item.Autojoin := ItemBookmarker.Params.Values['autojoin'] = 'true';
        Item.Password := ItemBookmarker.Params.Values['password'];
        Item.Nick := ItemBookmarker.Children.NodeByName['nick'].AsString;
        FBookmarkList.Add(Item);
        Continue;
      end;
      if ItemBookmarker.Name = 'url' then
      begin
        Item.BookmarkType := btUrl;
        Item.Name := ItemBookmarker.Params.Values['name'];
        Item.URL := ItemBookmarker.Params.Values['url'];
        FBookmarkList.Add(Item);
        Continue;
      end;
    end;
    FBookmarkList.EndUpdate;
  end;
  FormConsole.AddLog('JabberClientGetBookMarks: BookMarks loaded!' + #10#13 + QueryNode.AsString, $005656FE);
  TFormChatRoom.SwowPopupWnd('Закладки загружены');
end;

procedure TFormMain.JabberClientGetRoster(Sender: TObject; QueryNode: TGmXmlNode);
var
  RosterItem: TGmXmlNode;
  Item: TRosterItem;
  Group: TGroupItem;
  i, j: integer;
begin
  FRosterList.BeginUpdate;
  FRosterList.Clear;
  FGroupList.BeginUpdate;
  FGroupList.Clear;
  for i := 0 to QueryNode.Children.Count - 1 do
  begin
    RosterItem := QueryNode.Children.Node[i];
    if RosterItem.Name = 'item' then
    begin
      //Секция группа
      Item := TRosterItem.Create;
      Item.JID := RosterItem.Params.Values['jid'];
      Item.Name := RosterItem.Params.Values['name'];
      if Item.Name.IsEmpty then
        Item.Name := NickFromJID(Item.JID);
      Item.Status := stOffline;
      SetDefaultAvatar(Item, FStatusMask);
      for j := 0 to RosterItem.Children.Count - 1 do
      begin
        Group.Name := RosterItem.Children.Node[j].AsString;
        Item.Groups.Add(Group.Name);
        if Group.Name <> '' then
          FGroupList.Add(Group);
      end;
      FRosterList.Add(Item);
    end;
  end;
  FRosterList.EndUpdate;
  FGroupList.EndUpdate;
  FormConsole.AddLog('JabberClientGetRoster: Roster loaded!' + #10#13, $005656FE);
end;

procedure TFormMain.JabberClientIQ(Sender: TObject; QueryNode: TGmXmlNode);
begin
  FormConsole.AddLog('JabberClientIQ ', $005656FE);
end;

procedure TFormMain.JabberClientJabberOnline(Sender: TObject);
var
  i: Integer;
begin
  ActivityIndicatorWork.Animate := False;
  FormConsole.AddLog('JabberClientJabberOnline: Now Online!' + #10#13, $00FEB043);

  MenuItemUserVCard.Enabled := True;
  MenuItemAddContactSys.Enabled := True;

  UpdateUserInfo(JabberClient.VCard);
  SetImageStatus(JabberClient.UserStatus, ImageShowType.Picture);
  LabelNick.Caption := JabberClient.UserNick;
  LabelStatusText.Caption := JabberClient.UserStatusText;
  PlaySounds(sndOnline);
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TFormConference then
    begin
      (Components[i] as TFormConference).OnConnect;
    end;
  TFormChatRoom.SwowPopupWnd('Онлайн!');
end;

procedure TFormMain.JabberClientLoginError(Sender: TObject; Error: string);
begin
  ActivityIndicatorWork.Animate := False;
  PlaySounds(sndError);
  FormConsole.AddLog('JabberClientLoginError: Login error!' + #10#13, $00FEB043);
  TFormChatRoom.SwowPopupWnd('Ошибка авторизации!! Проверьте ваш логин/пароль...');
end;

procedure TFormMain.JabberClientMessage(Sender: TObject; Item: TJabberMessage);
var
  JID: string;
  ChatRoom: TFormChatRoom;
  GroupChatRoom: TFormConference;
  Roster: TRosterItem;
begin
  FormConsole.AddLog('JabberClientMessage: ' + Item.From + ' ' + Item.Body, $005656FE);

  JID := LoginFromJID(Item.From);
  if Item.MessageType = 'headline' then
  begin
    OnAttention(Item);
    Exit;
  end;
  //Чат сообщение
  if Item.MessageType = 'chat' then
  begin
    if Assigned(FRosterList.Find(JID)) then
    begin
      Roster := FRosterList.Find(JID);
      with Roster do
      begin
        if not Item.Body.IsEmpty then
        begin
          LastMessage.ID := Item.ID;
          LastMessage.Body := Item.Body;
        end;
        Item.Nick := Name;
      end;
    end
    else
    begin
      Roster := TRosterItem.Create;
      Roster.JID := LoginFromJID(Item.From);
      Roster.Name := JID;
      SetDefaultAvatar(Roster, FStatusMask);
      FRosterList.Add(Roster);
      Item.Nick := JID;
    end;

    if not GetChatByJID(JID, ChatRoom) then
    begin
      ChatRoom := TFormChatRoom.Create(Self);
      ChatRoom.Parent := PanelClient;
      ChatRoom.SetItem(Roster);
    end;
    if not Item.Body.IsEmpty then
    begin
      ChatRoom.NewMessage(Item);
      if (not Active) or (not ChatRoom.Visible) then
      begin
        TFormChatRoom.SwowPopupWnd(Item.Nick + ':' + Item.Body);
        if Assigned(Roster) then
          Roster.LastMessage.Unread := True;
      end
      else
      begin
        JabberClient.SendReadMessage(JID, Item.ID);
        if Assigned(Roster) then
          Roster.LastMessage.Unread := False;
      end;
    end
    else
      ChatRoom.MessageMarkers(Item);
    FRosterList.UpdateTable;
  end;

  //MSG from conference
  if (Item.MessageType = 'groupchat') then
  begin
    if GetGroupChatByJID(LoginFromJID(Item.From), GroupChatRoom) then
    begin
      Item.Nick := NickFromConfJID(Item.From);
      GroupChatRoom.NewMessage(Item);
      Exit;
    end;
  end;

  //MSG error
  if (Item.MessageType = 'error') then
  begin
    if GetGroupChatByJID(LoginFromJID(Item.From), GroupChatRoom) then
    begin
      GroupChatRoom.NewMessage(Item);
      Exit;
    end
    else
      ShowMessage(Item.From + #13#13 + Item.Error.Text);
  end;

  //Запрос проверки каптчи
  if (Item.MessageType = '') or (Item.MessageType = 'normal') then
  begin
    //CAPTCHA
    if Item.XMLNS_XOOB.URL <> '' then
    begin
      TFormCaptcha.Execute(Item.XMLNS_XOOB.URL);
      Exit;
    end;
  end;
end;

procedure TFormMain.UpdateUserInfo(Card: TVCard);
var
  Pic: TPicture;
  PNG: TPngImage;
begin
  with Card do
  begin
    if Photo.PhotoType <> '' then
    begin
      Pic := TPicture.Create;
      if SetImageFromBinVal(Photo.BinVal, Photo.PhotoType, Pic) then
      begin
        PNG := CreateAvatar(Pic.Graphic, FStatusMask);
        ImageAvatar.Picture.Assign(PNG);
        PNG.Free;
      end;
      Pic.Free;
    end
    else
    begin
      PNG := CreateDefaultAvatar(JabberClient.JID, JabberClient.UserNick, FStatusMask, CreateColorFromJID(JabberClient.JID));
      ImageAvatar.Picture.Assign(PNG);
      PNG.Free;
    end;
  end;
end;

procedure TFormMain.JabberClientPresence(Sender: TObject; QueryNode: TGmXmlNode);
var
  FormChat: TFormChatRoom;
  FormGroupChat: TFormConference;
  Item: TRosterItem;
  Pic: TPicture;
  PNG: TPngImage;
begin
  FormConsole.AddLog('JabberClientPresence ' + #10#13, $006A6AB4);
  {
  XMLItem := QueryNode;

  fromJID := XMLItem.Params.Values['from'];
  fromTYPE := LowerCase(XMLItem.Params.Values['type']);

  xmlItem2 := XMLItem.Children.NodeByName['error'];
  if Assigned(xmlItem2) then
    ErrorCode := xmlItem2.Params.Values['code'];
  if fromTYPE = 'error' then
  begin
    if ErrorCode = '409' then
      Application.MessageBox('Использованый вами ник уже используется кем-то другим.', 'Ошибка');

    if ErrorCode = '403' then
      Application.MessageBox(pchar('Вам запретили входить в комнату ' + fromJID2), 'Ошибка');

    if ErrorCode = '404' then
    begin
      FormConsole.AddLog('Сервер контакта - ' + fromJID2 + ' недоступен, удалите его!' + #10#13, $00FEB043);
    end;

    if ErrorCode = '407' then
    begin
      confONLY := LoginFromJID(fromJID);
      Application.MessageBox(pchar('Для входа в комнату ' + confONLY + ' нужно иметь членство.'), 'Ошибка');
      FormConference.ConfClose2(confONLY);
    end;
    Exit;
  end;       }

  if GetGroupChatByJID(LoginFromJID(QueryNode.Params.Values['from']), FormGroupChat) then
  begin
    FormGroupChat.OnPresence(Sender, QueryNode);
  end
  else
  begin
    //Свой статус
    if QueryNode.Params.Values['from'] = JabberClient.JID + '/' + JabberClient.Resource then
    begin
      if QueryNode.Children.NodeExists('show') then
        SetImageStatus(StrToShowType(QueryNode.Children.NodeByName['show'].AsString), ImageShowType.Picture)
      else
        SetImageStatus(stNormal, ImageShowType.Picture);

      if QueryNode.Children.NodeExists('status') then
        LabelStatusText.Caption := QueryNode.Children.NodeByName['status'].AsString
      else
        LabelStatusText.Caption := '';

      if QueryNode.Children.NodeExists('x') then
        if QueryNode.Children.NodeByName['x'].Children.NodeExists('photo') then
          if JabberClient.PhotoHash <> QueryNode.Children.NodeByName['x'].Children.NodeByName['photo'].AsString then
          begin
            JabberClient.PhotoHash := QueryNode.Children.NodeByName['x'].Children.NodeByName['photo'].AsString;
            UpdateUserInfo(JabberClient.GetVCard(JabberClient.JID));
          end;
    end
    else //Чей-то статус
    begin
      Item := FRosterList.Find(LoginFromJID(QueryNode.Params.Values['from']));
      if Assigned(Item) then
      begin
        if QueryNode.Params.Values['type'] = 'unavailable' then
          Item.Status := stOffline
        else
        begin
          if QueryNode.Children.NodeExists('show') then
            Item.Status := StrToShowType(QueryNode.Children.NodeByName['show'].AsString)
          else
            Item.Status := stNormal;

          if QueryNode.Children.NodeExists('status') then
            Item.StatusText := QueryNode.Children.NodeByName['status'].AsString;
          if QueryNode.Children.NodeExists('x') then
            if QueryNode.Children.NodeByName['x'].Children.NodeExists('photo') then
              if Item.Photo <> QueryNode.Children.NodeByName['x'].Children.NodeByName['photo'].AsString then
              begin
                Item.Photo := QueryNode.Children.NodeByName['x'].Children.NodeByName['photo'].AsString;
                with JabberClient.GetVCard(Item.JID) do
                begin
                  if Photo.PhotoType <> '' then
                  begin
                    Pic := TPicture.Create;
                    if SetImageFromBinVal(Photo.BinVal, Photo.PhotoType, Pic) then
                    begin
                      PNG := CreateAvatar(Pic.Graphic, FStatusMask);
                      Item.Avatar.Assign(PNG);
                      PNG.Free;
                    end;
                    Pic.Free;
                  end
                  else
                    Item.Photo := '';
                end;
              end;
          //JabberClient.SendPresence(QueryNode.Params.Values['from']);
        end;
        if GetChatByJID(Item.JID, FormChat) then
        begin
          FormChat.SetItem(Item);
        end;
        FRosterList.UpdateTable;
      end;
    end;
  end;

  FormConsole.AddLog('JabberClientPresence END' + #10#13, $006A6AB4);
end;

procedure TFormMain.JabberClientReceiveData(Sender: TObject; SendStr: string; Handled: Boolean);
begin
  BytesReceive := BytesReceive + Length(SendStr);
  FormConsole.AddLog('JabberClientReceiveData: ' + SendStr + #10#13, $005656FE);
end;

procedure TFormMain.JabberClientRosterSet(Sender: TObject; Item: TRosterItem);
begin
  if Item.Subscription = 'remove' then
  begin
    FRosterList.Delete(Item.JID);
    Exit;
  end;
  if not Assigned(Item.Avatar) then
    SetDefaultAvatar(Item, FStatusMask);
  FRosterList.Update(Item);
  FGroupList.Add(Item.Groups);
  FormConsole.AddLog('JabberClientRosterSet: ' + Item.JID + #10#13, $005656FE);
end;

procedure TFormMain.JabberClientSendData(Sender: TObject; SendStr: string);
begin
  BytesSend := BytesSend + Length(SendStr);
  FormConsole.AddLog('JabberClientSendData: ' + SendStr + #10#13, $0085C285);
end;

procedure TFormMain.JabberClientSubscribe(Sender: TObject; From, Nick: string);
var
  JIDExists: Boolean;
  i: Integer;
begin
  PlaySounds(sndSubscribe);

  if MessageDlg('Подтвердить авторизацию ' + From + '? ', mtConfirmation, mbYesNo, 1) = mrYes then
  begin
    JIDExists := False;
    for i := 0 to FRosterList.Count - 1 do
    begin
      if LowerCase(LoginFromJID(FRosterList[i].JID)) = LowerCase(From) then
      begin
        JIDExists := True;
        Break;
      end;
    end;

    if JIDExists then
    begin
      JabberClient.SendSubscribeAccept(From);
      TFormChatRoom.SwowPopupWnd('Авторизация одобрена!');
    end
    else
    begin
      if InputQuery('Добавление нового контакта', 'Введите ник: ', Nick) then
      begin
        if Nick = '' then
          Nick := LoginFromJID(From);
        JabberClient.AddContact(From, Nick);
        Sleep(1000);
        JabberClient.SendSubscribeAccept(From);
        TFormChatRoom.SwowPopupWnd('Авторизация одобрена!');
      end;
    end;
  end
  else
  begin
    JabberClient.SendSubscribeCancel(From);
    TFormChatRoom.SwowPopupWnd('Авторизация отменена!');
  end;
end;

procedure TFormMain.JabberClientWorkState(Sender: TObject; State: Boolean);
begin
  if ActivityIndicatorWork.Animate <> State then
    ActivityIndicatorWork.Animate := State;
  Application.ProcessMessages;
end;

procedure TFormMain.MenuItemAccountClick(Sender: TObject);
begin
  if SetAccount then
  begin
    if JabberClient.Online then
      JabberClient.Disconnect;
    JabberClient.Connect;
  end;
end;

procedure TFormMain.MenuItemContactRenameClick(Sender: TObject);
begin
  TableExRoster.Edit(TableExRoster.ItemIndex, 1);
end;

procedure TFormMain.MenuItemContactDeleteClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JabberClient.DeleteContact(FRosterList[TableExRoster.ItemIndex].JID);
    FRosterList.Delete(TableExRoster.ItemIndex);
  end;
end;

procedure TFormMain.MenuItemContactAuthAcceptClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JabberClient.SendSubscribeAccept(FRosterList[TableExRoster.ItemIndex].JID);
  end;
end;

procedure TFormMain.MenuItemContactAuthRemoveClick(Sender: TObject);
var
  JID: string;
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JID := FRosterList[TableExRoster.ItemIndex].JID;
    JabberClient.SendSubscribeCancel(JID);
    JabberClient.SendUnsubscribe(JID);
    JabberClient.SendAuthRemove(JID);
  end;
end;

procedure TFormMain.MenuItemContactAuthRequestClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JabberClient.SendAuthRequest(FRosterList[TableExRoster.ItemIndex].JID);
  end;
end;

procedure TFormMain.MenuItemSendAttontionClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JabberClient.SendAttention(FRosterList[TableExRoster.ItemIndex].JID);
  end;
end;

procedure TFormMain.MenuItemSettingsClick(Sender: TObject);
begin
  TFormConfig.Execute;
end;

procedure TFormMain.MenuItemStOnlineClick(Sender: TObject);
begin
  JabberClient.UserStatus := stNormal;
  CheckConnect;
end;

procedure TFormMain.MenuItemStChatClick(Sender: TObject);
begin
  JabberClient.UserStatus := stChat;
  CheckConnect;
end;

procedure TFormMain.MenuItemStAwayClick(Sender: TObject);
begin
  JabberClient.UserStatus := stAway;
  CheckConnect;
end;

procedure TFormMain.MenuItemStXAClick(Sender: TObject);
begin
  JabberClient.UserStatus := stXa;
  CheckConnect;
end;

procedure TFormMain.MenuItemStDNDClick(Sender: TObject);
begin
  JabberClient.UserStatus := stDnd;
  CheckConnect;
end;

procedure TFormMain.MenuItemStInvisibleClick(Sender: TObject);
begin
  JabberClient.UserStatus := stInvisible;
  CheckConnect;
end;

procedure TFormMain.MenuItemStOfflineClick(Sender: TObject);
begin
  JabberClient.Disconnect;
end;

procedure TFormMain.MenuItemConfListClick(Sender: TObject);
var
  AConf, ANick: string;
begin
  if JabberClient.Online then
  begin
    if TFormConfInvite.Execute(JabberClient, AConf, ANick) then
    begin
      EnterToGroupchat(AConf, ANick);
    end;
  end;
end;

procedure TFormMain.MenuItemQuitClick(Sender: TObject);
begin
  JabberClient.Disconnect;
  Application.Terminate;
end;

procedure TFormMain.MenuItemAddContactSysClick(Sender: TObject);
var
  AJID, ANick: string;
  Item: TRosterItem;
begin
  if TFormContactAdd.Execute(AJID, ANick, FGroupList) then
  begin
    Item := TRosterItem.Create;
    Item.JID := AJID;
    Item.Name := ANick;
    Item.Groups.AddStrings(FGroupList.ToList(True));
    if FormMain.JabberClient.AddContact(Item) then
      ShowMessage('Контакт добавлен');
    Item.Free;
  end;
end;

procedure TFormMain.MenuItemGetVersionClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if JabberClient.Online then
    begin
      ShowMessage(JabberClient.GetVersion(FRosterList[TableExRoster.ItemIndex].JID).ToString);
    end;
  end;
end;

procedure TFormMain.MenuItemAboutClick(Sender: TObject);
begin
  TFormAbout.Execute;
end;

procedure TFormMain.MenuItemContactGroupAddClick(Sender: TObject);
var
  GroupName: string;
  Item: TRosterItem;
begin
  if InputQuery('Добавление новой группы', 'Название группы: ', GroupName) and (GroupName <> '') then
  begin
    if FRosterList.IndexIn(TableExRoster.ItemIndex) then
    begin
      Item := FRosterList[TableExRoster.ItemIndex];
      Item.Groups.Add(GroupName);
      JabberClient.RenameContact(Item);
    end;
  end;
end;

procedure TFormMain.MenuItemSoundClick(Sender: TObject);
begin
  MenuItemSound.Checked := not MenuItemSound.Checked;
  Core.Settings.SetBool('System', 'Sound', MenuItemSound.Checked);
end;

procedure TFormMain.PopupMenuContactsPopup(Sender: TObject);
var
  MenuItem: TMenuItem;
  ItemGroups: TStringList;
  i: integer;
begin
  //Группы
  MenuItemAddToGroup.Clear;
  for i := 0 to FGroupList.Count - 1 do
  begin
    MenuItem := PopupMenuContacts.CreateMenuItem;
    MenuItem.Caption := FGroupList[i].Name;
    MenuItem.OnClick := OnAddToGroupClick;
    MenuItem.Tag := i;
    MenuItemAddToGroup.Add(MenuItem);
  end;
  MenuItemAddToGroup.Visible := MenuItemAddToGroup.Count > 0;

  //Группы (в которых состоит пользователь)
  ItemGroups := FRosterList[TableExRoster.ItemIndex].Groups;
  MenuItemRemoveGroup.Clear;
  for i := 0 to ItemGroups.Count - 1 do
  begin
    MenuItem := PopupMenuContacts.CreateMenuItem;
    MenuItem.Caption := ItemGroups[i];
    MenuItem.OnClick := OnRemoveFromGroupClick;
    MenuItem.Tag := i;
    MenuItemRemoveGroup.Add(MenuItem);
  end;
  MenuItemRemoveGroup.Visible := MenuItemRemoveGroup.Count > 0;
end;

procedure TFormMain.PopupMenuSysPopup(Sender: TObject);
var
  MenuItem: TMenuItem;
  i: integer;
begin
  //Закладки
  MenuItemBookmarks.Clear;
  for i := 0 to FBookmarkList.Count - 1 do
  begin
    MenuItem := PopupMenuSys.CreateMenuItem;
    MenuItem.Caption := FBookmarkList[i].Name;
    MenuItem.OnClick := OnBookmarkClick;
    MenuItem.Tag := i;
    MenuItemBookmarks.Add(MenuItem);
  end;
end;

procedure TFormMain.Save;
begin
  Core.Settings.SetParamWindow('Form', Self, [wpsCoord, wpsSize]);
end;

procedure TFormMain.LabelStatusTextClick(Sender: TObject);
begin
  JabberClient.UserStatusText := InputBox('Статус', 'Введите Ваш статус', JabberClient.UserStatusText);
  Core.Settings.SetStr('Account', 'Status', JabberClient.UserStatusText);
end;

procedure TFormMain.Load;
var
  PNG: TPngImage;
begin
  JabberClient.JID := Core.Settings.GetStr('Account', 'JID');
  JabberClient.UserServer := Core.Settings.GetStr('Account', 'Server', JabberClient.UserServer);
  JabberClient.JabberPort := Core.Settings.GetInt('Account', 'Port', 5222);
  JabberClient.UserNick := Core.Settings.GetStr('Account', 'Nick', JabberClient.UserNick);
  JabberClient.AuthHash := Core.Settings.GetStr('Account', 'Password');
  JabberClient.UserStatusText := Core.Settings.GetStr('Account', 'Status');

  MenuItemSound.Checked := Core.Settings.GetBool('System', 'Sound', True);

  Core.Settings.GetParamWindow('Form', Self, [wpsCoord, wpsSize]);

  LabelNick.Caption := JabberClient.UserNick;
  LabelStatusText.Caption := JabberClient.UserStatusText;
  PNG := CreateDefaultAvatar(JabberClient.JID, JabberClient.UserNick, FStatusMask, CreateColorFromJID(JabberClient.JID));
  ImageAvatar.Picture.Assign(PNG);
  PNG.Free;
  SetImageStatus(stOffline, ImageShowType.Picture);
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  EnterToGroupchat('зона@conference.jabber.ru', 'Пупка2');
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  EnterToGroupchat('!!!заходите!!!@conference.jabber.ru', 'Пупка');
end;

procedure TFormMain.EditSearchChange(Sender: TObject);
begin
  ButtonFlatSearchClear.Visible := EditSearch.Text <> '';
end;

procedure TFormMain.EnterToGroupchat(ConfJID, Nick: string);
var
  FormChat: TFormConference;
  LastForm: TForm;
begin
  if Assigned(FActiveChatForm) then
    LastForm := FActiveChatForm
  else
    LastForm := nil;
  if not GetGroupChatByJID(ConfJID, FormChat) then
  begin
    FormChat := TFormConference.Create(Self);
    FormChat.Parent := PanelClient;
    FormChat.SetData(ConfJID, Nick);
  end
  else if FormChat.Disconnected then
    FormChat.SetData(ConfJID, Nick);

  FormChat.Show;
  FormChat.BringToFront;
  FActiveChatForm := FormChat;
  if Assigned(LastForm) and (FActiveChatForm <> LastForm) then
  begin
    LastForm.Hide;
  end;
end;

procedure TFormMain.ButtonFlatMenuClick(Sender: TObject);
var
  PT: TPoint;
begin
  PT := ButtonFlatMenu.ClientToScreen(Point(0, ButtonFlatMenu.Height));
  PopupMenuSys.Popup(PT.X, PT.Y);
end;

procedure TFormMain.ButtonFlatSearchClearClick(Sender: TObject);
begin
  EditSearch.Clear;
end;

function TFormMain.CheckAccount: Boolean;
begin
  //Проверка данных аккаунта
  if not JabberClient.CheckAccount then
  begin
    TFormChatRoom.SwowPopupWnd('Введите данные Вашей учетной записи!');
    Result := SetAccount;
  end
  else
    Result := True;
end;

function TFormMain.CheckConnect: Boolean;
begin
  if JabberClient.Online then
    Exit(True);
  if CheckAccount then
    JabberClient.Connect;
  Result := False;
end;

procedure TFormMain.Start;
begin
  {$IFDEF DEBUG}
  FormConsole.Show;
  {$ENDIF}
  if CheckAccount then
    CheckConnect;
  Show;
end;

procedure TFormMain.TableExRosterDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
          ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 15, Rect.Bottom - 15, Ord(FRosterList[ARow].Status), True);
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
            ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 20, Rect.Top + 2, 7, True);
          end
          else
          begin
            TextOut(Rect.Left, Rect.Top + 22, FRosterList[ARow].GetDisplayStatus);
          end;
        end;
    end;
  end;
end;

function TFormMain.SetAccount: Boolean;
var
  JID, Nick, Password, Server, Port: string;
begin
  Result := False;
  JID := JabberClient.JID;
  Server := JabberClient.UserServer;
  Nick := JabberClient.UserNick;
  Password := JabberClient.AuthHash;
  Port := JabberClient.JabberPort.ToString;
  if TFormAccount.Execute(JID, Nick, Password, Server, Port) then
  begin
    JabberClient.JID := JID;
    JabberClient.UserServer := Server;
    JabberClient.UserNick := Nick;
    if Password <> JabberClient.AuthHash then
      JabberClient.AuthHash := GetAuthHash(JabberClient.UserName, JabberClient.UserServer, Password);
    JabberClient.JabberPort := StrToIntDef(Port, 5222);

    Core.Settings.SetStr('Account', 'Nick', JabberClient.UserNick);
    Core.Settings.SetInt('Account', 'Port', JabberClient.JabberPort);
    Core.Settings.SetStr('Account', 'JID', JabberClient.JID);
    Core.Settings.SetStr('Account', 'Password', JabberClient.AuthHash);
    Core.Settings.SetStr('Account', 'Server', JabberClient.UserServer);
    Result := True;
  end;
end;

procedure TFormMain.SetImageStatus(Status: TShowType; Picture: TPicture);
var
  Icon: TIcon;
begin
  Icon := TIcon.Create;
  ImageListStatuses.GetIcon(Ord(Status), Icon);
  ImageShowType.Picture.Assign(Icon);
  Icon.Free;
end;

procedure TFormMain.Splitter1CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  NewSize := Max(PanelLeft.Constraints.MinWidth, Min(NewSize, PanelLeft.Constraints.MaxWidth));
end;

procedure TFormMain.TableExRosterEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
begin
  if ACol <> 1 then
    Exit;
  if FRosterList.IndexIn(ARow) then
  begin
    Data.EditMode := teText;
    Data.TextValue := FRosterList.Items[ARow].Name;
    Data.Color := $0021160E;
    Data.FontColor := clWhite;
    Allow := True;
  end;
end;

procedure TFormMain.TableExRosterEditOk(Sender: TObject; Value: string; ItemValue, ACol, ARow: Integer);
var
  LV: string;
begin
  LV := FRosterList.Items[ARow].Name;
  FRosterList.Items[ARow].Name := Value;
  if not JabberClient.RenameContact(FRosterList.Items[ARow]) then
  begin
    FRosterList.Items[ARow].Name := LV;
  end;
  TableExRoster.Repaint;
end;

procedure TFormMain.TableExRosterItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
var
  JID: string;
  Item: TRosterItem;
  FormChat: TFormChatRoom;
  LastForm: TForm;
begin
  if FRosterList.IndexIn(Index) then
  begin
    Item := FRosterList.Items[Index];
    Item.LastMessage.Unread := False;
    JID := MD5(LoginFromJID(Item.JID));
    if Assigned(FActiveChatForm) then
    begin
      LastForm := FActiveChatForm;
    end
    else
    begin
      LastForm := nil;
    end;
    if not GetChatByJID(LoginFromJID(Item.JID), FormChat) then
    begin
      FormChat := TFormChatRoom.Create(Self);
      FormChat.Parent := PanelClient;
      FormChat.SetItem(Item);
    end;
    FormChat.Show;
    FormChat.BringToFront;
    FActiveChatForm := FormChat;
    if Assigned(LastForm) and (FActiveChatForm <> LastForm) then
    begin
      LastForm.Hide;
    end;
    FRosterList.UpdateTable;
  end;
end;

procedure TFormMain.TableExRosterMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    if TableExRoster.ItemUnderMouse >= 0 then
    begin
      PopupMenuContacts.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
    end
    else
    begin

    end;
  end;
end;

procedure TFormMain.TrayIconClick(Sender: TObject);
begin
  Open;
end;

procedure TFormMain.MenuItemContactVCardClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    TFormAccountCard.ShowCard(JabberClient.GetVCard(FRosterList[TableExRoster.ItemIndex].JID));
  end;
end;

procedure TFormMain.MenuItemUserVCardClick(Sender: TObject);
var
  Card: TVCard;
begin
  Card := JabberClient.GetVCard(JabberClient.JID);
  if TFormAccountCard.EditCard(Card) then
    JabberClient.SetVCard(Card);
end;

procedure TFormMain.MenuItemConsoleClick(Sender: TObject);
begin
  FormConsole.Show;
end;

end.

