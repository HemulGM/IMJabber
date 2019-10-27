unit IM.Conference;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, ExtCtrls, sSplitter, StdCtrls, sButton, sMemo,
  sPanel, sListView, sTabControl, ActnList, md5hash2, Menus, OleCtrls, SHDocVw,
  Buttons, sSpeedButton, acAlphaHints, mmsystem, MSHTML, inifiles, ExtDlgs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdMultipartFormData, acPNG, ImgList, System.ImageList, System.Actions;

type
  TFormConference = class(TForm)
    sTabControl1: TsTabControl;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sSplitter1: TsSplitter;
    chat: TsMemo;
    sButton1: TsButton;
    send: TsMemo;
    ActionListMain: TActionList;
    create_conf: TAction;
    ActionNewMessage: TAction;
    presence: TAction;
    send_msg: TAction;
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
    create_chat: TAction;
    nicknames: TPopupMenu;
    WebBrowser1: TWebBrowser;
    WebBrowser2: TWebBrowser;
    load_smiles: TAction;
    tray_flash: TAction;
    sSpeedButton1: TsSpeedButton;
    niks_list: TAction;
    BalloonHint1: TBalloonHint;
    Memo1: TMemo;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    EditSubject: TEdit;
    Label1: TLabel;
    sSpeedButton2: TsSpeedButton;
    N20: TMenuItem;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    SaveDialog1: TSaveDialog;
    sSpeedButton4: TsSpeedButton;
    conf_close: TAction;
    confs: TPopupMenu;
    sSpeedButton8: TsSpeedButton;
    Splitter1: TSplitter;
    sSpeedButton9: TsSpeedButton;
    body_load: TAction;
    N21: TMenuItem;
    sSpeedButton10: TsSpeedButton;
    sSpeedButton11: TsSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    IdHTTP1: TIdHTTP;
    Image1: TImage;
    sSpeedButton12: TsSpeedButton;
    conferenceusers: TListView;
    ImageList1: TImageList;
    update_users_list: TAction;
    procedure create_confExecute(Sender: TObject);
    procedure ActionNewMessageExecute(Sender: TObject);
    procedure presenceExecute(Sender: TObject);
    procedure send_msgExecute(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sTabControl1Change(Sender: TObject);
    procedure conferenceusersDblClick(Sender: TObject);
    procedure create_chatExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure NickClicked(Sender: TObject);
    procedure ConfClose(Sender: TObject);
    procedure ConfClose2(conf: string);
    procedure chatChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure load_smilesExecute(Sender: TObject);
    procedure WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure tray_flashExecute(Sender: TObject);
    procedure sendMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sendChange(Sender: TObject);
    procedure conferenceusersMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sendClick(Sender: TObject);
    procedure sPageControl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sPageControl1Change(Sender: TObject);
    procedure niks_listExecute(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure conf_closeExecute(Sender: TObject);
    procedure sSpeedButton8Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure body_loadExecute(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure WMMove(var Message: TWMMove); message WM_Move;
    procedure sSpeedButton10Click(Sender: TObject);
    procedure conferenceusersClick(Sender: TObject);
    procedure update_users_listExecute(Sender: TObject);
  private
  public
    snd_off, form7_pos_flag: Boolean;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  FormConference: TFormConference;
  conference: tmemo;
  nicks: tmemo;
  HookID: THandle;
  msg_body_flag: bool;
  enter_off: bool = false;
  content: string;
  Range: IHTMLTxtRange;
  body_loaded: bool = false;
  first_body_loaded: bool = false;
  allmsg: integer = 0;

implementation

uses
  IM.Conference.Invite, IM.Main, IM.ChatRoom, ActiveX, ComObj, IM.Account.Card,
  IM.Account;

{$R *.dfm}

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

procedure TFormConference.WMMove(var Message: TWMMove);
begin
  if form7_pos_flag then
  begin
    writeini('options', 'conf_form', 'top', inttostr(FormConference.Top));
    writeini('options', 'conf_form', 'left', inttostr(FormConference.Left));
  end;
end;

procedure TFormConference.conf_closeExecute(Sender: TObject);
var
  conf_menu: Tmenuitem;
  i: integer;
begin
  confs.Items.Clear;
  for i := 0 to sTabControl1.Tabs.Count - 1 do
  begin
    conf_menu := Tmenuitem.Create(send);
    conf_menu.Caption := sTabControl1.Tabs.Strings[i];
    conf_menu.OnClick := ConfClose;
    confs.Items.Insert(0, conf_menu);
  end;
  confs.Popup(FormConference.Left + FormConference.width - 20, FormConference.Top + FormConference.height - 135);
end;

procedure TFormConference.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

//Звук сообщения групчата
procedure MsgSnd;
begin
  if (FormConference.snd_off = false) then
  begin
    FormMain.PlaySound(sndGroup);
  end;
end;

function SetCaretPosition(memo: TMemo; x, y: integer): bool;
var
  i: integer;
begin
  i := SendMessage(memo.Handle, EM_LINEINDEX, y, 0) + x;
  SendMessage(memo.Handle, EM_SETSEL, i, i);
  result := true;
end;

//Функция загрузки HTML кода в TWebBrowser
procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

//Функция парсинга смайлов
//flag_type - true = замена текстовых смайлов на ссылки
//flag_type - false = создание сылок на смайлы
function smile_(text: string; flag_type: bool): string;
var
  f: TextFile; // файл
  buf: string; // буфер для чтения из файла

  f2: TextFile; // файл
  buf2, homedir: string; // буфер для чтения из файла

  smiles: tListBox;
  smiles_files: tListBox;
  i: integer;
  tmpstr: string;
begin
  homedir := ExtractFilePath(ParamStr(0));
  smiles := tListBox.Create(FormChatRoom);
  smiles.Name := 'allsmiles';
  smiles.Parent := FormChatRoom;
  smiles.Visible := false;

  smiles_files := tListBox.Create(FormChatRoom);
  smiles_files.Name := 'smilesfiles';
  smiles_files.Parent := FormChatRoom;
  smiles_files.Visible := false;

  AssignFile(f, ExtractFilePath(ParamStr(0)) + 'smiles\standart\smiles.dat');
  AssignFile(f2, ExtractFilePath(ParamStr(0)) + 'smiles\standart\files.dat');
  Reset(f); // открыть для чтения
  Reset(f2); // открыть для чтения
// чтение из файла
  while not EOF(f) do
  begin
    readln(f, buf); // прочитать строку из файла
    smiles.items.Add(buf); // добавить строку
  end;

// чтение из файла
  while not EOF(f2) do
  begin
    readln(f2, buf2); // прочитать строку из файла
    smiles_files.items.Add(buf2);
  end;

  CloseFile(f);
  CloseFile(f2);

  if flag_type then
  begin
    if smiles_files.items.Count = smiles.items.Count then
    begin
      for i := 0 to smiles.items.Count - 1 do
      begin
        text := StringReplace(text, smiles.items.Strings[i], '<img align="middle" src="' + homedir + 'smiles\standart\' + smiles_files.items.Strings[i] + '" alt="" border="0">', [rfReplaceAll, rfIgnoreCase]);
      end;

    end
    else
      showmessage('Неверная конртрольная сума smiles/standart/smiles.dat <> smiles/standart/files.dat');

    result := text;

  end
  else
  begin
    if smiles_files.items.Count = smiles.items.Count then
    begin
      for i := 0 to smiles.items.Count - 1 do
      begin
        if tmpstr <> smiles_files.items.Strings[i] then
          text := text + '<a onclick="smile(''' + smiles.items.Strings[i] + ''')" href="#"><img src="' + homedir + 'smiles/standart/' + smiles_files.items.Strings[i] + '" alt="" border="0"></a>';
        tmpstr := smiles_files.items.Strings[i];
      end;
    end
    else
      showmessage('Неверная конртрольная сума smiles/standart/smiles.dat <> smiles/standart/files.dat');

    result := text;

  end;

  smiles.Destroy;
  smiles_files.Destroy;
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

procedure TFormConference.body_loadExecute(Sender: TObject);
var
  header, footer, conf, homedir: string;
begin

  homedir := ExtractFilePath(ParamStr(0));

  try
    if sTabControl1.TabIndex >= 0 then
      conf := sTabControl1.Tabs.Strings[sTabControl1.TabIndex];
  except
  end;

  header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' + '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">' + '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />' + '<title>Lamp IM | Чат ' + conf + '</title>' + '<link rel="stylesheet" href="' + homedir + 'skins\\chat\\style.css" type="text/css" />' + '<script language="JavaScript">' + Memo1.Text + '</script>' + '</head><body onload="javascript:window.scrollTo(0,100000); ">';
  footer := '</body></html>';
      //Загружаем страницу в Веббраузер
  WB_LoadHTML(WebBrowser1, header + footer);
end;

procedure TFormConference.chatChange(Sender: TObject);
var
  conf: string;
  header, body_text, footer, homedir: string;
  document: IHTMLDocument2;
begin

  spanel1.Enabled := true;
  conferenceusers.Enabled := true;
  homedir := ExtractFilePath(ParamStr(0));

  if (Memo1.Text = '') then
    Memo1.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'skins\chat\js.js');

  try
    if (sTabControl1.Tabs.Count >= 0) and (sTabControl1.TabIndex <> -1) then
      conf := sTabControl1.Tabs.Strings[sTabControl1.TabIndex];
  except

  end;

  if chat.Tag = 0 then
    body_text := chat.Lines.Strings[chat.Lines.Count - 1];

  if chat.Tag = 1 then
  begin
    body_text := chat.text;
  end;

  //правим некоторые смайлы
  body_text := FromEscaping(body_text);

 //Заменяем текстовые смайлы на путь
  body_text := smile_(body_text, true);
  if chat.Tag = 1 then
  begin
    header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' + '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">' + '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />' + '<title>Lamp IM | Чат ' + conf + '</title>' + '<link rel="stylesheet" href="' + homedir + 'skins\\chat\\style.css" type="text/css" />' + '<script language="JavaScript">' + Memo1.Text + '</script>' + '</head><body onload="javascript:window.scrollTo(0,100000); ">';
    footer := '</body></html>';

      //body_text := StringReplace(body_text, '', '');
      //Загружаем страницу в Веббраузер
    content := header + body_text + footer;
    WB_LoadHTML(WebBrowser1, content);
    chat.Tag := 1;
  end;

  //Загружаем построчно в браузер
  try
    if chat.Tag = 0 then
    begin
      Range := ((WebBrowser1.Document as IHTMLDocument2).body as IHTMLBodyElement).createTextRange;
      Range.collapse(False);
      Range.pasteHTML(body_text);
    end;
  finally
  end;

  if chat.Tag = 1 then
    chat.Tag := 0;

//прокручиваем в низ
  document := webBrowser1.Document as IHTMLDocument2;
  if Assigned(document) then
    document.parentWindow.scrollBy(0, +1000000);

  if not FormConference.Active then
  begin
    if not FormMain.presence_incom_flag then
    begin
    //Анимация иконки
      FormMain.TrayIcon.Animate := true;
      flashwindow(FormConference.Handle, true);
    //звук сообщения в новом процессе
      MsgSnd;
    end;
  end;
end;

procedure TFormConference.create_chatExecute(Sender: TObject);
begin
  try
    if conferenceusers.ItemIndex <> -1 then
    begin
      FormMain.groupchat_jid := sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '/' + conferenceusers.Items[conferenceusers.ItemIndex].Caption;
      FormMain.ActionListMain.Actions[0].Execute;
    end;
  finally

  end;

end;

procedure TFormConference.create_confExecute(Sender: TObject);
var
  conf_name, user_nick: string;
begin
  conf_name := Lowercase(FormConfInvite.sComboBox1.Text);
  user_nick := FormConfInvite.sComboBox3.Text;

  FormMain.JabberClient.SendData('<presence to="' + conf_name + '/' + user_nick + '" >' + '<status>' + FormMain.LabelStatus.Caption + '</status><priority>0</priority></presence>');

  if not ExistMemoByName(sTabControl1, 'conf' + md5(conf_name)) then
  begin
    FormConference.sTabControl1.Tabs.Add(conf_name);
    conference := tmemo.Create(sTabControl1);
    conference.Parent := sTabControl1;
    conference.Visible := false;
    conference.ScrollBars := ssBoth;
    conference.Name := 'conf' + md5(conf_name);
    conference.Text := '';
  end
  else
    FormConference.Show;

end;

procedure TFormConference.FormActivate(Sender: TObject);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  FormConference.Hide;
end;

procedure TFormConference.FormCreate(Sender: TObject);
begin
  ActionListMain.Actions[5].Execute;
  try
    FormConference.height := strtoint(readini('options', 'conf_form', 'height'));
    FormConference.width := strtoint(readini('options', 'conf_form', 'width'));
    FormConference.Top := strtoint(readini('options', 'conf_form', 'top'));
    FormConference.Left := strtoint(readini('options', 'conf_form', 'left'));
    form7_pos_flag := true;
  finally

  end;
end;

procedure TFormConference.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.FormResize(Sender: TObject);
begin
  sSpeedButton8.left := FormConference.Width - 74;
  sSpeedButton2.left := FormConference.Width - 153;
  EditSubject.Width := FormConference.Width - 195;

  if form7_pos_flag then
  begin
    writeini('options', 'conf_form', 'height', inttostr(FormConference.height));
    writeini('options', 'conf_form', 'width', inttostr(FormConference.width));
  end;

end;

procedure TFormConference.FormShow(Sender: TObject);
begin

  if first_body_loaded = false then
  begin
    ActionListMain.Actions[9].Execute;
    first_body_loaded := true;
  end;

  if not FormMain.JabberClient.Connected then
  begin
    sPageControl1.Enabled := false;
    sButton1.Enabled := false;
  end;

  ActionListMain.Actions[6].Execute;

end;

procedure TFormConference.load_smilesExecute(Sender: TObject);
var
  header, body_text, footer, homedir: string;
begin

  //Текущий каталог программы
  homedir := ExtractFilePath(ParamStr(0));

  //Хедер
  header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' + '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">' + '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />' + '<link rel="stylesheet" href="' + homedir + 'skins/chat/style.css" type="text/css" />' + '</head><body onload="javascript:window.scrollTo(0,0);">' + '<script language="JavaScript"> function smile (a) {document.title=a;}</script>';

  //футер
  footer := '</div></body></html>';

//  body_text := '<a onclick="smile('':-)'')" href="#"><img src="'+homedir+'smiles/standart/smile.gif" width="21" height="25" alt=":-)" border="0"></a>';
  //Парсим смайлы
  body_text := smile_('', false);

  //Грузим страницу в браузер
  WB_LoadHTML(WebBrowser2, header + body_text + footer);

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
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="participant"></item></query></iq>');
  end;
end;

procedure TFormConference.N16Click(Sender: TObject);
begin
//Дать права модератора
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="moderator"></item></query></iq>');
  end;
end;

procedure TFormConference.N17Click(Sender: TObject);
begin
//Дать права администратора
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="admin"></item></query></iq>');
  end;
end;

procedure TFormConference.N18Click(Sender: TObject);
begin
//Дать права владельца
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="owner"></item></query></iq>');
  end;
end;

procedure TFormConference.N1Click(Sender: TObject);
begin
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    FormAccountCard.ActionListMain.Actions[2].Execute;
    FormAccountCard.sPageControl1.TabIndex := 0;
    FormAccountCard.sButton1.Visible := false;
    FormAccountCard.sButton2.Visible := false;
    FormAccountCard.sButton3.Visible := false;
    FormAccountCard.sButton5.Visible := false;
    FormAccountCard.Image1.Enabled := false;
    FormMain.pub_vcard_view := true;
    FormMain.pub_vcard_jid := sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '/' + conferenceusers.Items[conferenceusers.ItemIndex].Caption;
    FormAccountCard.ActionListMain.Actions[0].Execute;
  end;
end;

procedure TFormConference.N20Click(Sender: TObject);
begin
//Дать права учасника
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="member"></item></query></iq>');
  end;
end;

procedure TFormConference.N21Click(Sender: TObject);
var
  i: integer;
begin
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    randomize;
    i := random(777);
    if FormMain.JabberClient.Connected then
    begin
      FormMain.JabberClient.SendData('<iq type="get" from="' + FormMain.JabberClient.JID + '@' + FormMain.JabberClient.UserServer + '/' + FormMain.JabberClient.Resource + '" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '/' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" id="' + inttostr(i) + '"><query xmlns="jabber:iq:version"/></iq>');
      FormMain.get_version_flag := true;
    end;
  end;
end;

procedure TFormConference.N2Click(Sender: TObject);
begin
  ActionListMain.Actions[4].Execute;
end;

procedure TFormConference.N4Click(Sender: TObject);
var
  reasone: string;
begin
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if inputquery('Кик', 'Причина:', reasone) then
    begin
      if FormMain.JabberClient.Connected then
        FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '">' + '<query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="none"><reason>' + reasone + '</reason></item></query></iq>');
    end;
  end;
end;

procedure TFormConference.MenuItemSoundClick(Sender: TObject);
begin
//Визитер
  if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if FormMain.JabberClient.Connected then
      FormMain.JabberClient.SendData('<iq type="set" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="' + conferenceusers.Items[conferenceusers.ItemIndex].Caption + '" role="visitor"></item></query></iq>');
  end;
end;

procedure TFormConference.ActionNewMessageExecute(Sender: TObject);
var
  s, nick_color: string;
begin

  if msg_body_flag then
  begin
    msg_body_flag := false;
    s := 'groupchat_t1';
  end
  else
  begin
    msg_body_flag := true;
    s := 'groupchat_t2';
  end;

  if (FormMain.Topic <> '') then
  begin

    if ExistMemoByName(sTabControl1, 'conf' + md5(FormMain.topik_from)) then
    begin
      GetMemoByName(sTabControl1, 'conf' + md5(FormMain.topik_from)).Hint := FormMain.Topic;
      if (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] = FormMain.topik_from) then
        EditSubject.Text := FormMain.Topic;
    end;
    FormMain.Topic := '';
    FormMain.topik_from := '';
  end;

  if FormMain.conf <> '' then
  begin

    if ExistMemoByName(sTabControl1, 'conf' + md5(FormMain.conf)) then
    begin
      if copy(FormMain.msg, 1, 3) = '/me' then
      begin
        FormMain.msg := copy(FormMain.msg, 4, length(FormMain.msg));
        GetMemoByName(sTabControl1, 'conf' + md5(FormMain.conf)).Lines.Add('<div class="me">*<b>' + FormMain.user_nick + ':</b>' + FormMain.msg + '</div>');
      end
      else if (pos(FormAccount.EditNick.text, ' ' + FormMain.msg) > 1) or (pos(FormConfInvite.sComboBox3.text, ' ' + FormMain.msg) > 1) then
      begin
            //Генерируем цвет ника
        nick_color := copy(md5(FormMain.user_nick), 1, 6);
        nick_color := stringreplace(nick_color, 'F', '0', [rfReplaceAll, rfIgnoreCase]);

        GetMemoByName(sTabControl1, 'conf' + md5(FormMain.conf)).Lines.Add('<div class="vip">[' + FormatDateTime('h:m', now) + '] <font color="#' + nick_color + '">' + '<b>' + FormMain.user_nick + ':</b></font> ' + FormMain.msg + '</div>');
      end
      else
      begin
            //Генерируем цвет ника
        nick_color := copy(md5(FormMain.user_nick), 1, 6);
        nick_color := stringreplace(nick_color, 'F', '0', [rfReplaceAll, rfIgnoreCase]);

        GetMemoByName(sTabControl1, 'conf' + md5(FormMain.conf)).Lines.Add('<div class="' + s + '">[' + FormatDateTime('h:m', now) + '] <font color="#' + nick_color + '">' + '<b>' + FormMain.user_nick + ':</b></font> ' + FormMain.msg + '</div>');
      end;

      if sTabControl1.Tabs.Strings[sTabControl1.TabIndex] = FormMain.conf then
        chat.Text := GetMemoByName(sTabControl1, 'conf' + md5(sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).text;

    //chat.Perform(WM_VScroll, SB_BOTTOM, 0);
    end;

  end;

end;

function get_params(str: string): string;
begin
  result := copy(str, 0, pos('¦', str) - 1);
end;

function del_params(str: string): string;
begin
  delete(str, 1, pos('¦', str));
  result := str;
end;

procedure TFormConference.presenceExecute(Sender: TObject);
var
  status_total, tmp_nick: string;
  i, c, t: integer;
  present: bool;
begin
  // in presence variables -------
  // presence_from - JID
  // presence_nick - ник
  // presence_type - тип
  // presence_conf_status - статус
  // presence_conf_jid -
  // presence_conf_show

  if FormMain.presence_from <> '' then
  begin

    if ExistMemoByName(sTabControl1, 'conf' + md5(FormMain.presence_conf_jid)) then
    begin
      if FormMain.presence_conf_status <> '' then
        status_total := '[' + FormMain.presence_conf_status + '] ';
      if FormMain.presence_conf_show <> '' then
        status_total := status_total + '[' + FormMain.presence_conf_show + ']';
      if (FormMain.presence_conf_show = '') and (FormMain.presence_type <> 'unavailable') then
        status_total := status_total + '[Онлайн] ';
      if (FormMain.presence_conf_show = '') and (FormMain.presence_type = 'unavailable') then
        status_total := status_total + '[Отключен] ';

      if (FormMain.presence_conf_affiliation <> '') and (FormMain.presence_conf_affiliation <> 'none') then
        status_total := status_total + '[' + FormMain.presence_conf_affiliation + '] ';
      if (FormMain.presence_conf_role <> '') and (FormMain.presence_conf_affiliation <> 'none') then
        status_total := status_total + '[' + FormMain.presence_conf_role + '] ';

      GetMemoByName(sTabControl1, 'conf' + md5(FormMain.presence_conf_jid)).Lines.Add('<div class="conf_status">[' + FormatDateTime('h:m', now) + '] ' + FormMain.presence_nick + ' ' + status_total + '</div>');

      if sTabControl1.Tabs.Strings[sTabControl1.TabIndex] = FormMain.presence_conf_jid then
      begin
        FormConference.chat.Text := GetMemoByName(sTabControl1, 'conf' + md5(FormMain.presence_conf_jid)).text;
      end;

    end;

    if FormMain.presence_type = 'unavailable' then
    begin

      if ExistMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)) then
      begin
        c := GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.Count;
        for i := 0 to c - 1 do
        begin
          if copy(GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.Strings[i], 0, length(FormMain.presence_nick)) = FormMain.presence_nick then
          begin
            GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.Delete(i);
          end;
        end;

      end;

    end
    else
    begin

      if not ExistMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)) then
      begin
        nicks := tmemo.Create(sTabControl1);
        nicks.Parent := sTabControl1;
        nicks.Visible := false;
        nicks.ScrollBars := ssBoth;
        nicks.Name := 'nicks' + md5(FormMain.presence_conf);
        nicks.Text := FormMain.presence_nick + '¦' + FormMain.presence_conf_affiliation + '¦' + FormMain.presence_conf_role + '¦' + FormMain.presence_conf_show;
      //conferenceusers.Items.Text := nicks.Text;

      end
      else
      begin
        present := false;
        c := GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.Count;
        for i := 0 to c - 1 do
        begin
          tmp_nick := GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.Strings[i];
          if copy(tmp_nick, 0, pos('¦', tmp_nick) - 1) = FormMain.presence_nick then
          begin
            present := true;
            GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines[i] := FormMain.presence_nick + '¦' + FormMain.presence_conf_affiliation + '¦' + FormMain.presence_conf_role + '¦' + FormMain.presence_conf_show;
          end;
        end;

        if not present then
          GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.insert(0, FormMain.presence_nick + '¦' + FormMain.presence_conf_affiliation + '¦' + FormMain.presence_conf_role + '¦' + FormMain.presence_conf_show);

        for t := 0 to GetMemoByName(sTabControl1, 'nicks' + md5(FormMain.presence_conf)).Lines.Count - 1 do
        begin
//       showmessage (GetMemoByName(sTabControl1, 'nicks'+md5 (FormMain.presence_conf)).Lines.Strings[t]);
        end;


      //Обновление списка юзеров в конфе 2
      //ActionListMain.Actions[10].Execute;
      end;

    end; //end presence_type check

  end;

    //showmessage (GetMemoByName(sTabControl1, 'nicks'+md5 (FormMain.presence_conf)).text);
    //Обновление списка юзеров в конфе
  try
    if (sTabControl1.Tabs.Count > 0) and (sTabControl1.TabIndex <> -1) then
      ActionListMain.Actions[10].Execute;
  finally
  end;

  FormMain.presence_incom_flag := false;
end;

procedure TFormConference.sButton1Click(Sender: TObject);
begin
  if send.Text <> '' then
  begin
    if FormConference.sTabControl1.Tabs.Count >= 1 then
      ActionListMain.Actions[3].Execute;
  end;
end;

procedure TFormConference.NickClicked(Sender: TObject);
var
  menuItem: TMenuItem;
  p: tpoint;
begin
  menuItem := TMenuItem(Sender);
  send.Lines.Text := Format('%s%s: ', [send.Lines.Text, menuItem.Caption]);

//перемещаем курсор в конец строки
  p.X := length(send.Text);
  p.y := send.Lines.Count;
  send.CaretPos := p;
  send.SetFocus;
  menuItem.Free;
end;

procedure TFormConference.ConfClose(Sender: TObject);
var
  menuItem: TMenuItem;
  conf: string;
  i, n: integer;
begin
  menuItem := TMenuItem(Sender);
  conf := Format('%s', [menuItem.Caption]);
  if conf <> '' then
  begin

   //Удаляем вкладку
    for i := 0 to sTabControl1.Tabs.Count - 1 do
    begin
      if sTabControl1.Tabs.Strings[i] = conf then
      begin

        if sTabControl1.TabIndex <> -1 then
        begin
          if sTabControl1.Tabs.Strings[i] = sTabControl1.Tabs.Strings[sTabControl1.TabIndex] then
          begin
            chat.Lines.Add('<div class="status">Отключен</div>');
            sTabControl1.Tabs.Delete(i);
            sSpeedButton7.Click;
            EditSubject.Clear;
            conferenceusers.Clear;
          end
          else
          begin
            sTabControl1.Tabs.Delete(i);
          end;

        end
        else
          sTabControl1.Tabs.Delete(i);

        break;
      end;
    end;

        //Поиск ника в массиве конф
    for n := 0 to high(FormMain.forclose_confs_arr) do
    begin
      if FormMain.forclose_confs_arr[n, 0] = conf then
      begin
        FormMain.JabberClient.SendData('<presence type="unavailable" to="' + conf + '/' + FormMain.forclose_confs_arr[n, 1] + '" />');
        break;
      end;
    end;

  //Уничтожение memo конфы
    if ExistMemoByName(sTabControl1, 'conf' + md5(conf)) then
      GetMemoByName(sTabControl1, 'conf' + md5(conf)).Destroy;

  end;

end;

procedure TFormConference.ConfClose2(conf: string);
var
  i, n: integer;
begin

  if conf <> '' then
  begin

   //Удаляем вкладку
    for i := 0 to sTabControl1.Tabs.Count - 1 do
    begin
      if sTabControl1.Tabs.Strings[i] = conf then
      begin
        if sTabControl1.Tabs.Strings[i] = sTabControl1.Tabs.Strings[sTabControl1.TabIndex] then
        begin
          chat.Lines.Add('<div class="status">Отключен</div>');
          sTabControl1.Tabs.Delete(i);
          sSpeedButton7.Click;
          EditSubject.Clear;
          conferenceusers.Clear;
        end
        else
        begin
          sTabControl1.Tabs.Delete(i);
        end;

        break;
      end;
    end;

        //Поиск ника в массиве конф
    for n := 0 to high(FormMain.forclose_confs_arr) do
    begin
      if FormMain.forclose_confs_arr[n, 0] = conf then
      begin
        FormMain.JabberClient.SendData('<presence type="unavailable" to="' + conf + '/' + FormMain.forclose_confs_arr[n, 1] + '" />');
        break;
      end;
    end;

  //Уничтожение memo конфы
    if ExistMemoByName(sTabControl1, 'conf' + md5(conf)) then
      GetMemoByName(sTabControl1, 'conf' + md5(conf)).Destroy;

  end;

end;

procedure TFormConference.niks_listExecute(Sender: TObject);
var
  n_menu: Tmenuitem;
  i: integer;
begin

  nicknames.Items.Clear;
  for i := 0 to conferenceusers.Items.Count - 1 do
  begin
    n_menu := Tmenuitem.Create(send);
    n_menu.Caption := conferenceusers.Items[i].Caption;
    n_menu.OnClick := NickClicked;
    nicknames.Items.Insert(0, n_menu);
  end;

  nicknames.Popup(FormConference.left + 20, FormConference.Top + FormConference.height - 90);
end;

procedure TFormConference.sendChange(Sender: TObject);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.sendClick(Sender: TObject);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.sendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (enter_off = false) then
    ActionListMain.Actions[3].Execute
  else
    enter_off := false;

  if (Key = VK_F1) then
  begin
    enter_off := true;
    Key := 0;
    ActionListMain.Actions[7].Execute;
  end;

  if (Key = VK_F2) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton9.Click;
  end;

  if (Key = VK_F3) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton5.Click;
  end;

  if (Key = VK_F4) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton6.Click;
  end;

  if (Key = VK_F5) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton4.Click;
  end;

  if (Key = VK_F6) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton3.Click;
  end;

  if (Key = VK_F7) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton7.Click;
  end;

  if (Key = VK_F8) then
  begin
    enter_off := true;
    Key := 0;
    sSpeedButton10.Click;
  end;

end;

procedure TFormConference.sendMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.send_msgExecute(Sender: TObject);
begin
  FormMain.JabberClient.SendMessage(sTabControl1.Tabs.Strings[sTabControl1.TabIndex], 'groupchat', send.Text);
  send.Clear;
end;

procedure TFormConference.sPageControl1Change(Sender: TObject);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.sPageControl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.sSpeedButton10Click(Sender: TObject);
var
  Response: string;
  FormData: TIdMultiPartFormDataStream;
  S, E: integer;
  link, hostlink: string;
begin
  if OpenPictureDialog1.Execute then
  begin

    if (FileExists(OpenPictureDialog1.FileName) = False) then
    begin
      MessageBox(0, 'Файл(ы) не выбран(ы), выберете файл..!!! ', 'Ошибка', MB_ICONHAND);
      Exit;
    end
    else
    begin
      FormData := TIdMultiPartFormDataStream.Create;
      try
        FormData.AddFormField('upload', 'yes');
        FormData.AddFormField('upload', 'yes');
        FormData.AddFile('F', OpenPictureDialog1.FileName, 'image/jpeg');
        FormData.AddFormField('URLF', '');
        FormData.AddFormField('O', 'yes');
        FormData.AddFormField('M', '640');
        FormData.AddFormField('JQ', '85');
        FormData.AddFormField('J', 'yes');
        FormData.AddFormField('IM', '7');
        FormData.AddFormField('VM', '180');
        FormData.AddFormField('R', '0');
        FormData.AddFormField('VE', 'yes');
        FormData.AddFormField('V', 'zoom');
        FormData.AddFormField('X', '');
        FormData.AddFormField('FS', '');
        IdHTTP1.HandleRedirects := True;
        Response := idHTTP1.Post('http://www.radikal.ru/action.aspx', FormData);
      //[url=http://www.radikal.ru][img]http://s48.radikal.ru/i121/1007/e2/ea464811add5.jpg[/img][/url]
        S := pos('[url=http://www.radikal.ru][img]', Response) + Length('[url=http://www.radikal.ru][img]');
        ;
        E := pos('[/img][/url]', Response);
        link := Copy(Response, S, E - S);
        if link <> '' then
        begin
          hostlink := copy(link, 7, length(link));
          chat.Lines.Add('<div class="trumb">Успешно загружено: <br /><a target="_blank" href="' + link + '"><img src="http://zokran.co.cc/resize/150/' + hostlink + '" alt="" border="0"></a>' + '<br />Нажмите "Отправить" что бы закончить отправку фото.</div>');
          send.Text := send.Text + ' ' + link;
        end
        else
          MessageBox(0, 'Не удалось загрузить файл :( Внимание, файл не должен превышать более 10 Мб и быть формата JPG', 'Ошибка', MB_ICONHAND);

      finally
        FormData.Free;
      end;
    end;
  end;

end;

procedure TFormConference.sSpeedButton1Click(Sender: TObject);
begin
  ActionListMain.Actions[7].Execute;
end;

procedure TFormConference.sSpeedButton2Click(Sender: TObject);
var
  i: integer;
begin
  if (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and FormMain.JabberClient.Connected then
  begin
    randomize;
    i := random(777);
    FormMain.JabberClient.SendData('<message type="groupchat" id="' + inttostr(i) + '" to="' + sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '">' + '<subject>' + EditSubject.text + '</subject><body>/me изменил тему на: ' + EditSubject.text + '</body></message>');
  end;
end;

procedure TFormConference.sSpeedButton3Click(Sender: TObject);
begin
  try
    WebBrowser1.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_PROMPTUSER);
  except
  end;
end;

procedure TFormConference.sSpeedButton4Click(Sender: TObject);
begin
  try
    WebBrowser1.ExecWB(OLECMDID_FIND, OLECMDEXECOPT_PROMPTUSER);
  except
  end;
end;

procedure TFormConference.sSpeedButton5Click(Sender: TObject);
begin
  try
    WebBrowser1.ExecWB(OLECMDID_COPY, OLECMDEXECOPT_PROMPTUSER);
  except
  end;
end;

procedure TFormConference.sSpeedButton6Click(Sender: TObject);
var
  f: TextFile;
begin
  SaveDialog1.FileName := sTabControl1.Tabs.Strings[sTabControl1.TabIndex] + '_.html';
  if SaveDialog1.Execute then
  begin

    if savedialog1.FileName <> '' then
    begin
      AssignFile(f, savedialog1.FileName);
      Rewrite(f);
      Write(f, chat.Text);
      CloseFile(f);
    end;

  end;

end;

procedure TFormConference.sSpeedButton7Click(Sender: TObject);
begin
  chat.Clear;
  ActionListMain.Actions[9].Execute;
end;

procedure TFormConference.sSpeedButton8Click(Sender: TObject);
begin
  ActionListMain.Actions[8].Execute;
end;

procedure TFormConference.sSpeedButton9Click(Sender: TObject);
var
  p: tpoint;
begin
  send.Text := '/me ' + send.Text;

//перемещаем курсор в конец строки
  p.X := length(send.Text);
  p.y := send.Lines.Count;
  send.CaretPos := p;
  send.SetFocus;
end;

procedure TFormConference.sTabControl1Change(Sender: TObject);
begin
  body_loaded := false;
  chat.Tag := 1;
  chat.Text := GetMemoByName(sTabControl1, 'conf' + md5(sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).text;
//conferenceusers.Items := GetMemoByName(sTabControl1, 'nicks'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Lines;
//Обновление списка юзеров
  ActionListMain.Actions[10].Execute;

  EditSubject.Text := GetMemoByName(sTabControl1, 'conf' + md5(sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Hint;
end;

procedure TFormConference.tray_flashExecute(Sender: TObject);
begin
  FormMain.TrayIcon.Animate := false;
  FormMain.TrayIcon.IconIndex := 0;
end;

procedure TFormConference.update_users_listExecute(Sender: TObject);
var
  u, GID: integer;
  itm: tlistitem;
  tmp_str, nick_end_options: string;
begin

  conferenceusers.Items.Clear;
  for u := 0 to GetMemoByName(sTabControl1, 'nicks' + md5(sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Lines.Count - 1 do
  begin
    nick_end_options := GetMemoByName(sTabControl1, 'nicks' + md5(sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Lines.Strings[u];

    if get_params(nick_end_options) <> '' then
    begin
      itm := conferenceusers.Items.Add;
        //Присвоить ник
      itm.Caption := get_params(nick_end_options);
        //Удаляем ник
      nick_end_options := del_params(nick_end_options);
        //Берем affiliation
      tmp_str := get_params(nick_end_options);

        //Проверяем и присваеваем тип прав пользователя
      GID := 777;
      if tmp_str = 'none' then
        GID := 5;
      if tmp_str = 'owner' then
        GID := 0;
      if tmp_str = 'admin' then
        GID := 1;
      if tmp_str = 'member' then
        GID := 3;

        //Удаляем affiliation
      nick_end_options := del_params(nick_end_options);

        //Берем role
      tmp_str := get_params(nick_end_options);
      if (GID <> 3) and (tmp_str = 'participant') then
        GID := 4;
      if (GID = 5) and (tmp_str = 'moderator') then
        GID := 2;
      if tmp_str = 'visitor' then
        GID := 5;
      itm.GroupID := GID;

        //Удаляем affiliation, получаем show status, устанавливаем соответствующую иконку
        //соответственно статусу
      nick_end_options := del_params(nick_end_options);
      if (nick_end_options = '') or (nick_end_options = 'online') or (nick_end_options = 'avaliable') then
        itm.ImageIndex := 0;
      if nick_end_options = 'chat' then
        itm.ImageIndex := 1;
      if nick_end_options = 'away' then
        itm.ImageIndex := 2;
      if (nick_end_options = 'na') or (nick_end_options = 'xa') then
        itm.ImageIndex := 3;
      if nick_end_options = 'dnd' then
        itm.ImageIndex := 4;
      if nick_end_options = 'invisible' then
        itm.ImageIndex := 5;

    end;

  end;

end;

procedure TFormConference.conferenceusersClick(Sender: TObject);
begin
//conferenceusers.
//showmessage ();
end;

procedure TFormConference.conferenceusersDblClick(Sender: TObject);
begin
  ActionListMain.Actions[4].Execute;
end;

procedure TFormConference.conferenceusersMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ActionListMain.Actions[6].Execute;
end;

procedure TFormConference.WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
begin
  if Text <> 'about:blank' then
    send.Text := send.Text + ' ' + Text + ' ';
end;

end.

