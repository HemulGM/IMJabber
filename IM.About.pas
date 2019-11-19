unit IM.About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, HGM.Button;

type
  TFormAbout = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ButtonFlatOK: TButtonFlat;
    procedure ButtonFlatOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure Execute();
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.ButtonFlatOKClick(Sender: TObject);
begin
  Close;
end;

class procedure TFormAbout.Execute;
begin
  with TFormAbout.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

end.

