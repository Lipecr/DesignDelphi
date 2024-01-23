unit uDesign;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani, FMX.Objects, System.Skia,
  FMX.Skia, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.ListBox;

type
  TFormDesign = class(TForm)
    RectBut: TRectangle;
    CoAni: TColorAnimation;
    SkLText: TSkLabel;
    ShadEff: TShadowEffect;
    FloAni: TFloatAnimation;
    SkAnimatedImage1: TSkAnimatedImage;
    SkSvg1: TSkSvg;
    GlowEffect1: TGlowEffect;
    RectNome: TRectangle;
    Edit: TEdit;
    RectNomeDesc: TRectangle;
    ShadowEffect2: TShadowEffect;
    LayoutButton: TLayout;
    Layout2: TLayout;
    SkLDesc: TSkLabel;
    LayoutEditCustom: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    LayoutComboBox: TLayout;
    Rectangle1: TRectangle;
    SkSvg4: TSkSvg;
    ShadowEffect1: TShadowEffect;
    Layout3: TLayout;
    Layout6: TLayout;
    Rectangle2: TRectangle;
    SkLabel1: TSkLabel;
    Layout7: TLayout;
    SkSvg5: TSkSvg;
    ComboBox1: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    StyleBook1: TStyleBook;
    SkSvg6: TSkSvg;
    Layout8: TLayout;
    procedure RectButMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Single);
    procedure RectButMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Single);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDesign: TFormDesign;

implementation

{$R *.fmx}


//Cor ao clicar no TEdit--------------------------------------------------------
procedure TFormDesign.EditEnter(Sender: TObject);
Var I, j : Integer;
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

  if Sender is TComboBox then
  begin
    Rect := TRectangle(TComboBox(Sender).Parent);

    for I := 0 to TComboBox(Sender).ControlsCount - 1 do
      if TComboBox(Sender).Controls[i] is TSkSvg then
      begin
        TSkSvg(TComboBox(Sender).Controls[i]).Visible := False;
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
      .Controls[0]).TextSettings.FontColor := TAlphaColors.Blue;
      Break;
    end;

  Rect.Stroke.Color := TAlphaColors.Blue;

end;
//Cor ao sair do TEdit----------------------------------------------------------
procedure TFormDesign.EditExit(Sender: TObject);
var
  I, j : Integer;
  Rect : TRectangle;
  skLabel : TSkLabel;
  skSvg : TSkSvg;
  Combo : TComboBox;
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

  if Sender is TComboBox then
  begin
    Rect := TRectangle(TComboBox(Sender).Parent);

    for I := 0 to TComboBox(Sender).ControlsCount - 1 do
      if TComboBox(Sender).Controls[i] is TSkSvg then
      begin
        skSvg := TSkSvg(TComboBox(Sender).Controls[i]);
        Break;
      end;

    if (TComboBox(Sender).ItemIndex < 1) and TComboBox(Sender).Enabled then
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
    Rect.Stroke.Color := TAlphaColors.Red;
    skLabel.TextSettings.FontColor := TAlphaColors.Red;
  end
  else
  begin
    skSvg.Visible := False;
    Rect.Stroke.Color := TAlphaColors.Black;
    skLabel.TextSettings.FontColor := TAlphaColors.Black;
  end;


end;

procedure TFormDesign.RectButMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  TRectangle(Sender).opacity := 0.9;
end;

procedure TFormDesign.RectButMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  TRectangle(Sender).opacity := 1;
end;

end.
