object fmain: Tfmain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 215
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmail: TLabel
    Left = 72
    Top = 44
    Width = 46
    Height = 19
    Caption = 'E-Mail:'
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object edtEmail: TEdit
    Left = 72
    Top = 69
    Width = 377
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnValid: TButton
    Left = 160
    Top = 125
    Width = 177
    Height = 49
    Caption = 'Valid'
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnValidClick
  end
end
