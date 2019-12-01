program HGMJabber;

{$R *.dres}

uses
  Vcl.Forms,
  Winapi.Windows,
  CryptUnit in 'CryptUnit.pas',
  IM.About in 'IM.About.pas' {FormAbout},
  IM.Account.Card in 'IM.Account.Card.pas' {FormAccountCard},
  IM.Account in 'IM.Account.pas' {FormAccount},
  IM.ChatRoom in 'IM.ChatRoom.pas' {FormChatRoom},
  IM.Classes in 'IM.Classes.pas',
  IM.Conference.Invite in 'IM.Conference.Invite.pas' {FormConfInvite},
  IM.Conference in 'IM.Conference.pas' {FormConference},
  IM.Config in 'IM.Config.pas' {FormConfig},
  IM.Contact.Add in 'IM.Contact.Add.pas' {FormContactAdd},
  IM.Core in 'IM.Core.pas',
  IM.Form.Welcome in 'IM.Form.Welcome.pas' {FormWelcome},
  IM.Main in 'IM.Main.pas' {FormMain},
  IM.Roster in 'IM.Roster.pas' {FormRosterList},
  IM.Tool.Captcha in 'IM.Tool.Captcha.pas' {FormCaptcha},
  IM.Tool.Console in 'IM.Tool.Console.pas' {FormConsole},
  MD5Hash in 'MD5Hash.pas',
  GmXml in '..\HGMJabberClient\GmXml.pas',
  Jabber.Actions in '..\HGMJabberClient\Jabber.Actions.pas',
  Jabber in '..\HGMJabberClient\Jabber.pas',
  Jabber.Types in '..\HGMJabberClient\Jabber.Types.pas',
  VCLFlickerReduce in '..\#Fork\VCLFlickerReduce\VCLFlickerReduce.pas';

{$R *.res}

var
  MutexHandle: THandle;
  MutexName: string = 'HGMJabber Client';

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
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.Title := 'HGMJabber';
  Core := TImCore.Create(Application);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormConsole, FormConsole);
  FormWelcome := TFormWelcome.Create(FormMain);
  FormWelcome.Parent := FormMain.PanelClient;
  FormWelcome.Show;
  FormMain.Start;
  Application.Run;
  CloseHandle(MutexHandle);
end.

