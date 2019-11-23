object FormContactAdd: TFormContactAdd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1086#1085#1090#1072#1082#1090#1072
  ClientHeight = 344
  ClientWidth = 322
  Color = 2760985
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object sLabel1: TLabel
    Left = 32
    Top = 76
    Width = 26
    Height = 16
    Caption = #1053#1080#1082':'
    Transparent = True
  end
  object sLabel2: TLabel
    Left = 32
    Top = 24
    Width = 22
    Height = 16
    Caption = 'JID:'
    Transparent = True
  end
  object Label1: TLabel
    Left = 32
    Top = 135
    Width = 48
    Height = 16
    Caption = #1043#1088#1091#1087#1087#1099':'
    Transparent = True
  end
  object Shape1: TShape
    Left = 32
    Top = 72
    Width = 257
    Height = 1
    Brush.Color = 4078653
    Pen.Color = 4078653
  end
  object Shape2: TShape
    Left = 32
    Top = 128
    Width = 257
    Height = 1
    Brush.Color = 4078653
    Pen.Color = 4078653
  end
  object EditNick: TEdit
    Left = 32
    Top = 98
    Width = 257
    Height = 26
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 3
    BorderStyle = bsNone
    Color = 2760985
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = #1053#1080#1082
  end
  object EditJID: TEdit
    Left = 32
    Top = 46
    Width = 257
    Height = 26
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 3
    BorderStyle = bsNone
    Color = 2760985
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = 'JID'
  end
  object ButtonFlatOK: TButtonFlat
    Left = 193
    Top = 296
    Width = 96
    Height = 35
    Cursor = crDefault
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
  end
  object ButtonFlatCancel: TButtonFlat
    Left = 107
    Top = 296
    Width = 80
    Height = 35
    Cursor = crDefault
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
  end
  object TableExGroups: TTableEx
    Left = 32
    Top = 157
    Width = 257
    Height = 124
    BorderStyle = bsNone
    Color = 2760985
    DefaultRowHeight = 30
    TabOrder = 4
    OnDrawCellData = TableExGroupsDrawCellData
    ItemIndex = -1
    OnItemColClick = TableExGroupsItemColClick
    GetData = TableExGroupsGetData
    Columns = <
      item
        Caption = 'Check'
        Width = 30
        MinWidth = 30
      end
      item
        Caption = 'Name'
        Width = 227
      end>
    ItemCount = 1
    LineColor = 2760985
    LineColorXor = 2760985
    LineHotColor = 3549984
    LineSelColor = 7885355
    FontHotLine.Charset = DEFAULT_CHARSET
    FontHotLine.Color = clWhite
    FontHotLine.Height = -13
    FontHotLine.Name = 'Tahoma'
    FontHotLine.Style = []
    FontLine.Charset = DEFAULT_CHARSET
    FontLine.Color = clWhite
    FontLine.Height = -13
    FontLine.Name = 'Tahoma'
    FontLine.Style = []
    FontSelLine.Charset = DEFAULT_CHARSET
    FontSelLine.Color = clWhite
    FontSelLine.Height = -13
    FontSelLine.Name = 'Tahoma'
    FontSelLine.Style = []
    ShowColumns = False
    ColumnsFont.Charset = DEFAULT_CHARSET
    ColumnsFont.Color = 2631720
    ColumnsFont.Height = -11
    ColumnsFont.Name = 'Tahoma'
    ColumnsFont.Style = []
    CanClickToUnfocused = True
  end
end
