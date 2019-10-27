unit IM.About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, ComCtrls, acPNG, ExtCtrls, shellapi;

type
  TFormAbout = class(TForm)
    sButton1: TsButton;
    RichEdit1: TRichEdit;
    Image1: TImage;
    Bevel1: TBevel;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sLabelFX3: TsLabelFX;
    procedure sButton1Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sLabelFX1Click(Sender: TObject);
    procedure sLabelFX2Click(Sender: TObject);
    procedure sLabelFX3Click(Sender: TObject);
    procedure sLabelFX1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sLabelFX1MouseLeave(Sender: TObject);
    procedure sLabelFX2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sLabelFX2MouseLeave(Sender: TObject);
    procedure sLabelFX3MouseLeave(Sender: TObject);
    procedure sLabelFX3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Image1.Picture.Bitmap.FreeImage;
end;

procedure TFormAbout.sButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFormAbout.sLabel2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://coolbot.narkoz.com.ua'), '', '', SW_SHOW);
end;

procedure TFormAbout.sLabelFX1Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://lamp-im.narkoz.com.ua'), '', '', SW_SHOW);
end;

procedure TFormAbout.sLabelFX1MouseLeave(Sender: TObject);
begin
  sLabelFX1.Font.Style := [];
  sLabelFX1.Left := 45;
end;

procedure TFormAbout.sLabelFX1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  sLabelFX1.Font.Style := [fsBold];
  sLabelFX1.Left := 42;
end;

procedure TFormAbout.sLabelFX2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://narkoz.com.ua'), '', '', SW_SHOW);
end;

procedure TFormAbout.sLabelFX2MouseLeave(Sender: TObject);
begin
  sLabelFX2.Font.Style := [];
  sLabelFX2.Left := 55;
end;

procedure TFormAbout.sLabelFX2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  sLabelFX2.Font.Style := [fsBold];
  sLabelFX2.Left := 52;
end;

procedure TFormAbout.sLabelFX3Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://coolbot.narkoz.com.ua'), '', '', SW_SHOW);
end;

procedure TFormAbout.sLabelFX3MouseLeave(Sender: TObject);
begin
  sLabelFX3.Font.Style := [];
  sLabelFX3.Left := 44;
end;

procedure TFormAbout.sLabelFX3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  sLabelFX3.Font.Style := [fsBold];
  sLabelFX3.Left := 41;
end;

end.

