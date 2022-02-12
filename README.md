
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
