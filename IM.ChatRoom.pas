unit IM.ChatRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ExtCtrls, sBevel, ComCtrls, sPageControl, sMemo,
  sPanel, Menus, OleCtrls, SHDocVw, ActnList, ImgList, Buttons, acPNG,
  sSpeedButton, MMsystem, IdTCPConnection, IdTCPClient, IdMultipartFormData,
  ExtDlgs, IdBaseComponent, IdHTTP, IniFiles, System.ImageList, System.Actions;

type
  TFormChatRoom = class(TForm)
    sPanel1: TPanel;
    sPageControl1: TPageControl;
    sTabSheet1: TTabSheet;
    sTabSheet2: TTabSheet;
    sPanel2: TPanel;
    WebBrowserDialog: TWebBrowser;
    WebBrowser2: TWebBrowser;
    ImageList1: TImageList;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    Timer1: TTimer;
    BalloonHint1: TBalloonHint;
    MemoSend: TMemo;
    ButtonSend: TButton;
    Panel1: TPanel;
    LabelNick: TLabel;
    Button1: TButton;
    procedure ButtonSendClick(Sender: TObject);
    procedure MemoSendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FFirstMessage: Boolean;
    FEnterSend: Boolean;
    procedure ProcNewMessage(Body: string);
    function CompileBody(Body: string): string;
    procedure FillSmiles;
    function PutSmiles(TextBody: string; FillType: bool): string;
  public
    procedure Reads;
    procedure NewMessage(Nick, MessageBody: string);
    procedure SwowPopupWnd(text: string);
  end;

var
  FormChatRoom: TFormChatRoom;

implementation

uses
  MSHTML, ActiveX, IM.Main, IM.Notifycation, IM.Account, MD5Hash;

{$R *.dfm}

//Функция загрузки HTML кода в TWebBrowser
procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  Mem: TStringStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    Mem := TStringStream.Create;
    try
      Mem.WriteString(HTMLCode);
      Mem.Position := 0;
      (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(Mem));
    finally
      Mem.Free;
    end;
  end;
end;

function TFormChatRoom.CompileBody(Body: string): string;
var
  Homedir, Header, Footer: string;
begin
  Homedir := ExtractFilePath(ParamStr(0));
  Header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html><head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />' + '<title>Чат</title>' + '<link rel="stylesheet" href="' + Homedir + 'skins/chat/style.css" type="text/css" />' + '</head><body onload="javascript:window.scrollTo(0,100000);">';
  Footer := '</body></html>';
  Result := Header + Body + Footer;
end;

//Функция отображения всплывающих окон
procedure TFormChatRoom.SwowPopupWnd(text: string);
var
  ActiveWnd: THandle;
begin
  FormNotify.Label1.Caption := text;
  ActiveWnd := GetActiveWindow;
  FormNotify.Left := Screen.Width - FormNotify.Width - 1;
  FormNotify.Top := Screen.Height - FormNotify.Height - 31;
  FormNotify.Show;
  SetActiveWindow(ActiveWnd);

  Timer1.Enabled := true;
end;

//Скрыть всплывающее окно
procedure HidePopupWnd;
begin
  FormNotify.Hide;
end;

procedure TFormChatRoom.Button1Click(Sender: TObject);
begin
  Hide;
end;

procedure TFormChatRoom.Button2Click(Sender: TObject);
begin
  HidePopupWnd;
end;

procedure TFormChatRoom.FillSmiles;
var
  Header, Body, EndBody, HomeDir: string;
begin
  //Текущий каталог программы
  HomeDir := ExtractFilePath(ParamStr(0));
  Header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' + '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">' + '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />' + '<link rel="stylesheet" href="' + HomeDir + 'skins/chat/style.css" type="text/css" />' + '</head><body onload="javascript:window.scrollTo(0,0);">' + '<script language="JavaScript"> function smile (a) {document.title=a;}</script>';
  EndBody := '</body></html>';
  //Парсим смайлы
  Body := PutSmiles('', False);
  WB_LoadHTML(WebBrowser2, Header + Body + EndBody);
end;

procedure TFormChatRoom.FormCreate(Sender: TObject);
begin
  FFirstMessage := True;
  FEnterSend := True;
  FillSmiles;
end;

procedure TFormChatRoom.FormShow(Sender: TObject);
begin
  MemoSend.Focused;
end;

//Функция парсинга смайлов
//flag_type - true = замена текстовых смайлов на ссылки
//flag_type - false = создание ссылок на смайлы
function TFormChatRoom.PutSmiles(TextBody: string; FillType: bool): string;
var
  HomeDir, PrevSmile: string;
  ListOfSmiles: TStringList;
  ListOfFileNames: TStringList;
  i: integer;
