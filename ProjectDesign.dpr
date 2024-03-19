program ProjectDesign;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uDesign in 'uDesign.pas' {FormDesign},
  uFButton in 'Components\uFButton.pas' {frmButton: TFrame},
  uFEditText in 'Components\uFEditText.pas' {frmEdit: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TFormDesign, FormDesign);
  Application.Run;
end.
