unit IM.Account.Card;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ExtDlgs, ActnList, Registry,
  System.Actions, Jabber.Types, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg, Vcl.Grids, HGM.Controls.VirtualTable, HGM.Button;

type
  TEmailList = TTableData<TEmail>;

  TTelList = TTableData<TTel>;

  TAdrList = TTableData<TAddress>;

  TFormAccountCard = class(TForm)
    sPanel1: TPanel;
    PageControlCard: TPageControl;
    TabSheetGeneral: TTabSheet;
    TabSheetAbout: TTabSheet;
    ButtonClose: TButton;
    ButtonApply: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    EditFullName: TEdit;
    EditNickName: TEdit;
    EditBirthDay: TEdit;
    EditUrl: TEdit;
    RichEditDesc: TRichEdit;
    SaveDialog1: TSaveDialog;
    Label16: TLabel;
    EditFirstName: TEdit;
    Label17: TLabel;
    EditLastName: TEdit;
    Label18: TLabel;
    EditMiddleName: TEdit;
    TabSheetContacts: TTabSheet;
    TableExEmail: TTableEx;
    Label4: TLabel;
    TableExTel: TTableEx;
    Label6: TLabel;
    Label19: TLabel;
    TableExAddress: TTableEx;
    ButtonFlat1: TButtonFlat;
    ButtonFlat2: TButtonFlat;
    ButtonFlat3: TButtonFlat;
    ButtonFlat4: TButtonFlat;
    ButtonFlat5: TButtonFlat;
    ButtonFlat6: TButtonFlat;
    ButtonFlat7: TButtonFlat;
    ButtonFlat8: TButtonFlat;
    ButtonFlat9: TButtonFlat;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditOrgName: TEdit;
    EditOrgUnit: TEdit;
    EditTitle: TEdit;
    EditRole: TEdit;
    Panel1: TPanel;
    ImagePhoto: TImage;
    Panel2: TPanel;
    ButtonFlatPhotoRemove: TButtonFlat;
    ButtonFlatPhotoSaveAs: TButtonFlat;
    ButtonFlatPhotoSet: TButtonFlat;
    FileOpenDialog: TFileOpenDialog;
    Panel3: TPanel;
    ButtonFlatInfo: TButtonFlat;
    ButtonFlatContacts: TButtonFlat;
    ButtonFlatCommon: TButtonFlat;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TableExEmailGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExTelGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExAddressGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlat1Click(Sender: TObject);
    procedure ButtonFlatPhotoSetClick(Sender: TObject);
    procedure ButtonFlatCommonClick(Sender: TObject);
    procedure ButtonFlatContactsClick(Sender: TObject);
    procedure ButtonFlatInfoClick(Sender: TObject);
  private
    FCard: TVCard;
    FAdr: TAdrList;
    FEmails: TEmailList;
    FTels: TTelList;
    FImageType: string;
    FImageBin: string;
    FRadio: TButtonRadioControl;
    procedure SetCard;
  public
    class function ShowCard(Card: TVCard): Boolean;
    class function EditCard(var Card: TVCard): Boolean;
    function ShowModal(var Card: TVCard): Integer; overload;
  end;

var
  FormAccountCard: TFormAccountCard;

function SetImageFromBinVal(BinVal, ImageType: string; Target: TPicture): Boolean;

implementation

uses
  IM.Main, IM.Account, System.NetEncoding, HGM.Common.Helper,
  IdHashMessageDigest, HGM.Common.Utils;

{$R *.dfm}

function SetImageFromBinVal(BinVal, ImageType: string; Target: TPicture): Boolean;
var
  ImageBytes: TBytes;
  PhotoStream: TMemoryStream;
  PNG: TPngImage;
  JPG: TJPEGImage;
  GIF: TGIFImage;
