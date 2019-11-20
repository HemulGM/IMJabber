object FormAccountCard: TFormAccountCard
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1051#1080#1095#1085#1072#1103' VCard'
  ClientHeight = 457
  ClientWidth = 703
  Color = 2168334
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TPanel
    Left = 0
    Top = 417
    Width = 703
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonClose: TButton
      Left = 623
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = ButtonCloseClick
    end
    object ButtonApply: TButton
      Left = 542
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = ButtonApplyClick
    end
  end
  object PageControlCard: TPageControl
    AlignWithMargins = True
    Left = 5
    Top = 28
    Width = 693
    Height = 389
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 0
    ActivePage = TabSheetGeneral
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    ExplicitTop = 33
    ExplicitHeight = 379
    object TabSheetGeneral: TTabSheet
      Caption = #1054#1073#1097#1077#1077
      TabVisible = False
      ExplicitTop = 27
      ExplicitHeight = 376
      object Label1: TLabel
        Left = 238
        Top = 51
        Width = 62
        Height = 13
        Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103':'
      end
      object Label2: TLabel
        Left = 241
        Top = 24
        Width = 59
        Height = 13
        Caption = #1055#1089#1077#1074#1076#1086#1085#1080#1084':'
      end
      object Label3: TLabel
        Left = 216
        Top = 159
        Width = 84
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 271
        Top = 186
        Width = 29
        Height = 13
        Caption = #1057#1072#1081#1090':'
      end
      object Label16: TLabel
        Left = 277
        Top = 78
        Width = 23
        Height = 13
        Caption = #1048#1084#1103':'
      end
      object Label17: TLabel
        Left = 252
        Top = 105
        Width = 48
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103':'
      end
      object Label18: TLabel
        Left = 247
        Top = 132
        Width = 53
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
      end
      object Label7: TLabel
        Left = 247
        Top = 213
        Width = 53
        Height = 13
        Caption = #1050#1086#1084#1087#1072#1085#1080#1103':'
      end
      object Label8: TLabel
        Left = 263
        Top = 240
        Width = 37
        Height = 13
        Caption = #1054#1090#1076#1077#1083':'
      end
      object Label9: TLabel
        Left = 239
        Top = 267
        Width = 61
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
      end
      object Label10: TLabel
        Left = 172
        Top = 294
        Width = 128
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1085#1099#1077' '#1092#1091#1085#1085#1082#1094#1080#1080':'
      end
      object EditFullName: TEdit
        Left = 306
        Top = 48
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
      end
      object EditNickName: TEdit
        Left = 306
        Top = 21
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
      object EditBirthDay: TEdit
        Left = 306
        Top = 156
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 2
      end
      object EditUrl: TEdit
        Left = 306
        Top = 183
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 3
      end
      object EditFirstName: TEdit
        Left = 306
        Top = 75
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 4
      end
      object EditLastName: TEdit
        Left = 306
        Top = 102
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 5
      end
      object EditMiddleName: TEdit
        Left = 306
        Top = 129
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 6
      end
      object EditOrgName: TEdit
        Left = 306
        Top = 210
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 7
      end
      object EditOrgUnit: TEdit
        Left = 306
        Top = 237
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 8
      end
      object EditTitle: TEdit
        Left = 306
        Top = 264
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 9
      end
      object EditRole: TEdit
        Left = 306
        Top = 291
        Width = 215
        Height = 24
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 10
      end
      object Panel1: TPanel
        Left = 24
        Top = 21
        Width = 150
        Height = 191
        BevelOuter = bvNone
        Color = 12224792
        ParentBackground = False
        TabOrder = 11
        object ImagePhoto: TImage
          Left = 0
          Top = 0
          Width = 150
          Height = 150
          Align = alClient
          Center = True
          Proportional = True
          ExplicitWidth = 256
          ExplicitHeight = 256
        end
        object Panel2: TPanel
          Left = 0
          Top = 150
          Width = 150
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object ButtonFlatPhotoRemove: TButtonFlat
            AlignWithMargins = True
            Left = 51
            Top = 1
            Width = 48
            Height = 39
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alLeft
            Caption = '-'
            ColorNormal = 14668740
            ColorOver = 11373924
            ColorPressed = 10451273
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            FontOver.Charset = DEFAULT_CHARSET
            FontOver.Color = clWindowText
            FontOver.Height = -13
            FontOver.Name = 'Tahoma'
            FontOver.Style = []
            FontDown.Charset = DEFAULT_CHARSET
            FontDown.Color = clWindowText
            FontDown.Height = -13
            FontDown.Name = 'Tahoma'
            FontDown.Style = []
            IgnorBounds = True
            ImageIndentLeft = 0
            RoundRectParam = 0
            ShowFocusRect = False
            TabOrder = 0
            TabStop = True
            TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
            SubTextFont.Charset = DEFAULT_CHARSET
            SubTextFont.Color = clWhite
            SubTextFont.Height = -13
            SubTextFont.Name = 'Tahoma'
            SubTextFont.Style = []
          end
          object ButtonFlatPhotoSaveAs: TButtonFlat
            AlignWithMargins = True
            Left = 101
            Top = 1
            Width = 48
            Height = 39
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alLeft
            Caption = 'C'
            ColorNormal = 14668740
            ColorOver = 11373924
            ColorPressed = 10451273
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            FontOver.Charset = DEFAULT_CHARSET
            FontOver.Color = clWindowText
            FontOver.Height = -13
            FontOver.Name = 'Tahoma'
            FontOver.Style = []
            FontDown.Charset = DEFAULT_CHARSET
            FontDown.Color = clWindowText
            FontDown.Height = -13
            FontDown.Name = 'Tahoma'
            FontDown.Style = []
            IgnorBounds = True
            ImageIndentLeft = 0
            RoundRectParam = 0
            ShowFocusRect = False
            TabOrder = 1
            TabStop = True
            TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
            SubTextFont.Charset = DEFAULT_CHARSET
            SubTextFont.Color = clWhite
            SubTextFont.Height = -13
            SubTextFont.Name = 'Tahoma'
            SubTextFont.Style = []
          end
          object ButtonFlatPhotoSet: TButtonFlat
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 48
            Height = 39
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alLeft
            Caption = '+'
            ColorNormal = 14668740
            ColorOver = 11373924
            ColorPressed = 10451273
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            FontOver.Charset = DEFAULT_CHARSET
            FontOver.Color = clWindowText
            FontOver.Height = -13
            FontOver.Name = 'Tahoma'
            FontOver.Style = []
            FontDown.Charset = DEFAULT_CHARSET
            FontDown.Color = clWindowText
            FontDown.Height = -13
            FontDown.Name = 'Tahoma'
            FontDown.Style = []
            IgnorBounds = True
            ImageIndentLeft = 0
            OnClick = ButtonFlatPhotoSetClick
            RoundRectParam = 0
            ShowFocusRect = False
            TabOrder = 2
            TabStop = True
            TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
            SubTextFont.Charset = DEFAULT_CHARSET
            SubTextFont.Color = clWhite
            SubTextFont.Height = -13
            SubTextFont.Name = 'Tahoma'
            SubTextFont.Style = []
          end
        end
      end
    end
    object TabSheetContacts: TTabSheet
      Caption = #1050#1086#1085#1090#1072#1082#1090#1099
      TabVisible = False
      ExplicitTop = 27
      ExplicitHeight = 335
      object Label4: TLabel
        Left = 16
        Top = 3
        Width = 31
        Height = 13
        Caption = #1055#1086#1095#1090#1072
      end
      object Label6: TLabel
        Left = 358
        Top = 3
        Width = 44
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object Label19: TLabel
        Left = 16
        Top = 121
        Width = 31
        Height = 13
        Caption = #1040#1076#1088#1077#1089
      end
      object TableExEmail: TTableEx
        Left = 16
        Top = 22
        Width = 313
        Height = 86
        ColumnsHeight = 25
        BorderStyle = bsNone
        Color = 15198440
        DefaultRowHeight = 20
        TabOrder = 0
        ItemIndex = -1
        GetData = TableExEmailGetData
        Columns = <
          item
            Caption = #1058#1080#1087
          end
          item
            Caption = #1040#1076#1088#1077#1089
            Width = 213
          end>
        ItemCount = 1
        LineColor = 15198440
        FontHotLine.Charset = DEFAULT_CHARSET
        FontHotLine.Color = 2631720
        FontHotLine.Height = -11
        FontHotLine.Name = 'Tahoma'
        FontHotLine.Style = []
        FontLine.Charset = DEFAULT_CHARSET
        FontLine.Color = 2631720
        FontLine.Height = -11
        FontLine.Name = 'Tahoma'
        FontLine.Style = []
        FontSelLine.Charset = DEFAULT_CHARSET
        FontSelLine.Color = clWhite
        FontSelLine.Height = -11
        FontSelLine.Name = 'Tahoma'
        FontSelLine.Style = []
        ColumnsFont.Charset = DEFAULT_CHARSET
        ColumnsFont.Color = 2631720
        ColumnsFont.Height = -11
        ColumnsFont.Name = 'Tahoma'
        ColumnsFont.Style = []
        DrawColumnBorded = False
      end
      object TableExTel: TTableEx
        Left = 358
        Top = 22
        Width = 275
        Height = 86
        ColumnsHeight = 25
        BorderStyle = bsNone
        Color = 15198440
        DefaultRowHeight = 20
        TabOrder = 1
        ItemIndex = -1
        GetData = TableExTelGetData
        Columns = <
          item
            Caption = #1058#1080#1087
          end
          item
            Caption = #1053#1086#1084#1077#1088
            Width = 175
          end>
        ItemCount = 1
        LineColor = 15198440
        FontHotLine.Charset = DEFAULT_CHARSET
        FontHotLine.Color = 2631720
        FontHotLine.Height = -11
        FontHotLine.Name = 'Tahoma'
        FontHotLine.Style = []
        FontLine.Charset = DEFAULT_CHARSET
        FontLine.Color = 2631720
        FontLine.Height = -11
        FontLine.Name = 'Tahoma'
        FontLine.Style = []
        FontSelLine.Charset = DEFAULT_CHARSET
        FontSelLine.Color = clWhite
        FontSelLine.Height = -11
        FontSelLine.Name = 'Tahoma'
        FontSelLine.Style = []
        ColumnsFont.Charset = DEFAULT_CHARSET
        ColumnsFont.Color = 2631720
        ColumnsFont.Height = -11
        ColumnsFont.Name = 'Tahoma'
        ColumnsFont.Style = []
        DrawColumnBorded = False
      end
      object TableExAddress: TTableEx
        Left = 16
        Top = 140
        Width = 617
        Height = 213
        ColumnsHeight = 25
        BorderStyle = bsNone
        Color = 15198440
        DefaultRowHeight = 20
        TabOrder = 2
        ItemIndex = -1
        GetData = TableExAddressGetData
        Columns = <
          item
            Caption = #1058#1080#1087
          end
          item
            Caption = 'EXTADD'
          end
          item
            Caption = 'STREET'
          end
          item
            Caption = 'LOCALITY'
          end
          item
            Caption = 'REGION'
            Width = 60
          end
          item
            Caption = 'PCODE'
          end
          item
            Caption = 'COUNTRY'
            Width = 60
          end>
        ItemCount = 1
        LineColor = 15198440
        FontHotLine.Charset = DEFAULT_CHARSET
        FontHotLine.Color = 2631720
        FontHotLine.Height = -11
        FontHotLine.Name = 'Tahoma'
        FontHotLine.Style = []
        FontLine.Charset = DEFAULT_CHARSET
        FontLine.Color = 2631720
        FontLine.Height = -11
        FontLine.Name = 'Tahoma'
        FontLine.Style = []
        FontSelLine.Charset = DEFAULT_CHARSET
        FontSelLine.Color = clWhite
        FontSelLine.Height = -11
        FontSelLine.Name = 'Tahoma'
        FontSelLine.Style = []
        ColumnsFont.Charset = DEFAULT_CHARSET
        ColumnsFont.Color = 2631720
        ColumnsFont.Height = -11
        ColumnsFont.Name = 'Tahoma'
        ColumnsFont.Style = []
        DrawColumnBorded = False
      end
      object ButtonFlat1: TButtonFlat
        Left = 329
        Top = 22
        Width = 23
        Height = 29
        Caption = '+'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        OnClick = ButtonFlat1Click
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 3
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat2: TButtonFlat
        Left = 329
        Top = 51
        Width = 23
        Height = 29
        Caption = '-'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 4
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat3: TButtonFlat
        Left = 329
        Top = 80
        Width = 23
        Height = 28
        Caption = 'C'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 5
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat4: TButtonFlat
        Left = 633
        Top = 22
        Width = 23
        Height = 29
        Caption = '+'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 6
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat5: TButtonFlat
        Left = 633
        Top = 51
        Width = 23
        Height = 29
        Caption = '-'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 7
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat6: TButtonFlat
        Left = 633
        Top = 80
        Width = 23
        Height = 28
        Caption = 'C'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 8
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat7: TButtonFlat
        Left = 633
        Top = 140
        Width = 23
        Height = 29
        Caption = '+'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 9
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat8: TButtonFlat
        Left = 633
        Top = 169
        Width = 23
        Height = 29
        Caption = '-'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 10
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
      object ButtonFlat9: TButtonFlat
        Left = 633
        Top = 198
        Width = 23
        Height = 28
        Caption = 'C'
        ColorNormal = 14668740
        ColorOver = 11373924
        ColorPressed = 10451273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FontOver.Charset = DEFAULT_CHARSET
        FontOver.Color = clWindowText
        FontOver.Height = -13
        FontOver.Name = 'Tahoma'
        FontOver.Style = []
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clWindowText
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = []
        IgnorBounds = True
        ImageIndentLeft = 0
        RoundRectParam = 0
        ShowFocusRect = False
        TabOrder = 11
        TabStop = True
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clWhite
        SubTextFont.Height = -13
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
      end
    end
    object TabSheetAbout: TTabSheet
      Caption = #1054#1073#1086' '#1084#1085#1077
      TabVisible = False
      ExplicitTop = 27
      ExplicitHeight = 376
      object RichEditDesc: TRichEdit
        Left = 0
        Top = 0
        Width = 685
        Height = 379
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        Zoom = 100
        ExplicitHeight = 376
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    Color = 7885355
    ParentBackground = False
    TabOrder = 2
    object ButtonFlatInfo: TButtonFlat
      Left = 162
      Top = 0
      Width = 81
      Height = 28
      Cursor = crDefault
      Align = alLeft
      Caption = #1054#1073#1086' '#1084#1085#1077
      ColorNormal = 2826519
      ColorOver = 3549984
      ColorPressed = 7885355
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWhite
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatInfoClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 0
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    object ButtonFlatContacts: TButtonFlat
      Left = 81
      Top = 0
      Width = 81
      Height = 28
      Cursor = crDefault
      Align = alLeft
      Caption = #1050#1086#1085#1090#1072#1082#1090#1099
      ColorNormal = 2826519
      ColorOver = 3549984
      ColorPressed = 7885355
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWhite
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatContactsClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 1
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      ExplicitLeft = 9
      ExplicitTop = 2
      ExplicitHeight = 39
    end
    object ButtonFlatCommon: TButtonFlat
      Left = 0
      Top = 0
      Width = 81
      Height = 28
      Cursor = crDefault
      Align = alLeft
      Caption = #1054#1073#1097#1077#1077
      ColorNormal = 2826519
      ColorOver = 3549984
      ColorPressed = 7885355
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWhite
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatCommonClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 2
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      ExplicitLeft = 9
      ExplicitTop = 2
      ExplicitHeight = 39
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bmp'
    FileName = 'vcard.bmp'
    Left = 560
    Top = 264
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = #1060#1072#1081#1083#1099' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1081' (*.png, *.gif, *.jpeg, *.jpg)'
      end
      item
        DisplayName = 'GIF (*.gif)'
        FileMask = '*.gif'
      end
      item
        DisplayName = 'PNG (*.png)'
        FileMask = '*.png'
      end
      item
        DisplayName = 'JPEG (*.jpg, *.jpeg)'
        FileMask = '*.jpg; *.jpeg'
      end
      item
        DisplayName = #1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)'
        FileMask = '*.*'
      end>
    OkButtonLabel = #1054' '#1077#1073#1072#1090#1100', '#1085#1077#1096#1105#1083
    Options = [fdoFileMustExist]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
    Left = 57
    Top = 301
  end
end
