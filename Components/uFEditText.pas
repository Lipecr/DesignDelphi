unit uFEditText;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, System.Skia,
  FMX.Skia, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TfrmEdit = class(TFrame)
    LaySVG: TLayout;
    SkSvg: TSkSvg;
    RectBorda: TRectangle;
    edText: TEdit;
    SkSvgAlert: TSkSvg;
    Layout5: TLayout;
    Layout4: TLayout;
    RectDesc: TRectangle;
    SkLDesc: TSkLabel;
    procedure edTextEnter(Sender: TObject);
    procedure edTextExit(Sender: TObject);
  private const
    DefaultEditColEnter    = TAlphaColors.Aqua;
    DefaultEditColExitEmpy = TAlphaColors.Coral;
    DefaultEditColExit     = TAlphaColors.White;
  private
    { Private declarations }
    FRectEditColEnter: TAlphaColor;
    FRectEditColExitEmpty: TAlphaColor;
    FRectEditColExit: TAlphaColor;

    procedure SetRectEditColEnter(Value: TAlphaColor);
    procedure SetRectEditColExitEmpty(Value: TAlphaColor);
    procedure SetRectEditColExit(Value: TAlphaColor);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property EditColEnter: TAlphaColor    read FRectEditColEnter      write SetRectEditColEnter     default DefaultEditColEnter;
    property EditColExitEmpy: TAlphaColor read FRectEditColExitEmpty  write SetRectEditColExitEmpty default DefaultEditColExitEmpy;
    property EditColExit: TAlphaColor     read FRectEditColExit       write SetRectEditColExit      default DefaultEditColExit;
  end;

implementation

{$R *.fmx}

constructor TfrmEdit.Create(AOwner: TComponent);
begin
  inherited;
  FRectEditColEnter     := DefaultEditColEnter;
  FRectEditColExitEmpty := DefaultEditColExitEmpy;
  FRectEditColExit      := DefaultEditColExit;
end;

procedure TfrmEdit.SetRectEditColEnter(Value: TAlphaColor);
begin
  if FRectEditColEnter <> Value then
  begin
    FRectEditColEnter := Value;
    // Se necessário, atualize a aparência dos componentes afetados aqui
  end;
end;

procedure TfrmEdit.SetRectEditColExitEmpty(Value: TAlphaColor);
begin
  if FRectEditColExitEmpty <> Value then
  begin
    FRectEditColExitEmpty := Value;
    // Se necessário, atualize a aparência dos componentes afetados aqui
  end;
end;

procedure TfrmEdit.SetRectEditColExit(Value: TAlphaColor);
begin
  if FRectEditColExit <> Value then
  begin
    FRectEditColExit := Value;
    // Se necessário, atualize a aparência dos componentes afetados aqui
  end;
end;


procedure TfrmEdit.edTextEnter(Sender: TObject);
Var
  I, j : Integer;
  Rect : TRectangle;
  skLabel : TSkLabel;
  skSvg : TSkSvg;
begin
  if Sender is TEdit then
  begin
    Rect := TRectangle(TEdit(Sender).Parent);

    for I := 0 to TEdit(Sender).ControlsCount - 1 do
      if TEdit(Sender).Controls[i] is TSkSvg then
      begin
        TSkSvg(TEdit(Sender).Controls[i]).Visible := False;
        Break;
      end;
  end;

  for I := 0 to Rect.ControlsCount - 1 do
    if Rect.Controls[i] is TLayout then
    begin
      TSkLabel(
        TRectangle(
          TLayout(
            TLayout(
              Rect
            .Controls[i])
          .Controls[0])
        .Controls[0])
      .Controls[0]).TextSettings.FontColor := EditColEnter;
      Break;
    end;

  Rect.Stroke.Color := EditColEnter;

end;

procedure TfrmEdit.edTextExit(Sender: TObject);
var
  I, j : Integer;
  Rect : TRectangle;
  skLabel : TSkLabel;
  skSvg : TSkSvg;
  Check : Boolean;
begin
  Check := False;

  if Sender is TEdit then
  begin
    Rect := TRectangle(TEdit(Sender).Parent);

    for I := 0 to TEdit(Sender).ControlsCount - 1 do
      if TEdit(Sender).Controls[i] is TSkSvg then
      begin
        skSvg := TSkSvg(TEdit(Sender).Controls[i]);
        Break;
      end;

    if (TEdit(Sender).Text = '') and TEdit(Sender).Enabled then
      Check := True;

  end;

  for I := 0 to Rect.ControlsCount - 1 do
    if Rect.Controls[i] is TLayout then
      Break;
  skLabel := TSkLabel(
               TRectangle(
                 TLayout(
                   TLayout(
                     Rect.Controls[i])
                   .Controls[0])
                 .Controls[0])
               .Controls[0]);

  if Check then
  begin
    skSvg.Visible := True;
    Rect.Stroke.Color := EditColExitEmpy;
    skLabel.TextSettings.FontColor := EditColExitEmpy;
  end
  else
  begin
    skSvg.Visible := False;
    Rect.Stroke.Color := EditColExit;
    skLabel.TextSettings.FontColor := EditColExit;
  end;
end;

end.
