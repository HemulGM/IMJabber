unit IM.Conference.Invite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MD5Hash, ComCtrls, Jabber, Vcl.ExtCtrls, HGM.Button;

type
  TFormConfInvite = class(TForm)
    GroupBoxList: TPanel;
    LabelConfs: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ListViewConfs: TListView;
    ProgressBarLoad: TProgressBar;
    EditServer: TEdit;
    EditRoom: TEdit;
    EditLogin: TEdit;
    EditPass: TEdit;
    ComboBoxNick: TEdit;
    Panel1: TPanel;
    ButtonFlatOK: TButtonFlat;
    ButtonFlatCancel: TButtonFlat;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    ButtonFlatUpdate: TButtonFlat;
    procedure ListViewConfsDblClick(Sender: TObject);
    procedure ButtonFlatCancelClick(Sender: TObject);
    procedure ButtonFlatOKClick(Sender: TObject);
    procedure ButtonFlatUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Execute(Jabber: TJabberClient; var Conf, Nick: string): Boolean;
  end;

var
  FormConfInvite: TFormConfInvite;

implementation

uses
  IM.Conference, IM.Main, IM.Account, Jabber.Types;

{$R *.dfm}

procedure TFormConfInvite.ListViewConfsDblClick(Sender: TObject);
begin
  if ListViewConfs.ItemIndex >= 0 then
  begin
    EditRoom.Text := NickFromJID(ListViewConfs.Items[ListViewConfs.ItemIndex].SubItems[0]);
  end;
end;

class function TFormConfInvite.Execute(Jabber: TJabberClient; var Conf, Nick: string): Boolean;
begin
  with TFormConfInvite.Create(nil) do
  begin
    ComboBoxNick.Text := Jabber.UserNick;
    EditServer.Text := 'conference.' + Jabber.UserServer;
    EditRoom.Text := '';
    EditPass.Text := '';
    EditLogin.Text := Jabber.UserName;
    Result := ShowModal = mrOK;
    Conf := EditRoom.Text + '@' + EditServer.Text;
    Nick := ComboBoxNick.Text;
    Free;
  end;
end;

procedure TFormConfInvite.ButtonFlatUpdateClick(Sender: TObject);
var
  i: integer;
  Items: TConfList;
begin
  if FormMain.JabberClient.Online then
  begin
    ListViewConfs.Clear;
    ButtonFlatUpdate.Enabled := False;
    ProgressBarLoad.Style := pbstMarquee;
    ProgressBarLoad.Visible := True;
    Items := FormMain.JabberClient.GetListOfConference(EditServer.Text);
    if Items.Count > 0 then
    begin
      for i := 0 to Items.Count - 1 do
        with ListViewConfs.Items.Add do
        begin
          Caption := Items[i].Name;
          SubItems.Add(Items[i].JID);
        end;
    end;
    LabelConfs.Caption := 'Список конференций сервера (' + ListViewConfs.Items.Count.ToString + '):';
    Items.Free;
    ProgressBarLoad.Style := pbstNormal;
    ProgressBarLoad.Visible := False;
    ButtonFlatUpdate.Enabled := True;
  end;
end;

procedure TFormConfInvite.ButtonFlatCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormConfInvite.ButtonFlatOKClick(Sender: TObject);
begin
  if EditRoom.Text = '' then
    Exit;
  if EditServer.Text = '' then
    Exit;
  if ComboBoxNick.Text = '' then
    Exit;
  ModalResult := mrOk;
end;

end.

