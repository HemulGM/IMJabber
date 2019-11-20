unit IM.Account;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormAccount = class(TForm)
    sGroupBox1: TGroupBox;
    Label1: TLabel;
    EditNick: TEdit;
    EditLogin: TEdit;
    EditServer: TEdit;
    EditPassword: TEdit;
    sLabel1: TLabel;
    sLabel2: TLabel;
    sLabel3: TLabel;
    sLabel5: TLabel;
    EditJabberPort: TEdit;
    Panel1: TPanel;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAccount: TFormAccount;

implementation

uses
  IM.Main, CryptUnit, IM.Core;

{$R *.dfm}

procedure TFormAccount.FormCreate(Sender: TObject);
begin
  EditPassword.Text := Decrypt(Core.Settings.GetStr('account', 'pass'), PKey);
  EditLogin.Text := Core.Settings.GetStr('account', 'jid');
  EditServer.Text := Core.Settings.GetStr('account', 'server');
  EditJabberPort.Text := Core.Settings.GetStr('account', 'port');
  EditNick.Text := Core.Settings.GetStr('account', 'nick');

  FormMain.JabberClient.JID := EditLogin.Text;
  FormMain.JabberClient.UserServer := EditServer.Text;
  FormMain.JabberClient.Password := EditPassword.Text;
  FormMain.JabberClient.UserNick := EditNick.Text;
  FormMain.JabberClient.JabberPort := StrToIntDef(EditJabberPort.Text, 5222);
end;

procedure TFormAccount.ButtonSaveClick(Sender: TObject);
begin
  if (EditNick.Text <> '') and (EditLogin.Text <> '') and (EditServer.Text <> '') then
  begin
    Core.Settings.SetStr('account', 'nick', EditNick.Text);
    Core.Settings.SetStr('account', 'port', EditJabberPort.Text);
    Core.Settings.SetStr('account', 'jid', EditLogin.Text);
    Core.Settings.SetStr('account', 'pass', Encrypt(EditPassword.Text, PKey));
    Core.Settings.SetStr('account', 'server', EditServer.Text);

    FormMain.JabberClient.JID := EditLogin.Text;
    FormMain.JabberClient.UserServer := EditServer.Text;
    FormMain.JabberClient.Password := EditPassword.Text;
    FormMain.JabberClient.UserNick := EditNick.Text;
    FormMain.JabberClient.JabberPort := StrToIntDef(EditJabberPort.Text, 5222);
    Close;
    ModalResult := mrOk;
  end
  else
    ShowMessage('Не все поля заполнены!');
end;

procedure TFormAccount.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

end.

