unit Launch;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Colors, FMX.Memo, FMX.Effects;

type
  TfrmLaunch = class(TForm)
    Image1: TImage;
    Layout1: TLayout;
    Image2: TImage;
    Layout2: TLayout;
    ColorButton1: TColorButton;
    Label1: TLabel;
    ColorButton2: TColorButton;
    Label2: TLabel;
    ColorButton3: TColorButton;
    Label3: TLabel;
    btnTOU: TSpeedButton;
    btnPP: TSpeedButton;
    rcOpaque: TRectangle;
    rcTOU: TRectangle;
    ShadowEffect1: TShadowEffect;
    Memo1: TMemo;
    Button1: TButton;
    rcPP: TRectangle;
    ShadowEffect2: TShadowEffect;
    Memo2: TMemo;
    Button2: TButton;
    procedure ColorButton1Click(Sender: TObject);
    procedure ColorButton2Click(Sender: TObject);
    procedure ColorButton3Click(Sender: TObject);
    procedure btnTOUClick(Sender: TObject);
    procedure btnPPClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaunch: TfrmLaunch;

implementation

{$R *.fmx}

uses HeaderFooterFormwithNavigation;

procedure TfrmLaunch.btnPPClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcPP.Visible := true;
end;

procedure TfrmLaunch.btnTOUClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcTOU.Visible := true;
end;

procedure TfrmLaunch.Button1Click(Sender: TObject);
begin
  rcTOU.Visible := false;
  rcOpaque.Visible := false;
end;

procedure TfrmLaunch.Button2Click(Sender: TObject);
begin
  rcPP.Visible := false;
  rcOpaque.Visible := false;
end;

procedure TfrmLaunch.ColorButton1Click(Sender: TObject);
begin
  HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabJoin;
  HeaderFooterwithNavigation.Show;
end;

procedure TfrmLaunch.ColorButton2Click(Sender: TObject);
begin
  HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabSignIn;
  HeaderFooterwithNavigation.Show;
end;

procedure TfrmLaunch.ColorButton3Click(Sender: TObject);
var
  URLString: string;
begin
  URLString := 'http://www.triptether.com/users/sign_up';
  HeaderFooterwithNavigation.webSignUp.Navigate(URLString);
  HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabSignUp;
  HeaderFooterwithNavigation.Show;
end;

end.
