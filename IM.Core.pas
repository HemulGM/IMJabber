unit IM.Core;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Types, System.UITypes, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  Winapi.MMSystem, System.IniFiles, System.ImageList, System.Actions, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Controls, Vcl.Imaging.jpeg,
  Jabber.Types, Jabber, GmXml, MD5Hash, System.Generics.Collections,
  Vcl.Imaging.pngimage, IM.ChatRoom, IM.Classes, IM.Conference,
  HGM.Common.Settings;

type
  TIMCore = class(TComponent)
    Settings: TSettingsIni;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Core: TIMCore;

implementation

{ TIMCore }

constructor TIMCore.Create(AOwner: TComponent);
begin
  inherited;
  Settings := TSettingsIni.Create(ExtractFilePath(Application.ExeName) + '\options.ini');
end;

destructor TIMCore.Destroy;
begin
  Settings.Free;
  inherited;
end;

end.

