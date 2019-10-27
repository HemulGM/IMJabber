unit IM.Contact.Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, sGroupBox;

type
  TFormContactAdd = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    sButton1: TsButton;
    sButton2: TsButton;
    procedure sButton2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContactAdd: TFormContactAdd;

implementation

uses
  IM.Main, Jabber;

{$R *.dfm}

procedure TFormContactAdd.sButton1Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (pos('@', Edit2.Text) > 0) then
  begin
    FormMain.JabberClient.AddContact(edit2.Text, edit1.Text, '');
    edit1.Text := '';
    edit2.Text := '';
    Close;
  end
  else
    ShowMessage('Поля заполнены неверно!');
end;

procedure TFormContactAdd.sButton2Click(Sender: TObject);
begin
  Close;
end;

end.

