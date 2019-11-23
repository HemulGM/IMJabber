object FormConfig: TFormConfig
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 361
  ClientWidth = 311
  Color = clBtnFace
  DoubleBuffered = True
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
  object sPanel1: TPanel
    Left = 0
    Top = 320
    Width = 311
    Height = 41
    Align = alBottom
    TabOrder = 0
    object sButton1: TButton
      Left = 230
      Top = 7
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = sButton1Click
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 305
    Height = 314
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sCheckBox1: TCheckBox
        Left = 3
        Top = 3
        Width = 182
        Height = 20
        Caption = #1055#1086#1076#1082#1083#1102#1095#1072#1090#1100#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080'  '
        TabOrder = 0
        OnClick = sCheckBox1Click
      end
      object sCheckBox2: TCheckBox
        Left = 3
        Top = 24
        Width = 215
        Height = 20
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1090#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1074' '#1088#1086#1089#1090#1077#1088#1077'  '
        TabOrder = 1
        OnClick = sCheckBox2Click
      end
      object sCheckBox3: TCheckBox
        Left = 3
        Top = 46
        Width = 144
        Height = 20
        Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103'  '
        TabOrder = 2
        OnClick = sCheckBox3Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1047#1074#1091#1082#1080
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sLabel1: TLabel
        Left = 18
        Top = 7
        Width = 165
        Height = 26
        Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1079#1074#1091#1082#1086#1074#1086#1081' '#1089#1093#1077#1084#1099' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1091#1102' '#1087#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
        WordWrap = True
      end
      object FileListBox2: TFileListBox
        Left = 18
        Top = 39
        Width = 183
        Height = 202
        FileType = [ftDirectory]
        ShowGlyphs = True
        TabOrder = 0
        OnChange = FileListBox2Change
      end
    end
  end
end
