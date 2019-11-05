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
  IM.Main, Jabber, Jabber.Types;

{$R *.dfm}

procedure TFormContactAdd.sButton1Click(Sender: TObject);
var Item: TRosterItem;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (pos('@', Edit2.Text) > 0) then
  begin
    Item := TRosterItem.Create;
    Item.JID := edit2.Text;
    Item.Name := edit2.Text;
    //Item.Groups := edit2.Text;
    if FormMain.JabberClient.AddContact(Item) then ShowMessage('OK');
    Item.Free;
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

