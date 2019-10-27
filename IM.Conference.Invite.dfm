object FormConfInvite: TFormConfInvite
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076' '#1074' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1102
  ClientHeight = 471
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 309
    Width = 436
    Height = 154
    Caption = #1042#1099#1073#1086#1088' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 16
      Top = 24
      Width = 73
      Height = 13
      Caption = #1050#1086#1085#1092#1077#1088#1077#1085#1094#1080#1103':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 16
      Top = 70
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
    object sComboBox1: TsComboBox
      Left = 16
      Top = 43
      Width = 404
      Height = 21
      Alignment = taLeftJustify
      BoundLabel.ParentFont = False
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = -1
      ParentFont = False
      TabOrder = 0
      Text = 'ukraine@conference.jabber.ru'
      OnChange = sComboBox1Change
    end
    object sComboBox3: TsComboBox
      Left = 16
      Top = 89
      Width = 404
      Height = 21
      Alignment = taLeftJustify
      BoundLabel.ParentFont = False
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = -1
      ParentFont = False
      TabOrder = 1
      Text = 'Lamp IM'
      OnChange = sComboBox3Change
    end
    object sButton3: TsButton
      Left = 264
      Top = 116
      Width = 75
      Height = 25
      Caption = #1042#1086#1081#1090#1080
      TabOrder = 2
      OnClick = sButton3Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton4: TsButton
      Left = 345
      Top = 116
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = sButton4Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox2: TsGroupBox
    Left = 8
    Top = 8
    Width = 436
    Height = 295
    Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080' '#1089#1077#1088#1074#1077#1088#1072
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel4: TsLabel
      Left = 16
      Top = 24
      Width = 155
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1081' '#1089#1077#1088#1074#1077#1088#1072':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sButton1: TsButton
      Left = 345
      Top = 260
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object ListView1: TListView
      Left = 16
      Top = 43
      Width = 404
      Height = 211
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
      OnClick = ListView1Click
      OnDblClick = ListView1DblClick
    end
    object sProgressBar1: TsProgressBar
      Left = 16
      Top = 264
      Width = 323
      Height = 17
      TabOrder = 2
      SkinData.SkinSection = 'GAUGE'
    end
  end
end
