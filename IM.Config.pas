unit IM.Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormConfig = class(TForm)
    sPanel1: TPanel;
    sButton1: TButton;
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    class function Execute(): Boolean;
  end;

var
  FormConfig: TFormConfig;

implementation

uses
  IM.Main;

{$R *.dfm}

class function TFormConfig.Execute: Boolean;
begin
  with TFormConfig.Create(nil) do
  begin
    Result := ShowModal = mrOk;
    Free;
  end;
end;

procedure TFormConfig.sButton1Click(Sender: TObject);
begin
  Close;
end;

end.

