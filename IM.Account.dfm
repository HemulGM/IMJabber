object FormAccount: TFormAccount
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1059#1095#1077#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 248
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 283
    Height = 187
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1091#1095#1077#1090#1085#1086#1081' '#1079#1072#1087#1080#1089#1080' '
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 23
      Height = 13
      Caption = #1053#1080#1082':'
      Transparent = True
    end
    object sLabel1: TLabel
      Left = 29
      Top = 51
      Width = 34
      Height = 13
      Caption = #1051#1086#1075#1080#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object sLabel2: TLabel
      Left = 22
      Top = 124
      Width = 41
      Height = 13
      Caption = #1057#1077#1088#1074#1077#1088':'
      Transparent = True
    end
    object sLabel3: TLabel
      Left = 22
      Top = 78
      Width = 41
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object sLabel5: TLabel
      Left = 34
      Top = 151
      Width = 29
      Height = 13
      Caption = #1055#1086#1088#1090':'
      Transparent = True
    end
    object EditNick: TEdit
      Left = 69
      Top = 21
      Width = 190
      Height = 21
      TabOrder = 0
      Text = 'Lamp IM'
      TextHint = #1055#1088#1080#1084#1077#1088': Lamp-IM'
    end
    object EditLogin: TEdit
      Left = 69
      Top = 48
      Width = 190
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'lamp-IM'
      TextHint = #1055#1088#1080#1084#1077#1088': user'
    end
    object EditServer: TEdit
      Left = 69
      Top = 121
      Width = 190
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'jabber.ru'
      TextHint = #1055#1088#1080#1084#1077#1088': jabber.ru'
    end
    object EditPassword: TEdit
      Left = 69
      Top = 75
      Width = 190
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      Text = 'cegthvty'
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    end
    object EditJabberPort: TEdit
      Left = 69
      Top = 148
      Width = 190
      Height = 21
      TabOrder = 4
      Text = '5222'
      TextHint = #1055#1088#1080#1084#1077#1088': 5222'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 207
    Width = 303
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ButtonCancel: TButton
      Left = 218
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
      WordWrap = True
      OnClick = ButtonCancelClick
    end
    object ButtonSave: TButton
      Left = 137
      Top = 8
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 1
      WordWrap = True
      OnClick = ButtonSaveClick
    end
  end
end
