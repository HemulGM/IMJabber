unit IM.Tool.Console;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, HGM.Controls.SpinEdit, HGM.Button,
  Vcl.ComCtrls, Vcl.Grids, HGM.Controls.VirtualTable;

type
  TFormConsole = class(TForm)
    RichEditConsole: TRichEdit;
    PanelControl: TPanel;
    Label1: TLabel;
    sLabel1: TLabel;
    MemoXML: TMemo;
    SpinEditMaxLines: TlkSpinEdit;
    ButtonFlatSend: TButtonFlat;
    ButtonFlatClear: TButtonFlat;
    PageControl: TPageControl;
    TabSheetLog: TTabSheet;
    TabSheetXMPP: TTabSheet;
    TableExXMPPItems: TTableEx;
    RichEditXMPP: TRichEdit;
    PanelNav: TPanel;
    ButtonFlatXMPP: TButtonFlat;
    ButtonFlatLog: TButtonFlat;
    procedure ButtonFlatSendClick(Sender: TObject);
    procedure ButtonFlatClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableExXMPPItemsGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExXMPPItemsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatXMPPClick(Sender: TObject);
    procedure ButtonFlatLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    procedure AddLog(AText: string; AColor: TColor = clWhite);
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
    if Lines.Count > SpinEditMaxLines.Value then
      ButtonFlatClear.Click;
    SelStart := Length(Text);
    SelAttributes.Color := AColor;
    SelAttributes.Size := 9;
    SelAttributes.Name := 'Courier New';
    Lines.Add(TimeToStr(Now) + ': ' + AText);
    Perform(WM_VScroll, SB_BOTTOM, 0);
  end;
end;

procedure TFormConsole.ButtonFlatSendClick(Sender: TObject);
begin
  if FormMain.JabberClient.Connected then
  begin
    FormMain.JabberClient.SendData(MemoXML.Text);
    MemoXML.Clear;
  end;
end;

procedure TFormConsole.ButtonFlatXMPPClick(Sender: TObject);
begin
  PageControl.ActivePage := TabSheetXMPP;
end;

procedure TFormConsole.FormCreate(Sender: TObject);
begin
  FormMain.JabberClient.XMPPItems.AddTable(TableExXMPPItems);
end;

procedure TFormConsole.FormShow(Sender: TObject);
begin
  BringToFront;
end;

procedure TFormConsole.TableExXMPPItemsGetData(FCol, FRow: Integer; var Value: string);
begin
  Value := '';
  if FCol = 0 then
    Value := 'Пусто';
  if not FormMain.JabberClient.XMPPItems.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := TimeToStr(FormMain.JabberClient.XMPPItems[FRow].Date);
    1:
      Value := FormMain.JabberClient.XMPPItems[FRow].Data;
  end;
end;

procedure TFormConsole.TableExXMPPItemsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not FormMain.JabberClient.XMPPItems.IndexIn(Index) then
    Exit;
  RichEditXMPP.Text := FormMain.JabberClient.XMPPItems[Index].Data;
end;

procedure TFormConsole.ButtonFlatClearClick(Sender: TObject);
begin
  RichEditConsole.Clear;
end;

procedure TFormConsole.ButtonFlatLogClick(Sender: TObject);
begin
  PageControl.ActivePage := TabSheetLog;
end;

end.

