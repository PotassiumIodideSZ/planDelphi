unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,Printers;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Image1: TImage;
    procedure FormPaint(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  

implementation
uses
  unit4;
var
  sdviGor, sdviVer,DprinGor,DprinVer:integer;
  maprnxf6,maPrnYF6:real;
{$R *.DFM}
{------------------------------------------}
procedure TForm6.FormPaint(Sender: TObject);

begin
  printGr(form6.canvas,False,maprnXf6,maprnyf6);
end;
{------------------------------------------}
procedure TForm6.ScrollBar1Change(Sender: TObject);
var
  p:integer;
  begin
  p:=ScrollBar1.Position;
  sdviGor:=50-p*DprinGor;
  rasGrSe;
  printGr(form6.canvas,False,maprnxf6,maprnyf6);
end;
{------------------------------------------}
procedure TForm6.ScrollBar2Change(Sender: TObject);
var
  p:integer;
  begin
  p:=ScrollBar2.Position;
  sdviVer:=50-p*DprinVer;
  RasGrSe;
  printGr(form6.canvas,False,maprnxf6,maprnyf6);
end;
{------------------------------------------}
procedure TForm6.FormShow(Sender: TObject);

begin

  sdviVer:=50;
  sdviGor:=50;
  maPrnXF6:=0.5;
  maPrnYF6:=0.5;

  ScrollBar1.Position:=0;
  ScrollBar2.Position:=0;
  DPrinGor:=round((printer.PageWidth+50)/100);
  DprinVer:=round((printer.PageHeight+50)/100);

end;
{------------------------------------------}
procedure TForm6.FormResize(Sender: TObject);
begin
  form6.ScrollBar1.Width:=form6.Width-35;
  form6.ScrollBar2.Height:=form6.ClientHeight-21;
end;

{-----------------------------------------------}
procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {TekFont.Size:=tekfontSize;}
end;
{---------------------------------------------------}
procedure TForm6.Button1Click(Sender: TObject);

begin
  {form6.Button1.Visible:=false;
  printGr(form6.canvas,False,sdviGor,SdviVer,maprnXf6,maprnyf6);
  form6.Print;
  form6.Button1.Visible:=true;  }

  Printer.BeginDoc;
  PrintGr(Printer.Canvas,True,maprnxn,maprnyn);
  Printer.EndDoc;
end;
{-----------------------------------------------}
procedure TForm6.Button2Click(Sender: TObject);

 (* var
    bit1:bitmap;*)
begin
 (* var
  Bit1 : TBitMap;
  i    :integer;
  x,y  :integer;
  rdest,rSource:trect;
  strR :string;
begin
  try
  if FlRadbut2 then begin
    rdest.Left  :=0;
    rdest.Right :=24;
    rdest.Top   :=0;
    rdest.bottom:=12;

    for i:=nomNToch to nomKToch do begin

        {x:=XnSe+Round(mToch[i].xToch*Dox2);
        y:=YkSe-Round(mToch[i].yToch*Doy2);}

        x:=mToch[i].xToch;
        y:=mToch[i].yToch;

        rsource.Left  :=x-2;
        rsource.Right :=x+22;
        rsource.Top   :=y-2;
        rsource.bottom:=y+10;

        {Form5.Canvas.CopyMode:=cmPatInvert;}
        mToch[i].bitmap.Canvas.CopyRect(rdest,TekCanvas,Rsource);



        TekCanvas.Pen.Color:=clBlack;
        TekCanvas.Brush.Color:=clBlack;


        TekCanvas.Rectangle(x-2,y-2,x+3,y+3);

        Str(mToch[i].nToch,StrR);
        TekCanvas.Brush.Style:=bsClear;
        TekCanvas.Font.Size:=8;

        rsource.Left  :=x;
        rsource.Right :=x+18;
        rsource.Top   :=y;
        rsource.bottom:=y+11;
        {TekCanvas.TextRect(rSource,x+3,y-3,StrR);}
        TekCanvas.TextOut(x+3,y-3,StrR);
        TekCanvas.Brush.Style:=bsSolid;

        {TekCanvas.Pen.Color:=clRed;
        TekCanvas.Brush.Color:=clRed;
        TekCanvas.Ellipse(x-2,y+2,x+2,y-2); }

    end;
  end;







    Bit1 := TBitMap.Create;
    TekCanvas.CopyRect(rsource,bit1.bitmap.Canvas,Rdest);
  finally
    BitMap1.Free;
  end;       *)
end;
{----------------------------------}

end.
