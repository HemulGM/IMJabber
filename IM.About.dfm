object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 337
  ClientWidth = 527
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
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 169
    Height = 321
    Transparent = True
  end
  object Label1: TLabel
    Left = 280
    Top = 144
    Width = 121
    Height = 33
    Caption = 'IM Jabber'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = []
    Font.Quality = fqAntialiased
    ParentFont = False
  end
  object ButtonFlatOK: TButtonFlat
    Left = 444
    Top = 304
    Width = 75
    Height = 25
    Cursor = crDefault
    Caption = 'Ok'
    ColorNormal = 14668740
    ColorOver = 11373924
    ColorPressed = 10451273
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    OnClick = ButtonFlatOKClick
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
