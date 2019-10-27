object FormAccountCard: TFormAccountCard
  Left = 0
  Top = 0
  Caption = #1051#1080#1095#1085#1072#1103' VCard'
  ClientHeight = 425
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 385
    Width = 467
    Height = 40
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sButton3: TsButton
      Left = 169
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = sButton3Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton4: TsButton
      Left = 331
      Top = 6
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = sButton4Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton5: TsButton
      Left = 250
      Top = 6
      Width = 75
      Height = 25
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100
      TabOrder = 2
      OnClick = sButton5Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sProgressBar1: TsProgressBar
      Left = 10
      Top = 10
      Width = 92
      Height = 17
      TabOrder = 3
      Visible = False
      SkinData.SkinSection = 'GAUGE'
    end
    object sButton7: TsButton
      Left = 108
      Top = 6
      Width = 217
      Height = 25
      Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100'/'#1086#1090#1084#1077#1085#1080#1090#1100' '#1072#1074#1090#1086#1088#1080#1079#1072#1094#1080#1102'...'
      TabOrder = 4
      Visible = False
      OnClick = sButton7Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPageControl1: TsPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 461
    Height = 379
    ActivePage = sTabSheet1
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072#1103
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 62
        Height = 13
        Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103':'
      end
      object Label2: TLabel
        Left = 16
        Top = 43
        Width = 23
        Height = 13
        Caption = #1053#1080#1082':'
      end
      object Label3: TLabel
        Left = 16
        Top = 67
        Width = 55
        Height = 26
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 16
        Top = 97
        Width = 48
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085':'
      end
      object Label5: TLabel
        Left = 16
        Top = 124
        Width = 53
        Height = 13
        Caption = 'Web-'#1089#1072#1081#1090':'
      end
      object Label6: TLabel
        Left = 16
        Top = 151
        Width = 32
        Height = 13
        Caption = 'E-mail:'
      end
      object Edit1: TEdit
        Left = 90
        Top = 13
        Width = 215
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 90
        Top = 40
        Width = 215
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 90
        Top = 67
        Width = 215
        Height = 21
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 90
        Top = 94
        Width = 215
        Height = 21
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 90
        Top = 121
        Width = 215
        Height = 21
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 90
        Top = 148
        Width = 215
        Height = 21
        TabOrder = 5
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = #1056#1072#1073#1086#1090#1072
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label7: TLabel
        Left = 16
        Top = 16
        Width = 53
        Height = 13
        Caption = #1050#1086#1084#1087#1072#1085#1080#1103':'
      end
      object Label8: TLabel
        Left = 16
        Top = 43
        Width = 37
        Height = 13
        Caption = #1054#1090#1076#1077#1083':'
      end
      object Label9: TLabel
        Left = 16
        Top = 70
        Width = 61
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
      end
      object Label10: TLabel
        Left = 16
        Top = 97
        Width = 67
        Height = 13
        Caption = #1056#1086#1076' '#1079#1072#1085#1103#1090#1080#1081':'
      end
      object Edit7: TEdit
        Left = 90
        Top = 13
        Width = 237
        Height = 21
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 90
        Top = 40
        Width = 237
        Height = 21
        TabOrder = 1
      end
      object Edit9: TEdit
        Left = 90
        Top = 67
        Width = 237
        Height = 21
        TabOrder = 2
      end
      object Edit10: TEdit
        Left = 90
        Top = 94
        Width = 237
        Height = 21
        TabOrder = 3
      end
    end
    object sTabSheet3: TsTabSheet
      Caption = #1044#1086#1084
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label11: TLabel
        Left = 16
        Top = 16
        Width = 35
        Height = 13
        Caption = #1059#1083#1080#1094#1072':'
      end
      object Label12: TLabel
        Left = 16
        Top = 43
        Width = 35
        Height = 13
        Caption = #1043#1086#1088#1086#1076':'
      end
      object Label13: TLabel
        Left = 16
        Top = 70
        Width = 47
        Height = 13
        Caption = #1054#1073#1083#1072#1089#1090#1100':'
      end
      object Label14: TLabel
        Left = 16
        Top = 97
        Width = 41
        Height = 13
        Caption = #1048#1085#1076#1077#1082#1089':'
      end
      object Label15: TLabel
        Left = 16
        Top = 124
        Width = 41
        Height = 13
        Caption = #1057#1090#1088#1072#1085#1072':'
      end
      object Edit11: TEdit
        Left = 90
        Top = 13
        Width = 256
        Height = 21
        TabOrder = 0
      end
      object Edit12: TEdit
        Left = 90
        Top = 40
        Width = 256
        Height = 21
        TabOrder = 1
      end
      object Edit13: TEdit
        Left = 90
        Top = 67
        Width = 256
        Height = 21
        TabOrder = 2
      end
      object Edit14: TEdit
        Left = 90
        Top = 94
        Width = 256
        Height = 21
        TabOrder = 3
      end
      object Edit15: TEdit
        Left = 90
        Top = 121
        Width = 256
        Height = 21
        TabOrder = 4
      end
    end
    object sTabSheet4: TsTabSheet
      Caption = #1054#1073#1086' '#1084#1085#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RichEdit1: TRichEdit
        Left = 0
        Top = 0
        Width = 453
        Height = 351
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        Zoom = 100
      end
    end
    object sTabSheet5: TsTabSheet
      Caption = #1060#1086#1090#1086
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 453
        Height = 310
        Align = alClient
        AutoSize = True
        Center = True
        OnClick = Image1Click
        ExplicitLeft = 224
        ExplicitTop = 48
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object sPanel2: TsPanel
        Left = 0
        Top = 310
        Width = 453
        Height = 41
        Align = alBottom
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object sButton1: TsButton
          Left = 91
          Top = 6
          Width = 75
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 0
          OnClick = sButton1Click
          SkinData.SkinSection = 'BUTTON'
        end
        object sButton2: TsButton
          Left = 172
          Top = 6
          Width = 75
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 1
          OnClick = sButton2Click
          SkinData.SkinSection = 'BUTTON'
        end
        object sButton6: TsButton
          Left = 10
          Top = 6
          Width = 75
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 2
          OnClick = sButton6Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 216
    Top = 168
  end
  object ActionListMain: TActionList
    Left = 312
    Top = 168
    object get_vcard: TAction
      Caption = 'get_vcard'
      OnExecute = get_vcardExecute
    end
    object send_vcard: TAction
      Caption = 'send_vcard'
      OnExecute = send_vcardExecute
    end
    object vk_clear: TAction
      Caption = 'vk_clear'
      OnExecute = vk_clearExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bmp'
    FileName = 'vcard.bmp'
    Left = 144
    Top = 168
  end
end
