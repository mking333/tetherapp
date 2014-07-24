program tetherapp;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterFormwithNavigation in 'HeaderFooterFormwithNavigation.pas' {HeaderFooterwithNavigation},
  Launch in 'Launch.pas' {frmLaunch};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLaunch, frmLaunch);
  Application.CreateForm(THeaderFooterwithNavigation, HeaderFooterwithNavigation);
  Application.Run;
end.


