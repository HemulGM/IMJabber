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
  Vcl.Imaging.pngimage, IM.ChatRoom;

type
  TSoundType = (sndError, sndOnline, sndMessage, sndOffline, sndSubscribe, sndWelcome, sndGroup);

  TRosterList = class(TTableData<TRosterItem>)
    procedure Delete(Index: Integer);
    procedure Update(Item: TRosterItem);
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
    MenuItemConfs: TMenuItem;
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
    N37: TMenuItem;
    N38: TMenuItem;
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
    OpenPictureDialog: TOpenPictureDialog;
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
    procedure ActionGroupChatExecute(Sender: TObject);
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
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
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
    procedure ActionStatusInConfsExecute(Sender: TObject);
    procedure ActionShowMainExecute(Sender: TObject);
    procedure MenuItemContactGroupAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionAuthAndAddExecute(Sender: TObject);
    procedure JabberClientConnecting(Sender: TObject);
    procedure TableExRosterGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExRosterItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure TableExRosterEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
    procedure TableExRosterEditOk(Sender: TObject; Value: string; ItemValue, ACol, ARow: Integer);
    procedure TableExRosterMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonFlatMenuClick(Sender: TObject);
    procedure PopupMenuSysPopup(Sender: TObject);
    procedure OnRemoveFromGroupClick(Sender: TObject);
    procedure TableExRosterDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    FActiveChatForm: TForm;
    FRosterList: TRosterList;
    FGroupList: TGroupList;
    FBookmarkList: TBookmarkList;
    procedure SetImageStatus(Status: TShowType; Picture: TPicture);
    function GetChatByJID(AJID: string; var Form: TFormChatRoom): Boolean;
  public
    JabberClient: TJabberClient;
    FStatusMask: TPNGImage;
    FFullMask: TPNGImage;
    BytesSend, BytesReceive: integer;
    msg: string;
    user_nick: string;
    conf: string;
    Topic: string;
    presence_incom_flag: bool;
    presence_from: string;
    presence_nick: string;
    presence_type: string;
    presence_conf_jid: string;
    presence_conf: string;
    presence_conf_show, presence_conf_status: string;
    presence_conf_affiliation: string;
    presence_conf_role: string;
    groupchat_jid: string;
    current_show: string;
    iq_id: string;
    vcard_flag, pub_vcard_view: bool;
    pub_vcard_jid: string;
    topik_from: string;
    group_jid: string;
    group_id: integer;
    group_name: string;
    conference_list_flag: bool;
    conference_list_id: string;
    forclose_confs_arr: array of array of string;
    procedure PlaySound(Sound: TSoundType); overload;
    function CheckAccount: Boolean;
    function CheckConnect: Boolean;
    procedure Start;
  end;

var
  FormMain: TFormMain;

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;

implementation

uses
  IM.Account, IM.Config, IM.About, IM.Tool.Console, IM.Conference,
  IM.Conference.Invite, IM.Contact.Add, IM.Account.Card, IM.Tool.Captcha,
  HGM.Common.Utils, System.NetEncoding;

{$R *.dfm}

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;
begin
  Result := TPngImage.CreateBlank(COLOR_RGB, 16, Mask.Width, Mask.Height);
  Result.Canvas.StretchDraw(Rect(0, 0, Mask.Width, Mask.Height), Source);
  Result.CreateAlpha;
  ApplyMask(0, 0, Mask, Result);
end;

function CreateDefaultAvatar(JID: string; Mask: TPngImage): TPngImage;
var
  Clr: TColor;
begin
  JID := MD5(JID);
  case JID[Length(JID)] of
    '0':
      Clr := $00E6A330;
    '1':
      Clr := $00B98843;
    '2':
      Clr := $00874FCB;
    '3':
      Clr := $00A6A441;
    '4':
      Clr := $00C16579;
    '5':
      Clr := $003B86DB;
    '6':
      Clr := $005445DD;
    '7':
      Clr := $0055AA63;
    '8':
      Clr := $00D5D52B;
    '9':
      Clr := $00AB5656;
    'A':
      Clr := $00E6A330;
    'B':
      Clr := $00B98843;
    'C':
      Clr := $00874FCB;
    'D':
      Clr := $00A6A441;
    'E':
      Clr := $00C16579;
    'F':
      Clr := $003B86DB;
  end;
  Result := TPngImage.CreateBlank(COLOR_RGBALPHA, 16, Mask.Width, Mask.Height);
  PNGColored(0, 0, Mask, Result, Clr);
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
  tmp_confname, tmp_nick: string;
