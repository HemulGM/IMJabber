unit IM.Account;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, HGM.Button;

type
  TFormAccount = class(TForm)
    PanelBottom: TPanel;
    Label1: TLabel;
    sLabel1: TLabel;
    sLabel2: TLabel;
    sLabel3: TLabel;
    sLabel5: TLabel;
    EditNick: TEdit;
    EditLogin: TEdit;
    EditServer: TEdit;
    EditPassword: TEdit;
    EditJabberPort: TEdit;
    ButtonFlatSave: TButtonFlat;
    ButtonFlatCancel: TButtonFlat;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    PanelTop: TPanel;
    Label2: TLabel;
    Shape7: TShape;
    procedure EditPasswordChange(Sender: TObject);
    procedure ButtonFlatSaveClick(Sender: TObject);
    procedure ButtonFlatCancelClick(Sender: TObject);
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

procedure TFormAccount.ButtonFlatCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAccount.ButtonFlatSaveClick(Sender: TObject);
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

end.

