program IMJabber;

uses
  Forms,
  windows,
  IM.Main in 'IM.Main.pas' {FormMain},
  IM.Config in 'IM.Config.pas' {FormConfig},
  IM.Account in 'IM.Account.pas' {FormAccount},
  IM.About in 'IM.About.pas' {FormAbout},
  IM.Tool.Console in 'IM.Tool.Console.pas' {FormConsole},
  IM.ChatRoom in 'IM.ChatRoom.pas' {FormChatRoom},
  IM.Conference in 'IM.Conference.pas' {FormConference},
  IM.Conference.Invite in 'IM.Conference.Invite.pas' {FormConfInvite},
  IM.Notifycation in 'IM.Notifycation.pas' {FormNotify},
  IM.Account.Card in 'IM.Account.Card.pas' {FormAccountCard},
  IM.Contact.Add in 'IM.Contact.Add.pas' {FormContactAdd},
  IM.Tool.Captcha in 'IM.Tool.Captcha.pas' {FormCaptcha},
  Base64Unit in 'Base64Unit.pas',
  MD5Hash in 'MD5Hash.pas',
  IM.Form.Welcome in 'IM.Form.Welcome.pas' {FormWelcome},
  GmXml in '..\HGMJabberClient\GmXml.pas',
  Jabber.Actions in '..\HGMJabberClient\Jabber.Actions.pas',
  Jabber in '..\HGMJabberClient\Jabber.pas',
  Jabber.Types in '..\HGMJabberClient\Jabber.Types.pas';

{$R *.res}

begin
  //Запрещение запуска 2 копии программы...
  CreateFileMapping(HWND($FFFFFFFF), nil, PAGE_READWRITE, 0, 1024, 'IMJabber HGM');
  if GetLastError <> ERROR_ALREADY_EXISTS then
  begin
    Application.Initialize;
  //Application.MainFormOnTaskbar := True;
    Application.ShowMainForm := True;
    Application.Title := 'IMJabber';
    Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormConfig, FormConfig);
  Application.CreateForm(TFormAccount, FormAccount);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormConsole, FormConsole);
  Application.CreateForm(TFormChatRoom, FormChatRoom);
  Application.CreateForm(TFormConference, FormConference);
  Application.CreateForm(TFormConfInvite, FormConfInvite);
  Application.CreateForm(TFormNotify, FormNotify);
  Application.CreateForm(TFormAccountCard, FormAccountCard);
  Application.CreateForm(TFormContactAdd, FormContactAdd);
  Application.CreateForm(TFormCaptcha, FormCaptcha);
  FormWelcome := TFormWelcome.Create(FormMain);
    FormWelcome.Parent := FormMain.PanelClient;
    FormWelcome.Show;
    Application.Run;
  end
  else
  begin
    Application.MessageBox('Можно запустить только одну копию Lamp IM!', 'Внимание!');
    Halt;
  end;
end.

