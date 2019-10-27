object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 446
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 335
    Width = 169
    Height = 74
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 169
    Height = 321
    Transparent = True
  end
  object sLabelFX1: TsLabelFX
    Left = 16
    Top = 340
    Width = 91
    Height = 21
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'C'#1072#1081#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    OnClick = sLabelFX1Click
    OnMouseMove = sLabelFX1MouseMove
    OnMouseLeave = sLabelFX1MouseLeave
    Angle = 0
    Shadow.OffsetKeeper.LeftTop = -3
    Shadow.OffsetKeeper.RightBottom = 5
  end
  object sLabelFX2: TsLabelFX
    Left = 16
    Top = 359
    Width = 70
    Height = 21
    Cursor = crHandPoint
    Caption = #1041#1083#1086#1075' '#1072#1074#1090#1086#1088#1072
    OnClick = sLabelFX2Click
    OnMouseMove = sLabelFX2MouseMove
    OnMouseLeave = sLabelFX2MouseLeave
    Angle = 0
    Shadow.OffsetKeeper.LeftTop = -3
    Shadow.OffsetKeeper.RightBottom = 5
  end
  object sLabelFX3: TsLabelFX
    Left = 15
    Top = 378
    Width = 161
    Height = 21
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'PHP CoolBot - '#13#10#1089#1072#1081#1090' jabber '#1073#1086#1090#1072
    OnClick = sLabelFX3Click
    OnMouseMove = sLabelFX3MouseMove
    OnMouseLeave = sLabelFX3MouseLeave
    Angle = 0
    Shadow.OffsetKeeper.LeftTop = -3
    Shadow.OffsetKeeper.RightBottom = 5
  end
  object sButton1: TsButton
    Left = 438
    Top = 415
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object RichEdit1: TRichEdit
    Left = 183
    Top = 8
    Width = 330
    Height = 401
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Lamp IM Version 0.3 beta'
      'Jabber '#1082#1083#1080#1077#1085#1090' '#1076#1083#1103' Windows '#1085#1072#1087#1080#1089#1072#1085#1085#1099#1081' '#1085#1072' Delphi.'
      ''
      #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080':'
      '- '#1040#1085#1080#1084#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1089#1084#1072#1081#1083#1080#1082#1080
      '- '#1055#1086#1076#1076#1077#1088#1078#1082#1072' CAPTCHA '#1092#1086#1088#1084' '#1073#1077#1079' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1073#1088#1072#1091#1079#1077#1088#1072
      '- '#1055#1077#1088#1077#1076#1072#1095#1072' '#1092#1072#1081#1083#1086#1074' ('#1074' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077')'
      '- '#1055#1077#1088#1077#1076#1072#1095#1072' '#1092#1086#1090#1086
      '- '#1055#1086#1076#1076#1077#1088#1078#1082#1072' '#1089#1082#1080#1085#1086#1074
      '- '#1047#1074#1091#1082#1080' '#1095#1072#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1081' '#1080' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1081
      '- XML '#1082#1086#1085#1089#1086#1083#1100
      '- '#1055#1088#1086#1074#1077#1088#1082#1072' '#1074#1077#1088#1089#1080#1080' '#1082#1083#1080#1077#1085#1090#1072' '#1074' '#1082#1086#1085#1090#1072#1082#1090' '#1083#1080#1089#1090#1077' '#1080' '#1074' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080
      '- '#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1079#1072#1082#1083#1072#1076#1086#1082
      '- '#1055#1086#1089#1099#1083#1072#1090#1100' '#1080' '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1087#1088#1080#1075#1083#1072#1096#1077#1085#1080#1103' '#1074' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080
      '- '#1055#1086#1076#1076#1077#1088#1078#1082#1072' VCard'
      '- '#1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
      #1048' '#1084#1085#1086#1075#1086#1077' '#1076#1088#1091#1075#1086#1077'...'
      ''
      #1050#1086#1085#1090#1072#1082#1090#1099': '
      'JID: NarKoZ@jabber.ru'
      'Conference: ukraine@conference.jabber.ru'
      'Em@il: NarKoZ@xaker.ru'
      ''
      #1045#1089#1083#1080' '#1074#1072#1084' '#1087#1086#1085#1088#1072#1074#1080#1083#1072#1089#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1072':'
      'Donate Web Money: Z476900230777 '
      ''
      #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1080' '#1087#1086' '#1091#1083#1091#1095#1096#1077#1085#1080#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
      'Conference: ukraine@conference.jabber.ru/NarKoZ'
      ''
      #1059#1076#1072#1095#1085#1086#1075#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103'!')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    WordWrap = False
    Zoom = 100
  end
end
