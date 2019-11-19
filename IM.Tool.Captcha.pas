unit IM.Tool.Captcha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sGroupBox, OleCtrls, SHDocVw;

type
  TFormCaptcha = class(TForm)
    WebBrowser: TWebBrowser;
  private
    { Private declarations }
  public
    class function Execute(URL: string): Boolean;
  end;

var
  FormCaptcha: TFormCaptcha;

implementation

{$R *.dfm}

{ TFormCaptcha }

class function TFormCaptcha.Execute(URL: string): Boolean;
begin
  with TFormCaptcha.Create(nil) do
  begin
    WebBrowser.Navigate(URL);
    ShowModal;
    Result := True;
    Free;
  end;
end;

end.
