unit IM.Contact.Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, HGM.Button, Vcl.ExtCtrls, Vcl.Grids,
  HGM.Controls.VirtualTable, IM.Classes;

type
  TFormContactAdd = class(TForm)
    EditNick: TEdit;
    EditJID: TEdit;
    sLabel1: TLabel;
    sLabel2: TLabel;
    ButtonFlatOK: TButtonFlat;
    ButtonFlatCancel: TButtonFlat;
    TableExGroups: TTableEx;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    PanelBottom: TPanel;
    Shape3: TShape;
    PanelTop: TPanel;
    Label2: TLabel;
    Shape4: TShape;
    procedure ButtonFlatCancelClick(Sender: TObject);
    procedure ButtonFlatOKClick(Sender: TObject);
    procedure TableExGroupsGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExGroupsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExGroupsItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
  private
    FGroups: TGroupList;
  public
    class function Execute(var JID, Nick: string; Groups: TGroupList): Boolean;
  end;

var
  FormContactAdd: TFormContactAdd;

implementation

uses
  IM.Main;

{$R *.dfm}

class function TFormContactAdd.Execute(var JID, Nick: string; Groups: TGroupList): Boolean;
begin
  with TFormContactAdd.Create(nil) do
  begin
    FGroups := Groups;
    Groups.AddTable(TableExGroups);
    Groups.UpdateTable;

    Result := ShowModal = mrOk;

    JID := EditJID.Text;
    Nick := EditNick.Text;
    Groups.UnAssignTable(TableExGroups);
    Free;
  end;
end;

procedure TFormContactAdd.TableExGroupsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if FGroups.Checked[ARow] then
    FormMain.ImageListNormal.Draw(TableExGroups.Canvas, Rect.Left + 2, Rect.Top + 2, 1, True)
  else
    FormMain.ImageListNormal.Draw(TableExGroups.Canvas, Rect.Left + 2, Rect.Top + 2, 2, True);
end;

procedure TFormContactAdd.TableExGroupsGetData(FCol, FRow: Integer; var Value: string);
begin
  case FCol of
    0:
      Value := '';
    1:
      Value := FGroups[FRow].Name;
  end;
end;

procedure TFormContactAdd.TableExGroupsItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if Index <> 0 then
    Exit;
  FGroups.Checked[TableExGroups.ItemIndex] := not FGroups.Checked[TableExGroups.ItemIndex];
end;

procedure TFormContactAdd.ButtonFlatOKClick(Sender: TObject);
begin
  if (EditJID.Text <> '') and (EditNick.Text <> '') and (Pos('@', EditJID.Text) > 0) then
  begin
    ModalResult := mrOk;
  end
  else
    ShowMessage('Поля заполнены неверно!');
end;

procedure TFormContactAdd.ButtonFlatCancelClick(Sender: TObject);
begin
  Close;
end;

end.