begin
  HomeDir := ExtractFilePath(ParamStr(0));
  ListOfSmiles := TStringList.Create;
  ListOfFileNames := TStringList.Create;

  ListOfSmiles.LoadFromFile(HomeDir + 'smiles\standart\smiles.dat');
  ListOfFileNames.LoadFromFile(HomeDir + 'smiles\standart\files.dat');

  if FillType then
  begin
    if ListOfFileNames.Count = ListOfSmiles.Count then
    begin
      for i := 0 to ListOfSmiles.Count - 1 do
      begin
        TextBody := StringReplace(TextBody, ListOfSmiles.Strings[i], '<img align="middle" src="' + HomeDir + 'smiles\standart\' + ListOfFileNames.Strings[i] + '" alt="" border="0">', [rfReplaceAll, rfIgnoreCase]);
      end;
    end;
    Result := TextBody;
  end
  else
  begin
    if ListOfFileNames.Count = ListOfSmiles.Count then
    begin
      PrevSmile := '';
      for i := 0 to ListOfSmiles.Count - 1 do
      begin
        if PrevSmile <> ListOfFileNames.Strings[i] then
          TextBody := TextBody + '<a onclick="smile(''' + ListOfSmiles.Strings[i] + ''')" href="#"><img display="block" max-width=100%" max-height="100%" src="' + HomeDir + 'smiles/standart/' + ListOfFileNames.Strings[i] + '" alt="" border="0"></a>';
        PrevSmile := ListOfFileNames.Strings[i];
      end;
    end;
    Result := TextBody;
  end;

  ListOfSmiles.Free;
  ListOfFileNames.Free;
end;

procedure TFormChatRoom.Reads;
begin
  //
end;

procedure TFormChatRoom.ButtonSendClick(Sender: TObject);
var
  JID: string;
begin
  if (MemoSend.Text <> '') and (MemoSend.Text <> ' ') then
  begin
    JID := Hint;
    FormMain.JabberClient.SendMessage(JID, 'chat', MemoSend.Text);
    ProcNewMessage('<div class="mymsg">[' + FormatDateTime('h:m', now) + ']<b> ' + FormMain.JabberClient.UserNick + ': </b>' + ToEscaping(MemoSend.Text) + '</div>');
    MemoSend.Clear;
  end;
end;

procedure TFormChatRoom.MemoSendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if FEnterSend then
      ButtonSend.Click;
  end;
end;

procedure TFormChatRoom.NewMessage(Nick, MessageBody: string);
var
  NickColor: string;
begin
  //Генерируем цвет ника
  NickColor := Copy(MD5(Nick), 1, 6);
  NickColor := StringReplace(NickColor, 'F', '0', [rfReplaceAll, rfIgnoreCase]);
  ProcNewMessage('<div class="usermsg">[' + FormatDateTime('h:m', Now) + ']<font color="#' + NickColor + '"> <b>' + Nick + ':</b></font> ' + MessageBody + '</div>');
end;

procedure TFormChatRoom.ProcNewMessage(Body: string);
var
  Range: IHTMLTxtRange;
  Document: IHTMLDocument2;
begin
  Body := FromEscaping(Body);
  //Заменяем текстовые смайлы на путь
  Body := PutSmiles(Body, True);

  if FFirstMessage then
  begin
    FFirstMessage := False;
    //Загружаем тело страницы в Веббраузер
    WB_LoadHTML(WebBrowserDialog, CompileBody(Body));
  end;
  //Загружаем построчно в браузер
  Range := ((WebBrowserDialog.Document as IHTMLDocument2).Body as IHTMLBodyElement).createTextRange;
  Range.Collapse(False);
  Range.PasteHTML(Body);

  Document := WebBrowserDialog.Document as IHTMLDocument2;
  if Assigned(Document) then
    Document.ParentWindow.ScrollBy(0, 1000000);

  if not Active then
  begin
    FormMain.TrayIcon.Animate := True;
    FormMain.PlaySound(sndMessage);
  end;
end;

procedure TFormChatRoom.sSpeedButton2Click(Sender: TObject);
begin
  FEnterSend := not FEnterSend;
  MemoSend.WantReturns := not FEnterSend;
end;

procedure TFormChatRoom.sSpeedButton5Click(Sender: TObject);
begin
  try
    WebBrowserDialog.ExecWB(OLECMDID_COPY, OLECMDEXECOPT_PROMPTUSER);
    MemoSend.Text := (WebBrowserDialog.Document as IHTMLDocument2).Body.innerHTML;
  except
  end;
end;

procedure TFormChatRoom.sSpeedButton7Click(Sender: TObject);
begin
  WB_LoadHTML(WebBrowserDialog, CompileBody('<div class="mymsg">[19:37]<b> HemulGM: </b>dfgdgdfg</div><div class="usermsg">[19:37]<b> WorcAc: </b>dfgdgdfg</div>'));
end;

procedure TFormChatRoom.Timer1Timer(Sender: TObject);
begin
  HidePopupWnd;
  timer1.Enabled := false;
end;

procedure TFormChatRoom.WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
begin
  if Text <> 'about:blank' then
    MemoSend.Text := MemoSend.Text + ' ' + Text + ' ';
end;

end.

