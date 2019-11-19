object FormConfInvite: TFormConfInvite
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076' '#1074' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1102
  ClientHeight = 471
  ClientWidth = 451
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxList: TGroupBox
    Left = 8
    Top = 8
    Width = 435
    Height = 455
    Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080' '#1089#1077#1088#1074#1077#1088#1072
    TabOrder = 0
    object LabelConfs: TLabel
      Left = 16
      Top = 45
      Width = 155
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1081' '#1089#1077#1088#1074#1077#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 21
      Width = 41
      Height = 13
      Caption = #1057#1077#1088#1074#1077#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 352
      Width = 47
      Height = 13
      Caption = #1050#1086#1084#1085#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 267
      Top = 352
      Width = 23
      Height = 13
      Caption = #1048#1084#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 249
      Top = 379
      Width = 41
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object sLabel2: TLabel
      Left = 40
      Top = 379
      Width = 23
      Height = 13
      Caption = #1053#1080#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ButtonReloadList: TButton
      Left = 345
      Top = 303
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = ButtonReloadListClick
    end
    object ListViewConfs: TListView
      Left = 16
      Top = 64
      Width = 404
      Height = 233
      Columns = <
        item
          Caption = #1050#1086#1085#1092#1077#1088#1077#1085#1094#1080#1103
          Width = 200
        end
        item
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 200
        end>
      ReadOnly = True
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = ListViewConfsDblClick
    end
    object ProgressBarLoad: TProgressBar
      Left = 16
      Top = 307
      Width = 323
      Height = 17
      TabOrder = 2
    end
    object EditServer: TEdit
      Left = 63
      Top = 18
      Width = 357
      Height = 21
      TabOrder = 3
    end
    object ButtonEnter: TButton
      Left = 264
      Top = 412
      Width = 75
      Height = 25
      Caption = #1042#1086#1081#1090#1080
      TabOrder = 4
      OnClick = ButtonEnterClick
    end
    object ButtonClose: TButton
      Left = 345
      Top = 412
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 5
      OnClick = ButtonCloseClick
    end
    object EditRoom: TEdit
      Left = 69
      Top = 349
      Width = 164
      Height = 21
      TabOrder = 6
    end
    object EditLogin: TEdit
      Left = 296
      Top = 349
      Width = 124
      Height = 21
      TabOrder = 7
    end
    object EditPass: TEdit
      Left = 296
      Top = 376
      Width = 124
      Height = 21
      TabOrder = 8
    end
    object ComboBoxNick: TComboBox
      Left = 69
      Top = 376
      Width = 164
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
  end
end
