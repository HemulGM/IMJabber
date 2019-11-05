unit IM.Account;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel, sGroupBox, ExtCtrls, inifiles,
  sCheckBox;

type
  TFormAccount = class(TForm)
    sGroupBox1: TGroupBox;
    Label1: TLabel;
    EditNick: TEdit;
    EditLogin: TEdit;
    EditServer: TEdit;
    EditPassword: TEdit;
    sLabel1: TLabel;
    sLabel2: TLabel;
    sLabel3: TLabel;
    sLabel5: TLabel;
    EditJabberPort: TEdit;
    Panel1: TPanel;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAccount: TFormAccount;

const
  C1 = 52845;
  C2 = 22719;

implementation

uses
  IM.Main, IM.ChatRoom, IM.Config;

{$R *.dfm}

function Decode(const S: AnsiString): AnsiString;
const
  Map: array[ansiChar] of Byte = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 0, 0, 0, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0, 0, 0, 0, 0, 0, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
var
  I: LongInt;
begin
  case Length(S) of
    2:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6);
        SetLength(Result, 1);
        Move(I, Result[1], Length(Result))
      end;
    3:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12);
        SetLength(Result, 2);
        Move(I, Result[1], Length(Result))
      end;
    4:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12) + (Map[S[4]] shl 18);
        SetLength(Result, 3);
        Move(I, Result[1], Length(Result))
      end
  end
end;

function PreProcess(const S: AnsiString): AnsiString;
var
  SS: AnsiString;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Decode(Copy(SS, 1, 4));
    Delete(SS, 1, 4)
  end
end;

function InternalDecrypt(const S: AnsiString; Key: Word): AnsiString;
var
  I: Word;
  Seed: Word;
begin
  Result := S;
  Seed := Key;
  for I := 1 to Length(Result) do
  begin
    Result[I] := ansiChar(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(S[I]) + Seed) * Word(C1) + Word(C2)
  end
end;

function Decrypt(const S: AnsiString; Key: Word): AnsiString;
begin
  Result := InternalDecrypt(PreProcess(S), Key)
end;

function Encode(const S: AnsiString): AnsiString;
const
  Map: array[0..63] of Char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + 'abcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I: LongInt;
begin
  I := 0;
  Move(S[1], I, Length(S));
  case Length(S) of
    1:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64];
    2:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64];
    3:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64] + Map[(I shr 18) mod 64]
  end
end;

function PostProcess(const S: AnsiString): AnsiString;
var
  SS: AnsiString;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Encode(Copy(SS, 1, 3));
    Delete(SS, 1, 3)
  end
end;

function InternalEncrypt(const S: AnsiString; Key: Word): AnsiString;
var
  I: Word;
  Seed: Word;
begin
  Result := S;
  Seed := Key;
  for I := 1 to Length(Result) do
  begin
    Result[I] := ansiChar(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(Result[I]) + Seed) * Word(C1) + Word(C2)
  end
end;

function Encrypt(const S: AnsiString; Key: Word): AnsiString;
begin
  Result := PostProcess(InternalEncrypt(S, Key))
end;

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

procedure TFormAccount.FormCreate(Sender: TObject);
const
  my_key = 33189;
begin
  EditPassword.Text := decrypt(readini('options', 'account', 'pass'), my_key);
  EditLogin.Text := readini('options', 'account', 'jid');
  EditServer.Text := readini('options', 'account', 'server');
  EditJabberPort.Text := readini('options', 'account', 'port');
  EditNick.Text := readini('options', 'account', 'nick');

  FormMain.JabberClient.JID := EditLogin.Text;
  FormMain.JabberClient.Password := EditPassword.Text;
  FormMain.JabberClient.UserNick := EditNick.Text;
  try
    FormMain.JabberClient.JabberPort := StrToInt(EditJabberPort.Text);
  except
    FormMain.JabberClient.JabberPort := 5222;
  end;
end;

procedure TFormAccount.ButtonSaveClick(Sender: TObject);
const
  my_key = 33189;
begin
  if (EditNick.Text <> '') and (EditLogin.Text <> '') and (EditServer.Text <> '') then
  begin
    writeini('options', 'account', 'nick', EditNick.Text);
    writeini('options', 'account', 'port', EditJabberPort.Text);
    writeini('options', 'account', 'jid', EditLogin.Text);
    writeini('options', 'account', 'pass', Encrypt(EditPassword.Text, my_key));
    writeini('options', 'account', 'server', EditServer.Text);

    FormMain.JabberClient.JID := EditLogin.Text;
    FormMain.JabberClient.Password := EditPassword.Text;
    FormMain.JabberClient.UserServer := EditServer.Text;
    try
      FormMain.JabberClient.JabberPort := StrToInt(EditJabberPort.Text);
    except
      FormMain.JabberClient.JabberPort := 5222;
    end;
    Close;
    if EditNick.Text <> '' then
      FormMain.Caption := 'IMJabber - ' + readini('options', 'account', 'nick');
    ModalResult := mrOk;
  end
  else
    ShowMessage('Не все поля заполнены!');
end;

procedure TFormAccount.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

end.

