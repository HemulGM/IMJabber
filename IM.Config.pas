unit IM.Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FileCtrl, inifiles;

type
  TFormConfig = class(TForm)
    sPanel1: TPanel;
    sButton1: TButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    sCheckBox1: TCheckBox;
    sCheckBox2: TCheckBox;
    sCheckBox3: TCheckBox;
    TabSheet3: TTabSheet;
    sLabel1: TLabel;
    FileListBox2: TFileListBox;
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure FileListBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfig: TFormConfig;

implementation

uses
  IM.Main;

{$R *.dfm}

function ReadIni(file_name, ASection, AString: string): string;
var
  sIniFile: TIniFile;
begin
  sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\' + file_name + '.ini');
  Result := sIniFile.ReadString(ASection, AString, '');
  sIniFile.Free;
end;

procedure WriteIni(file_name, ASection, AString, AValue: string);
var
  sIniFile: TIniFile;
begin
  sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\' + file_name + '.ini');
  sIniFile.WriteString(ASection, AString, AValue);
  sIniFile.Free;
end;

procedure TFormConfig.FileListBox2Change(Sender: TObject);
var
  dirname: string;
begin
  if FileListBox2.ItemIndex <> -1 then
  begin
    dirname := FileListBox2.Items.Strings[FileListBox2.ItemIndex];
    dirname := stringreplace(dirname, '[', '', [rfReplaceAll, rfIgnoreCase]);
    dirname := stringreplace(dirname, ']', '', [rfReplaceAll, rfIgnoreCase]);
    writeini('options', 'system', 'sounds', dirname);
  end;

end;

procedure TFormConfig.FormCreate(Sender: TObject);
var
  snd_dir: string;
  itms: integer;
begin
//Указываем папку звуковых схем
  FileListBox2.Directory := ExtractFilePath(ParamStr(0)) + '\sounds\';
//Удаляем лишние папки
  FileListBox2.Items.Delete(0);
  FileListBox2.Items.Delete(0);

//Проверка выбрана ли звуковая схема
  snd_dir := readini('options', 'system', 'sounds');
  if snd_dir = '' then
    snd_dir := 'lamp';

//Установка выбраной схемы
  for itms := 0 to FileListBox2.Items.Count - 1 do
  begin
    if FileListBox2.Items.Strings[itms] = '[' + snd_dir + ']' then
      FileListBox2.ItemIndex := itms;
  end;

  if readini('options', 'system', 'autoconnect') = '1' then
  begin
    sCheckBox1.Checked := true;
  end
  else
    sCheckBox1.Checked := false;

  if readini('options', 'system', 'show_offline') = '1' then
  begin
    sCheckBox2.Checked := true;
  end
  else
    sCheckBox2.Checked := false;

  if readini('options', 'system', 'chek_update') = '1' then
  begin
    sCheckBox3.Checked := true;
  end
  else
    sCheckBox3.Checked := false;

end;

procedure TFormConfig.sButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFormConfig.sButton2Click(Sender: TObject);
begin
//form1.sSkinManager1.SkinName
end;

procedure TFormConfig.sCheckBox1Click(Sender: TObject);
begin

  if sCheckBox1.Checked then
  begin
    writeini('options', 'system', 'autoconnect', '1');
  end
  else
  begin
    writeini('options', 'system', 'autoconnect', '0');
  end;

end;

procedure TFormConfig.sCheckBox2Click(Sender: TObject);
begin

  if sCheckBox2.Checked then
  begin
    writeini('options', 'system', 'show_offline', '1');
  end
  else
  begin
    writeini('options', 'system', 'show_offline', '0');
  end;

end;

procedure TFormConfig.sCheckBox3Click(Sender: TObject);
begin

  if sCheckBox3.Checked then
  begin
    writeini('options', 'system', 'chek_update', '1');
  end
  else
  begin
    writeini('options', 'system', 'chek_update', '0');
  end;

end;

end.

