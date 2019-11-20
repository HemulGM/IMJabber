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
    procedure EditPasswordChange(Sender: TObject);
  private
    FPasswordChanged: Boolean;
  public
    class function Execute(var JID, Nick, Password, Server, Port: string): Boolean;
  end;

var
  FormAccount: TFormAccount;

implementation

uses
  IM.Main, CryptUnit, IM.Core, Jabber;

{$R *.dfm}

procedure TFormAccount.ButtonSaveClick(Sender: TObject);
begin
  if (EditNick.Text <> '') and (EditLogin.Text <> '') and (EditServer.Text <> '') then
  begin
    ModalResult := mrOk;
  end
  else
    ShowMessage('Не все поля заполнены!');
end;

procedure TFormAccount.EditPasswordChange(Sender: TObject);
begin
  FPasswordChanged := True;
end;

class function TFormAccount.Execute(var JID, Nick, Password, Server, Port: string): Boolean;
begin
  with TFormAccount.Create(nil) do
  begin
    EditLogin.Text := JID;
    EditServer.Text := Server;
    EditJabberPort.Text := Port;
    EditNick.Text := Nick;
    if Password <> '' then
      EditPassword.Text := '123456789123';
    FPasswordChanged := False;
    Result := ShowModal = mrOK;

    JID := EditLogin.Text;
    Server := EditServer.Text;
    Port := EditJabberPort.Text;
    Nick := EditNick.Text;
    if FPasswordChanged then
      Password := EditPassword.Text;
    Free;
  end;
end;

procedure TFormAccount.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

end.

