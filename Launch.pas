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
    btnResume: TColorButton;
    Label1: TLabel;
    btnNewTrip: TColorButton;
    Label2: TLabel;
    btnSignUp: TColorButton;
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
    rcAgree: TRectangle;
    ShadowEffect3: TShadowEffect;
    btnAgree: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnTOUx: TSpeedButton;
    btnPPx: TSpeedButton;
    Layout3: TLayout;
    Panel1: TPanel;
    btnJoin: TColorButton;
    Label7: TLabel;
    procedure btnResumeClick(Sender: TObject);
    procedure btnNewTripClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnTOUClick(Sender: TObject);
    procedure btnPPClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAgreeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnTOUxClick(Sender: TObject);
    procedure btnPPxClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
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

var
  frmLaunch: TfrmLaunch;

implementation

{$R *.fmx}

uses HeaderFooterFormwithNavigation;

procedure TfrmLaunch.btnAgreeClick(Sender: TObject);
var
  ini: TIniFile;
begin
  rcAgree.Visible := false;
  rcOpaque.Visible := false;

  HasAgreed := 'Yes';

  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteString('termsandconditions', 'agreed', 'Yes');
  ini.WriteString('termsandconditions', 'agreedate', DateTimeToStr(Now));
  ini.Free;
end;

procedure TfrmLaunch.btnPPClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcPP.Visible := true;
end;

procedure TfrmLaunch.btnPPxClick(Sender: TObject);
begin
  rcAgree.Visible := false;
  rcPP.Visible := true;
end;

procedure TfrmLaunch.btnTOUClick(Sender: TObject);
begin
  rcOpaque.Visible := true;
  rcTOU.Visible := true;
end;

procedure TfrmLaunch.btnTOUxClick(Sender: TObject);
begin
  rcAgree.Visible := false;
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

procedure TfrmLaunch.btnResumeClick(Sender: TObject);
begin
  if HasAgreed = 'Yes' then
  begin
    if (NameSetting = 'No') or (EmailSetting = 'No') then
    begin
      HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabSettings;
      HeaderFooterwithNavigation.Show;
    end
    else
    begin
      HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabJoin;
      HeaderFooterwithNavigation.Show;
      HeaderFooterwithNavigation.JoinTrip(self);
    end;
  end
  else
  begin
    rcOpaque.Visible := true;
    rcAgree.Visible := true;
  end;
end;

procedure TfrmLaunch.btnJoinClick(Sender: TObject);
begin
  if HasAgreed = 'Yes' then
  begin
    if (NameSetting = 'No') or (EmailSetting = 'No') then
    begin
      HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabSettings;
      HeaderFooterwithNavigation.Show;
    end
    else
    begin
      HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabJoin;
      HeaderFooterwithNavigation.Show;
    end;
  end
  else
  begin
    rcOpaque.Visible := true;
    rcAgree.Visible := true;
  end;
end;

procedure TfrmLaunch.btnNewTripClick(Sender: TObject);
begin
  if HasAgreed = 'Yes' then
  begin
    HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabSignIn;
    HeaderFooterwithNavigation.Show;
  end
  else
  begin
    rcOpaque.Visible := true;
    rcAgree.Visible := true;
  end;
end;

procedure TfrmLaunch.btnSignUpClick(Sender: TObject);
begin
  if HasAgreed = 'Yes' then
  begin
    HeaderFooterwithNavigation.TabControl1.ActiveTab := HeaderFooterwithNavigation.TabSignUp;
    HeaderFooterwithNavigation.Show;
  end
  else
  begin
    rcOpaque.Visible := true;
    rcAgree.Visible := true;
  end;
end;

procedure TfrmLaunch.FormActivate(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  HasAgreed := ini.ReadString('termsandconditions', 'agreed', 'No');
  NameSetting := ini.ReadString('login', 'name', 'No');
  EmailSetting := ini.ReadString('login', 'email', 'No');
  TripID := ini.ReadString('login', 'trip', '');
  TripPin := ini.ReadString('login', 'pin', '');
  ini.Free;

  if (TripID.Length > 0) and (TripPIN.Length > 0) then
    btnResume.Visible := True
  else
    btnResume.Visible := False;
end;

end.
