program tetherapp;

uses
  System.StartUpCopy,
  {$IF Defined(IOS) and Defined(CPUARM)}
  IdSSLOpenSSLHeaders_Static,
  {$ELSE}
  IdSSLOpenSSLHeaders,
  {$ENDIF }
  FMX.Forms,
  HeaderFooterFormwithNavigation in 'HeaderFooterFormwithNavigation.pas' {HeaderFooterwithNavigation},
  Launch in 'Launch.pas' {frmLaunch};

{$R *.res}

begin
{$IF Defined(IOS) and not Defined(CPUARM)}
  IdOpenSSLSetLibPath('/usr/lib/');
{$ENDIF}
  Application.Initialize;
  Application.CreateForm(THeaderFooterwithNavigation, HeaderFooterwithNavigation);
  Application.CreateForm(TfrmLaunch, frmLaunch);
  Application.Run;
end.