begin
  if FBookmarkList.IndexIn(MenuItem.Tag) then
  begin
    tmp_confname := FormConfInvite.sComboBox1.Text;
    tmp_nick := FormConfInvite.sComboBox3.Text;
    FormConfInvite.sComboBox1.Text := FBookmarkList[MenuItem.Tag].JID;
    FormConfInvite.sComboBox3.Text := FBookmarkList[MenuItem.Tag].nick;
    FormConfInvite.sButton3.Click;
    FormConfInvite.sComboBox1.Text := tmp_confname;
    FormConfInvite.sComboBox3.Text := tmp_nick;
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
  AvatarFN: string;
begin
  FRosterList := TRosterList.Create(TableExRoster);
  FGroupList := TGroupList.Create;
  FBookmarkList := TBookmarkList.Create;
  FStatusMask := TPngImage.Create;
  FStatusMask.LoadFromResourceName(HInstance, 'statusmask');
  FFullMask := TPngImage.Create;
  FFullMask.LoadFromResourceName(HInstance, 'fullmask');
  JabberClient := TJabberClient.Create(nil);
  ImageListOver.AddImages(ImageListNormal);
  for i := 0 to ImageListOver.Count - 1 do
  begin
    ColorImages(ImageListOver, i, clWhite);
  end;

  LabelNick.Caption := '';
  LabelStatusText.Caption := '';

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

  SetLength(forclose_confs_arr, 200);
  for i := 0 to 199 do
    SetLength(forclose_confs_arr[i], 2);

  try
    LabelStatus.Caption := ReadIni('options', 'form', 'status');
    JabberClient.UserStatusText := LabelStatus.Caption;
    if ReadIni('options', 'account', 'nick') <> '' then
    begin
      Caption := 'IMJabber - ' + ReadIni('options', 'account', 'nick');
      TrayIcon.Hint := 'IMJabber - ' + ReadIni('options', 'account', 'nick');
    end;
                                            {
    Height := StrToInt(ReadIni('options', 'form', 'height'));
    Width := StrToInt(ReadIni('options', 'form', 'width'));
    Top := StrToInt(ReadIni('options', 'form', 'top'));
    Left := StrToInt(ReadIni('options', 'form', 'left')); }
    if StrToInt(ReadIni('options', 'form', 'sound')) = 1 then
    begin
      MenuItemSound.Checked := True;
      MenuItemSound.Caption := 'Звук [вкл]';
    end;
    AvatarFN := ReadIni('options', 'avatar', 'name');
    if AvatarFN <> '' then
    begin
      //Загрузка аватара
      if FileExists(ExtractFilePath(ParamStr(0)) + 'avatar\avatar' + AvatarFN) then
      begin
        //Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'avatar\avatar' + AvatarFN);
      end;
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

procedure TFormMain.FormShow(Sender: TObject);
begin
  FormConsole.Show;
end;

procedure TFormMain.ActionGroupChatExecute(Sender: TObject);
begin
  if not ExistFormByName(Self, 'form' + md5(groupchat_jid)) then
  begin
    with TFormChatRoom.Create(Self) do
    begin
      Parent := PanelClient;
      Name := 'form' + md5(groupchat_jid);
      Hint := groupchat_jid;
      Caption := 'Чат с ' + groupchat_jid;
      Show;
      BringToFront;
    end;
  end
  else
  begin
    GetFormByName(Self, 'form' + md5(groupchat_jid)).show;
  end;
end;

procedure TFormMain.Image2Click(Sender: TObject);
begin
  PopupMenuSys.Popup(FormMain.left + 10, FormMain.top + FormMain.Height - 310);
end;