begin
  ImageBytes := TNetEncoding.Base64.DecodeStringToBytes(BinVal);
  ImageType := LowerCase(ImageType);
  PhotoStream := TMemoryStream.Create;
  try
    PhotoStream.Write(ImageBytes, Length(ImageBytes));
    PhotoStream.Position := 0;
    Result := True;
    if ImageType = 'image/png' then
    begin
      PNG := TPngImage.Create;
      PNG.LoadFromStream(PhotoStream);
      Target.Assign(PNG);
      PNG.Free;
    end
    else if (ImageType = 'image/jpg') or (ImageType = 'image/jpeg') then
    begin
      JPG := TJPEGImage.Create;
      JPG.LoadFromStream(PhotoStream);
      Target.Assign(JPG);
      JPG.Free;
    end
    else if ImageType = 'image/gif' then
    begin
      GIF := TGIFImage.Create;
      GIF.LoadFromStream(PhotoStream);
      Target.Assign(GIF);
      GIF.Free;
    end
    else
    begin
      Target.Assign(nil);
      Result := False;
    end;
  finally
    PhotoStream.Free;
  end;
end;

procedure TFormAccountCard.ButtonApplyClick(Sender: TObject);
var
  i: Integer;
begin
  FCard.FullName := EditFullName.Text;
  FCard.Name.FirstName := EditFirstName.Text;
  FCard.Name.MiddleName := EditMiddleName.Text;
  FCard.Name.LastName := EditLastName.Text;
  FCard.NickName := EditNickName.Text;
  FCard.BirthDay := StrToDate(EditBirthDay.Text);
  FCard.URL := EditUrl.Text;
  FCard.Title := EditTitle.Text;
  FCard.Role := EditRole.Text;
  FCard.Desc := RichEditDesc.Text;

  FCard.ClearTel;
  for i := 0 to FTels.Count - 1 do
    FCard.AddTel(FTels[i]);

  FCard.ClearEmail;
  for i := 0 to FEmails.Count - 1 do
    FCard.AddEmail(FEmails[i]);

  FCard.ClearAdr;
  for i := 0 to FAdr.Count - 1 do
    FCard.AddAddress(FAdr[i]);

  FCard.Organisation.Name := EditOrgName.Text;
  FCard.Organisation.OrgUnit := EditOrgUnit.Text;

  FCard.Photo.PhotoType := FImageType;
  FCard.Photo.BinVal := FImageBin;
  ModalResult := mrOk;
end;

procedure TFormAccountCard.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAccountCard.ButtonFlat1Click(Sender: TObject);
var
  Item: TEmail;
begin
  Item.Flags := [efWork, efInternet, efPref, efX400];
  Item.UserId := 'alinvip22@gmail.com';
  FEmails.Add(Item);
end;

procedure TFormAccountCard.ButtonFlatCommonClick(Sender: TObject);
begin
  FRadio.Selected := Sender as TButtonFlat;
  PageControlCard.ActivePage := TabSheetGeneral;
end;

procedure TFormAccountCard.ButtonFlatContactsClick(Sender: TObject);
begin
  FRadio.Selected := Sender as TButtonFlat;
  PageControlCard.ActivePage := TabSheetContacts;
end;

procedure TFormAccountCard.ButtonFlatInfoClick(Sender: TObject);
begin
  FRadio.Selected := Sender as TButtonFlat;
  PageControlCard.ActivePage := TabSheetAbout;
end;

procedure TFormAccountCard.ButtonFlatPhotoSetClick(Sender: TObject);
var
  FS: TFileStream;
  STR: TStringStream;
  Base64String, Ext: string;
begin
  if FileOpenDialog.Execute(Handle) then
  begin
    Ext := LowerCase(ExtractFileExt(FileOpenDialog.FileName));
    if Ext = '.png' then
      Ext := 'image/png'
    else if (Ext = '.jpg') or (Ext = '.jpeg') then
      Ext := 'image/jpeg'
    else if Ext = '.gif' then
      Ext := 'image/gif'
    else
      Ext := '';
    if Ext <> '' then
    begin

      FS := TFileStream.Create(FileOpenDialog.FileName, fmOpenRead);
      STR := TStringStream.Create;
      TNetEncoding.Base64.Encode(FS, STR);
      Base64String := STR.DataString;
      STR.Free;
      FS.Free;
      FImageBin := Base64String;
      FImageType := Ext;
      ImagePhoto.Picture.LoadFromFile(FileOpenDialog.FileName);
    end
    else
    begin
      MessageBox(Handle, 'Произошла ошибка при загрузки изображения. Выберите другое', '', MB_ICONWARNING or MB_OK);
      Exit;
    end;
  end;
