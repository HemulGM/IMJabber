unit IM.Conference.Invite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MD5Hash, ComCtrls, Jabber;

type
  TFormConfInvite = class(TForm)
    GroupBoxList: TGroupBox;
    LabelConfs: TLabel;
    ButtonReloadList: TButton;
    ListViewConfs: TListView;
    ProgressBarLoad: TProgressBar;
    Label2: TLabel;
    EditServer: TEdit;
    ButtonEnter: TButton;
    ButtonClose: TButton;
    Label1: TLabel;
    EditRoom: TEdit;
    Label3: TLabel;
    EditLogin: TEdit;
    Label4: TLabel;
    EditPass: TEdit;
    sLabel2: TLabel;
    ComboBoxNick: TComboBox;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonEnterClick(Sender: TObject);
    procedure ButtonReloadListClick(Sender: TObject);
    procedure ListViewConfsDblClick(Sender: TObject);
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

procedure TFormConfInvite.ButtonReloadListClick(Sender: TObject);
var
  i: integer;
  Last: string;
  Items: TConfList;
  ST: Cardinal;
begin
  if FormMain.JabberClient.Online then
  begin
    ListViewConfs.Clear;
    Items := nil;
    ButtonReloadList.Enabled := False;
    ProgressBarLoad.Style := pbstMarquee;
    Last := '';
    repeat
      if not Last.IsEmpty then
      begin
        ST := GetTickCount + 100;
        while ST > GetTickCount do
          Application.ProcessMessages;
      end;
      if Assigned(Items) then
      begin
        Items.Free;
        Items := nil;
      end;
      Items := FormMain.JabberClient.GetListOfConference(EditServer.Text, Last);
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
      Last := Items.ConfLast;
    until Items.Count <= 0;
    LabelConfs.Caption := 'Список конференций сервера (' + ListViewConfs.Items.Count.ToString + '):';
    ButtonReloadList.Enabled := True;
    ProgressBarLoad.Style := pbstNormal;
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

procedure TFormConfInvite.ButtonEnterClick(Sender: TObject);
begin
  if EditRoom.Text = '' then
    Exit;
  if EditServer.Text = '' then
    Exit;
  if ComboBoxNick.Text = '' then
    Exit;
  ModalResult := mrOk;
end;

procedure TFormConfInvite.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.

