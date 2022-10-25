program AI.EKON25;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
