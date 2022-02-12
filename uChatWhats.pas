{
  Biblioteca para simular o Chat do Whatsapp.
  Desenvolvido por Valter Patrick e Terceiros.

  E-mail:
  valterpatrick@hotmail.com

  Caso queira Contribuir (PIX):
  08412248627

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Como funciona:
  Coloque esta bibioteca na pasta do seu projeto e adicione nos uses ddo projeto.
  É necessário colocar na tela um componente TScrollBox (WhereDisplay) e instanciar a Classe TChatWhats uma única vez,
  não sendo necessário uma instância para cada componente.
  Ao clicar com o botão direito em cima do balão, se for texto ou imagem abrirá um popupmenu para poder copia o texto/imagem
  Se utilizar o TScrollBox, inclua estes códigos nos seguintes eventos para poder funcionar o scroll do mouse:

  procedure ScrollChatMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  begin
  TScrollBox.VertScrollBar.Position := TScrollBox.VertScrollBar.ScrollPos + 8;
  end;

  procedure ScrollChatMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  begin
  TScrollBox.VertScrollBar.Position := TScrollBox.VertScrollBar.ScrollPos - 8;
  end;

  No FormCreate colocar o seguinte código:
  ActiveControl := ScrollChat;
}

unit uChatWhats;

interface

uses Classes, Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Forms, DateUtils, sysutils, StrUtils,
  Math, Winapi.Windows, Vcl.Menus, Vcl.Clipbrd, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TUser = (User1, User2);
  TSizeAAttachment = (SASmall, SAMedium, SALarge);
  TNotifyEvent = procedure(Sender: TObject) of Object;

  TChatWhats = class
  private
    ClickLabel: TNotifyEvent;
    procedure ItemClick(Sender: TObject);
  public
    procedure ClearAll(WhereDisplay: TWinControl);
    procedure AddMessageDisplay(WhereDisplay: TWinControl; WhoSend: TUser; Color: TColor; ANameWhoSendMessage, AMessage: String;
      ATimeStamp: TDateTime; AAttachmentType: STring; AAttachmentFile: string = ''; AAttachmentSize: TSizeAAttachment = SASmall);
  end;

implementation

procedure TChatWhats.ClearAll(WhereDisplay: TWinControl);
begin
  while WhereDisplay.ControlCount > 0 do
    WhereDisplay.Controls[0].free;
end;

procedure TChatWhats.ItemClick(Sender: TObject);
var
  MyFormat: Word;
  AData: THandle;
  APalette: HPALETTE;
begin
  if Sender is TMenuItem then
  begin
    if TMenuItem(Sender).Owner is TPopupMenu then
    begin
      if TPopupMenu(TMenuItem(Sender).Owner).Owner is TLabel then
        Clipboard.AsText := TLabel(TPopupMenu(TMenuItem(Sender).Owner).Owner).Caption
      else if TPopupMenu(TMenuItem(Sender).Owner).Owner is TImage then
      begin
        TImage(TPopupMenu(TMenuItem(Sender).Owner).Owner).Picture.SaveToClipboardFormat(MyFormat, AData, APalette);
        Clipboard.SetAsHandle(MyFormat, AData);
      end;
    end;
  end;
end;