end;

procedure TFormAccountCard.SetCard;
var
  i: Integer;
begin
  EditFullName.Text := FCard.FullName;
  EditFirstName.Text := FCard.Name.FirstName;
  EditMiddleName.Text := FCard.Name.MiddleName;
  EditLastName.Text := FCard.Name.LastName;
  EditNickName.Text := FCard.NickName;
  EditBirthDay.Text := DateToStr(FCard.BirthDay);
  EditUrl.Text := FCard.URL;
  EditTitle.Text := FCard.Title;
  EditRole.Text := FCard.Role;
  RichEditDesc.Text := FCard.Desc;
  EditOrgName.Text := FCard.Organisation.Name;
  EditOrgUnit.Text := FCard.Organisation.OrgUnit;

  FImageType := FCard.Photo.PhotoType;
  FImageBin := FCard.Photo.BinVal;

  FAdr.BeginUpdate;
  for i := Low(FCard.Address) to High(FCard.Address) do
    FAdr.Add(FCard.Address[i]);
  FAdr.EndUpdate;

  FEmails.BeginUpdate;
  for i := Low(FCard.EMail) to High(FCard.EMail) do
    FEmails.Add(FCard.EMail[i]);
  FEmails.EndUpdate;

  FTels.BeginUpdate;
  for i := Low(FCard.Tel) to High(FCard.Tel) do
    FTels.Add(FCard.Tel[i]);
  FTels.EndUpdate;

  SetImageFromBinVal(FImageBin, FImageType, ImagePhoto.Picture);
end;

class function TFormAccountCard.ShowCard(Card: TVCard): Boolean;
begin
  with TFormAccountCard.Create(nil) do
  begin
    FCard := Card;
    SetCard;
    ButtonApply.Visible := False;
    ShowModal;
    Result := True;
    Free;
  end;
end;

function TFormAccountCard.ShowModal(var Card: TVCard): Integer;
begin
  FCard := Card;
  SetCard;
  ButtonApply.Visible := True;
  Result := ShowModal;
  if Result = mrOK then
    Card := FCard;
end;

procedure TFormAccountCard.TableExAddressGetData(FCol, FRow: Integer; var Value: string);
begin
  if FAdr.IndexIn(FRow) then
  begin
    case FCol of
      0:
        Value := '';
      1:
        Value := FAdr[FRow].ExtAdd;
      2:
        Value := FAdr[FRow].Street;
      3:
        Value := FAdr[FRow].Locality;
      4:
        Value := FAdr[FRow].Region;
      5:
        Value := FAdr[FRow].PCode;
      6:
        Value := FAdr[FRow].Country;
    end;
  end;
end;

procedure TFormAccountCard.TableExEmailGetData(FCol, FRow: Integer; var Value: string);
begin
  if FEmails.IndexIn(FRow) then
  begin
    case FCol of
      0:
        Value := '';
      1:
        Value := FEmails[FRow].UserId;
    end;
  end;
end;

procedure TFormAccountCard.TableExTelGetData(FCol, FRow: Integer; var Value: string);
begin
  if FTels.IndexIn(FRow) then
  begin
    case FCol of
      0:
        Value := '';
      1:
        Value := FTels[FRow].Number;
    end;
  end;
end;

class function TFormAccountCard.EditCard(var Card: TVCard): Boolean;
begin
  with TFormAccountCard.Create(nil) do
  begin
    Result := ShowModal(Card) = mrOk;
    Free;
  end;
end;

procedure TFormAccountCard.FormCreate(Sender: TObject);
begin
  FRadio := TButtonRadioControl.Create($0021160E, $0078522B);
  FRadio.Items.AddRange([ButtonFlatInfo, ButtonFlatContacts, ButtonFlatCommon]);
  FRadio.Selected := ButtonFlatCommon;
  FTels := TTelList.Create(TableExTel);
  FEmails := TEmailList.Create(TableExEmail);
  FAdr := TAdrList.Create(TableExAddress);
end;

procedure TFormAccountCard.FormDestroy(Sender: TObject);
begin
  FRadio.Free;
  FTels.Free;
  FEmails.Free;
  FAdr.Free;
end;

end.

