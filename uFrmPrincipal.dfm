object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'uChatWhats Demo'
  ClientHeight = 609
  ClientWidth = 884
  Color = clBtnFace
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnChat: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 878
    Height = 447
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
    object ScrollChat: TScrollBox
      Left = 1
      Top = 1
      Width = 876
      Height = 445
      Align = alClient
      TabOrder = 0
      OnMouseWheelDown = ScrollChatMouseWheelDown
      OnMouseWheelUp = ScrollChatMouseWheelUp
      ExplicitTop = 2
      ExplicitWidth = 874
      ExplicitHeight = 429
    end
  end
  object PnControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 456
    Width = 878
    Height = 150
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      878
      150)
    object Label2: TLabel
      Left = 25
      Top = 12
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Usu'#225'rio 1:'
    end
    object Label3: TLabel
      Left = 338
      Top = 12
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Texto Enviar:'
    end
    object Label4: TLabel
      Left = 25
      Top = 39
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Usu'#225'rio 2:'
    end
    object Label5: TLabel
      Left = 328
      Top = 39
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Imagem Enviar:'
    end
    object Label1: TLabel
      Left = 15
      Top = 66
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tamanho Imagem:'
    end
    object BtnEnvTextoUsuario1: TBitBtn
      Left = 8
      Top = 107
      Width = 145
      Height = 25
      Caption = 'Enviar Texto Usu'#225'rio 1'
      TabOrder = 0
      OnClick = BtnEnvTextoUsuario1Click
    end
    object BtnEnvTextoUsuario2: TBitBtn
      Left = 159
      Top = 107
      Width = 145
      Height = 25
      Caption = 'Enviar Texto Usu'#225'rio 2'
      TabOrder = 1
      OnClick = BtnEnvTextoUsuario2Click
    end
    object BtnLimpar: TBitBtn
      Left = 310
      Top = 107
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = BtnLimparClick
    end
    object EdtNomeUsuario1: TEdit
      Left = 110
      Top = 9
      Width = 200
      Height = 21
      TabOrder = 3
      Text = 'Usu'#225'rio 1'
    end
    object EdtTextoEnviar: TEdit
      Left = 409
      Top = 9
      Width = 450
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 4
      Text = 'Texto Enviar...'
    end
    object EdtNomeUsuario2: TEdit
      Left = 110
      Top = 36
      Width = 200
      Height = 21
      TabOrder = 5
      Text = 'Usu'#225'rio 2'
    end
    object EdtImagemEnviar: TEdit
      Left = 409
      Top = 36
      Width = 423
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 6
    end
    object BtnPesqImagem: TBitBtn
      Left = 838
      Top = 36
      Width = 21
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      Caption = '...'
      TabOrder = 7
      OnClick = BtnPesqImagemClick
    end
    object BtnEnvImagemUsuario1: TBitBtn
      Left = 391
      Top = 107
      Width = 145
      Height = 25
      Caption = 'Enviar Imagem Usu'#225'rio 1'
      TabOrder = 8
      OnClick = BtnEnvImagemUsuario1Click
    end
    object BtnEnvImagemUsuario2: TBitBtn
      Left = 542
      Top = 107
      Width = 145
      Height = 25
      Caption = 'Enviar Imagem Usu'#225'rio 2'
      TabOrder = 9
      OnClick = BtnEnvImagemUsuario2Click
    end
    object CmbTamImagem: TComboBox
      Left = 110
      Top = 63
      Width = 200
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 10
      Text = 'Pequeno'
      Items.Strings = (
        'Pequeno'
        'M'#233'dio'
        'Grande')
    end
  end
  object OpenImage: TOpenDialog
    Filter = 
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Po' +
      'rtable Network Graphics (*.png)|*.png'
    Left = 715
    Top = 544
  end
end
