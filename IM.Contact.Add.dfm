object FormContactAdd: TFormContactAdd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1086#1085#1090#1072#1082#1090#1072
  ClientHeight = 144
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 97
    Caption = #1053#1086#1074#1099#1081' '#1082#1086#1085#1090#1072#1082#1090
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 16
      Top = 24
      Width = 23
      Height = 13
      Caption = #1053#1080#1082':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 16
      Top = 56
      Width = 20
      Height = 13
      Caption = 'JID:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Edit1: TEdit
      Left = 56
      Top = 21
      Width = 193
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 56
      Top = 53
      Width = 193
      Height = 21
      TabOrder = 1
    end
  end
  object sButton1: TsButton
    Left = 109
    Top = 111
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton2: TsButton
    Left = 198
    Top = 111
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = sButton2Click
    SkinData.SkinSection = 'BUTTON'
  end
end
