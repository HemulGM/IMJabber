unit IM.Tool.Console;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sGroupBox, ExtCtrls, sPanel, sLabel, sEdit, sButton,
  ComCtrls, sRichEdit, Buttons, sSpeedButton, Spin;

type
  TFormConsole = class(TForm)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    sButton1: TsButton;
    Memo1: TMemo;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    sSpeedButton1: TsSpeedButton;
    Timer1: TTimer;
    RichEditConsole: TRichEdit;
    procedure RichEditConsoleChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
  public
    procedure AddLog(AText: string; AColor: TColor = clBlack);
  end;

var
  FormConsole: TFormConsole;

implementation

uses
  IM.Main;

{$R *.dfm}

procedure TFormConsole.AddLog(AText: string; AColor: TColor);
begin
  with RichEditConsole do
  begin
    SelStart := Length(Text);
    SelAttributes.Color := AColor;
    SelAttributes.Size := 9;
    SelAttributes.Name := 'Courier New';
    Lines.Add(TimeToStr(Now)+': '+AText);
  end;
end;

procedure TFormConsole.FormResize(Sender: TObject);
begin
  memo1.Width := FormConsole.Width - 150;
  sButton1.Left := FormConsole.Width - 100;
end;

procedure TFormConsole.sButton1Click(Sender: TObject);
begin
  if FormMain.JabberClient.Connected then
  begin
    FormMain.JabberClient.SendData(memo1.Text);
    Memo1.Clear;
  end;
end;

procedure TFormConsole.RichEditConsoleChange(Sender: TObject);
begin
  RichEditConsole.Perform(WM_VScroll, SB_BOTTOM, 0);
  if RichEditConsole.Lines.Capacity > SpinEdit1.Value then
    timer1.Enabled := true;
end;

procedure TFormConsole.sSpeedButton1Click(Sender: TObject);
begin
  RichEditConsole.Clear;
end;

procedure TFormConsole.Timer1Timer(Sender: TObject);
begin
  sSpeedButton1.Click;
  timer1.Enabled := false;
end;

end.

