object FormConsole: TFormConsole
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1089#1086#1083#1100
  ClientHeight = 514
  ClientWidth = 782
  Color = 2168334
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 25
    Width = 782
    Height = 399
    ActivePage = TabSheetXMPP
    Align = alClient
    MultiLine = True
    OwnerDraw = True
    Style = tsButtons
    TabOrder = 0
    object TabSheetLog: TTabSheet
      Caption = #1051#1086#1075
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RichEditConsole: TRichEdit
        Left = 0
        Top = 0
        Width = 774
        Height = 389
        Align = alClient
        BorderStyle = bsNone
        Color = 2168334
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        Zoom = 100
      end
    end
    object TabSheetXMPP: TTabSheet
      Caption = 'XMPP'
      ImageIndex = 1
      TabVisible = False
      object TableExXMPPItems: TTableEx
        Left = 0
        Top = 0
        Width = 774
        Height = 212
        Align = alClient
        BorderStyle = bsNone
        Color = 2826519
        DefaultRowHeight = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Emoji'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ItemIndex = -1
        GetData = TableExXMPPItemsGetData
        ProcEmpty = True
        Columns = <
          item
            Width = 120
            MinWidth = 120
          end
          item
            Width = 654
            MinWidth = 200
          end>
        ItemCount = 1
        LineColor = 2826519
        LineColorXor = 2826519
        LineHotColor = 3549984
        LineSelColor = 7885355
        FontHotLine.Charset = DEFAULT_CHARSET
        FontHotLine.Color = clWhite
        FontHotLine.Height = -13
        FontHotLine.Name = 'Segoe UI Emoji'
        FontHotLine.Style = []
        FontLine.Charset = DEFAULT_CHARSET
        FontLine.Color = clWhite
        FontLine.Height = -13
        FontLine.Name = 'Segoe UI Emoji'
        FontLine.Style = []
        FontSelLine.Charset = DEFAULT_CHARSET
        FontSelLine.Color = clWhite
        FontSelLine.Height = -13
        FontSelLine.Name = 'Segoe UI Emoji'
        FontSelLine.Style = []
        ShowColumns = False
        ColumnsFont.Charset = DEFAULT_CHARSET
        ColumnsFont.Color = 2631720
        ColumnsFont.Height = -11
        ColumnsFont.Name = 'Tahoma'
        ColumnsFont.Style = []
        MouseRightClickTooClick = True
      end
      object RichEditXMPP: TRichEdit
        Left = 0
        Top = 212
        Width = 774
        Height = 177
        Align = alBottom
        BorderStyle = bsNone
        Color = 2168334
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        Zoom = 100
      end
    end
  end
  object PanelControl: TPanel
    Left = 0
    Top = 424
    Width = 782
    Height = 90
    Align = alBottom
    BevelOuter = bvNone
    Color = 2826519
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      782
      90)
    object Label1: TLabel
      Left = 40
      Top = 68
      Width = 50
      Height = 13
      Caption = #1054#1095#1080#1089#1090#1082#1072': '
      Transparent = True
    end
    object sLabel1: TLabel
      Left = 30
      Top = 6
      Width = 60
      Height = 13
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object MemoXML: TMemo
      Left = 96
      Top = 6
      Width = 587
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = 2168334
      TabOrder = 1
    end
    object SpinEditMaxLines: TlkSpinEdit
      Left = 96
      Top = 65
      Width = 57
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 2
      Value = 5000
    end
    object ButtonFlatSend: TButtonFlat
      Left = 688
      Top = 6
      Width = 88
      Height = 53
      Cursor = crDefault
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      ColorNormal = 2168334
      ColorOver = 3942426
      ColorPressed = 5519395
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
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      OnClick = ButtonFlatSendClick
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
    object ButtonFlatClear: TButtonFlat
      Left = 159
      Top = 64
      Width = 88
      Height = 23
      Cursor = crDefault
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      ColorNormal = 2168334
      ColorOver = 3942426
      ColorPressed = 5519395
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
      OnClick = ButtonFlatClearClick
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
  end
  object PanelNav: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 2826519
    ParentBackground = False
    TabOrder = 2
    object ButtonFlatXMPP: TButtonFlat
      Left = 88
      Top = 0
      Width = 159
      Height = 25
      Cursor = crDefault
      Align = alLeft
      Caption = #1054#1095#1077#1088#1077#1076#1100' '#1087#1072#1082#1077#1090#1086#1074' XMPP'
      ColorNormal = 2168334
      ColorOver = 3942426
      ColorPressed = 5519395
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
      OnClick = ButtonFlatXMPPClick
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
    object ButtonFlatLog: TButtonFlat
      Left = 0
      Top = 0
      Width = 88
      Height = 25
      Cursor = crDefault
      Align = alLeft
      Caption = #1051#1086#1075
      ColorNormal = 2168334
      ColorOver = 3942426
      ColorPressed = 5519395
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
      OnClick = ButtonFlatLogClick
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
  end
end
