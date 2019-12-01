object FormConfInvite: TFormConfInvite
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1042#1093#1086#1076' '#1074' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1102
  ClientHeight = 537
  ClientWidth = 439
  Color = 2826519
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Shape6: TShape
    Left = 0
    Top = 486
    Width = 439
    Height = 1
    Align = alBottom
    Brush.Color = 2169104
    Pen.Color = 2169104
    ExplicitTop = 427
    ExplicitWidth = 327
  end
  object Shape7: TShape
    Left = 0
    Top = 41
    Width = 439
    Height = 1
    Align = alTop
    Brush.Color = 2169104
    Pen.Color = 2169104
    ExplicitLeft = -32
    ExplicitTop = 82
    ExplicitWidth = 327
  end
  object GroupBoxList: TPanel
    Left = 0
    Top = 42
    Width = 439
    Height = 444
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitTop = 8
    ExplicitHeight = 456
    object LabelConfs: TLabel
      Left = 16
      Top = 58
      Width = 181
      Height = 16
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1081' '#1089#1077#1088#1074#1077#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 21
      Width = 48
      Height = 16
      Caption = #1057#1077#1088#1074#1077#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 13
      Top = 352
      Width = 54
      Height = 16
      Caption = #1050#1086#1084#1085#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 253
      Top = 352
      Width = 40
      Height = 16
      Caption = #1051#1086#1075#1080#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 246
      Top = 390
      Width = 48
      Height = 16
      Caption = #1055#1072#1088#1086#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 37
      Top = 390
      Width = 26
      Height = 16
      Caption = #1053#1080#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape1: TShape
      Left = 63
      Top = 38
      Width = 357
      Height = 1
      Brush.Color = 4078653
      Pen.Color = 4078653
    end
    object Shape2: TShape
      Left = 69
      Top = 369
      Width = 164
      Height = 1
      Brush.Color = 4078653
      Pen.Color = 4078653
    end
    object Shape3: TShape
      Left = 69
      Top = 408
      Width = 164
      Height = 1
      Brush.Color = 4078653
      Pen.Color = 4078653
    end
    object Shape4: TShape
      Left = 296
      Top = 369
      Width = 124
      Height = 1
      Brush.Color = 4078653
      Pen.Color = 4078653
    end
    object Shape5: TShape
      Left = 296
      Top = 408
      Width = 124
      Height = 1
      Brush.Color = 4078653
      Pen.Color = 4078653
    end
    object ListViewConfs: TListView
      Left = 16
      Top = 80
      Width = 404
      Height = 217
      BorderStyle = bsNone
      Color = 2169362
      Columns = <
        item
          Caption = #1050#1086#1085#1092#1077#1088#1077#1085#1094#1080#1103
          Width = 180
        end
        item
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 200
        end>
      ReadOnly = True
      ShowColumnHeaders = False
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListViewConfsDblClick
    end
    object ProgressBarLoad: TProgressBar
      Left = 16
      Top = 298
      Width = 404
      Height = 4
      TabOrder = 1
      Visible = False
    end
    object EditServer: TEdit
      Left = 63
      Top = 17
      Width = 357
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvNone
      BevelWidth = 2
      BorderStyle = bsNone
      Color = 2760985
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EditRoom: TEdit
      Left = 69
      Top = 348
      Width = 164
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvNone
      BevelWidth = 2
      BorderStyle = bsNone
      Color = 2760985
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EditLogin: TEdit
      Left = 296
      Top = 348
      Width = 124
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvNone
      BevelWidth = 2
      BorderStyle = bsNone
      Color = 2760985
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object EditPass: TEdit
      Left = 296
      Top = 386
      Width = 124
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvNone
      BevelWidth = 2
      BorderStyle = bsNone
      Color = 2760985
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object ComboBoxNick: TEdit
      Left = 69
      Top = 386
      Width = 164
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvNone
      BevelWidth = 2
      BorderStyle = bsNone
      Color = 2760985
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object ButtonFlatUpdate: TButtonFlat
      AlignWithMargins = True
      Left = 325
      Top = 310
      Width = 95
      Height = 25
      Cursor = crDefault
      Caption = #1055#1054#1051#1059#1063#1048#1058#1068
      ColorNormal = 10906674
      ColorOver = 11301432
      ColorPressed = 11761983
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWhite
      FontOver.Height = -13
      FontOver.Name = 'Segoe UI Semibold'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Segoe UI Semibold'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatUpdateClick
      RoundRectParam = 25
      Shape = stRoundRect
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
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 487
    Width = 439
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 2826519
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 467
    ExplicitWidth = 451
    object ButtonFlatOK: TButtonFlat
      AlignWithMargins = True
      Left = 339
      Top = 8
      Width = 96
      Height = 34
      Cursor = crDefault
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 8
      Align = alRight
      Caption = #1044#1054#1041#1040#1042#1048#1058#1068
      ColorNormal = 2760985
      ColorOver = 3680799
      ColorPressed = 4403489
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15905386
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = 13344113
      FontOver.Height = -13
      FontOver.Name = 'Segoe UI Semibold'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = 13344113
      FontDown.Height = -13
      FontDown.Name = 'Segoe UI Semibold'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatOKClick
      RoundRectParam = 0
      Shape = stRoundRect
      ShowFocusRect = False
      TabOrder = 0
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      ExplicitLeft = 352
      ExplicitTop = 3
      ExplicitHeight = 35
    end
    object ButtonFlatCancel: TButtonFlat
      AlignWithMargins = True
      Left = 251
      Top = 8
      Width = 80
      Height = 34
      Cursor = crDefault
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 8
      Align = alRight
      Caption = #1054#1058#1052#1045#1053#1040
      ColorNormal = 2760985
      ColorOver = 3680799
      ColorPressed = 4403489
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15905386
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = 15905386
      FontOver.Height = -13
      FontOver.Name = 'Segoe UI Semibold'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = 15905386
      FontDown.Height = -13
      FontDown.Name = 'Segoe UI Semibold'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatCancelClick
      RoundRectParam = 0
      Shape = stRoundRect
      ShowFocusRect = False
      TabOrder = 1
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      ExplicitLeft = 266
      ExplicitTop = 3
      ExplicitHeight = 35
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 2826519
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 295
    object Label6: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Width = 409
      Height = 35
      Margins.Left = 15
      Margins.Right = 15
      Align = alClient
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1075#1088#1091#1087#1087#1086#1074#1086#1075#1086' '#1095#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 221
      ExplicitHeight = 21
    end
  end
end
