unit IM.Main;

interface

uses
  Winapi.Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, sSkinManager, sSkinProvider, Jabber, ActnList, ImgList,
  ExtCtrls, sPanel, ComCtrls, sListView, jpeg, Menus, acPNG, GIFImg, StdCtrls,
  sButton, Buttons, sBitBtn, GmXml, MD5Hash, ExtDlgs, Math, EncdDecd, registry,
  Winapi.MMSystem, IniFiles, IdBaseComponent, System.ImageList, System.Actions,
  Jabber.Types, IM.ChatRoom;

type
  TSoundType = (sndError, sndOnline, sndMessage, sndOffline, sndSubscribe, sndWelcome, sndGroup);

  TFormMain = class(TForm)
    ActionListMain: TActionList;
    LampList1: TImageList;
    TrayIcon: TTrayIcon;
    PopupMenuSys: TPopupMenu;
    PopupMenuStatus: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MenuItemSound: TMenuItem;
    MenuItemStatusOnline: TMenuItem;
    MenuItemStatusChat: TMenuItem;
    MenuItemStatusAway: TMenuItem;
    MenuItemStatusXa: TMenuItem;
    MenuItemStatusDND: TMenuItem;
    MenuItemStatusInvis: TMenuItem;
    MenuItemDisconnect: TMenuItem;
    XML1: TMenuItem;
    N16: TMenuItem;
    MenuItemBookmark: TMenuItem;
    ActionGroupChat: TAction;
    PopupMenuContacts: TPopupMenu;
    N19: TMenuItem;
    Vcard1: TMenuItem;
    N20: TMenuItem;
    MenuItemContactDelete: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
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
    VCard2: TMenuItem;
    load_avatar: TAction;
    ActionRequierAutorize: TAction;
    ActionAutorization: TAction;
    ActionRemoveAutorize: TAction;
    ActionAccountCheck: TAction;
    sort_contacts: TAction;
    N40: TMenuItem;
    N41: TMenuItem;
    MenuItemBookmarks: TMenuItem;
    add_invite_item: TAction;
    ActionStatusInConfs: TAction;
    ActionAuthAndAdd: TAction;
    MenuItemShow: TMenuItem;
    ActionShowMain: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    MenuItemMoveToGroup: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    sPanel1: TPanel;
    LabelStatus: TLabel;
    sPanel4: TPanel;
    Image1: TImage;
    PanelContacts: TPanel;
    ListViewContacts: TListView;
    sPanel3: TPanel;
    ProgressBarLoading: TProgressBar;
    BitBtnStatus: TBitBtn;
    PanelClient: TPanel;
    PanelLeft: TPanel;
    Shape1: TShape;
    procedure Image2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure InviteConf(Sender: TObject);
    procedure MoveToGroup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure JabberClientConnect(Sender: TObject);
    procedure JabberClientConnectError(Sender: TObject);
    procedure JabberClientDisconnect(Sender: TObject);
    procedure JabberClientGetBookMarks(Sender: TObject; BookMarks: string);
    procedure JabberClientGetRoster(Sender: TObject; RosterList: string);
    procedure MenuItemStatusOnlineClick(Sender: TObject);
    procedure JabberClientIQ(Sender: TObject; XMLMessage: string);
    procedure JabberClientJabberOnline(Sender: TObject);
    procedure JabberClientLoginError(Sender: TObject; Error: string);
    procedure JabberClientSubscribe(Sender: TObject; From, Nick: string);
    procedure JabberClientMessage(Sender: TObject; XMLMessage: string);
    procedure JabberClientPresence(Sender: TObject; Presence: string);
    procedure JabberClientReceiveData(Sender: TObject; SendStr: string; Handled: Boolean);
    procedure JabberClientSendData(Sender: TObject; SendStr: string);
    procedure MenuItemDisconnectClick(Sender: TObject);
    procedure BitBtnStatusClick(Sender: TObject);
    procedure ListViewContactsClick(Sender: TObject);
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
    procedure N19Click(Sender: TObject);
    procedure joinconf(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure ListViewContactsEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure VCard2Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure MenuItemSoundClick(Sender: TObject);
    procedure MenuItemContactDeleteClick(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure ActionRequierAutorizeExecute(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure ActionAutorizationExecute(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure ActionRemoveAutorizeExecute(Sender: TObject);
    procedure Vcard1Click(Sender: TObject);
    procedure ListViewContactsCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure add_invite_itemExecute(Sender: TObject);
    procedure MenuItemBookmarksClick(Sender: TObject);
    procedure PopupMenuContactsPopup(Sender: TObject);
    procedure ActionStatusInConfsExecute(Sender: TObject);
    procedure ActionShowMainExecute(Sender: TObject);
    procedure MenuItemShowClick(Sender: TObject);
    procedure ListViewContactsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ListViewContactsMouseLeave(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionAuthAndAddExecute(Sender: TObject);
    procedure JabberClientConnecting(Sender: TObject);
  private
    FActiveChatForm: TForm;
  public
    JabberClient: TJabberClient;
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
    invite_popup_flag: bool;
    groupchat_jid: string;
    current_show: string;
    iq_id: string;
    vcard_flag, pub_vcard_view: bool;
    pub_vcard_jid: string;
    up_vcard_flag: bool;
    get_version_flag: bool;
    topik_from: string;
    new_contact_flag: bool;
    //Переменные групп
    group_update_flag: bool;
    group_jid: string;
    group_id: integer;
    group_name: string;
    conference_list_flag: bool;
    conference_list_id: string;
    new_contact_nick: string;
    new_contact_jid: string;
    forclose_confs_arr: array of array of string;
    procedure PlaySound(Sound: TSoundType); overload;
    function CheckAccount: Boolean;
    function CheckConnect: Boolean;
  end;

var
  FormMain: TFormMain;
  autorize_JID: string;

function ToEscaping(Value: string): string;

function FromEscaping(Value: string): string;

implementation

uses
  IM.Account, IM.Config, IM.About, IM.Tool.Console, IM.Conference,
  IM.Conference.Invite, IM.Contact.Add, IM.Account.Card, IM.Tool.Captcha,
  HGM.Common.Utils;

{$R *.dfm}

function ToEscaping(Value: string): string;
begin
  Result := Value;
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '©', '&copy;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '™', '&trade;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '"', '&bdquo;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '"', '&ldquo;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '''', '&apos;', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':\'')', ':'')', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':\''(', ':''(', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':-\\', ':-\', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '\\m/', '\m/', [rfReplaceAll, rfIgnoreCase]);
end;

function FromEscaping(Value: string): string;
begin
  Result := Value;
  Result := StringReplace(Result, '&gt;', '>', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&amp;', '&', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&lt;', '<', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&quot;', '"', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&copy;', '©', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&trade;', '™', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&bdquo;', '"', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&ldquo;', '"', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&apos;', '''', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':'')', ':\'')', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':''(', ':\''(', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':-\', ':-\\', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '\m/', '\\m/', [rfReplaceAll, rfIgnoreCase]);
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

//Обновление ростера по статусам
function update_rostr(rostr: TListView; user_jid: string; only_online: Boolean): Boolean;
var
  index, i, u: integer;
  have_in_rostr: Boolean;
  Item: TlistItem;
  jid: string;
begin
  Result := False;
  if not only_online then
  begin
    have_in_rostr := false;
    for i := 0 to rostr.Items.Count - 1 do
    begin
      if JIDToInfo(user_jid, 'uname') = rostr.Items[i].Caption then
        have_in_rostr := true;
      application.ProcessMessages;
    end;

    if not have_in_rostr then
    begin
      //Добавляем контакт в группу
      Item := rostr.Items.Add;
      Item.Caption := readini('rostr', user_jid, 'uname'); // Имя контакта
      try
        Item.ImageIndex := strtoint(readini('rostr', user_jid, 'show'));
        Item.SubItems.Insert(0, readini('rostr', user_jid, 'status'));
        //Сохраняем индекс
        WriteIni('rostr', user_jid, 'index', inttostr(Item.Index));
        Item.GroupID := strtoint(readini('rostr', user_jid, 'groupid'));
      except
      end;

          //Реиндексация онлайн контактов
      for u := 0 to rostr.Items.Count - 1 do
      begin
        application.ProcessMessages;
        jid := nick2info(rostr.Items[u].Caption, 'jid');
        if jid <> '' then
        begin
          jid := LoginFromJID(jid);
          try
            writeini('rostr', jid, 'index', inttostr(rostr.Items[u].index));
          except
          end;
        end;
      end; //реиндекс. закончена

      result := true;

    end
    else
    begin
      try
        //Чтение индекса контакта
        index := strtoint(readini('rostr', user_jid, 'index'));

        //Удаление оффлайн контакта с ростера
        if readini('rostr', user_jid, 'show') = '6' then
        begin
          rostr.Items[index].Delete;

          //Реиндексация онлайн контактов
          for u := 0 to rostr.Items.Count - 1 do
          begin
            application.ProcessMessages;
            jid := nick2info(rostr.Items[u].Caption, 'jid');
            if jid <> '' then
            begin
              jid := LoginFromJID(jid);
              try
                writeini('rostr', jid, 'index', inttostr(rostr.Items[u].index));
              except
              end;
            end;
          end; //реиндекс. закончена

          result := true;
        end
        else
        begin
          //Обновление статусов
          rostr.Items[index].ImageIndex := strtoint(readini('rostr', user_jid, 'show'));
          rostr.Items[index].SubItems.Text := readini('rostr', user_jid, 'status');
          rostr.Items[index].GroupID := strtoint(readini('rostr', user_jid, 'groupid'));
          result := true;
          application.ProcessMessages;
        end;

      except
      end;

    end;

  end
  else
  begin
    try
      index := strtoint(readini('rostr', user_jid, 'index'));
      rostr.Items[index].ImageIndex := strtoint(readini('rostr', user_jid, 'show'));
      rostr.Items[index].SubItems.Text := readini('rostr', user_jid, 'status');
      rostr.Items[index].GroupID := strtoint(readini('rostr', user_jid, 'groupid'));
      result := true;
      application.ProcessMessages;
    except
    end;
  end;

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

    if (ListViewContacts.ItemIndex >= 0) then
    begin
      if ListViewContacts.Selected.Selected then
      begin
        JabberClient.SendData('<message to="' + conf + '" id="inv' + inttostr(i) + '" >' + '<x xmlns="http://jabber.org/protocol/muc#user"><invite to="' + nick2info(ListViewContacts.Selected.Caption, 'jid') + '" /></x></message>');
      end;
    end;

  end;
end;

procedure TFormMain.MoveToGroup(Sender: TObject);
var
  menuItem: TMenuItem;
  group: string;
  i, n: integer;
begin
  i := random(777);
  menuItem := TMenuItem(Sender);
  group := Format('%s', [menuItem.Caption]);
  if (group <> '') then
  begin

    if (ListViewContacts.ItemIndex <> -1) then
    begin
      if ListViewContacts.Selected.Selected then
      begin
        if JabberClient.Online then
        begin
          group_id := 0;
          group_jid := LoginFromJID(nick2info(ListViewContacts.Selected.Caption, 'jid'));
          group_name := group;

          for n := 0 to ListViewContacts.Groups.Count - 1 do
          begin
            if ListViewContacts.Groups.Items[n].Header = group_name then
              group_id := ListViewContacts.Groups.Items[n].GroupID;
          end;

          if group_id = 0 then
          begin
            JabberClient.SendData('<iq type="set" id="grp' + inttostr(i) + '" >' + '<query xmlns="jabber:iq:roster">' + '<item name="' + nick2info(ListViewContacts.Selected.Caption, 'uname') + '" jid="' + group_jid + '" ></item></query></iq>');
            group_update_flag := true;
          end
          else
          begin
            JabberClient.SendData('<iq type="set" id="grp' + inttostr(i) + '" >' + '<query xmlns="jabber:iq:roster">' + '<item name="' + nick2info(ListViewContacts.Selected.Caption, 'uname') + '" jid="' + group_jid + '" >' + '<group>' + group + '</group></item></query></iq>');
            group_update_flag := true;
          end;

        end;
      end;
    end;

  end;
end;

procedure TFormMain.joinconf(Sender: TObject);
var
  menuItem: TMenuItem;
  conf: string;
  nick, tmp_confname, tmp_nick: string;
begin
  menuItem := TMenuItem(Sender);
  conf := Format('%s', [menuItem.Caption]);
  nick := copy(conf, pos('/', conf) + 1, length(conf));
  conf := LoginFromJID(conf);

  if (conf <> '') and (nick <> '') then
  begin
    tmp_confname := FormConfInvite.sComboBox1.Text;
    tmp_nick := FormConfInvite.sComboBox3.Text;
    FormConfInvite.sComboBox1.Text := conf;
    FormConfInvite.sComboBox3.Text := nick;
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

//Поиск елемента в Listview
function FindListViewItem(lv: TsListView; const S: string; column: Integer): TListItem;
var
  i: Integer;
  found: Boolean;
begin
  Assert(Assigned(lv));
  Assert((lv.viewstyle = vsReport) or (column = 0));
  Assert(S <> '');
  for i := 0 to lv.Items.Count - 1 do
  begin
    Result := lv.Items[i];
    if column = 0 then
      found := AnsiCompareText(Result.Caption, S) = 0
    else if column > 0 then
      found := AnsiCompareText(Result.SubItems[column - 1], S) = 0
    else
      found := False;
    if found then
      Exit;
  end;
  // No hit if we get here
  Result := nil;
end;

//функция доступа к дочерным формам
function GetFormByName(Owner: TComponent; AName: string): TForm;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      if (Owner.Components[i] is TForm) then
        Exit(Owner.Components[i] as TForm);
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

//Проверка существования дочерных memo
function ExistMemoByName(Owner: TComponent; AName: string): Bool;
var
  i: Integer;
begin
  result := false;
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      result := true;
  end;
end;

//функция существования дочерной формы
function ExistFormByName(Owner: TComponent; AName: string): Bool;
var
  i: Integer;
begin
  result := false;
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      result := true;
  end;
end;

procedure TFormMain.add_invite_itemExecute(Sender: TObject);
var
  itm: TmenuItem;
  i: integer;
begin
  if invite_popup_flag then
  begin

    for i := 0 to FormConference.sTabControl1.Tabs.Count - 1 do
    begin
      itm := TmenuItem.Create(Owner);
      itm.Name := 'menu_' + md5(FormConference.sTabControl1.Tabs.Strings[i]);
      itm.Caption := FormConference.sTabControl1.Tabs.Strings[i];
      itm.OnClick := InviteConf;
      PopupMenuContacts.Items[6].Insert(0, itm);
    end;

    invite_popup_flag := false;
  end;
end;

procedure TFormMain.ActionAuthAndAddExecute(Sender: TObject);
begin
  //
end;

procedure TFormMain.ActionAutorizationExecute(Sender: TObject);
begin
  //Авторизируем
  if ListViewContacts.ItemIndex >= 0 then
  begin
    JabberClient.SendSubscribeAccept(ListViewContacts.Selected.SubItems[0]);
  end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
  FormMain.Hide;
  MenuItemShow.Visible := true;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: integer;
  AvatarFN: string;
begin
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

  JabberClient.JabberPort := 5222;
  JabberClient.UserServer := 'jabber.ru';
  JabberClient.Resource := 'jabbrel';

  SetLength(forclose_confs_arr, 200);
  for i := 0 to 199 do
    SetLength(forclose_confs_arr[i], 2);

  try
    LabelStatus.Caption := ReadIni('options', 'form', 'status');
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
        Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'avatar\avatar' + AvatarFN);
      end;
    end;
  finally

  end;
  //Звук запуска
  PlaySound(sndWelcome);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
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
  if (ExistFormByName(Self, 'form' + md5(groupchat_jid)) = false) then
  begin
    FormChatRoom := TFormChatRoom.Create(Self);
    FormChatRoom.Parent := PanelClient;
    FormChatRoom.Name := 'form' + md5(groupchat_jid);
    FormChatRoom.Hint := groupchat_jid;
    FormChatRoom.Caption := 'Чат с ' + groupchat_jid;
    FormChatRoom.Show;
    FormChatRoom.BringToFront;
  end
  else
  begin
    GetFormByName(Self, 'form' + md5(groupchat_jid)).show;
  end;
end;

procedure TFormMain.Image1Click(Sender: TObject);
begin
  VCard2.Click;
  FormAccountCard.sPageControl1.TabIndex := 4;
  FormAccountCard.sButton1.Click;
//ActionList1.Actions[2].Execute;
end;

procedure TFormMain.Image2Click(Sender: TObject);
begin
  MenuItemShow.Visible := False;
  PopupMenuSys.Popup(FormMain.left + 10, FormMain.top + FormMain.Height - 310);
end;

procedure TFormMain.JabberClientConnect(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientConnect: Connected to server!' + #10#13, clBlue);
  FormChatRoom.SwowPopupWnd('Подключено!');
end;

procedure TFormMain.JabberClientConnecting(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientConnecting: Connecting' + #10#13, clBlue);
  ProgressBarLoading.Visible := True;
end;

procedure TFormMain.JabberClientConnectError(Sender: TObject);
begin
  ProgressBarLoading.Visible := False;
  PlaySound(sndError);
  FormConsole.AddLog('JabberClientConnectError: Connect error!' + #10#13, clBlue);
  FormChatRoom.SwowPopupWnd('Ошибка подключения!');
end;

procedure TFormMain.JabberClientDisconnect(Sender: TObject);
begin
  FormConsole.AddLog('JabberClientDisconnect: Disconnected!' + #10#13, clBlue);
  ProgressBarLoading.Visible := False;
  BytesSend := 0;
  BytesReceive := 0;
  if fileexists(ExtractFilePath(ParamStr(0)) + 'rostr.ini') then
    deletefile(ExtractFilePath(ParamStr(0)) + 'rostr.ini');
  PlaySound(sndOffline);
  FormConference.snd_off := true;
  BitBtnStatus.Caption := MenuItemDisconnect.Caption;
  ListViewContacts.Clear;
  ListViewContacts.Groups.Clear;
  N16.Enabled := false;
  MenuItemBookmark.Enabled := false;
  N40.Enabled := false;
  VCard2.Enabled := false;
  ListViewContacts.PopupMenu := nil;

  if FormConference.sTabControl1.Tabs.Count >= 1 then
    FormConference.chat.Lines.Add('<div class="status">Отключен</div>');
  FormConference.conferenceusers.Enabled := false;
  FormConference.spanel1.Enabled := false;
  TrayIcon.Animate := false;

  FormAccountCard.Timer1.Enabled := false;
  FormAccountCard.sProgressBar1.Visible := false;
  FormAccountCard.Close;
  FormChatRoom.SwowPopupWnd('Отключен(а)!');
end;

procedure TFormMain.JabberClientGetBookMarks(Sender: TObject; BookMarks: string);
begin
  FormConsole.AddLog('JabberClientGetBookMarks: BookMarks loaded!' + #10#13, clRed);
  FormChatRoom.SwowPopupWnd('Закладки загружены');
end;

procedure TFormMain.JabberClientGetRoster(Sender: TObject; RosterList: string);
var
  XMLParser: TGmXML;
  RootItem, RosterItem: TGmXmlNode;
  i: integer;
begin
  ListViewContacts.Items.BeginUpdate;
  ListViewContacts.Items.Clear;
  ListViewContacts.Groups.Clear;
  ListViewContacts.Groups.Add.Header := '';

  XMLParser := TGmXML.Create;
  XMLParser.Text := RosterList;
  RootItem := XMLParser.Nodes.Root.Children.Node[0];
  if Assigned(RootItem) then
  begin
    for i := 0 to RootItem.Children.Count - 1 do
    begin
      RosterItem := RootItem.Children.Node[i];
      if RosterItem.Name = 'item' then
      begin
        //Секция группа
        with ListViewContacts.Items.Add do
        begin
          Caption := RosterItem.Params.Values['name'];
          SubItems.Add(RosterItem.Params.Values['jid']);
          if RosterItem.Children.Count > 0 then
          begin
            GroupID := GetGroup(ListViewContacts, RosterItem.Children.Node[0].AsString, True);
            SubItems.Add(RosterItem.Params.Values[RosterItem.Children.Node[0].AsString]);
          end
          else
          begin
            GroupID := 0;
            SubItems.Add('');
          end;
          ImageIndex := 1;
        end;
      end;
    end;

    ListViewContacts.Items.EndUpdate;
    FormConsole.AddLog('JabberClientGetRoster: Roster loaded!' + #10#13, clRed);
    XMLParser.Destroy;
  end;
end;

procedure TFormMain.JabberClientIQ(Sender: TObject; XMLMessage: string);
var
  XMLParser: TGmXML;
  XMLItem, tmpItem, tmpItem2, tmpItem3, tmpItem4, adr_items, tel_items, mail_items: TGmXmlNode;
  org_items, photo_items: TGmXmlNode;
  a, b, c, i, n: integer;
  f: TextFile;
  v_jid, v_id, photo, current_type, photo_type, photo_way, user_ver: string;
  reg: treginifile;
  Item: TlistItem;
  WinV: Word;
  itm: TmenuItem;
  rostritem: TlistItem;
begin
  FormConsole.AddLog('JabberClientIQ: ' + XMLMessage, clRed);

  XMLParser := TGmXML.Create;
  XMLParser.Text := XMLMessage;
  XMLItem := XMLParser.Nodes.Root;
  v_jid := XMLItem.Params.Values['from'];
  v_id := XMLItem.Params.Values['id'];

  if (AnsiLowerCase(XMLItem.Params.Values['type']) = 'get') then
  begin
        //берем версию винд
    WinV := Winapi.Windows.GetVersion and $0000FFFF;
    tmpItem := XMLItem.Children.Node[0];

     //Version return------------------------------
    if (AnsiLowerCase(tmpItem.Name) = 'query') and (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:version') then
    begin
      JabberClient.SendData('<iq type="result" ' + 'to="' + v_jid + '" ' + 'from="' + JabberClient.JID + '@' + JabberClient.UserServer + '/' + JabberClient.Resource + '" ' + 'id="' + v_id + '"><query xmlns="jabber:iq:version">' + '<name>IMJabber</name>' + '<version>Beta</version>' + '<os>Windows ' + IntToStr(Lo(WinV)) + '.' + IntToStr(Hi(WinV)) + '</os></query></iq>');
      FormChatRoom.SwowPopupWnd(v_jid + ' - проверил версию вашего клиента...');
    end;

     //Ping------------------------------
    if (AnsiLowerCase(tmpItem.Name) = 'ping') and (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'urn:xmpp:ping') then
    begin
      JabberClient.SendData('<iq from="' + JabberClient.JID + '@' + JabberClient.UserServer + '/' + JabberClient.Resource + '" to="' + v_jid + '" id="' + v_id + '" type="result"/>');
      FormChatRoom.SwowPopupWnd(v_jid + ' - проверил PING вашего клиента...');
    end;

    //Time return------------------------------
    if (AnsiLowerCase(tmpItem.Name) = 'query') and (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:time') then
    begin
      JabberClient.SendData('<iq type="result" ' + 'to="' + v_jid + '" ' + 'from="' + JabberClient.JID + '@' + JabberClient.UserServer + '/' + JabberClient.Resource + '" ' + 'id="' + v_id + '"><query xmlns="jabber:iq:time">' + '<utc>' + datetostr(now) + ' ' + timetostr(now) + '</utc>' + '<tz>MDT</tz>' + '<display>' + datetostr(now) + ' ' + timetostr(now) + '</display></query></iq>');
      FormChatRoom.SwowPopupWnd(v_jid + ' - узнал время на вашем компе...');
    end;

  end;
  XMLParser.Free;

  if get_version_flag then
  begin
    XMLParser := TGmXML.Create;
    XMLParser.Text := XMLMessage;
    XMLItem := XMLParser.Nodes.Root;
    if (AnsiLowerCase(XMLItem.Params.Values['type']) = 'result') then
    begin
       //Получена версия клиента, парсим её, едрить колотить..
      tmpItem := XMLItem.Children.Node[0];
      if (AnsiLowerCase(tmpItem.Name) = 'query') and (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:version') then
      begin

        user_ver := '';
        for a := 0 to tmpItem.Children.Count - 1 do
        begin
          tmpItem2 := tmpItem.Children.Node[a];
          if (tmpItem2.Name = 'name') or (tmpItem2.Name = 'version') or (tmpItem2.Name = 'os') then
          begin
            user_ver := user_ver + ' ' + tmpItem2.AsString;
          end;

        end;

      end;

    end;

    if user_ver = '' then
      user_ver := '[недоступно]';
    MessageDlg('JID: ' + v_jid + ', версия клиента: ' + user_ver, mtInformation, [mbok], 1);

    XMLParser.Free;
    get_version_flag := false;
  end;

  if conference_list_flag then
  begin

    XMLParser := TGmXML.Create;
    XMLParser.Text := XMLMessage;
    XMLItem := XMLParser.Nodes.Root;

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

      XMLParser.Free;
      conference_list_flag := false;
      conference_list_id := '';
      FormConfInvite.sProgressBar1.Position := 0;
      FormConfInvite.sButton1.Enabled := true;
    end;
  end;
         {
  if new_contact_flag then
  begin
    XMLParser := TGmXML.Create(Self);
    XMLParser.Text := XMLMessage;
    XMLItem := XMLParser.Nodes.Root;

    if (XMLItem.Params.Values['type'] = 'result') and (XMLItem.Params.Values['id'] = iq_id) then
    begin
      new_contact_flag := false;

      //Добавляем ник в ростр
      if (new_contact_nick <> '') then
      begin
        //Добавляем контакт в группу
        rostritem := ListViewContacts.Items.Add;
        rostritem.Caption := new_contact_nick; // Имя контакта
        rostritem.ImageIndex := 6;
        rostritem.SubItems.Insert(0, '');
        rostritem.GroupID := 0;
      end;

      FormChatRoom.SwowPopupWnd('Контакт добавлен!');
    end;
    XMLParser.Destroy;
  end; }
  //Обновление группы в контакта
  if group_update_flag then
  begin
    XMLParser := TGmXML.Create;
    XMLParser.Text := XMLMessage;
    XMLItem := XMLParser.Nodes.Root;

    if (XMLItem.Params.Values['type'] = 'result') and (XMLItem.Params.Values['id'] = iq_id) then
    begin
      //Обновляем ростр
      update_rostr(ListViewContacts, group_jid, FormConfig.sCheckBox2.Checked);

      group_id := 0;
      group_name := '';
      group_jid := '';
      group_update_flag := false;
    end;

    FormChatRoom.SwowPopupWnd('Контакт перемещен!');
    XMLParser.Destroy;
  end;

  if up_vcard_flag then
  begin

    FormAccountCard.sProgressBar1.Position := 100;
    XMLParser := TGmXML.Create;
    XMLParser.Text := XMLMessage;
    XMLItem := XMLParser.Nodes.Root;

    if (XMLItem.Params.Values['type'] = 'result') and (XMLItem.Params.Values['id'] = iq_id) then
    begin
      up_vcard_flag := false;
      FormChatRoom.SwowPopupWnd('VCard успешно обновлена!');
    end;
    XMLParser.Destroy;
    FormAccountCard.Timer1.Enabled := false;
    FormAccountCard.sButton5.Enabled := true;
    FormAccountCard.sButton3.Enabled := true;
    FormAccountCard.sProgressBar1.Visible := false;
  end;

  if vcard_flag then
  begin

    FormAccountCard.sProgressBar1.Position := 20;
        //Получение VCARD
    XMLParser := TGmXML.Create;
    XMLParser.Text := XMLMessage;
    XMLItem := XMLParser.Nodes.Root;
    if (XMLItem.Params.Values['type'] = 'result') then
    begin

      if XMLItem.Children.Count > 0 then
      begin

        tmpItem := XMLItem.Children.Node[0];

        for i := 0 to tmpItem.Children.Count - 1 do
        begin
          tmpItem2 := tmpItem.Children.Node[i];

          if AnsiLowerCase(tmpItem2.Name) = 'fn' then
            FormAccountCard.Edit1.Text := FromEscaping(tmpItem2.AsString);

          if AnsiLowerCase(tmpItem2.Name) = 'nickname' then
            FormAccountCard.Edit2.Text := FromEscaping(tmpItem2.AsString);

          if AnsiLowerCase(tmpItem2.Name) = 'bday' then
            FormAccountCard.Edit3.Text := FromEscaping(tmpItem2.AsString);

          if AnsiLowerCase(tmpItem2.Name) = 'url' then
            FormAccountCard.Edit5.Text := FromEscaping(tmpItem2.AsString);

          if AnsiLowerCase(tmpItem2.Name) = 'title' then
            FormAccountCard.Edit9.Text := FromEscaping(tmpItem2.AsString);

          if AnsiLowerCase(tmpItem2.Name) = 'role' then
            FormAccountCard.Edit10.Text := FromEscaping(tmpItem2.AsString);

          if AnsiLowerCase(tmpItem2.Name) = 'desc' then
          begin
            if pub_vcard_view then
              FormAccountCard.RichEdit1.Text := 'JID: [' + FormMain.pub_vcard_jid + '] ' + #10#13 + tmpItem2.AsString
            else
              FormAccountCard.RichEdit1.Text := FromEscaping(tmpItem2.AsString);
          end;

                //Секция адрес
          if AnsiLowerCase(tmpItem2.Name) = 'adr' then
          begin
            FormAccountCard.sProgressBar1.Position := 30;
            for n := 0 to tmpItem2.Children.Count - 1 do
            begin
              adr_items := tmpItem2.Children.Node[n];

              if AnsiLowerCase(adr_items.Name) = 'street' then
                FormAccountCard.Edit11.Text := FromEscaping(adr_items.AsString);

              if AnsiLowerCase(adr_items.Name) = 'locality' then
                FormAccountCard.Edit12.Text := FromEscaping(adr_items.AsString);

              if AnsiLowerCase(adr_items.Name) = 'region' then
                FormAccountCard.Edit13.Text := FromEscaping(adr_items.AsString);

              if AnsiLowerCase(adr_items.Name) = 'pcode' then
                FormAccountCard.Edit14.Text := FromEscaping(adr_items.AsString);

              if AnsiLowerCase(adr_items.Name) = 'ctry' then
                FormAccountCard.Edit15.Text := FromEscaping(adr_items.AsString);

            end;
          end;

                //Секция телефон
          if AnsiLowerCase(tmpItem2.Name) = 'tel' then
          begin
            FormAccountCard.sProgressBar1.Position := 50;
            for n := 0 to tmpItem2.Children.Count - 1 do
            begin
              tel_items := tmpItem2.Children.Node[n];
              if AnsiLowerCase(tel_items.Name) = 'number' then
                FormAccountCard.Edit4.Text := FromEscaping(tel_items.AsString);
            end;
          end;

                //Секция e-mail
          if AnsiLowerCase(tmpItem2.Name) = 'email' then
          begin
            for n := 0 to tmpItem2.Children.Count - 1 do
            begin
              mail_items := tmpItem2.Children.Node[n];
              if AnsiLowerCase(mail_items.Name) = 'userid' then
                FormAccountCard.Edit6.Text := FromEscaping(mail_items.AsString);
            end;
            FormAccountCard.sProgressBar1.Position := 60;
          end;

                //Секция организация
          if AnsiLowerCase(tmpItem2.Name) = 'org' then
          begin
            for n := 0 to tmpItem2.Children.Count - 1 do
            begin
              org_items := tmpItem2.Children.Node[n];
              if AnsiLowerCase(org_items.Name) = 'orgname' then
                FormAccountCard.Edit7.Text := FromEscaping(org_items.AsString);
              if AnsiLowerCase(org_items.Name) = 'orgunit' then
                FormAccountCard.Edit8.Text := FromEscaping(org_items.AsString);
            end;
            FormAccountCard.sProgressBar1.Position := 80;
          end;

                //Секция фото
          if AnsiLowerCase(tmpItem2.Name) = 'photo' then
          begin

            FormAccountCard.sProgressBar1.Position := 90;
            for n := 0 to tmpItem2.Children.Count - 1 do
            begin
              photo_items := tmpItem2.Children.Node[n];

              if AnsiLowerCase(photo_items.Name) = 'type' then
                photo_type := photo_items.AsString;

              if AnsiLowerCase(photo_items.Name) = 'binval' then
              begin
                     //конвертируем base64 в картинку
                photo := DecodeString(photo_items.AsString);

              end; //---------
            end;
          end;
        end;
      end
      else
      begin
        Application.MessageBox('VCard не заполнена!', 'Информация');
        exit;
      end;

    end;

    if pub_vcard_view then
    begin
                          //путь к временому файлу аватара
      photo_way := ExtractFilePath(ParamStr(0)) + 'avatar\tmp.';
    end
    else
    begin
                         //извлекаем путь к аве
      photo_way := ExtractFilePath(ParamStr(0)) + 'avatar\avatar.';
    end;

                     //проверка типа картинки
    if pos('png', AnsiLowerCase(photo_type)) > 1 then
      current_type := 'png';
    if pos('jpg', AnsiLowerCase(photo_type)) > 1 then
      current_type := 'jpg';
    if pos('jpeg', AnsiLowerCase(photo_type)) > 1 then
      current_type := 'jpeg';
    if pos('gif', AnsiLowerCase(photo_type)) > 1 then
      current_type := 'gif';

    if current_type <> '' then
    begin
      try
        photo_way := photo_way + current_type;
        if FileExists(photo_way) then
          deletefile(photo_way);
        AssignFile(f, photo_way);
        if not FileExists(photo_way) then
        begin
          Rewrite(f);
          CloseFile(f);
        end;
        Append(f);
        Writeln(f, photo);
        Flush(f);
        CloseFile(f);
      finally

        if FileExists(photo_way) then
        begin
          FormAccountCard.Image1.Picture.LoadFromFile(photo_way);
          if pub_vcard_view = false then
          begin
            Image1.Picture.Bitmap.FreeImage;
            Image1.Picture.LoadFromFile(photo_way);
            reg := treginifile.Create('software');
            reg.WriteString('LampIM', 'avatar_type', '.' + current_type);
            reg.Free;
          end;
        end
        else
        begin
          if pub_vcard_view = false then
          begin
            reg := treginifile.Create('software');
            reg.WriteString('LampIM', 'avatar_type', '');
            reg.Free;
          end;
        end;

      end;
    end;

    XMLParser.Free;
    vcard_flag := false;
    if pub_vcard_view then
    begin
      FormAccountCard.Caption := 'VCard - ' + pub_vcard_jid;
      FormAccountCard.Show;
    end;

    FormAccountCard.sProgressBar1.Position := 100;
    FormAccountCard.sProgressBar1.Visible := false;
    FormAccountCard.sProgressBar1.Position := 0;
    FormAccountCard.Timer1.Enabled := false;
    pub_vcard_view := false;

    if autorize_JID <> '' then
      FormAccountCard.sButton7.Visible := true
    else
      FormAccountCard.sButton7.Visible := false;
  end;

  //Парсинг закладок
  XMLParser := TGmXML.Create;
  XMLParser.Text := XMLMessage;
  XMLItem := XMLParser.Nodes.Root;
  if (AnsiLowerCase(XMLItem.Params.Values['type']) = 'result') then
  begin
       //Получена версия клиента, парсим её, едрить колотить..
    if XMLItem.Children.Count > 0 then
    begin
      tmpItem := XMLItem.Children.Node[0];
      if (AnsiLowerCase(tmpItem.Name) = 'query') and (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:private') then
      begin
        if tmpItem.Children.Count > 0 then
        begin
          for a := 0 to tmpItem.Children.Count - 1 do
          begin
            tmpItem2 := tmpItem.Children.Node[a];
            if (tmpItem2.Name = 'storage') then
            begin
              for b := 0 to tmpItem2.Children.Count - 1 do
              begin
                tmpItem3 := tmpItem2.Children.Node[b];
                if tmpItem3.Name = 'conference' then
                begin
                  for c := 0 to tmpItem3.Children.Count - 1 do
                  begin
                    tmpItem4 := tmpItem3.Children.Node[c];
                    if (tmpItem4.Name = 'nick') then
                    begin
                      if not ExistMemoByName(Owner, 'bkmrk_' + md5(tmpItem3.Params.Values['jid'])) then
                      begin
                        itm := TmenuItem.Create(Owner);
                        itm.Name := 'bkmrk_' + md5(tmpItem3.Params.Values['jid']);
                        itm.Caption := tmpItem3.Params.Values['jid'] + '/' + tmpItem4.asstring;
                        itm.OnClick := joinconf;
                        MenuItemBookmark.Insert(0, itm);
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  XMLParser.Free;
end;

procedure TFormMain.JabberClientJabberOnline(Sender: TObject);
var
  MenuItem: TMenuItem;
  current_show: string;
begin
  ProgressBarLoading.Visible := False;
  FormConsole.AddLog('JabberClientJabberOnline: Now Online!' + #10#13, clBlue);

  MenuItemBookmark.Clear;
  MenuItem := TMenuItem.Create(MenuItemBookmark);
  MenuItem.Name := 'zero';
  MenuItem.Visible := False;
  MenuItemBookmark.Insert(0, MenuItem);
  MenuItemBookmark.Enabled := True;

  N16.Enabled := True;
  VCard2.Enabled := True;
  N40.Enabled := True;
  ListViewContacts.PopupMenu := PopupMenuContacts;

  JabberClient.StartSetPresence;
  JabberClient.UserStatusText := LabelStatus.Caption;
  JabberClient.EndSetPresence;

  PlaySound(sndOnline);
  FormChatRoom.SwowPopupWnd('Онлайн!');
end;

procedure TFormMain.JabberClientLoginError(Sender: TObject; Error: string);
begin
  ProgressBarLoading.Visible := False;
  PlaySound(sndError);
  FormConsole.AddLog('JabberClientLoginError: Login error!' + #10#13, clBlue);
  FormChatRoom.SwowPopupWnd('Ошибка авторизации!! Проверьте ваш логин/пароль...');
  sleep(2000);
end;

procedure TFormMain.JabberClientMessage(Sender: TObject; XMLMessage: string);
var
  XMLParser: TGmXML;
  XMLItem, XMLNode, tmpItem2: TGmXmlNode;
  From, JID, JIDmd, MessagesID, MessageType, Nick: string;
  i: integer;
  BodyMessage, invite_from: string;
begin
  FormConsole.AddLog('JabberClientMessage: ' + XMLMessage + #10#13, clRed);
  BodyMessage := '';
  XMLParser := TGmXML.Create;
  XMLParser.Text := XMLMessage;
  XMLItem := XMLParser.Nodes.Root;

  From := XMLItem.Params.Values['from'];
  MessagesID := XMLItem.Params.Values['id'];
  MessageType := XMLItem.Params.Values['type'];
  JID := LoginFromJID(From);

  //Чат сообщение
  if (MessageType = 'chat') then
  begin
    //Поиск ника по JID
    Nick := JIDToInfo(JID, 'uname');
    if Nick = '' then
      Nick := JID;

    //Тело сообщения
    XMLNode := XMLItem.Children.NodeByName['body'];
    if Assigned(XMLNode) then
      BodyMessage := XMLNode.AsString;

    if Pos('conference', From) > 1 then
    begin
      JID := From;
      JIDmd := MD5(From);
      Nick := Copy(JID, Pos('/', JID) + 1, Length(JID));
      if Nick = '' then
        Nick := JID;
    end
    else
    begin
      JID := LoginFromJID(JID);
      JIDmd := MD5(AnsiLowerCase(JID));
    end;

    if not ExistFormByName(Self, 'form' + JIDmd) then
    begin //Создание окна
      FormChatRoom := TFormChatRoom.Create(Self);
      FormChatRoom.Parent := PanelClient;
      FormChatRoom.Name := 'form' + JIDmd;
      FormChatRoom.Hint := JID;
      FormChatRoom.Caption := 'Чат с ' + Nick;
    end
    else
    begin
      FormChatRoom := TFormChatRoom(GetFormByName(Self, 'form' + JIDmd));
    end;
    if BodyMessage <> '' then
    begin
      FormChatRoom.NewMessage(Nick, BodyMessage);
      if not Active then
        FormChatRoom.SwowPopupWnd(Nick + ':' + BodyMessage)
      else
        JabberClient.SendReadMessage(JID, MessagesID);
    end
    else
      FormChatRoom.Reads;
  end;

  //MSG from conference
  if (XMLItem.Params.Values['type'] = 'groupchat') then
  begin
    //Chat nick
    user_nick := Copy(XMLItem.Params.Values['from'], Pos('/', XMLItem.Params.Values['from']) + 1, length(XMLItem.Params.Values['from']));

    for i := 0 to XMLItem.Children.Count - 1 do
    begin
      XMLNode := XMLItem.Children.Node[i];
      //Получаем тело сообщения
      if XMLNode.Name = 'body' then
      begin
        msg := XMLNode.AsString;
        Continue;
      end;

      //Получаем топик конфы
      if XMLNode.Name = 'subject' then
      begin
        topik_from := LoginFromJID(XMLItem.Params.Values['from']);
        Continue;
      end;
    end;

    conf := JID;
    FormConference.ActionNewMessage.Execute;
  end;

  //Запрос проверки каптчи
  if (XMLItem.Params.Values['type'] = '') or (XMLItem.Params.Values['type'] = 'normal') then
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
          FormChatRoom.SwowPopupWnd('Для входа в конференцию ' + From + ' необходима проверка CAPTCHA. Запрос отправлен..');
          FormCaptcha.WebBrowser1.Navigate(tmpItem2.AsString);
          FormCaptcha.Show;
        finally

        end;
      end;

      //парсинг инвайта
      if (XMLNode.Name = 'x') and (XMLNode.Params.Values['xmlns'] = 'jabber:x:conference') then
      begin
        FormChatRoom.SwowPopupWnd(From + ' приглашает посетить конференцию ' + XMLNode.Params.Values['jid']);
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
  end;

  XMLParser.Free;
end;

procedure TFormMain.JabberClientPresence(Sender: TObject; Presence: string);
var
  XMLParser: TGmXML;
  XMLItem, tmpItem, xmlItem2: TGmXmlNode;
  a: integer;
  fromTYPE, fromJID, fromJID2, JID, conf_nick, confONLY, JIDonly: string;
  real_JID, presence_show, presence_status: string;
begin
  FormConsole.AddLog('JabberClientPresence: ' + Presence + #10#13, clRed);

  XMLParser := TGmXML.Create;
  XMLParser.Text := Presence;
  XMLItem := XMLParser.Nodes.Root;

  fromJID := Lowercase(XMLItem.Params.Values['from']);
  real_JID := XMLItem.Params.Values['from'];
  JIDonly := LoginFromJID(real_JID);

  fromJID2 := XMLItem.Params.Values['from'];
  conf_nick := copy(fromJID2, Pos('/', fromJID2) + 1, length(fromJID2));

  fromTYPE := LowerCase(XMLItem.Params.Values['type']);
  confONLY := LoginFromJID(fromJID);

  if fromTYPE = 'error' then
  begin
    if Pos('error code="409"', Presence) > 1 then
      Application.MessageBox('Использованый вами ник уже используется кем-то другим.', 'Ошибка');

    if (Pos('error code="403"', Presence) > 1) and (Pos('You have been banned', Presence) > 1) then
      Application.MessageBox(pchar('Вам запретили входить в комнату ' + fromJID2), 'Ошибка');

    if (Pos('error code="404"', Presence) > 1) and (Pos('remote-server-not-found xmlns="urn:ietf:params:xml:ns:xmpp-stanzas', Presence) > 1) then
    begin
      FormConsole.AddLog('Сервер контакта - ' + fromJID2 + ' недоступен, удалите его!' + #10#13, clBlue);
    end;

    if (Pos('error code="407"', Presence) > 1) and (Pos('Membership is required to enter this room', Presence) > 1) then
    begin
      Application.MessageBox(pchar('Для входа в комнату ' + confONLY + ' нужно иметь членство.'), 'Ошибка');
      FormConference.ConfClose2(confONLY);
    end;
    Exit;
  end;

  //subscribe
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
    //Rostr
    //получаем статусы
    for a := 0 to XMLItem.Children.Count - 1 do
    begin
      tmpItem := XMLItem.Children.Node[a];
        //получаем тип статуса юзера
      if (tmpItem.Name = 'show') then
        presence_show := tmpItem.AsString;
        //получаем текст статуса юзера
      if (tmpItem.Name = 'status') then
        presence_status := tmpItem.AsString;
    end;

    //пишем статусы в ini
    if JIDexists(JID) = true then
    begin
      //Записываем тип статуса
      WriteIni('rostr', JIDonly, 'show', '0');
      //Записываем JID с ресурсом
      WriteIni('rostr', JIDonly, 'jid', real_JID);

      //Меняеи картинки соответственно статусу юзверя...
      if presence_show = 'chat' then
        WriteIni('rostr', JIDonly, 'show', '1');
      if presence_show = 'away' then
        WriteIni('rostr', JIDonly, 'show', '2');
      if presence_show = 'xa' then
        WriteIni('rostr', JIDonly, 'show', '3');
      if presence_show = 'na' then
        WriteIni('rostr', JIDonly, 'show', '3');
      if presence_show = 'n/a' then
        WriteIni('rostr', JIDonly, 'show', '3');
      if presence_show = 'dnd' then
        WriteIni('rostr', JIDonly, 'show', '4');
      if presence_show = 'invisible' then
        WriteIni('rostr', JIDonly, 'show', '5');
      if fromTYPE = 'unavailable' then
        WriteIni('rostr', JIDonly, 'show', '6');

      //Записываем сам статус
      WriteIni('rostr', JIDonly, 'status', FromEscaping(presence_status));
      //Обновляем ростр
      update_rostr(ListViewContacts, JIDonly, FormConfig.sCheckBox2.Checked);
    end;
  end;
  XMLParser.Free;
end;

procedure TFormMain.JabberClientReceiveData(Sender: TObject; SendStr: string; Handled: Boolean);
begin
  BytesReceive := BytesReceive + Length(SendStr);
  FormConsole.AddLog('JabberClientReceiveData: ' + SendStr + #10#13, clRed);
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
    FormAccountCard.sButton1.Visible := False;
    FormAccountCard.sButton2.Visible := False;
    FormAccountCard.sButton3.Visible := False;
    FormAccountCard.sButton5.Visible := False;
    pub_vcard_view := True;
    pub_vcard_jid := LoginFromJID(From);
    FormAccountCard.ActionListMain.Actions[0].Execute;
  end
  else
  begin
    if MessageDlg('Подтвердить авторизацию от ' + From + '? ', mtConfirmation, mbYesNo, 1) = mrYes then
    begin
      JIDExists := False;
      for i := 0 to ListViewContacts.Items.Count - 1 do
      begin
        if LowerCase(ListViewContacts.Items[i].SubItems[0]) = LowerCase(From) then
        begin
          JIDExists := True;
          Break;
        end;
      end;

      if JIDExists then
      begin
        JabberClient.SendSubscribeAccept(From);
        FormChatRoom.SwowPopupWnd('Авторизация одобрена!');
      end
      else
      begin
        if InputQuery('Добавление нового контакта', 'Введите ник: ', Nick) then
        begin
          if Nick = '' then
            Nick := LoginFromJID(From);
          JabberClient.AddContact(From, Nick, '');
          Sleep(1000);
          JabberClient.SendSubscribeAccept(From);
          FormChatRoom.SwowPopupWnd('Авторизация одобрена!');
        end;
      end;
    end
    else
    begin
      JabberClient.SendSubscribeCancel(From);
      FormChatRoom.SwowPopupWnd('Авторизация отменена!');
    end;
  end;
end;

procedure TFormMain.MenuItemStatusChatClick(Sender: TObject);
begin
  CheckConnect;
  JabberClient.UserStatus := stChat;
  BitBtnStatus.Caption := MenuItemStatusChat.Caption;
end;

procedure TFormMain.MenuItemStatusAwayClick(Sender: TObject);
begin
  CheckConnect;
  JabberClient.UserStatus := stAway;
  BitBtnStatus.Caption := MenuItemStatusAway.Caption;
end;

procedure TFormMain.MenuItemStatusXaClick(Sender: TObject);
begin
  CheckConnect;
  JabberClient.UserStatus := stXa;
  BitBtnStatus.Caption := MenuItemStatusXa.Caption;
end;

procedure TFormMain.MenuItemStatusDNDClick(Sender: TObject);
begin
  CheckConnect;
  JabberClient.UserStatus := stDnd;
  BitBtnStatus.Caption := MenuItemStatusDND.Caption;
end;

procedure TFormMain.MenuItemStatusInvisClick(Sender: TObject);
begin
  CheckConnect;
  JabberClient.UserStatus := stInvisible;
  BitBtnStatus.Caption := MenuItemStatusInvis.Caption;
end;

procedure TFormMain.MenuItemDisconnectClick(Sender: TObject);
begin
  JabberClient.Disconnect;
  BitBtnStatus.Caption := MenuItemDisconnect.Caption;
end;

procedure TFormMain.N19Click(Sender: TObject);
begin
  ListViewContactsClick(nil);
end;

procedure TFormMain.N1Click(Sender: TObject);
begin
  FormAccount.show;
end;

procedure TFormMain.N20Click(Sender: TObject);
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    ListViewContacts.Selected.EditCaption;
  end;
end;

procedure TFormMain.MenuItemContactDeleteClick(Sender: TObject);
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    JabberClient.DeleteContact(ListViewContacts.Selected.SubItems[0]);
    ListViewContacts.Items.Delete(ListViewContacts.Selected.Index);
  end;
end;

procedure TFormMain.N23Click(Sender: TObject);
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    ActionAutorization.Execute;
  end;
end;

procedure TFormMain.N24Click(Sender: TObject);
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    ActionRemoveAutorize.Execute;
  end;
end;

procedure TFormMain.N25Click(Sender: TObject);
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    ActionRequierAutorize.Execute;
  end;
end;

procedure TFormMain.N26Click(Sender: TObject);
begin
  FormContactAdd.show;
end;

procedure TFormMain.N2Click(Sender: TObject);
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

procedure TFormMain.N3Click(Sender: TObject);
begin
  JabberClient.Disconnect;
  application.Terminate;
end;

procedure TFormMain.N40Click(Sender: TObject);
begin
  N26.Click;
end;

procedure TFormMain.N41Click(Sender: TObject);
var
  i: integer;
  j: string;
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    if ListViewContacts.Selected.Selected then
    begin
      randomize;
      i := random(777);
      j := nick2info(ListViewContacts.Selected.Caption, 'jid');
      if JabberClient.Online then
      begin
        JabberClient.SendData('<iq type="get" from="' + JabberClient.JID + '@' + JabberClient.UserServer + '/' + JabberClient.Resource + '" to="' + j + '" id="' + inttostr(i) + '"><query xmlns="jabber:iq:version"/></iq>');
        get_version_flag := true;
      end;
    end;
  end;
end;

procedure TFormMain.MenuItemBookmarksClick(Sender: TObject);
begin
  ActionListMain.Actions[8].Execute;
end;

procedure TFormMain.N4Click(Sender: TObject);
begin
  FormAbout.show;
end;

procedure TFormMain.MenuItemShowClick(Sender: TObject);
begin
  ActionListMain.Actions[11].Execute;
  MenuItemShow.Visible := false;
end;

procedure TFormMain.N7Click(Sender: TObject);
var
  group: string;
  i, n, gid: integer;
  LG1: TlistGroup;
  group_exist: bool;
begin
  group_exist := false;
  i := random(777);
  InputQuery('Добавление новой группы', 'Название группы: ', group);
  if (group <> '') then
  begin

    //Поиск существования группы
    for n := 0 to ListViewContacts.Groups.Count - 1 do
    begin
      if ListViewContacts.Groups.Items[n].Header = group_name then
        group_exist := true;
    end;

    if not group_exist then
    begin
      //Создаем группу
      gid := ListViewContacts.Groups.Count + 1;
      LG1 := ListViewContacts.Groups.Add;
      LG1.Header := group;
      LG1.GroupID := gid;
    end;

    if (ListViewContacts.ItemIndex <> -1) then
    begin
      if ListViewContacts.Selected.Selected then
      begin
        if JabberClient.Online then
        begin
          group_id := 0;
          group_jid := LoginFromJID(nick2info(ListViewContacts.Selected.Caption, 'jid'));
          group_name := group;

          for n := 0 to ListViewContacts.Groups.Count - 1 do
          begin
            if ListViewContacts.Groups.Items[n].Header = group_name then
            begin
              group_id := ListViewContacts.Groups.Items[n].GroupID;
            end;
          end;

          if group_id = 0 then
          begin
            JabberClient.SendData('<iq type="set" id="grp' + inttostr(i) + '" >' + '<query xmlns="jabber:iq:roster">' + '<item name="' + nick2info(ListViewContacts.Selected.Caption, 'uname') + '" jid="' + group_jid + '" ></item></query></iq>');
            group_update_flag := true;
          end
          else
          begin
            JabberClient.SendData('<iq type="set" id="grp' + inttostr(i) + '" >' + '<query xmlns="jabber:iq:roster">' + '<item name="' + nick2info(ListViewContacts.Selected.Caption, 'uname') + '" jid="' + group_jid + '" >' + '<group>' + group + '</group></item></query></iq>');
            group_update_flag := true;
          end;
        end;
      end;
    end
    else
      Application.MessageBox('Создание группы отменено', 'Вы не указали название группы, создание отменено!', 0);
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
  CheckConnect;
  JabberClient.UserStatus := stNormal;
  BitBtnStatus.Caption := MenuItemStatusOnline.Caption;
end;

procedure TFormMain.ActionRemoveAutorizeExecute(Sender: TObject);
var
  JID: string;
begin
  //Удаляем авторизизацию юзера
  if ListViewContacts.Selected.Selected then
  begin
    JID := ListViewContacts.Selected.SubItems[0];
    JabberClient.SendSubscribeCancel(JID);
    JabberClient.SendUnsubscribe(JID);
    JabberClient.SendAuthRemove(JID);
  end;
end;

procedure TFormMain.ActionRequierAutorizeExecute(Sender: TObject);
var
  JID: string;
begin
  //Отправляем запрос на авторизацию
  if ListViewContacts.Selected.Selected then
  begin
    JID := ListViewContacts.Selected.SubItems[0];
    JabberClient.SendAuthRequest(JID);
  end;
end;

procedure TFormMain.PopupMenuContactsPopup(Sender: TObject);
var
  MenuItem: TMenuItem;
  i: integer;
begin
  //Закладки
  MenuItemBookmarks.Clear;
  MenuItem := TMenuItem.Create(Owner);
  MenuItem.Name := 'bookmarks';
  MenuItem.Visible := False;
  MenuItemBookmarks.Insert(0, MenuItem);

  //Группы
  MenuItemMoveToGroup.Clear;
  for i := 0 to ListViewContacts.Groups.Count - 1 do
  begin
    //Проверка существования пункта меню  в памяти
    if ExistMemoByName(Owner, 'grp_' + md5(ListViewContacts.Groups.Items[i].Header)) then
    begin
      GetMenuItemByName(Owner, 'grp_' + md5(ListViewContacts.Groups.Items[i].Header)).Destroy;
    end;

    MenuItem := TMenuItem.Create(Owner);
    MenuItem.Name := 'grp_' + md5(ListViewContacts.Groups.Items[i].Header);
    MenuItem.Caption := ListViewContacts.Groups.Items[i].Header;
    MenuItem.OnClick := MoveToGroup;
    MenuItemMoveToGroup.Insert(0, MenuItem);
  end;
  invite_popup_flag := True;
end;

procedure TFormMain.BitBtnStatusClick(Sender: TObject);
begin
  PopupMenuStatus.Popup(FormMain.left + 45, FormMain.top + FormMain.Height - 270);
end;

function TFormMain.CheckAccount: Boolean;
begin
  Result := False;
  //Проверка данных аккаунта
  if not JabberClient.CheckAccount then
  begin
    FormChatRoom.SwowPopupWnd('Введите данные Вашей учетной записи!');
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
  if JabberClient.Online then
  begin
    JabberClient.UserStatusText := LabelStatus.Caption;
    WriteIni('options', 'form', 'status', LabelStatus.Caption);
  end;
end;

procedure TFormMain.ListViewContactsClick(Sender: TObject);
var
  JID, JID2: string;
begin
  if ListViewContacts.ItemIndex >= 0 then
  begin
    JID2 := LoginFromJID(ListViewContacts.Selected.SubItems[0]);
    JID := MD5(JID2);
    if Assigned(FActiveChatForm) then
    begin
      FActiveChatForm.Hide;
    end;
    if (ExistFormByName(Self, 'form' + JID) = false) then
    begin
      FActiveChatForm := TFormChatRoom.Create(Self);
      FActiveChatForm.Parent := PanelClient;
      FActiveChatForm.Name := 'form' + JID;
      FActiveChatForm.Hint := JID2;
      FActiveChatForm.Caption := 'Чат с ' + ListViewContacts.Selected.Caption;
      TFormChatRoom(FActiveChatForm).LabelNick.Caption := ListViewContacts.Selected.Caption;
      FActiveChatForm.Show;
      FActiveChatForm.BringToFront;
    end
    else
    begin
      FActiveChatForm := GetFormByName(Self, 'form' + JID);
      FActiveChatForm.Show;
    end;
  end
  else
  begin
    if Assigned(FActiveChatForm) then
    begin
      FActiveChatForm.Hide;
    end;
  end;
end;

procedure TFormMain.ListViewContactsCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Compare := Item1.ImageIndex - Item2.ImageIndex;
end;

procedure TFormMain.ListViewContactsEdited(Sender: TObject; Item: TListItem; var S: string);
var
  Group, JID: string;
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    JID := ListViewContacts.Selected.SubItems[0];
    Group := ListViewContacts.Selected.SubItems[1];
    JabberClient.RenameContact(JID, S, Group);
  end;
end;

procedure TFormMain.ListViewContactsMouseLeave(Sender: TObject);
begin
  ListViewContacts.Hint := '';
end;

procedure TFormMain.ListViewContactsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ListViewContacts.Hint := '';
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

procedure TFormMain.TrayIconClick(Sender: TObject);
begin
  ActionShowMain.Execute;
end;

procedure TFormMain.Vcard1Click(Sender: TObject);
begin
  if (ListViewContacts.ItemIndex >= 0) then
  begin
    if ListViewContacts.Selected.Selected then
    begin
      FormAccountCard.ActionListMain.Actions[2].Execute;
      FormAccountCard.sPageControl1.TabIndex := 0;
      FormAccountCard.sButton1.Visible := false;
      FormAccountCard.sButton2.Visible := false;
      FormAccountCard.sButton3.Visible := false;
      FormAccountCard.sButton5.Visible := false;
      pub_vcard_view := true;
      pub_vcard_jid := LoginFromJID(nick2info(ListViewContacts.Selected.Caption, 'jid'));

      FormAccountCard.ActionListMain.Actions[0].Execute;
    end;
  end;
end;

procedure TFormMain.VCard2Click(Sender: TObject);
begin
  FormAccountCard.sPageControl1.TabIndex := 0;
  FormAccountCard.sButton1.Visible := true;
  FormAccountCard.sButton2.Visible := true;
  FormAccountCard.sButton3.Visible := true;
  FormAccountCard.sButton5.Visible := true;
  FormAccountCard.Image1.Enabled := true;
  FormAccountCard.Caption := 'Личная VCard';
  FormAccountCard.show;
  FormAccountCard.sButton5.Click;
end;

procedure TFormMain.XML1Click(Sender: TObject);
begin
  FormConsole.show;
end;

end.

