unit IM.Form.Welcome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, HGM.Controls.Labels,
  Vcl.ExtCtrls;

type
  TFormWelcome = class(TForm)
    Label2: TLabelEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWelcome: TFormWelcome;

implementation

{$R *.dfm}

end.
