object frmXtdmSub: TfrmXtdmSub
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'frmXtdmSub'
  ClientHeight = 566
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 176
    Top = 203
    Width = 48
    Height = 13
    Caption = #20195#30721#31867#22411
  end
  object lbl2: TLabel
    Left = 176
    Top = 267
    Width = 48
    Height = 13
    Caption = #20195'  '#30721'  '#20540
  end
  object lbl3: TLabel
    Left = 176
    Top = 328
    Width = 48
    Height = 13
    Caption = #26174#31034#39034#24207
  end
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 60
    Align = alTop
    TabOrder = 0
    DesignSize = (
      554
      60)
    object btnSave: TBitBtn
      Left = 443
      Top = 5
      Width = 50
      Height = 50
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = #20445#23384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnClose: TBitBtn
      Left = 499
      Top = 5
      Width = 50
      Height = 50
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object cbbType: TComboBox
    Left = 256
    Top = 200
    Width = 130
    Height = 21
    TabOrder = 1
  end
  object edtValue: TEdit
    Left = 256
    Top = 264
    Width = 130
    Height = 21
    TabOrder = 2
  end
  object edtSort: TEdit
    Left = 256
    Top = 325
    Width = 130
    Height = 21
    TabOrder = 3
  end
end
