unit IM.Tool.Captcha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sGroupBox, OleCtrls, SHDocVw;

type
  TFormCaptcha = class(TForm)
    sGroupBox1: TsGroupBox;
    WebBrowser1: TWebBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCaptcha: TFormCaptcha;

implementation

{$R *.dfm}

end.
