unit uFButton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, System.Skia,
  FMX.Skia, FMX.Ani, FMX.Objects, FMX.Layouts;

type
  TfrmButton = class(TFrame)
    RectFill: TRectangle;
    ca1: TColorAnimation;
    fa2: TFloatAnimation;
    SkLbl: TSkLabel;
    SkPBShadow: TSkPaintBox;
    SkSvgIcon: TSkSvg;
    LayContent: TLayout;
    procedure SkPBShadowDraw(ASender: TObject; const ACanvas: ISkCanvas; const ADest: TRectF;
      const AOpacity: Single);
    procedure RectFillMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Single);
    procedure RectFillMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmButton.RectFillMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
var I : Integer;
begin
  TRectangle(Sender).Opacity := 0.8;
end;

procedure TfrmButton.RectFillMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  TRectangle(Sender).Opacity := 1;
end;

procedure TfrmButton.SkPBShadowDraw(ASender: TObject; const ACanvas: ISkCanvas;
  const ADest: TRectF; const AOpacity: Single);
var
  LPaint : ISKPaint;
  LRoundRect : TSkRoundRect;
begin
  try
    LPaint := TSkPaint.Create;
    LRoundRect := TSkRoundRect.Create(ADest, 8, 8);
    LPaint.ImageFilter := TSkImageFilter.MakeDropShadowOnly(2, 2, 4, 4, $20000000);
    ACanvas.DrawRoundRect(LRoundRect, LPaint);
  finally
    LRoundRect.Free;
  end;
  inherited;
end;

end.
