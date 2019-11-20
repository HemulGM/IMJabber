object FormRosterList: TFormRosterList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  ClientHeight = 446
  ClientWidth = 277
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
  object TableExRoster: TTableEx
    Left = 0
    Top = 0
    Width = 277
    Height = 446
    Align = alClient
    BorderStyle = bsNone
    Color = 2826519
    DefaultRowHeight = 48
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI Emoji'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDrawCellData = TableExRosterDrawCellData
    ItemIndex = -1
    OnItemClick = TableExRosterItemClick
    Columns = <
      item
        Width = 48
        MinWidth = 48
      end
      item
        Width = 229
        MinWidth = 200
      end>
    DefaultDataDrawing = False
    ShowScrollBar = False
    CanNoSelect = False
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
end
