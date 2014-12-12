unit Launch;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.IOUtils, System.INIFiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Colors, FMX.Memo, FMX.Effects, FMX.Edit;
type
  TfrmLaunch = class(TForm)
    Image1: TImage;
    Layout1: TLayout;
    Image2: TImage;
    Layout2: TLayout;
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
    rcAbout: TRectangle;
    ShadowEffect3: TShadowEffect;
    btnAgree: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnTOUx: TSpeedButton;
    btnPPx: TSpeedButton;
    Timer1: TTimer;
    btnAbout: TSpeedButton;
    Label1: TLabel;
    btnBack: TSpeedButton;
    procedure btnTOUClick(Sender: TObject);
    procedure btnPPClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAgreeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnTOUxClick(Sender: TObject);
    procedure btnPPxClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
    HasAgreed: string;
    NameSetting: string;
    EmailSetting: string;
    TripID: string;
    TripPIN: string;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses HeaderFooterFormwithNavigation;

procedure TfrmLaunch.btnAboutClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcAbout.Visible := true;
end;

procedure TfrmLaunch.btnAgreeClick(Sender: TObject);
var
  ini: TIniFile;
begin
  rcAbout.Visible := false;
  rcOpaque.Visible := false;

  HasAgreed := 'Yes';

  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteString('termsandconditions', 'agreed', 'Yes');
  ini.WriteString('termsandconditions', 'agreedate', DateTimeToStr(Now));
  ini.Free;
end;

procedure TfrmLaunch.btnBackClick(Sender: TObject);
begin
  HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabJoin;
  HeaderFooterwithNavigation.Show;
end;

procedure TfrmLaunch.btnPPClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcPP.Visible := true;
end;

procedure TfrmLaunch.btnPPxClick(Sender: TObject);
begin
  rcAbout.Visible := false;
  rcPP.Visible := true;
end;

procedure TfrmLaunch.btnTOUClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcTOU.Visible := true;
end;

procedure TfrmLaunch.btnTOUxClick(Sender: TObject);
begin
  rcAbout.Visible := false;
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

procedure TfrmLaunch.FormActivate(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  HasAgreed := ini.ReadString('termsandconditions', 'agreed', 'No');
  NameSetting := ini.ReadString('login', 'name', 'Nickname');
  EmailSetting := ini.ReadString('login', 'email', 'name@host.com');
  TripID := ini.ReadString('login', 'trip', '');
  TripPin := ini.ReadString('login', 'pin', '1234567');
  ini.Free;

{
  if HasAgreed <> 'Yes' then
  begin

    rcOpaque.Visible := true;
    rcAgree.Visible := true;
  end;
}
end;

procedure TfrmLaunch.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  btnAgreeClick(self);
end;

end.
