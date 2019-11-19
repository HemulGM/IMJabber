unit IM.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Types, System.UITypes, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  Winapi.MMSystem, System.IniFiles, System.ImageList, System.Actions, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Controls, Vcl.Imaging.jpeg,
  Jabber.Types, Jabber, GmXml, MD5Hash, System.Generics.Collections,
  HGM.Controls.VirtualTable, HGM.Button, Vcl.WinXCtrls, Vcl.Grids,
  Vcl.Imaging.pngimage, IM.ChatRoom, Direct2D, IM.Classes, IM.Conference;

type
  TFormMain = class(TForm)
    ActionListMain: TActionList;
    ImageListStatuses: TImageList;
    TrayIcon: TTrayIcon;
    PopupMenuSys: TPopupMenu;
    PopupMenuStatus: TPopupMenu;
    MenuItemAccount: TMenuItem;
    MenuItemSettings: TMenuItem;
    MenuItemQuit: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemSound: TMenuItem;
    MenuItemStatusOnline: TMenuItem;
    MenuItemStatusChat: TMenuItem;
    MenuItemStatusAway: TMenuItem;
    MenuItemStatusXa: TMenuItem;
    MenuItemStatusDND: TMenuItem;
    MenuItemStatusInvis: TMenuItem;
    MenuItemDisconnect: TMenuItem;
    MenuItemConsole: TMenuItem;
    MenuItemBookmarks: TMenuItem;
    ActionGroupChat: TAction;
    PopupMenuContacts: TPopupMenu;
    MenuItemContactVCard: TMenuItem;
    MenuItemContactRename: TMenuItem;
    MenuItemContactDelete: TMenuItem;
    MenuItemContactAuth: TMenuItem;
    MenuItemContactAuthAccept: TMenuItem;
    MenuItemContactAuthRemove: TMenuItem;
    MenuItemContactAuthRequest: TMenuItem;
    MenuItemStatuses: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    MenuItemConfList: TMenuItem;
    ActionNewChat: TAction;
    MenuItemUserVCard: TMenuItem;
    load_avatar: TAction;
    ActionRequierAutorize: TAction;
    ActionAutorization: TAction;
    ActionRemoveAutorize: TAction;
    ActionAccountCheck: TAction;
    sort_contacts: TAction;
    MenuItemAddContactSys: TMenuItem;
    MenuItemGetVersion: TMenuItem;
    MenuItemIviteToConf: TMenuItem;
    ActionAddInviteItem: TAction;
    ActionStatusInConfs: TAction;
    ActionAuthAndAdd: TAction;
    ActionShowMain: TAction;
    MenuItemContactGroup: TMenuItem;
    MenuItemContactGroupAdd: TMenuItem;
    MenuItemAddToGroup: TMenuItem;
    PanelMenu: TPanel;
    LabelStatus: TLabel;
    PanelContacts: TPanel;
    PanelClient: TPanel;
    PanelLeft: TPanel;
    Shape1: TShape;
    TableExRoster: TTableEx;
    ButtonFlatMenu: TButtonFlat;
    ImageListNormal: TImageList;
    ImageListOver: TImageList;
    MenuItemRemoveGroup: TMenuItem;
    ActivityIndicatorWork: TActivityIndicator;
    Panel1: TPanel;
    ImageAvatar: TImage;
    LabelNick: TLabel;
    LabelStatusText: TLabel;
    ImageShowType: TImage;
    N1: TMenuItem;
    N2: TMenuItem;
    MenuItemSendAttontion: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Button1: TButtonFlat;
    Button2: TButtonFlat;
    procedure Image2Click(Sender: TObject);
    procedure MenuItemQuitClick(Sender: TObject);
    procedure MenuItemAccountClick(Sender: TObject);
    procedure MenuItemSettingsClick(Sender: TObject);
    procedure InviteConf(Sender: TObject);
    procedure OnAddToGroupClick(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure MenuItemConsoleClick(Sender: TObject);
    procedure JabberClientConnect(Sender: TObject);
    procedure JabberClientConnectError(Sender: TObject);
    procedure JabberClientDisconnect(Sender: TObject);
    procedure JabberClientGetBookMarks(Sender: TObject; QueryNode: TGmXmlNode);
    procedure JabberClientGetRoster(Sender: TObject; QueryNode: TGmXmlNode);
    procedure MenuItemStatusOnlineClick(Sender: TObject);
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
    procedure MenuItemDisconnectClick(Sender: TObject);
    procedure MenuItemStatusChatClick(Sender: TObject);
    procedure MenuItemStatusAwayClick(Sender: TObject);
    procedure MenuItemStatusXaClick(Sender: TObject);
    procedure MenuItemStatusDNDClick(Sender: TObject);
    procedure MenuItemStatusInvisClick(Sender: TObject);
    procedure LabelStatusClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
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
    procedure ActionAddInviteItemExecute(Sender: TObject);
    procedure PopupMenuContactsPopup(Sender: TObject);
    procedure ActionShowMainExecute(Sender: TObject);
    procedure MenuItemContactGroupAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionAuthAndAddExecute(Sender: TObject);
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
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  public
    JabberClient: TJabberClient;
    FStatusMask: TPNGImage;
    FFullMask: TPNGImage;
    procedure PlaySound(Sound: TSoundType); overload;
    function CheckAccount: Boolean;
    function CheckConnect: Boolean;
    procedure Start;
  end;

var
  FormMain: TFormMain;
  DefaultColors: array[$0..$F] of TColor = ($00E6A330, $00B98843, $00874FCB, $00A6A441, $00C16579, $003B86DB, $005445DD, $0055AA63, $00D5D52B, $00AB5656, $00E6A330, $00B98843, $00874FCB, $00A6A441, $00C16579, $003B86DB);

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;

function CreateDefaultAvatar(JID, Name: string; Mask: TPngImage; Color: TColor = clNone): TPngImage;

function SetDefaultAvatar(Item: TRosterItem; Mask: TPngImage): Boolean;

function CreateColorFromJID(JID: string): TColor;

function CreateShortName(JID, Name: string): string;

implementation

uses
  IM.Account, IM.Config, IM.About, IM.Tool.Console, IM.Conference.Invite,
  IM.Contact.Add, IM.Account.Card, IM.Tool.Captcha, HGM.Common.Utils,
  System.NetEncoding, D2D1, System.DateUtils;

{$R *.dfm}

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;
begin
  Result := TPngImage.CreateBlank(COLOR_RGB, 16, Mask.Width, Mask.Height);
  Result.Canvas.StretchDraw(Rect(0, 0, Mask.Width, Mask.Height), Source);
  Result.CreateAlpha;
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
  Item.Avatar.Free;
  Item.Avatar := CreateDefaultAvatar(Item.JID, Item.Name, Mask, Item.Color);
  Result := True;
end;

function ReadIni(file_name, ASection, AString: string): string;
var
  sIniFile: TIniFile;
begin
  sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\' + file_name + '.ini');
  Result := sIniFile.ReadString(ASection, AString, '');
  sIniFile.Free;
end;

procedure WriteIni(file_name, ASection, AString, AValue: string);
var
  sIniFile: TIniFile;
begin
  sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\' + file_name + '.ini');
  sIniFile.WriteString(ASection, AString, AValue);
  sIniFile.Free;
end;

function ReadINISections(file_name: string; Strings: TStrings): bool;
var
  sIniFile: TIniFile;
begin
  sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\' + file_name + '.ini');
  sIniFile.ReadSections('', Strings);
  sIniFile.Free;
end;

//Получение инфы по нику
//info_type = [uname, group, groupid, jid]
function nick2info(nick: string; info_type: string): string;
var
  LB: TStringList;
  i: Integer;
begin
  LB := TStringList.Create;
  ReadINISections('rostr', LB);
  for i := 0 to LB.Count - 1 do
  begin
    if readini('rostr', LB.Strings[i], 'uname') = nick then
    begin
      Result := readini('rostr', LB.Strings[i], info_type);
      Break;
    end;
  end;
  LB.Free;
end;

//Получение инфы по джиду
//InfoType = [uname, group, groupid, jid]
function JIDToInfo(JID: string; InfoType: string): string;
var
  LB: TStringList;
  i: Integer;
begin
  LB := TStringList.Create;
  ReadINISections('rostr', LB);
  for i := 0 to LB.Count - 1 do
  begin
    if LB.Strings[i] = JID then
      Result := readini('rostr', LB.Strings[i], InfoType);
    Application.ProcessMessages;
  end;
  LB.Free;
end;

//Проверка наличия JID
function JIDexists(JID: string): bool;
var
  LB: TStringList;
  i: Integer;
begin
  Result := False;
  LB := TStringList.Create;
  ReadINISections('rostr', LB);
  for i := 0 to LB.Count - 1 do
  begin
    if AnsiLowerCase(LB.Strings[i]) = AnsiLowerCase(JID) then
      Result := True;
  end;
  LB.Free;
end;

//Добавление пользователей в ростр
function load_rostr(rostr: TListView; reload_rostr: bool): bool;
var
  LB: TStringList;
  i: Integer;
  Item: TlistItem;
begin
  Result := False;
  LB := TStringList.Create;
  ReadINISections('rostr', LB);

  for i := 0 to LB.Count - 1 do
  begin
    //Добавляем контакт в группу
    Item := rostr.Items.Add;
    Item.Caption := readini('rostr', LB.Strings[i], 'uname'); // Имя контакта
    try
      Item.ImageIndex := strtoint(readini('rostr', LB.Strings[i], 'show'));
      Item.SubItems.Insert(0, readini('rostr', LB.Strings[i], 'status'));
      //Сохраняем индекс
      WriteIni('rostr', LB.Strings[i], 'index', inttostr(Item.Index));
      Item.GroupID := strtoint(readini('rostr', LB.Strings[i], 'groupid'));
    except

    end;

    Result := true;
  end;

  LB.Free;
end;

procedure TFormMain.InviteConf(Sender: TObject);
var
  menuItem: TMenuItem;
  conf: string;
  i: integer;
begin
  i := random(777);
  menuItem := TMenuItem(Sender);
  conf := Format('%s', [menuItem.Caption]);
  if conf <> '' then
  begin
    if FRosterList.IndexIn(TableExRoster.ItemIndex) then
    begin
      JabberClient.SendData('<message to="' + conf + '" id="inv' + inttostr(i) + '" >' + '<x xmlns="http://jabber.org/protocol/muc#user"><invite to="' + FRosterList[TableExRoster.ItemIndex].JID + '" /></x></message>');
    end;
  end;
end;

procedure TFormMain.OnAddToGroupClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if FGroupList.IndexIn(MenuItem.Tag) then
    begin
      FRosterList[TableExRoster.ItemIndex].Groups.Add(FGroupList[MenuItem.Tag].Name);
      JabberClient.RenameContact(FRosterList[TableExRoster.ItemIndex]);
    end;
  end;
end;

procedure TFormMain.OnAttention(Item: TJabberMessage);
begin
  ShowMessage('Вас окликнули ' + Item.From + #13#10 + Item.Body);
end;

procedure TFormMain.OnRemoveFromGroupClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if MenuItem.Tag < FRosterList[TableExRoster.ItemIndex].Groups.Count then
    begin
      FRosterList[TableExRoster.ItemIndex].Groups.Delete(MenuItem.Tag);
      JabberClient.RenameContact(FRosterList[TableExRoster.ItemIndex]);
    end;
  end;
end;

procedure TFormMain.OnBookmarkClick(Sender: TObject);
begin
  ShowMessage(FBookmarkList[TMenuItem(Sender).Tag].Name + ' ' + FBookmarkList[TMenuItem(Sender).Tag].JID);
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

procedure TFormMain.PlaySound(Sound: TSoundType);
var
  SoundFile: string;
begin
  if not MenuItemSound.Checked then
    Exit;
  SoundFile := ExtractFilePath(ParamStr(0)) + 'sounds\' + readini('options', 'system', 'sounds');
  case Sound of
    sndError:
      SoundFile := SoundFile + '\warning.wav';
    sndOnline:
      SoundFile := SoundFile + '\online.wav';
    sndOffline:
      SoundFile := SoundFile + '\disconnect.wav';
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
    Winapi.MMSystem.PlaySound(PChar(SoundFile), 0, SND_FILENAME or SND_ASYNC);
end;

//функция доступа к дочерным формам
function GetFormByName(Owner: TComponent; AName: string): TForm;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if (Owner.Components[i] is TForm) then
      if AnsiLowerCase(Owner.Components[i].Name) = AName then
        Exit(Owner.Components[i] as TForm);
  end;
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
      if (Components[i] as TFormChatRoom).JID = AJID then
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
      if (Components[i] as TFormConference).JID = AJID then
      begin
        Form := Components[i] as TFormConference;
        Exit(True);
      end;
  end;
end;

//функция доступа к дочерным memo
function GetMenuItemByName(Owner: TComponent; AName: string): Tmenuitem;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      if (Owner.Components[i] is Tmemo) then
        Exit(Owner.Components[i] as TmenuItem);
  end;
end;

//функция доступа к дочерным memo
function GetMemoByName(Owner: TComponent; AName: string): Tmemo;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      if (Owner.Components[i] is Tmemo) then
        Exit(Owner.Components[i] as Tmemo);
  end;
end;

function ExistComponentByName(Owner: TComponent; AName: string): Bool;
var
  i: Integer;
begin
  Result := false;
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      Exit(True);
  end;
end;

function ExistFormByName(Owner: TComponent; AName: string): Bool;
var
  i: Integer;
begin
  Result := False;
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if Owner.Components[i] is TForm then
      if AnsiLowerCase(Owner.Components[i].Name) = AName then
        Exit(True);
  end;
end;

procedure TFormMain.ActionAddInviteItemExecute(Sender: TObject);
var
  itm: TmenuItem;
  i: integer;
begin     {
  for i := 0 to FormConference.sTabControl1.Tabs.Count - 1 do
  begin
    itm := TmenuItem.Create(Owner);
    itm.Name := 'menu_' + md5(FormConference.sTabControl1.Tabs.Strings[i]);
    itm.Caption := FormConference.sTabControl1.Tabs.Strings[i];
    itm.OnClick := InviteConf;
    PopupMenuContacts.Items[6].Insert(0, itm);
  end;        }
end;

procedure TFormMain.ActionAuthAndAddExecute(Sender: TObject);
begin
  //
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
  FormMain.Hide;
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
  begin
    ColorImages(ImageListOver, i, clWhite);
  end;

  LabelNick.Caption := 'Пожалуйста подождите...';
  LabelStatusText.Caption := '';

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

  try
    LabelStatus.Caption := ReadIni('options', 'form', 'status');
    JabberClient.UserStatusText := LabelStatus.Caption;
    if ReadIni('options', 'form', 'sound') = '1' then
    begin
      MenuItemSound.Checked := True;
    end;
  finally

  end;
  //Звук запуска
  PlaySound(sndWelcome);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FStatusMask.Free;
  FFullMask.Free;
  FBookmarkList.Free;
  FGroupList.Free;
  FRosterList.Free;
  JabberClient.Free;
  writeini('options', 'form', 'top', inttostr(FormMain.Top));
  writeini('options', 'form', 'left', inttostr(FormMain.Left));
  writeini('options', 'form', 'height', inttostr(FormMain.height));
  writeini('options', 'form', 'width', inttostr(FormMain.width));
end;

procedure TFormMain.Image2Click(Sender: TObject);
begin
  PopupMenuSys.Popup(FormMain.left + 10, FormMain.top + FormMain.Height - 310);
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
  PlaySound(sndError);
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
  PlaySound(sndOffline);
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
  if Assigned(QueryNode) then
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
  PlaySound(sndOnline);
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
  PlaySound(sndError);
  FormConsole.AddLog('JabberClientLoginError: Login error!' + #10#13, $00FEB043);
  TFormChatRoom.SwowPopupWnd('Ошибка авторизации!! Проверьте ваш логин/пароль...');
end;

procedure TFormMain.JabberClientMessage(Sender: TObject; Item: TJabberMessage);
var
  JID, JIDmd: string;
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
    JIDmd := MD5(AnsiLowerCase(JID));
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

  //Запрос проверки каптчи
  if (Item.MessageType = '') or (Item.MessageType = 'normal') then
  begin
    //CAPTCHA
    if Item.XMLNS_XOOB.URL <> '' then
    begin
      TFormCaptcha.Execute(Item.XMLNS_XOOB.URL);
      Exit;
    end;
        {
    //парсинг инвайта
    if (XMLNode.Name = 'x') and (XMLNode.Params.Values['xmlns'] = 'jabber:x:conference') then
    begin
      TFormChatRoom.SwowPopupWnd(From + ' приглашает посетить конференцию ' + XMLNode.Params.Values['jid']);
      //выдергивание джида пославшего инвайт (вариант 2)
      if invite_from = '' then
        invite_from := XMLItem.Params.Values['from'];

      if Application.MessageBox(pchar(invite_from + ' приглашает посетить конференцию ' + XMLNode.Params.Values['jid']), 'Приглашение', MB_YESNO) = IDYES then
      begin
        FormConfInvite.sGroupBox1.Caption := XMLNode.Params.Values['jid'];
        FormConfInvite.Show;
      end;
    end; }
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
      PNG := CreateDefaultAvatar(JabberClient.JID, JabberClient.UserNick, FStatusMask);
      ImageAvatar.Picture.Assign(PNG);
      PNG.Free;
    end;
  end;
end;

procedure TFormMain.WMSize(var Message: TWMSize);
begin
  inherited;
  Invalidate;
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
  PlaySound(sndSubscribe);

  if MessageDlg('Подтвердить авторизацию от ' + From + '? ', mtConfirmation, mbYesNo, 1) = mrYes then
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

procedure TFormMain.MenuItemStatusChatClick(Sender: TObject);
begin
  JabberClient.UserStatus := stChat;
  CheckConnect;
end;

procedure TFormMain.MenuItemStatusAwayClick(Sender: TObject);
begin
  JabberClient.UserStatus := stAway;
  CheckConnect;
end;

procedure TFormMain.MenuItemStatusXaClick(Sender: TObject);
begin
  JabberClient.UserStatus := stXa;
  CheckConnect;
end;

procedure TFormMain.MenuItemStatusDNDClick(Sender: TObject);
begin
  JabberClient.UserStatus := stDnd;
  CheckConnect;
end;

procedure TFormMain.MenuItemStatusInvisClick(Sender: TObject);
begin
  JabberClient.UserStatus := stInvisible;
  CheckConnect;
end;

procedure TFormMain.MenuItemDisconnectClick(Sender: TObject);
begin
  JabberClient.Disconnect;
end;

procedure TFormMain.MenuItemAccountClick(Sender: TObject);
begin
  FormAccount.show;
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
  //Авторизируем
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JabberClient.SendSubscribeAccept(FRosterList[TableExRoster.ItemIndex].JID);
  end;
end;

procedure TFormMain.MenuItemContactAuthRemoveClick(Sender: TObject);
var
  JID: string;
begin
  //Удаляем авторизизацию юзера
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
  //Отправляем запрос на авторизацию
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    JabberClient.SendAuthRequest(FRosterList[TableExRoster.ItemIndex].JID);
  end;
end;

procedure TFormMain.MenuItemSendAttontionClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if JabberClient.Online then
    begin
      JabberClient.SendAttention(FRosterList[TableExRoster.ItemIndex].JID);
    end;
  end;
end;

procedure TFormMain.MenuItemSettingsClick(Sender: TObject);
begin
  FormConfig.show;
end;

procedure TFormMain.N31Click(Sender: TObject);
begin
  MenuItemStatusChat.Click;
end;

procedure TFormMain.N32Click(Sender: TObject);
begin
  MenuItemStatusAway.Click;
end;

procedure TFormMain.N33Click(Sender: TObject);
begin
  MenuItemStatusXa.Click;
end;

procedure TFormMain.N34Click(Sender: TObject);
begin
  MenuItemStatusDND.Click;
end;

procedure TFormMain.N35Click(Sender: TObject);
begin
  MenuItemStatusInvis.Click;
end;

procedure TFormMain.N36Click(Sender: TObject);
begin
  MenuItemDisconnect.Click;
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
  application.Terminate;
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
    //Item.Groups := edit2.Text;
    if FormMain.JabberClient.AddContact(Item) then
      ShowMessage('OK');
    Item.Free;
  end;
end;

procedure TFormMain.MenuItemGetVersionClick(Sender: TObject);
begin
  if FRosterList.IndexIn(TableExRoster.ItemIndex) then
  begin
    if JabberClient.Online then
    begin
      ShowMessage(JabberClient.GetVersion(FRosterList[TableExRoster.ItemIndex].JID).Version);
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
begin
  if InputQuery('Добавление новой группы', 'Название группы: ', GroupName) and (GroupName <> '') then
  begin
    if FRosterList.IndexIn(TableExRoster.ItemIndex) then
    begin
      FRosterList[TableExRoster.ItemIndex].Groups.Add(GroupName);
      JabberClient.RenameContact(FRosterList[TableExRoster.ItemIndex]);
    end;
  end;
end;

procedure TFormMain.MenuItemSoundClick(Sender: TObject);
begin
  if MenuItemSound.Checked then
  begin
    MenuItemSound.Checked := false;
    writeini('options', 'form', 'sound', '0');
  end
  else
  begin
    MenuItemSound.Checked := true;
    writeini('options', 'form', 'sound', '1');
  end;
end;

procedure TFormMain.MenuItemStatusOnlineClick(Sender: TObject);
begin
  JabberClient.UserStatus := stNormal;
  CheckConnect;
end;

procedure TFormMain.PopupMenuContactsPopup(Sender: TObject);
var
  MenuItem: TMenuItem;
  ItemGroups: TStringList;
  i: integer;
begin
  //Пригласить в ...
  MenuItemIviteToConf.Clear;
  for i := 0 to FBookmarkList.Count - 1 do
  begin
    if FBookmarkList[i].BookmarkType <> btConference then
      Continue;
    MenuItem := PopupMenuContacts.CreateMenuItem;
    MenuItem.Caption := FBookmarkList[i].Name;
    MenuItem.OnClick := OnIviteToConfClick;
    MenuItem.Tag := i;
    MenuItemIviteToConf.Add(MenuItem);
  end;

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

  //Группы
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

procedure TFormMain.Button1Click(Sender: TObject);
begin
  EnterToGroupchat('зона@conference.jabber.ru', 'Пупка2');
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  EnterToGroupchat('!!!заходите!!!@conference.jabber.ru', 'Пупка');
end;

procedure TFormMain.EnterToGroupchat(ConfJID, Nick: string);
var
  FormChat: TFormConference;
  LastForm: TForm;
begin
  if Assigned(FActiveChatForm) then
  begin
    LastForm := FActiveChatForm;
  end
  else
  begin
    LastForm := nil;
  end;
  if not GetGroupChatByJID(ConfJID, FormChat) then
  begin
    FormChat := TFormConference.Create(Self);
    FormChat.Parent := PanelClient;
  end;
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

function TFormMain.CheckAccount: Boolean;
begin
  Result := False;
  //Проверка данных аккаунта
  if not JabberClient.CheckAccount then
  begin
    TFormChatRoom.SwowPopupWnd('Введите данные Вашей учетной записи!');
    if FormAccount.ShowModal = mrOk then
    begin
      JabberClient.JID := FormAccount.EditLogin.Text;
      JabberClient.Password := FormAccount.EditPassword.Text;
      JabberClient.UserServer := FormAccount.EditServer.Text;
      try
        JabberClient.JabberPort := StrToInt(FormAccount.EditJabberPort.Text);
      except
        JabberClient.JabberPort := 5222;
      end;
      Result := True;
    end;
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

procedure TFormMain.sButton1Click(Sender: TObject);
begin
  PopupMenuStatus.Popup(FormMain.left + 51, FormMain.top + FormMain.Height - 370);
end;

procedure TFormMain.Start;
begin
  {$IFDEF DEBUG}
  FormConsole.Show;
  {$ENDIF}
  if JabberClient.CheckAccount then
    CheckConnect;
end;

procedure TFormMain.ActionShowMainExecute(Sender: TObject);
begin
  ShowWindow(Application.Handle, sw_show);
  FormMain.Show;
  FormMain.BringToFront;
end;

procedure TFormMain.LabelStatusClick(Sender: TObject);
begin
  LabelStatus.Caption := InputBox('Статус', 'Введите Ваш статус', LabelStatus.Caption);
  JabberClient.UserStatusText := LabelStatus.Caption;
  WriteIni('options', 'form', 'status', LabelStatus.Caption);
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

procedure TFormMain.SetImageStatus(Status: TShowType; Picture: TPicture);
var
  Icon: TIcon;
begin
  Icon := TIcon.Create;
  ImageListStatuses.GetIcon(Ord(Status), Icon);
  ImageShowType.Picture.Assign(Icon);
  Icon.Free;
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
  ActionShowMain.Execute;
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
  FormConsole.show;
end;

end.

