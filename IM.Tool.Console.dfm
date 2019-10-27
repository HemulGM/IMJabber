object FormConsole: TFormConsole
  Left = 0
  Top = 0
  Caption = 'XML Console'
  ClientHeight = 385
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 295
    Width = 474
    Height = 90
    Align = alBottom
    BevelOuter = bvNone
    Color = 12507635
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      474
      90)
    object sLabel1: TsLabel
      Left = 17
      Top = 9
      Width = 23
      Height = 13
      Caption = 'XML:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label1: TLabel
      Left = 90
      Top = 65
      Width = 211
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1040#1074#1090#1086'-'#1086#1095#1080#1089#1090#1082#1072' '#1087#1086#1089#1083#1077':                      '#1079#1085#1072#1082#1086#1074'.'
      ExplicitLeft = 321
    end
    object sSpeedButton1: TsSpeedButton
      Left = 300
      Top = 62
      Width = 75
      Height = 23
      Anchors = [akTop, akRight]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      ExplicitLeft = 531
    end
    object sButton1: TsButton
      Left = 380
      Top = 5
      Width = 88
      Height = 80
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object Memo1: TMemo
      Left = 46
      Top = 6
      Width = 329
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object SpinEdit1: TSpinEdit
      Left = 201
      Top = 62
      Width = 57
      Height = 22
      Anchors = [akTop, akRight]
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 5000
    end
  end
  object RichEditConsole: TRichEdit
    Left = 0
    Top = 0
    Width = 474
    Height = 295
    Align = alClient
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Zoom = 100
    OnChange = RichEditConsoleChange
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 184
    Top = 56
  end
end
