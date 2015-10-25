unit HashCmp1;

{$MODE Delphi}

interface

uses

  LCLIntf, LCLType, LMessages,
  Messages,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls, Menus,
  SysUtils,
  Classes,
  LbClass,
  LbCipher;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    edtHash1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LbMD51: TLbMD5;
    LbSHA11: TLbSHA1;
    btnHashFile: TButton;
    edtHash: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    OpenDialog1: TOpenDialog;
    rgHashMethod: TRadioGroup;
    btnHashString: TButton;
    procedure btnHashFileClick(Sender: TObject);
    procedure btnHashStringClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  LbUtils, about;

var
  MD5Digest : TMD5Digest;
  SHA1Digest : TSHA1Digest;

procedure TForm1.btnHashFileClick(Sender: TObject);
begin
  edthash1.Color:=clWhite;
  edthash1.Font.Color:=clBlack;
  edthash1.Text:='';
  edthash.Text:='';

  if OpenDialog1.Execute then begin
    case rgHashMethod.ItemIndex of
      0 : begin
            LbMD51.HashFile(OpenDialog1.FileName);
            LbMD51.GetDigest(MD5Digest);
            edtHash.Text := BufferToHex(MD5Digest, SizeOf(MD5Digest));
          end;
      1 : begin
            LbSHA11.HashFile(OpenDialog1.FileName);
            LbSHA11.GetDigest(SHA1Digest);
            edtHash.Text := BufferToHex(SHA1Digest, SizeOf(SHA1Digest));
          end;
    end;

  end;
end;

procedure TForm1.btnHashStringClick(Sender: TObject);
var
  S : string;
begin
  S := '';
  if InputQuery('fastMD5', 'Scrivi la frase da codificare', S) then begin
    case rgHashMethod.ItemIndex of
      0 : begin
            LbMD51.HashString(S);
            LbMD51.GetDigest(MD5Digest);
            edtHash.Text := BufferToHex(MD5Digest, SizeOf(MD5Digest));
          end;
      1 : begin
            LbSHA11.HashString(S);
            LbSHA11.GetDigest(SHA1Digest);
            edtHash.Text := BufferToHex(SHA1Digest, SizeOf(SHA1Digest));
          end;
    end;

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if edthash.Text=edthash1.Text then edthash1.Color:=clGreen else edthash1.Color:=clRed;

  edthash1.Font.Color:=clWhite;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
    OpenURL('http://www.fasttools.it/fast-md5');
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  close;
end;

end.