procedure TFormMain.JabberClientConnect(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientConnect: Connected to server!' + #10#13, clBlue);
  TFormChatRoom.SwowPopupWnd('Подключено!');
end;

procedure TFormMain.JabberClientConnecting(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientConnecting: Connecting' + #10#13, clBlue);
  ActivityIndicatorWork.Animate := True;
end;

procedure TFormMain.JabberClientConnectError(Sender: TObject);
begin
  ActivityIndicatorWork.Animate := False;
  PlaySound(sndError);
  FormConsole.AddLog('JabberClientConnectError: Connect error!' + #10#13, clBlue);
  TFormChatRoom.SwowPopupWnd('Ошибка подключения!');
end;

procedure TFormMain.JabberClientDisconnect(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientDisconnect: Disconnected!' + #10#13, clBlue);
  ActivityIndicatorWork.Animate := False;
  BytesSend := 0;
  BytesReceive := 0;
  PlaySound(sndOffline);
  FormConference.snd_off := true;
  FRosterList.Clear;
  MenuItemConfs.Enabled := False;
  MenuItemAddContactSys.Enabled := False;
  MenuItemUserVCard.Enabled := False;

  if FormConference.sTabControl1.Tabs.Count >= 1 then
    FormConference.Chat.Lines.Add('<div class="status">Отключен</div>');
  FormConference.conferenceusers.Enabled := False;
  FormConference.spanel1.Enabled := False;
  TrayIcon.Animate := False;

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
  FormConsole.AddLog('JabberClientGetBookMarks: BookMarks loaded!' + #10#13 + QueryNode.AsString, clRed);
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
        Item.Status := stOffline;
        Item.Avatar.Assign(CreateDefaultAvatar(Item.JID, FStatusMask));
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
    FormConsole.AddLog('JabberClientGetRoster: Roster loaded!' + #10#13, clRed);
  end;
end;

procedure TFormMain.JabberClientIQ(Sender: TObject; QueryNode: TGmXmlNode);
var
  XMLItem, tmpItem, tmpItem2: TGmXmlNode;
  a: integer;
  v_jid, v_id: string;
  Item: TlistItem;
begin
  FormConsole.AddLog('JabberClientIQ ', clRed);

  XMLItem := QueryNode;
  v_jid := XMLItem.Params.Values['from'];
  v_id := XMLItem.Params.Values['id'];

  if conference_list_flag then
  begin
    XMLItem := QueryNode;

    if XMLItem.Params.Values['id'] = conference_list_id then
    begin
      tmpItem2 := XMLItem.Children.Node[0];

      for a := 0 to tmpItem2.Children.Count - 1 do
      begin

        tmpItem := tmpItem2.Children.Node[a];

        if tmpItem.Name = 'item' then
        begin
          Item := TListItem.Create(FormConfInvite.ListView1.Items);
          Item.Caption := tmpItem.Params.Values['jid'];
          Item.StateIndex := 2;
          Item.SubItems.Insert(0, FromEscaping(tmpItem.Params.Values['name']));
          FormConfInvite.ListView1.Items.Insert(0); // добавляем пустую сроку наверх
          FormConfInvite.ListView1.Items.Item[0] := Item; // и вписываешь в нее свою
          Item.Free; // освобождаем строку
        end;

        FormConfInvite.sProgressBar1.Max := tmpItem2.Children.Count;
        FormConfInvite.sProgressBar1.Position := a;
      end;

      conference_list_flag := false;
      conference_list_id := '';
      FormConfInvite.sProgressBar1.Position := 0;
      FormConfInvite.sButton1.Enabled := true;
    end;
  end;
end;

procedure TFormMain.JabberClientJabberOnline(Sender: TObject);
var
  PNG: TPngImage;
  Pic: TPicture;
begin
  ActivityIndicatorWork.Animate := False;
  FormConsole.AddLog('JabberClientJabberOnline: Now Online!' + #10#13, clBlue);

  MenuItemConfs.Enabled := True;
  MenuItemUserVCard.Enabled := True;
  MenuItemAddContactSys.Enabled := True;

  Pic := TPicture.Create;
  SetImageFromBinVal(JabberClient.VCard.Photo.BinVal, JabberClient.VCard.Photo.PhotoType, Pic);
  PNG := CreateAvatar(Pic.Graphic, FStatusMask);
  Pic.Free;
  ImageAvatar.Picture.Assign(PNG);
  PNG.Free;

  SetImageStatus(JabberClient.UserStatus, ImageShowType.Picture);
  LabelNick.Caption := JabberClient.UserNick;
  LabelStatusText.Caption := JabberClient.UserStatusText;
  PlaySound(sndOnline);
  TFormChatRoom.SwowPopupWnd('Онлайн!');
end;

procedure TFormMain.JabberClientLoginError(Sender: TObject; Error: string);
begin
  ActivityIndicatorWork.Animate := False;
  PlaySound(sndError);
  FormConsole.AddLog('JabberClientLoginError: Login error!' + #10#13, clBlue);
  TFormChatRoom.SwowPopupWnd('Ошибка авторизации!! Проверьте ваш логин/пароль...');
end;

procedure TFormMain.JabberClientMessage(Sender: TObject; Item: TJabberMessage);
var
  JID, JIDmd: string;
  ChatRoom: TFormChatRoom;
  Roster: TRosterItem;
begin
  FormConsole.AddLog('JabberClientMessage: ' + #10#13, clRed);

  JID := LoginFromJID(Item.From);
  Roster := nil;
  //Чат сообщение
  if (Item.MessageType = 'chat') then
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
      Roster.JID := JID;
      Roster.Name := JID;
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
    //Chat nick
    user_nick := FRosterList.GetNick(JID);
    msg := Item.Body;
    topik_from := Item.From;
    conf := JID;
    FormConference.ActionNewMessage.Execute;
  end;
   {
  //Запрос проверки каптчи
  if (Item.MessageType = '') or (Item.MessageType = 'normal') then
  begin
    for i := 0 to XMLItem.Children.Count - 1 do
    begin
      XMLNode := XMLItem.Children.Node[i];
      //выдергивание джида пославшего инвайт (вариант 1)
      if (XMLNode.Name = 'x') and (XMLNode.Params.Values['xmlns'] = 'http://jabber.org/protocol/muc#user') then
      begin
        try
          tmpItem2 := XMLNode.Children.Node[0];
          if (tmpItem2.Params.Values['from'] <> '') then
            invite_from := tmpItem2.Params.Values['from'];
        finally

        end;
      end;

      //парсинг входа в конфу через каптчу
      if (XMLNode.Name = 'x') and (XMLNode.Params.Values['xmlns'] = 'jabber:x:oob') then
      begin
        try
          tmpItem2 := XMLNode.Children.Node[0];
          TFormChatRoom.SwowPopupWnd('Для входа в конференцию ' + From + ' необходима проверка CAPTCHA. Запрос отправлен..');
          FormCaptcha.WebBrowser1.Navigate(tmpItem2.AsString);
          FormCaptcha.Show;
        finally

        end;
      end;

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
      end;
    end;
  end;   }
end;

procedure TFormMain.JabberClientPresence(Sender: TObject; QueryNode: TGmXmlNode);
var
  XMLItem, tmpItem, xmlItem2: TGmXmlNode;
  a: integer;
  fromTYPE, fromJID, fromJID2, JID, conf_nick, confONLY, JIDonly, ErrorCode: string;
  real_JID: string;
  Item: TRosterItem;
  FormChat: TFormChatRoom;
  Pic: TPicture;
  PNG: TPngImage;
begin
  FormConsole.AddLog('JabberClientPresence ' + #10#13, clMaroon);

  XMLItem := QueryNode;
  fromJID := Lowercase(XMLItem.Params.Values['from']);
  real_JID := XMLItem.Params.Values['from'];
  JIDonly := LoginFromJID(real_JID);

  fromJID2 := XMLItem.Params.Values['from'];
  conf_nick := copy(fromJID2, Pos('/', fromJID2) + 1, length(fromJID2));

  fromTYPE := LowerCase(XMLItem.Params.Values['type']);
  confONLY := LoginFromJID(fromJID);
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
      FormConsole.AddLog('Сервер контакта - ' + fromJID2 + ' недоступен, удалите его!' + #10#13, clBlue);
    end;

    if ErrorCode = '407' then
    begin
      Application.MessageBox(pchar('Для входа в комнату ' + confONLY + ' нужно иметь членство.'), 'Ошибка');
      FormConference.ConfClose2(confONLY);
    end;
    Exit;
  end;

  //OnlyJID
  JID := LoginFromJID(fromJID);

  if Pos('@conference', fromJID) > 0 then
  begin
    presence_conf_jid := JID;
    //Юзера кикнули
    if fromTYPE = 'unavailable' then
    begin
      xmlItem2 := XMLItem.Children.Node[0];
      if xmlItem2.Name = 'x' then
        xmlItem2 := xmlItem2.Children.Node[0];
      if xmlItem2.Name = 'item' then
      begin
        if xmlItem2.Children.Count = 1 then
        begin
          xmlItem2 := xmlItem2.Children.Node[0];
          try
            if FormConference.sTabControl1.Tabs[FormConference.sTabControl1.TabIndex] = JID then
              FormConference.chat.Lines.Add('<div class="status">[' + timetostr(now) + '] ' + conf_nick + ' выгнали с конференции, причина: ' + xmlItem2.AsString + '</div>');
          finally
          end;
        end;
      end;
    end;

    //статусы юзеров в конфе
    presence_conf_show := '';
    presence_conf_status := '';
    presence_conf_affiliation := '';
    presence_conf_role := '';
    presence_incom_flag := true;
    //получаем статусы
    for a := 0 to XMLItem.Children.Count - 1 do
    begin
      tmpItem := XMLItem.Children.Node[a];
      //получаем тип статуса юзера
      if (tmpItem.Name = 'show') then
        presence_conf_show := tmpItem.AsString;

      //получаем текст статуса юзера
      if (tmpItem.Name = 'status') then
        presence_conf_status := FromEscaping(tmpItem.AsString);

      //Получаем права юзеров в конфе
      if (tmpItem.Name = 'x') then
      begin
        if (tmpItem.Children.Count > 0) then
        begin
          try
            xmlItem2 := tmpItem.Children.Node[0];
            presence_conf_affiliation := xmlItem2.Params.Values['affiliation'];
            presence_conf_role := xmlItem2.Params.Values['role'];
          finally
          end;
        end;
      end;
    end;

    presence_from := fromJID;
    presence_nick := conf_nick;
    presence_type := fromTYPE;
    presence_conf := LoginFromJID(fromJID);
    FormConference.ActionListMain.Actions[2].Execute;
  end
  else
  begin
    //Свой статус
    if LoginFromJID(QueryNode.Params.Values['from']) = JabberClient.JID then
    begin
      if QueryNode.Children.NodeExists('show') then
        SetImageStatus(StrToShowType(QueryNode.Children.NodeByName['show'].AsString), ImageShowType.Picture)
      else
        SetImageStatus(stNormal, ImageShowType.Picture);

      if QueryNode.Children.NodeExists('status') then
        LabelStatusText.Caption := QueryNode.Children.NodeByName['status'].AsString
      else
        LabelStatusText.Caption := '';
    end
    else //Чей-то статус
    begin
      Item := FRosterList.Find(LoginFromJID(QueryNode.Params.Values['from']));
      if Assigned(Item) then
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
                end;
              end;
            end;
        if GetChatByJID(Item.JID, FormChat) then
        begin
          FormChat.SetItem(Item);
        end;

        FRosterList.UpdateTable;
      end;
    end;
  end;

  FormConsole.AddLog('JabberClientPresence END' + #10#13, clMaroon);
end;

procedure TFormMain.JabberClientReceiveData(Sender: TObject; SendStr: string; Handled: Boolean);
begin
  BytesReceive := BytesReceive + Length(SendStr);
  FormConsole.AddLog('JabberClientReceiveData: ' + SendStr + #10#13, clRed);
end;

procedure TFormMain.JabberClientRosterSet(Sender: TObject; Item: TRosterItem);
begin
  FRosterList.Update(Item);
  FGroupList.Add(Item.Groups);
  FormConsole.AddLog('JabberClientRosterSet: ' + Item.JID + #10#13, clRed);
end;

procedure TFormMain.JabberClientSendData(Sender: TObject; SendStr: string);
begin
  BytesSend := BytesSend + Length(SendStr);
  FormConsole.AddLog('JabberClientSendData: ' + SendStr + #10#13, clGreen);
end;

procedure TFormMain.JabberClientSubscribe(Sender: TObject; From, Nick: string);
var
  JIDExists: Boolean;
  i: Integer;
begin
  PlaySound(sndSubscribe);
  if MessageDlg('Запрос авторизации от ' + Nick + ' (' + From + '), желаете посмотреть VCARD пользователя перед добавлением его в контакты? ', mtConfirmation, mbYesNo, 1) = mrYes then
  begin
    FormAccountCard.sPageControl1.TabIndex := 0;
    FormAccountCard.ButtonApply.Visible := False;
    pub_vcard_view := True;
    pub_vcard_jid := LoginFromJID(From);
    //FormAccountCard.ActionListMain.Actions[0].Execute;
  end
  else
  begin
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
end;

procedure TFormMain.JabberClientWorkState(Sender: TObject; State: Boolean);
begin
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

procedure TFormMain.N37Click(Sender: TObject);
begin
  if JabberClient.Online then
    FormConfInvite.show;
end;

procedure TFormMain.N38Click(Sender: TObject);
begin
  if JabberClient.Online then
    FormConference.show;
end;

procedure TFormMain.MenuItemQuitClick(Sender: TObject);
begin
  JabberClient.Disconnect;
  application.Terminate;
end;

procedure TFormMain.MenuItemAddContactSysClick(Sender: TObject);
begin
  FormContactAdd.Show;
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
  FormAbout.Show;
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
    MenuItemSound.Caption := 'Звук [выкл]';
  end
  else
  begin
    MenuItemSound.Checked := true;
    MenuItemSound.Caption := 'Звук [вкл]';
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
  if JabberClient.CheckAccount then
    CheckConnect;
end;

procedure TFormMain.ActionShowMainExecute(Sender: TObject);
begin
  ShowWindow(Application.Handle, sw_show);
  FormMain.Show;
  FormMain.FormStyle := fsStayOnTop;
  FormMain.FormStyle := fsNormal;
end;

procedure TFormMain.LabelStatusClick(Sender: TObject);
begin
  LabelStatus.Caption := InputBox('Статус', 'Введите Ваш статус', LabelStatus.Caption);
  JabberClient.UserStatusText := LabelStatus.Caption;
  WriteIni('options', 'form', 'status', LabelStatus.Caption);
end;

procedure TFormMain.ActionStatusInConfsExecute(Sender: TObject);
var
  i, c: integer;
  nick: string;
begin
  //Смена статуса во всех конференциях
  for i := 0 to FormConference.sTabControl1.Tabs.Count - 1 do
  begin
    //Поиск конфы в многомерном массиве (извлечение ника в случае успеха)
    nick := '';
    for c := 0 to high(forclose_confs_arr) do
    begin
      if forclose_confs_arr[c, 0] = AnsiLowerCase(FormConference.sTabControl1.Tabs.Strings[i]) then
      begin
        nick := FormMain.forclose_confs_arr[c, 1];
      end;
    end;
    JabberClient.SendData('<presence to="' + FormConference.sTabControl1.Tabs.Strings[i] + '/' + nick + '" >' + '<show>' + current_show + '</show><status>' + ToEscaping(LabelStatus.Caption) + '</status><priority>5</priority></presence>');
  end;
end;

procedure TFormMain.TableExRosterDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S: string;
  i: Integer;
begin
  if not FRosterList.IndexIn(ARow) then
    Exit;
  with TableExRoster.Canvas do
  begin
    case ACol of
      0:
        begin
          Brush.Style := bsClear;
          Rect.Inflate(-4, -4);
          Draw(Rect.Left, Rect.Top, FRosterList[ARow].Avatar);
          if FRosterList[ARow].Photo.IsEmpty then
          begin
            Font.Size := 16;
            S := FRosterList[ARow].Name[1];
            i := Pos(' ', FRosterList[ARow].Name);
            if (i > 0) and ((i + 1) < Length(FRosterList[ARow].Name)) then
              S := S + FRosterList[ARow].Name[i + 1];

            TextRect(Rect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
          end;
          ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 15, Rect.Bottom - 15, Ord(FRosterList[ARow].Status), True);
        end;
      1:
        begin
          Font.Name := 'Segoe UI';
          TextOut(Rect.Left, Rect.Top + 3, FRosterList[ARow].Name);
          TextOut(Rect.Left, Rect.Top + 22, FRosterList[ARow].LastMessage.Body);
          if FRosterList[ARow].LastMessage.Unread then
          begin
            ImageListStatuses.Draw(TableExRoster.Canvas, Rect.Right - 20, Rect.Top + 2, 7, True);
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

procedure TFormMain.TableExRosterGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FRosterList.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := '';
    1:
      Value := FRosterList.Items[FRow].Name + ' - ' + FRosterList.Items[FRow].StatusText;
  end;
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

procedure TRosterList.Update(Item: TRosterItem);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if Items[i].JID = Item.JID then
    begin
      Items[i].Name := Item.Name;
      Items[i].Subscription := Item.Subscription;
      Items[i].StatusText := Item.StatusText;
      Items[i].Status := Item.Status;
      Items[i].Groups.SetStrings(Item.Groups);
      UpdateTable;
      Exit;
    end;
  end;
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