procedure TChatWhats.AddMessageDisplay(WhereDisplay: TWinControl; WhoSend: TUser; Color: TColor; ANameWhoSendMessage, AMessage: String;
  ATimeStamp: TDateTime; AAttachmentType: STring; AAttachmentFile: string = ''; AAttachmentSize: TSizeAAttachment = SASmall);

  function TamImagem: Integer;
  begin
    Result := 200;
    if AAttachmentSize = SASmall then
      Result := 200
    else if AAttachmentSize = SAMedium then
      Result := 400
    else if AAttachmentSize = SALarge then
      Result := WhereDisplay.Width - 100;
  end;

  function isImage: Boolean;
  begin
    Result := (pos('png', AAttachmentType.ToLower) > 0) or (pos('jpg', AAttachmentType.ToLower) > 0) or (pos('jpeg', AAttachmentType.ToLower) > 0);
  end;

  procedure CriarItensPopUpMenu(popup: TPopupMenu; Caption: String);
  var
    item: TMenuItem;
  begin
    item := TMenuItem.Create(popup);
    item.Caption := Caption;
    ClickLabel := ItemClick;
    item.OnClick := ClickLabel;
    popup.Items.Add(item);
  end;

  procedure AddText(Owner: TWinControl;
    ACaption: STring;
    AStyle: TFontStyles;
    AAlign: TAlign;
    AUser: TUser;
    PopUpMenu: Boolean;
    var h: Integer);
  var
    l: TLabel;
    m: TPopupMenu;
  begin
    l := TLabel.Create(Owner);
    l.Parent := Owner;
    l.Caption := ACaption;
    l.Font.Style := AStyle;
    l.Align := AAlign;
    l.WordWrap := True;

    if AUser = User1 then
      l.Alignment := taLeftJustify
    else
      l.Alignment := taRightJustify;
    l.AlignWithMargins := True;
    l.Margins.Bottom := 3;
    l.Margins.Left := 3;
    l.Margins.Right := 3;
    l.Margins.Top := 5;
    if PopUpMenu then
    begin
      m := TPopupMenu.Create(l);
      l.PopUpMenu := m;
      CriarItensPopUpMenu(m, 'Copiar Texto...');
    end;
    h := h + l.Height + 2;
  end;

  Procedure LoadImage(Owner: TWinControl;
    var h: Integer);
  var
    p: TPanel;
    m: TPopupMenu;
    img: TImage;
    stm: TMemoryStream;
  begin
    p := TPanel.Create(Owner);
    p.Parent := Owner;
    p.DoubleBuffered := True;
    p.Align := alTop;
    p.BevelOuter := bvNone;

    p.Height := 100;
    img := TImage.Create(p);
    try
      img.Parent := p;
      img.AutoSize := True;
      img.Stretch := False;
      stm := TMemoryStream.Create;
      stm.LoadFromFile(AAttachmentFile);
      try
        img.Picture.LoadFromStream(stm);
        m := TPopupMenu.Create(img);
        img.PopUpMenu := m;
        CriarItensPopUpMenu(m, 'Copiar Imagem...');
      except
        on E: Exception do
          Application.MessageBox(PWideChar(E.Message), 'Erro ao Carregar Imagem', MB_ICONERROR + MB_OK);
      end;

      p.Height := img.Height;
      if p.Height > 200 then
      begin
        img.Stretch := True;
        img.AutoSize := False;
        img.Proportional := True;
        img.Height := TamImagem;
        p.Height := TamImagem;
        if WhoSend = User1 then
          img.Align := alRight
        else
          img.Align := alLeft;

        img.Width := TamImagem;
      end;
      img.Align := alClient;
    except

    end;
    h := h + img.Height;
  end;

var
  s: TShape;
  p: TPanel;
  h: Integer;
begin
  // Painel que servirá de conteiner para os demais componentes
  p := TPanel.Create(WhereDisplay);
  p.DoubleBuffered := True;

  p.Parent := WhereDisplay;
  p.Height := 10; // Tamanho inicial, será alterado depois
  p.Align := alTop;
  p.AlignWithMargins := True;
  p.Margins.Bottom := 3;
  if WhoSend = User1 then // Usuário 1 = conversa a esquerda
  begin
    p.Margins.Left := 3;
    p.Margins.Right := Round(WhereDisplay.Width * 0.1);
  end
  else // Usuário 2 = conversa a direita
  begin
    p.Margins.Left := Round(WhereDisplay.Width * 0.1);
    p.Margins.Right := 3;
  end;
  p.Margins.Top := 3;
  p.BevelOuter := bvNone;
  p.Top := 2000000000; // Maior número possível para as mensagens sempre ficarem por último

  h := 5;
  AddText(p, ANameWhoSendMessage, [fsBold], alTop, WhoSend, False, h);

  if AMessage.Trim <> '' then
  begin
    // Quadrado desenhado na tela
    s := TShape.Create(p);
    s.Parent := p;
    s.Brush.Color := Color;
    s.Align := alClient;
    s.Shape := stRoundRect;
    AddText(p, AMessage, [], alClient, WhoSend, True, h);
  end;

  if AAttachmentType <> '' then // arquivo
  begin
    if isImage then
      LoadImage(p, h)
    else
      AddText(p, 'Anexo tipo: ' + AAttachmentType, [TFontStyle.fsUnderline], alBottom, WhoSend, False, h);
  end;

  AddText(p, FormatDateTime('dd/mm/yyyy hh:nn:ss', ATimeStamp), [fsItalic], alBottom, WhoSend, False, h);
  p.Height := h + 18;

  if WhereDisplay is TScrollBox then
    TScrollBox(WhereDisplay).VertScrollBar.Position := 2000000000; // Maior número possível para as mensagens sempre ficarem por último
end;

end.
