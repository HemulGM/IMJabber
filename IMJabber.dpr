program IMJabber;

{$R *.dres}

uses
  Vcl.Forms,
  Winapi.Windows,
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
  CryptUnit in 'CryptUnit.pas',
  MD5Hash in 'MD5Hash.pas',
  IM.Form.Welcome in 'IM.Form.Welcome.pas' {FormWelcome},
  GmXml in '..\HGMJabberClient\GmXml.pas',
  Jabber.Actions in '..\HGMJabberClient\Jabber.Actions.pas',
  Jabber in '..\HGMJabberClient\Jabber.pas',
  Jabber.Types in '..\HGMJabberClient\Jabber.Types.pas',
  IM.Classes in 'IM.Classes.pas',
  VCLFlickerReduce in '..\#Fork\VCLFlickerReduce\VCLFlickerReduce.pas',
  IM.Core in 'IM.Core.pas',
  IM.Roster in 'IM.Roster.pas' {FormRosterList};

{$R *.res}

var
  MutexHandle: THandle;
  MutexName: string = 'IMJabber HGM';

begin
  MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, True, PChar(MutexName));
  if MutexHandle <> 0 then
  begin
    CloseHandle(MutexHandle);
    Application.MessageBox('Можно запустить только одну копию программы IMJabber', 'Внимание!');
    Exit;
  end
  else
  begin
    MutexHandle := CreateMutex(nil, False, PChar(MutexName));
  end;
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.ShowMainForm := True;
  Application.Title := 'IMJabber';
  Core := TIMCore.Create(Application);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormConfig, FormConfig);
  Application.CreateForm(TFormConsole, FormConsole);
  Application.CreateForm(TFormConfInvite, FormConfInvite);
  Application.CreateForm(TFormNotify, FormNotify);
  Application.CreateForm(TFormAccountCard, FormAccountCard);
  Application.CreateForm(TFormContactAdd, FormContactAdd);
  Application.CreateForm(TFormCaptcha, FormCaptcha);
  Application.CreateForm(TFormRosterList, FormRosterList);
  FormWelcome := TFormWelcome.Create(FormMain);
  FormWelcome.Parent := FormMain.PanelClient;
  FormWelcome.Show;
  FormMain.Start;
  Application.Run;
  CloseHandle(MutexHandle);
end.

