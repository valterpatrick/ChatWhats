unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  uChatWhats, Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TFrmPrincipal = class(TForm)
    PnChat: TPanel;
    PnControles: TPanel;
    BtnEnvTextoUsuario1: TBitBtn;
    BtnEnvTextoUsuario2: TBitBtn;
    BtnLimpar: TBitBtn;
    ScrollChat: TScrollBox;
    Label2: TLabel;
    EdtNomeUsuario1: TEdit;
    Label3: TLabel;
    EdtTextoEnviar: TEdit;
    EdtNomeUsuario2: TEdit;
    Label4: TLabel;
    EdtImagemEnviar: TEdit;
    Label5: TLabel;
    BtnPesqImagem: TBitBtn;
    BtnEnvImagemUsuario1: TBitBtn;
    BtnEnvImagemUsuario2: TBitBtn;
    CmbTamImagem: TComboBox;
    Label1: TLabel;
    OpenImage: TOpenDialog;
    procedure BtnEnvTextoUsuario1Click(Sender: TObject);
    procedure BtnEnvTextoUsuario2Click(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnEnvImagemUsuario1Click(Sender: TObject);
    procedure BtnEnvImagemUsuario2Click(Sender: TObject);
    procedure BtnPesqImagemClick(Sender: TObject);
    procedure ScrollChatMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollChatMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  private
    Chat: TChatWhats;
    CorChatUsuario1, CorChatUsuario2: TColor;
    function TamanhoImagem(TamInt: Integer): TSizeAAttachment;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}


procedure TFrmPrincipal.BtnEnvImagemUsuario1Click(Sender: TObject);
begin
  Chat.AddMessageDisplay(ScrollChat, User1, CorChatUsuario1, EdtNomeUsuario1.Text, '', Now, ExtractFileExt(EdtImagemEnviar.Text), EdtImagemEnviar.Text, TamanhoImagem(CmbTamImagem.ItemIndex));
end;

procedure TFrmPrincipal.BtnEnvImagemUsuario2Click(Sender: TObject);
begin
  Chat.AddMessageDisplay(ScrollChat, User2, CorChatUsuario2, EdtNomeUsuario2.Text, '', Now, ExtractFileExt(EdtImagemEnviar.Text), EdtImagemEnviar.Text, TamanhoImagem(CmbTamImagem.ItemIndex));
end;

procedure TFrmPrincipal.BtnEnvTextoUsuario1Click(Sender: TObject);
begin
  Chat.AddMessageDisplay(ScrollChat, User1, CorChatUsuario1, EdtNomeUsuario1.Text, EdtTextoEnviar.Text, Now, '', '');
end;

procedure TFrmPrincipal.BtnEnvTextoUsuario2Click(Sender: TObject);
begin
  Chat.AddMessageDisplay(ScrollChat, User2, CorChatUsuario2, EdtNomeUsuario1.Text, EdtTextoEnviar.Text, Now, '', '');
end;

procedure TFrmPrincipal.BtnLimparClick(Sender: TObject);
begin
  Chat.ClearAll(ScrollChat);
end;

procedure TFrmPrincipal.BtnPesqImagemClick(Sender: TObject);
begin
  if OpenImage.Execute then
    EdtImagemEnviar.Text := OpenImage.FileName;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Chat := TChatWhats.Create;
  CorChatUsuario1 := clLime;
  CorChatUsuario2 := clYellow;
  CmbTamImagem.ItemIndex := 0;
  ActiveControl := ScrollChat;
end;

procedure TFrmPrincipal.ScrollChatMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollChat.VertScrollBar.Position := ScrollChat.VertScrollBar.ScrollPos + 8;
end;

procedure TFrmPrincipal.ScrollChatMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollChat.VertScrollBar.Position := ScrollChat.VertScrollBar.ScrollPos - 8;
end;

function TFrmPrincipal.TamanhoImagem(TamInt: Integer): TSizeAAttachment;
begin
  Result := SASmall;
  if CmbTamImagem.ItemIndex = 0 then
    Result := SASmall
  else if CmbTamImagem.ItemIndex = 1 then
    Result := SAMedium
  else if CmbTamImagem.ItemIndex = 2 then
    Result := SALarge;
end;

end.
