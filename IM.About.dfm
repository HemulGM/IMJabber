object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 256
  ClientWidth = 517
  Color = 2760985
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    517
    256)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 64
    Width = 121
    Height = 33
    Caption = 'IM Jabber'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = []
    Font.Quality = fqAntialiased
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 103
    Width = 317
    Height = 19
    Caption = #1050#1083#1080#1077#1085#1090' '#1084#1077#1089#1089#1077#1085#1076#1078#1077#1088#1072' '#1087#1086' '#1087#1088#1086#1090#1086#1082#1086#1083#1091' Jabber'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    Font.Quality = fqAntialiased
    ParentFont = False
  end
  object ButtonFlatClose: TButtonFlat
    Left = 412
    Top = 209
    Width = 96
    Height = 34
    Cursor = crDefault
    Margins.Left = 4
    Margins.Top = 8
    Margins.Right = 4
    Margins.Bottom = 8
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
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
    ExplicitLeft = 422
    ExplicitTop = 290
  end
end
