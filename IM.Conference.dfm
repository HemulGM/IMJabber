object FormConference: TFormConference
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #1050#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080
  ClientHeight = 568
  ClientWidth = 922
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 631
    Top = 0
    Width = 1
    Height = 568
    Align = alRight
    Color = 1774090
    ParentColor = False
    ResizeStyle = rsUpdate
    OnCanResize = Splitter1CanResize
    ExplicitLeft = 629
  end
  object PanelClient: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 568
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelInfo: TPanel
      Left = 0
      Top = 0
      Width = 631
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      Color = 2826519
      ParentBackground = False
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 576
        Height = 55
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object LabelSubject: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 31
          Width = 566
          Height = 17
          Margins.Left = 5
          Margins.Top = 7
          Margins.Right = 5
          Margins.Bottom = 7
          Align = alBottom
          AutoSize = False
          Caption = #1058#1077#1084#1072
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9079434
          Font.Height = -13
          Font.Name = 'Segoe UI Emoji'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 10
          ExplicitTop = 30
          ExplicitWidth = 34
        end
        object LabelName: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 7
          Width = 566
          Height = 19
          Margins.Left = 5
          Margins.Top = 7
          Margins.Right = 5
          Margins.Bottom = 7
          Align = alTop
          AutoSize = False
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 10
          ExplicitTop = 6
          ExplicitWidth = 67
        end
      end
      object PanelControls: TPanel
        Left = 576
        Top = 0
        Width = 55
        Height = 55
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object ButtonFlatLeave: TButtonFlat
          Left = 0
          Top = 0
          Width = 55
          Height = 55
          Align = alRight
          Caption = ''
          ColorNormal = 2826519
          ColorOver = 2826519
          ColorPressed = 2826519
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
          ImageIndentLeft = 16
          ImageIndex = 5
          Images = FormMain.ImageListNormal
          ImagesOver = FormMain.ImageListOver
          OnClick = ButtonFlatLeaveClick
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
      end
    end
    object PanelSend: TPanel
      Left = 0
      Top = 523
      Width = 631
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      Color = 2826519
      ParentBackground = False
      TabOrder = 1
      object ButtonFlatAttachment: TButtonFlat
        Left = 0
        Top = 0
        Width = 45
        Height = 45
        Align = alLeft
        Caption = ''
        ColorNormal = 2826519
        ColorOver = 2826519
        ColorPressed = 2826519
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
        ImageIndentLeft = 11
        ImageIndex = 7
        Images = FormMain.ImageListNormal
        ImagesOver = FormMain.ImageListOver
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
      object RichEditSend: TRichEdit
        Left = 45
        Top = 0
        Width = 496
        Height = 45
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvSpace
        BevelKind = bkSoft
        BevelWidth = 6
        BorderStyle = bsNone
        Color = 2826519
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Emoji'
        Font.Style = []
        ParentFont = False
        PlainText = True
        TabOrder = 0
        Zoom = 100
        OnKeyDown = RichEditSendKeyDown
      end
      object ButtonFlatSend: TButtonFlat
        Left = 586
        Top = 0
        Width = 45
        Height = 45
        Align = alRight
        Caption = ''
        ColorNormal = 2826519
        ColorOver = 2826519
        ColorPressed = 2826519
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
        ImageIndentLeft = 11
        ImageIndex = 8
        Images = FormMain.ImageListNormal
        ImagesOver = FormMain.ImageListNormal
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
      object ButtonFlat5: TButtonFlat
        Left = 541
        Top = 0
        Width = 45
        Height = 45
        Align = alRight
        Caption = ''
        ColorNormal = 2826519
        ColorOver = 2826519
        ColorPressed = 2826519
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
        ImageIndentLeft = 11
        ImageIndex = 6
        Images = FormMain.ImageListNormal
        ImagesOver = FormMain.ImageListOver
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
    object hChatMessages: ThChat
      Left = 0
      Top = 55
      Width = 631
      Height = 468
      Align = alClient
      BorderWidth = 10
    end
  end
  object PanelRight: TPanel
    Left = 632
    Top = 0
    Width = 290
    Height = 568
    Align = alRight
    BevelOuter = bvNone
    Color = 3943971
    Constraints.MaxWidth = 390
    Constraints.MinWidth = 290
    ParentBackground = False
    TabOrder = 1
    object PanelConfOccups: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 169
      Width = 290
      Height = 399
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 2826519
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 394
      object TableExRoster: TTableEx
        Left = 0
        Top = 56
        Width = 290
        Height = 343
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
        Columns = <
          item
            Width = 48
            MinWidth = 48
          end
          item
            Width = 242
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
      object PanelMembers: TPanel
        Left = 0
        Top = 0
        Width = 290
        Height = 56
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 2826519
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 3
        object Label1: TButtonFlat
          AlignWithMargins = True
          Left = 0
          Top = 10
          Width = 249
          Height = 38
          Cursor = crDefault
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 8
          Align = alClient
          Caption = #1059#1063#1040#1057#1058#1053#1048#1050#1048
          ColorNormal = 2826519
          ColorOver = 5455917
          ColorPressed = 2826519
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
          ImageIndentLeft = 10
          ImageIndentRight = 30
          ImageIndex = 3
          Images = FormMain.ImageListNormal
          RoundRectParam = 0
          ShowFocusRect = False
          TabOrder = 0
          TabStop = True
          TextFormat = [tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
          ExplicitTop = 0
          ExplicitWidth = 290
          ExplicitHeight = 41
        end
        object ButtonFlat3: TButtonFlat
          AlignWithMargins = True
          Left = 249
          Top = 10
          Width = 41
          Height = 38
          Cursor = crDefault
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 8
          Align = alRight
          Caption = ''
          ColorNormal = 2826519
          ColorOver = 2826519
          ColorPressed = 2826519
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
          ImageIndentLeft = 6
          ImageIndentRight = 6
          ImageIndex = 4
          Images = FormMain.ImageListNormal
          ImagesOver = FormMain.ImageListOver
          RoundRectParam = 0
          ShowFocusRect = False
          TabOrder = 1
          TabStop = True
          TextFormat = [tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
          ExplicitTop = 0
          ExplicitHeight = 41
        end
      end
    end
    object PanelConfInfo: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 290
      Height = 161
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      BevelOuter = bvNone
      Color = 2826519
      ParentBackground = False
      TabOrder = 1
      object LabelConfName: TLabel
        Left = 101
        Top = 83
        Width = 159
        Height = 19
        AutoSize = False
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        EllipsisPosition = epEndEllipsis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelConfSubject: TLabel
        Left = 101
        Top = 108
        Width = 159
        Height = 17
        AutoSize = False
        Caption = #1058#1077#1084#1072
        EllipsisPosition = epEndEllipsis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9079434
        Font.Height = -13
        Font.Name = 'Segoe UI Emoji'
        Font.Style = []
        ParentFont = False
      end
      object LabelExConf: TLabelEx
        Left = 11
        Top = 72
        Width = 81
        Height = 66
        Brush.Color = 10053222
        Pen.Color = 10053222
        Shape = stCircle
        Caption = #1053#1040
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = []
        TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter, tfWordBreak, tfWordEllipsis]
        IgnorBounds = True
        EllipseRectVertical = False
      end
      object ButtonFlat1: TButtonFlat
        Left = 223
        Top = 0
        Width = 55
        Height = 55
        Caption = ''
        ColorNormal = 2826519
        ColorOver = 5455917
        ColorPressed = 2826519
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
        ImageIndentLeft = 16
        ImageIndex = 2
        OnClick = ButtonFlatLeaveClick
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 290
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          AlignWithMargins = True
          Left = 25
          Top = 3
          Width = 207
          Height = 49
          Margins.Left = 25
          Align = alClient
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1075#1088#1091#1087#1087#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 161
          ExplicitHeight = 20
        end
        object ButtonFlat2: TButtonFlat
          Left = 235
          Top = 0
          Width = 55
          Height = 55
          Align = alRight
          Caption = ''
          ColorNormal = 2826519
          ColorOver = 2826519
          ColorPressed = 2826519
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
          ImageIndentLeft = 16
          ImageIndex = 5
          Images = FormMain.ImageListNormal
          ImagesOver = FormMain.ImageListOver
          OnClick = ButtonFlatLeaveClick
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
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 152
    object N2: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000004F619A004F
        619A004F619A004F619A004F619A004F619A004F619A004F619A004F619A004F
        619A004F619A004F619A004F619A004F619A004F619A004F619A004F619A00CF
        FF9A00CFFF9A00CFFF9A00CFFF9A00CFFF9A00CFFF9A00CFFF9A00CFFF9A00CF
        FF9A00CFFF9A00CFFF9A00CFFF9A00CFFF9A00CFFF9A004F619A004F619A00CF
        FF9A47CFEBFF08C6FFFF00BFFFFF00C2FFFF03C4FFFF05C7FFFF05C7FFFF03C6
        FFFF00C3FFFF00BFFFFF00C3FFFF65C8E2FF00CFFF9A004F619A004F619A00CF
        FF9A00B7FCFF56C8DFFF23CBFFFF0BC4FFFF13C9FFFF17CCFFFF18CDFFFF15C9
        FFFF0CC6FFFF1DC8FFFF6AC2D7FF00B8FAFF00CFFF9A004F619A004F619A00CF
        FF9A00BFFFFF00BFFEFF5AC5DCFF38D5FFFF1BCFFFFF19ACE6FF159FDCFF1DD1
        FFFF31D2FFFF67C1D6FF00BEFCFF02BFFFFF00CFFF9A004F619A004F619A00CF
        FF9A05C0FFFF0FC6FFFF0BC8FFFF61C6DCFF2FC2EEFF00F7FAFF00FFFFFF1CC7
        F0FF67BFD6FF0BC8FEFF10C6FFFF06C0FFFF00CFFF9A004F619A004F619A00CF
        FF9A08C1FFFF13C8FFFF1CC9FEFF0EC4EEFF0BFFFEFF11FFFFFF11FEFFFF0EFF
        FFFF0CD2F2FF1CC6FCFF13C8FFFF0AC3FFFF00CFFF9A004F619A004F619A00CF
        FF9A0AC3FFFF10C0FCFF17D4F2FF25FFFFFF25FDFFFF24FCFFFF24FCFFFF24FD
        FFFF25FFFFFF1BE3F7FF0FC0FAFF0AC2FFFF00CFFF9A004F619A004F619A00CF
        FF9A09BDFBFF27E7F8FF39FFFFFF36FDFFFF36FDFFFF36FDFFFF36FDFFFF36FD
        FFFF36FDFFFF38FFFFFF2EF2F9FF04BDFBFF00CFFF9A004F619A004F619A00CF
        FF9A62FFFF9572FFFFA770FFFFA670FFFFA670FFFFA670FFFFA670FFFFA670FF
        FFA670FFFFA670FFFFA672FFFFA670FFFFA000CFFF9A004F619A004F619A004F
        619A004F619A004F619A004F619A004F619A004F619A004F619A004F619A004F
        619A004F619A004F619A004F619A004F619A004F619A004F619A000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Caption = #1055#1088#1080#1074#1072#1090#1085#1086#1077' '#1086#1073#1097#1077#1085#1080#1077
      OnClick = N2Click
    end
    object N1: TMenuItem
      Bitmap.Data = {
        E6040000424DE6040000000000003604000028000000100000000B0000000100
        080000000000B000000000000000000000000001000000000000F7F7F700BEBE
        BE00EAEAEA00DFDFDF00F5F5F500F4F4F400E4E4E400E2E2E200E5E5E500EDED
        ED00EFEFEF00F1F1F100D5D5D500BABABA00F3F3F300F6F6F600B0B0B000B5B5
        B500DBDBDB00B8B8B800DDDDDD00FAFAFA00E7E7E700FBC98900BDBDBD00CE9C
        7F00B2B2B200FDCC8E00B3B1B500B19C7800759ABD00ECECEC00C2C2C200D4AB
        7900F7C88C00EFC28800E9E9E900EFBB8D00F7AE5E00A1CDF700D2D2D200829B
        BB00CFAD8100FAA65500CCCCCC00DB9D5600FCC06600C4C4C400B4B4B400F0F0
        F000E4AF7400D4D4D400E5AE6A00E6E6E600B1B1B100E1E1E100A7977700D7D7
        D7009EC8F300C7C7C700AC948A00A1B5B800FDBB6400FCBC6500E1A56100CECE
        CE00BFBFBF00E3E3E3002F629600CBCBCB00F3BA7800F8F8F800EDB77500264E
        7700FCFCFC00BBBBBB00CFAB7900C5C5C500FDA65C00B0C3C500EEEEEE00C6B6
        94004C7FB500E4AA6900B7B7B700F9F9F900B6B6B600FCCC8E00EBEBEB00E8E8
        E800D8D8D800FFFFFF002E0070006E00670029007C002A002E0070006E006700
        7C00470049004600200049006D00610067006500200028002A002E0067006900
        660029007C002A002E006700690066007C004A00500045004700200049006D00
        6100670065002000460069006C006500200028002A002E006A00700067002900
        7C002A002E006A00700067007C004A00500045004700200049006D0061006700
        65002000460069006C006500200028002A002E006A0070006500670029007C00
        2A002E006A007000650067007C004200690074006D0061007000730020002800
        2A002E0062006D00700029007C002A002E0062006D0070007C00490063006F00
        6E007300200028002A002E00690063006F0029007C002A002E00690063006F00
        7C0045006E00680061006E0063006500640020004D0065007400610066006900
        6C0065007300200028002A002E0065006D00660029007C002A002E0065006D00
        66007C004D00650074006100660069006C0065007300200028002A002E007700
        6D00660029007C002A002E0077006D0066000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF005A41455B4D2F
        42014B0D56115B361001335B072C035B5B5B5B5B5B0C11285B10395B5B5B5B05
        501F5859315B5B5B5B1A125B51533E3F262A5A58025959595B30145B21252E2B
        4E325A09545413565B56035B17193D4F3C465A0B0A0958025B0D075B571C3A27
        1E575A05545456135B18065B1B29524449225A00040E0B0A5B01085B57231D38
        4C575A4A4834402D5B20081515555555554700000F0F0405043B0E5858022416
        350643370314125A0C59}
      Caption = 'Vcard'
      OnClick = N1Click
    end
    object N3: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000010000010000
        0100000100000100000100000100000100000100000100000100000100000100
        00010000010000010000010000010000010000010000429BD401000001000001
        0000010000010000010000010000409BD5010000010000010000010000010000
        010000010000098BDD008ADE349EDF010000010000010000319EE051ADE5309D
        E00100000100000100000100000100000100000100001F97DF008FE20091E301
        93E30C97E443AEE8CCE4F2F0F3F53DA6E2010000010000010000010000010000
        01000001000042A8E10094E50097E70098E876C5EEF4F5F5F5F5F5DFECF455B0
        E20100000100000100000100000100000100000100005FB5E20099E8009CEA00
        9EEB85CEF1F5F5F5F5F5F5BEE1F271BBE2010000010000010000010000010000
        0100000100001DA3E7009EEB00A1ED00A3EF85D0F2F5F5F5F5F5F5B2DEF328A9
        E801000001000001000001000001000001000030A8E6009EEB00A3EE00A6F000
        A9F285D3F4F5F5F5F5F5F5F5F5F592D2F23CAFE7010000010000010000010000
        2CA5E5009DEA00A2ED00A6F000ABF300AEF585D5F5F5F5F5F5F5F5F5F5F5F5F5
        F597D4F238ACE60100000100004EAEE213A1E90AA3ED04A6EF00A9F200AEF500
        B3F885D8F7F5F5F5F3F4F5E8F1F5D6ECF5BBE2F450BBEE5CB5E3010000010000
        01000001000095CCE45FC2EC13B6F600B6FA85DAF8F3F4F54FC9F768C7EC98CE
        E50100000100000100000100000100000100000100000100000100007ECCEA04
        B7FA85DAF8B9E6F78BCFE9010000010000010000010000010000010000010000
        01000001000001000001000001000027BDF783D8F75CCBF60100000100000100
        0001000001000001000001000001000001000001000001000001000001000083
        CCE94FC7F68FCFE8010000010000010000010000010000010000010000010000
        0100000100000100000100000100000100004DC0F00100000100000100000100
        0001000001000001000001000001000001000001000001000001000001000001
        0000010000010000010000010000010000010000010000010000}
      Caption = #1040#1076#1084#1080#1085
      object N4: TMenuItem
        Caption = #1050#1080#1082
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1041#1072#1085
        Enabled = False
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N20: TMenuItem
        Caption = #1044#1072#1090#1100' '#1087#1088#1072#1074#1086' '#1091#1095#1072#1089#1085#1080#1082#1072
        OnClick = N20Click
      end
      object N7: TMenuItem
        Caption = #1043#1086#1083#1086#1089
        object N15: TMenuItem
          Caption = #1044#1072#1090#1100' '#1075#1086#1083#1086#1089
          OnClick = N15Click
        end
        object MenuItemSound: TMenuItem
          Caption = #1054#1090#1085#1103#1090#1100' '#1075#1086#1083#1086#1089
          OnClick = MenuItemSoundClick
        end
      end
      object N9: TMenuItem
        Caption = #1052#1086#1076#1077#1088#1072#1090#1086#1088
        object N16: TMenuItem
          Caption = #1044#1072#1090#1100' '#1087#1088#1072#1074#1086' '#1084#1086#1076#1077#1088#1072#1090#1086#1088#1072
          OnClick = N16Click
        end
        object N10: TMenuItem
          Caption = #1054#1090#1085#1103#1090#1100' '#1087#1088#1072#1074#1086' '#1084#1086#1076#1077#1088#1072#1090#1086#1088#1072
          OnClick = N10Click
        end
      end
      object N11: TMenuItem
        Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
        object N17: TMenuItem
          Caption = #1044#1072#1090#1100' '#1087#1088#1072#1074#1086' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
          OnClick = N17Click
        end
        object N12: TMenuItem
          Caption = #1054#1090#1085#1103#1090#1100' '#1087#1088#1072#1074#1086' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
          OnClick = N12Click
        end
      end
      object N13: TMenuItem
        Caption = #1042#1083#1072#1076#1077#1083#1077#1094
        object N18: TMenuItem
          Caption = #1044#1072#1090#1100' '#1087#1088#1072#1074#1086' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
          OnClick = N18Click
        end
        object N14: TMenuItem
          Caption = #1054#1090#1085#1103#1090#1100' '#1087#1088#1072#1074#1086' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
          OnClick = N14Click
        end
      end
    end
    object N21: TMenuItem
      Bitmap.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000C57A4400C274
        3D00CA9E8C00D59A6D00E7C3A600B8622D00F0DCCE00C9814C00C4784200FCF7
        F400AB552400CE8A5600F3E1D500C3764000BD693100CC875100E2BA9D00C06E
        3400E2BDA300CE8C5800C67C4600BB876E00CE895200B45E2900BC6A3500DDAD
        8900D69A6600D99E6B00CB855100DAA26F00D89F6C00E2B48C00ECD3C100DFAC
        7D00DCA77900DBA37100BE6D3600C8804C00C87F4900C77D4800C2733C00C272
        3A00D3956200D5986500B4653A00D2925F00C1713A00C1713900FFFFFF00CB84
        4F00FEFEFE00BA7B5E00D5BBB000E2B89700D7AF9D00B6693E00D5996600D295
        6800C87E4800EEE0DA00E4CCC300F6EAE000C9804800D1905D00D2915C00D08E
        5800AC634000BF744400C1713700C37E5600F3EAE600E9CAB400C4763E00E1B5
        9200E6C7B100CB895A00EACFBA00CE936D00F3E5DC00FEFEFF00EBDAD400C688
        6700BF927E00C88F7100FDF9F600DCA57500C5825800DCB09100E3C0A900E6C5
        AB00DFB08600E6C5AE00F7EEE800D8A17700F4E5D900F0E1DC00E1C0AE00F4E6
        DD00EFD8C500D7B1A200D6B7AB00C9835000D2915B00C06F3900D3945F00EACC
        B200FEFCFB00EBCEB700F5F0F000AD5A2B00BA673100B15B2700FAF4EF00C172
        3B00E2BA9900DCAA8500E0AE8100D2936000D4966400E2CEC700FEFDFC00CA82
        4A00D8A07200E8C5A900CF8D5900CF8E5A00DEB69D00D59E76006D0061006700
        65002000460069006C006500200028002A002E006A0070006500670029007C00
        2A002E006A007000650067007C004200690074006D0061007000730020002800
        2A002E0062006D00700029007C002A002E0062006D0070007C00490063006F00
        6E007300200028002A002E00690063006F0029007C002A002E00690063006F00
        7C0045006E00680061006E0063006500640020004D0065007400610066006900
        6C0065007300200028002A002E0065006D00660029007C002A002E0065006D00
        66007C004D00650074006100660069006C0065007300200028002A002E007700
        6D00660029007C002A002E0077006D0066000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303030306C34
        52151502774F3030303030303064420A6F1717176D33503030303030020A0518
        6E180E67290E2C3C303030630A18182458065728284828373B30462C0E24240D
        09204B080D08002E53323617672E282F0C20110014141426435F510E71010D44
        12702514262507070860452F0D0800487F4F033A311C0F0F077E560108142700
        1C6A10790B137C7C0B7E4D01143A14394730590F3F2D752A414A12283A07317C
        19350340762B381B2A4E5C65071C0B7C0F723D221A1B1E231932305B3E0B7D2D
        6669545A1E1D745D613030301016682B1A1E2223211F730630303030304C7A1A
        1D55211F49105E30303030303030096204047B6B0C7830303030}
      Caption = #1042#1077#1088#1089#1080#1103' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = N21Click
    end
  end
  object BalloonHint: TBalloonHint
    Left = 72
    Top = 96
  end
  object ImageList24: TImageList
    ColorDepth = cd32Bit
    Left = 72
    Top = 208
    Bitmap = {
      494C010103001800500010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003226183599724B9EB98A5BBFB98A5BBFA97F54B0553F2A590000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020101020000000000000000010100010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080603F85F0B376F8936E48984836234B3D2E1D3F7C5C3D80DDA66DE6B88A
      5ABE0E0A060F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003A2C1C3CD39E68DA251C11270000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001611
      0A18CE9965D53E2F1F4004030204A57C52AC926E489700000000000000000000
      0000000000000000000000000000000000000000000000000000000000007457
      3978DEA76EE6291F142C000000000000000000000000000000000E0A070EB687
      59BCB88A5ABE0101000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003A2C1C3CEAAE73F2AF8356B5DEA76EE6251C112700000000000000000000
      000000000000000000000000000000000000000000000000000016110A18D19C
      67D7A37B50A908060308A57C52ACCF9B66D6DAA46CE2926E4897000000000000
      00000000000000000000000000000000000000000000000000001A120C1BEFB3
      76F63A2B1C3C0000000000000000000000000000000004030204463422480E0A
      070EDBA56DE458422B5B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003A2C
      1C3CEAAE73F260482F640000000080613F86DEA76EE6251C1127000000000000
      0000000000000000000000000000000000000000000016110A18D19C67D7A37B
      50A908060308A57C52ACCF9B66D616100A1722190F23DAA46CE2926E48970000
      0000000000000000000000000000000000000000000000000000654B3168BC8C
      5DC3000000000000000000000000000000003B2C1C3DC69462CE7A5B3C7E0000
      000077593A7BA97F54B000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005942
      2B5C5E472E6200000000000000000000000080613F86DEA76EE6251C11270000
      00000000000000000000000000000000000000000000271D12288C6845920302
      01040C09060C956F499A16100A176A4F346E58422B5B22190F23DAA46CE2926E
      48970000000000000000000000000000000000000000000000008967438E8C68
      449000000000000000000000000058422B5BBC8C5DC321180F22000000000000
      000046342248CE9B66D500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B67448FDEA76EE6251C
      1127000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004937234CEEB275F658422B5B22190F23DAA4
      6CE2926E4897000000000000000000000000000000000000000084634088906C
      47950000000000000000000000006C5035706A4F346E00000000000000000000
      00004A38244EC89763D000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B67448FDEA7
      6EE6251C11270000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004937234CEEB275F658422B5B271D
      1228DEA66EE7926E489700000000000000000000000000000000553F2958D29C
      67D90101000100000000000000006C5035706A4F346E00000000000000000000
      00008D6A46939B744CA000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B67
      448FDEA76EE6160F0A1700000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004937234CEEB275F64836
      234B271D1228DEA66EE780613F850000000000000000000000000B08040CDEA7
      6EE6624A31660000000000000000513D27544F3A26520000000000000000271D
      1228ECB174F43A2B1C3C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B38254E0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E2E1F400E0A
      060F00000000271D1228251C1127000000000000000000000000000000004735
      224AEEB275F661482F650000000000000000000000000000000033261835DAA4
      6CE28965438D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000047352249E0A86FE8D19C67D88663428B7B5C3C7FB98B5BBFF2B577FA7A5B
      3C7E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000090603095B432C5E7B5C3C7F7B5C3C7F6C5035701A120C1B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFF81F0000FFFFF6FFF0070000F8FFE07FE3C30000F07FC03FC7830000
      E23F801FCF130000E71F800FCE330000FF8FFE07CE730000FFC7FF03C6730000
      FFE3FF81C6630000FFF7FFC9E3C70000FFFFFFFFF00F0000FFFFFFFFF81F0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
