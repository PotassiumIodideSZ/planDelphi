unit Unit4;

interface
uses
  SysUtils,Windows,Graphics,Messages,Dialogs,Printers;
const
    MaxNm=4  ;{������������ ���������� ����������� ����������}
    MaxNb=31; { MaxNB=�������� �� 2**MaxNm+2*MaxNm+1;
                                 nm=2,nb=13;
                                 nm=3,nb=20,
                                 nm=4,nb=31,
                                 nm=5,nb=52,
                                 nm=5,nb=91}
    MaxNY =5  ;{������������ ���������� ������� �������}
    MaxK2=15 ;{���������� ������������� ������������ ������
                = 0.5*(Nm+1)*(Nm+2)}
    MaxNO=10 ;{������������ ���������� ������}
    MaxNmNy=5;{������������ �� Nm � Ny}
    MaxN_MIsFil=297;{MaxNb+MaxNy+2*MaxNm+3}
    Xmi=-1.;{��� �������� ��� Xnm ��� ���������}
    Xma=1.; {���� �������� ��� Xnm ��� ���������}
    maxNom=30;{maxNom=Nm*(Nm-1)}
    maxKolIzo=100;{���������� 3-� ������ ��������}
    maxToch=100;{������������ �-�� ����� �� �������}
type
  arrayX=array[1..maxNm] of real;
  array3=array[1..3] of real;
  array2=array[1..2] of real;

  {TTekFont=record
    FColor:Tcolor;
    FSize :integer;
    FName : TFontName;
    FPitch: TFontPitch;
  end; }

  typToch=class
    nToch:integer;
    xToch:integer;
    xx1Toch:real;
    yy1Toch:real;
    YToch:integer;
    bitmap:Tbitmap;
    Constructor Create;
    Destructor  Destroy;override;
  end;

  TypIzo=class
    colorG:Tcolor;
    G_Width:Integer;
    G_Style:TPenStyle;
    I_Y:integer; {����� ������� �������}
    nameG:string;
    KolFX:integer; {���������� �������� �� X=10}
    KolFY:integer; {���������� �������� �� Y=10}

    kolZE0:integer;  // ����� ������� � ��� Z
    kolxt0:integer;  // ��� �������� �� x
    kolyt0:integer;  // ��� �������� �� y
    kolzt0:integer;  // ��� �������� �� z

    KolRX:integer; {���������� ��������� �� X=100}
    KolRY:integer; {���������� ��������� �� Y=100}
    XnmFix:arrayX;
    XnmFakt:arrayx;
    IzoNxx:integer;
    izoNxy:integer;
    Nom:integer;
    YminGr,YmaxGr:real; {������������ �������� ��� 3-� ������� �������}
    Ymin0,Ymax0:real;  {������������ �������� ��� ����}
    XminGr:real;
    XmaxGr:real;
    KolUrSe:integer;
    FormatZ:string;
    Constructor Create;
    Destructor  Destroy;override;
    procedure YMinMax(Var Ymin:real;Var YMax:real);
    function Yproiz(X:arrayX;I,N:integer;Var Rx:real):real;
  end;

  TIzometrG = class(TypIzo)
    Constructor Create;
    Destructor  Destroy;override;
    procedure   PolyLine3(TekCanvas:TCanvas;ixy:integer;fzna,zna1,zna2:real;col:Tcolor;RWidth:Integer;RStyle:TPenStyle;razmer:integer;FlPrin:integer;maprnx,maprny:real);
    procedure   Trimer(TekCanvas:TCanvas;ris:boolean;flprin:integer;maprnx,maprny:real);
    procedure   RisOsi3(TekCanvas:TCanvas;ris:boolean;flprin:integer;maprnx,maprny:real);
    procedure   RisSe(TekCanvas:TCanvas;razmer:integer;ris:boolean;flprin:integer;maprnx,maprny:real);
    procedure   RisOsi2(TekCanvas:TCanvas;ris:boolean;flprin:integer;maprnx,maprny:real);
    procedure   Linurv(TekCanvas:tcanvas;razmer:integer;ris:boolean;flprin:integer;Y:real;maprnx,maprny:real);
    function    KOR(n:integer;X:arrayX;Y:real;var Vtkor:array2):integer;

  end;
var
  LWidth:integer;{������� �����}
  LStyle:TPenStyle; {����� �����}
  Gran:real;{������� �������������� ����������� ���������� ��� ��������}
  KoorX,KoorY:integer;{���������� �� ����� ������������ XplYpl}

  OsX3KoorX, OsX3KoorY, OsY3KoorX, OsY3KoorY, OsZ3KoorX, OsZ3KoorY:integer;
                      {���������� ���� 3-������� �������}

  FlRectangle2,FlRectangle1:boolean;{��������� �� ������(�������������) �������
                                     � �������� Image1 ��� Image2 }
  X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2:integer;{���������� ������� �� Image1}
  X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1:integer;{���������� ������� �� Image2}

  PreBits:TBitmap;{�������� ���������������� ���������}
  PpiX,PpiY:integer;{���������� ����� �� ����
                � �������� ���������������� ���������:
               ������� ������ ���� �������� 8,5�11 ������}
  PixelsPerInchY:integer;{���������� ����� �� ����
                         � ����� ���������������� ���������}
  Gamma:integer;{���� ������� ����������� ������� � ��������� ������}
  RGamma:real;
  GdeDown:byte; {��� ������ ����: 1-������ ���������;2-��� X;3-���-Y;4-��� Z}
  FlMouseDown:boolean;{���� ������ �� Image}
  XMouseDown,YMouseDown:integer;{���������� ������ ������� ���� �� Image}

  FlSpeedButton1:boolean;{True-����� ������������ �������}
  FlOFont:boolean;  {true-���� ���������������}
  GrFont:TFont;      {���� ��� �������}

  fconf:text;
  Xnm:arrayX;{������ � ����� ������� �������� � ������������}
  Nxx:integer; {���������� �� X}
  Nxy:integer; {���������� �� Y}
  NM   :integer; {��������� ����������� ����������}
  NB   :integer; {MaxNB=2**MaxNm+2*MaxNm+1}
  N0   :integer;{���������� ����������� ����� ��� �������������� �����}
  AAAr  :array[1..7] of real;{��������� ��� ������� ������ �������������� �����}
  NY   :integer; {���������� ��������� ���������� (�������)}
  X    :array[1..MaxNM] of array[1..MaxNB] of Real; {�����������}
  XMin :array[1..MaxNM] of Real; {����������� �������� ������ �����������}
  XMax :array[1..MaxNM] of Real; {������������ �������� ������ ����������� �� �������}
  XMin_Gr :array[1..MaxNM] of Real; {����������� ��������(�����������) ������ ����������� �� �������}
  XMax_Gr :array[1..MaxNM] of Real; {������������ ��������(�����������) ������ �����������}
  Y    :array[1..MaxNY] of array[1..MaxNb] of array[1..MaxNO] of Real;{���������}
  C    :array[1..MaxNY] of integer; {���������� ������ ��� ������ ��������� }
  Ysr  :array[1..MaxNY] of array[1..MaxNB] of Real; {������� ����.���������}
  B0   :array[1..MaxNY] of Real;{��������� �-�}
  B    :array[1..MaxNY] of array[1..MaxNm] of Real;{�- ��� �}
  BB   :array[1..MaxNY] of array[1..MaxNm,1..MaxNm] of Real;{�- ��� �i*Xj}
  B2   :array[1..MaxNY] of array[1..MaxNm] of Real;{�- ��� �**2}
  S2Y  :array[1..MaxNY] of array[1..MaxNb] of Real;{��������� �����������������}
  SS2Y :array[1..MaxNY] of Real;{����� ��������� �����������������}
  S2   :array[1..MaxNY] of Real;
  Gmax :array[1..MaxNY] of Real;{G-��������� ����.������.� ����� ������.}
  GTabl:array[1..MaxNY] of Real;{����������� �������� G-��������� �� �������}
  Fras :array[1..MaxNY] of Real;{�������� ������ ���������}
  FTab :array[1..MaxNY] of Real;{�������� ������ ���������}
  NameXY :array [1..2,1..MaxNMNY] of string;{�������� X � Y}
  IKohren:array [1..MaxNy] of Boolean;{�������� �� �� �������� �������}
  IFile:boolean;{�������� �� ���� � �������}
  IRaschet:boolean;{���������� �� ������ ������}
  Imemo1:integer;{1-�� ����,2-��� ����,3-���������}
  MIsFil:array[0..MaxN_MIsFil] of string;
  N_MIsFil:integer;
  FormatX3:string;
  FormatY3:string;
  FormatX:string; {������ ��� X � stringgrid2 � ������ ��� x � y �� ���������� �������}
  FormatZ0:string; {������ ������ Z �� ���������� �������}
  OkForm3:boolean;{������ �� ������ Ok � Form3}
  KolIzo:integer;{���������� ��������}
  NomIzo:integer;{������� ������}
  IzoR:TypIzo;
  FlY00  :array[1..maxNy] of array[1..maxNom] of boolean;{Ymax0 � Ymin0-��� ������� ���� ������� �������}
  ZnYmax0:array[1..maxNy] of array[1..maxNom] of real;
  ZnYmin0:array[1..maxNy] of array[1..maxNom] of real;

  XOpl2,YOpl2:integer;    {������� ��������� ��� �������}
  XOpl,YOpl:integer;{������ ��������� ����������� �������}
  alpha:integer;{���� ����� ���� X � ������������ }
  Ralpha:real;
  beta:integer;{���� ����� ���� Y � ������������ }
  Rbeta:real;

  DOx:integer;{����� ���� ����������� �������}
  DOy:integer;
  DOz:integer;

  Dox2,Doy2:integer; {����� ���� �������}

  PoleX,PoleY:integer;
  FonColIzo:TColor;  {���� ���� ��� ����������� �������}
  Radiana:real;

  LGor:integer;{����� ���� ��� ��������� �� ����������� � ���������}
  LVer:integer;

  RowStringGrid2:integer;
  FlTrackBar:boolean;
  FlOsi3:boolean;
  NomOsi3:integer;
  ColOsi3:TColor;
  maPrnXn,maPrnYn:real;
  Rdrive:char;
  RFolder:string;

  XMouse,YMouse:integer;
  {sdviVer2,sdviGor2,sdviVer3,sdviGor3:integer;}
  {����� ������ ���������, �� ������� �� �����, �� ������� ������}
  nameF:string;
  mToch:array[1..maxToch] of typToch;
  kolToch:integer;
  xnSe,XkSe,YnSe,YkSe:integer;
  ShiCol:integer; {������ ������� ��� ������ �����}
  FlRadBut1,FlRadBut2,FlRadBut3:boolean;
  zagGr:string;{��������� ��� �������}
  memo1Ch:boolean;
  Izo:array [1..MaxKolIzo] of TIzometrG;
  teknomizo:integer;
  kolSimNameG:integer;{���������� �������� ����� ������� ��� ������ ������ �����}

  sdviTochGor2:integer;
 {����� ������ ����� �� �������������������� � ������ ��������}

  sdviTochVer2:integer;
  {����� �� ��������� ������ ����� �� ��������� � ������ ����}

  {TekFontSize:integer;
  TekFontName: TFontName;
  TekFontPitch: TFontPitch;}


  procedure XplYpl(var Xpl:integer;var Ypl:integer;X1,Y1,Z1:real;razmer:integer;flprin:integer);
  procedure WZag(TekCanvas:TCanvas;flprin:integer;StrR:string;maPrnx,maprny:real);
  procedure RasGrSe;
  procedure SaveFileNast;
  procedure LoadFileNast;
  procedure WXoplYopl;
  function Yras(I:integer;X:ArrayX):real;
  {function GetValue(strR:string):integer;}
  function UDPP(stroka:string):string;
  function UDP(stroka:string):string;
  function Fors(stroka:string;k:integer):string;
  function ZIF(ss:integer;st:string;var dr:integer):integer;
  procedure RisToch(TekCanvas:TCanvas;nomNToch,nomKToch:integer;maPrnx,maprny:real);
  procedure RisToch0(TekCanvas:TCanvas;nomNToch,nomKToch:integer;flprin:integer;maPrnx,maprny:real);

  procedure SteToch(TekCanvas:TCanvas;nomNToch,nomKToch:integer;maPrnx,maprny:real);

  procedure PrintGr(TekCanvas:TCanvas;flprin:integer;maprnx,maprny:real;ColFon:TColor);
  function  ONomIzo(StrR:string):integer;
  procedure RisRectangle(Tekcanvas:TCanvas;Var FlRectangle:boolean;X1,Y1,X2,Y2:integer);
  procedure SpisToch(TekCanvas:TCanvas;maprnx,maprny:real);

implementation
{---------------------------------------------------}
procedure RisRectangle(Tekcanvas:TCanvas;Var FlRectangle:boolean;X1,Y1,X2,Y2:integer);
begin
  with Tekcanvas do begin
    Pen.Style:=psDash;
    Pen.color:=clGray;
    Pen.Mode:=pmXor;
    Pen.Width:=LWidth;
    if FlRectangle then begin
      Rectangle(X1,Y1,X2,Y2);
      X2:=0;
      Y2:=0;
      X1:=0;
      Y1:=0;
      FlRectangle:=False;
    end
    else begin
      Rectangle(X1,Y1,X2,Y2);
      FlRectangle:=True;
    end;
    Pen.Style:=LStyle;
    Pen.color:=clBlack;
    Pen.Mode:=pmCopy;
    Pen.Width:=LWidth;
  end;
end;{RisRectangle}
{-------------------------------------------}
function ONomIzo(StrR:string):integer;
  var
  ii:integer;
begin
  Result:=0;
  for ii:=1 to kolizo do begin
    if izo[ii].nameG=StrR then begin
      Result:=ii;
      break;
    end;
  end;
end;


{--------------------------------------------}
procedure RisToch0(TekCanvas:TCanvas;nomNToch,nomKToch:integer;flprin:integer;maPrnx,maprny:real);
var
  i,iix,iiy:integer;
  x,y:integer;
  rdest,rSource:trect;
  strR:string;
  dx2,dy2,dx1,dy1:integer;
begin
  if Flradbut2 then begin

    for i:=nomNToch to nomKToch do begin

        iix:=mToch[i].xToch{+sdviGor};
        iiy:=mToch[i].yToch{+sdviver};

        dx1:=Round((iix-2)*maprnx);
        dy1:=Round((iiy-2)*maprny);
        dx2:=Round((iix+3)*maprnx);
        dy2:=Round((iiy+3)*maprny);

        TekCanvas.Pen.Color:=clBlack;
        Tekcanvas.Pen.Mode:=pmCopy;
        Tekcanvas.Pen.Width:=LWidth;
        TekCanvas.Brush.Color:=clBlack;
        TekCanvas.Pen.Style:=LStyle;

        TekCanvas.Rectangle(dx1,dy1,dx2,dy2);

        Str(mToch[i].nToch,StrR);

        TekCanvas.Brush.Style:=bsClear;
        TekCanvas.TextOut(Round((iix+3)*maPrnx),Round((iiy-3)*maPrny),StrR);

    end;
  end;
end;
                                    

{--------------------------------------------}
procedure SteToch(TekCanvas:TCanvas;nomNToch,nomKToch:integer;maPrnx,maprny:real);
var
  i:integer;
  x,y:integer;
  rdest,rSource:trect;
  strR:string;
begin
  if FlRadBut2 then begin

    for i:=nomKToch downto NomNToch do begin

        x:=(mToch[i].xToch{+sdviGor});
        y:=(mToch[i].yToch{+sdviver});

        rdest.Left  :=round((x-2)*maprnx);
        rdest.Right :=rdest.left+mToch[i].bitmap.Width;
        rdest.Top  :=round((y-2)*maprnx);
        rdest.Bottom :=rdest.Top+mToch[i].bitmap.Height;


        rsource.Left  :=0;

        rsource.Right:=mToch[i].bitmap.Width;
        rsource.Top   :=0;

        rsource.bottom:=mToch[i].bitmap.Height;

        TekCanvas.CopyRect(rdest,mToch[i].bitmap.Canvas,Rsource);
    end;
  end;
end;

{--------------------------------------------}
procedure RisToch(TekCanvas:TCanvas;nomNToch,nomKToch:integer;maprnx,maprny:real);
var
  i,w,h:integer;
  x,y:integer;
  rdest,rSource:trect;
  strR:string;
  dx1,dx2,dy1,dy2:integer;
begin
  if FlRadBut2 then begin
    for i:=nomNToch to nomKToch do begin
        Str(mToch[i].nToch,StrR);

        h:=TekCanvas.TextHeight(StrR);
        w:=TekCanvas.TextWidth(StrR);

        x:=mToch[i].xToch{+sdviGor};
        y:=mToch[i].yToch{+sdviver};

        rsource.Left  :=round((x-2)*maprnx);
        rsource.Right :=round((x+w+5)*maprnx);
        rsource.Top   :=round((y-2)*maprny);
        rsource.bottom:=round((y+h+5)*maprny);

        rdest.Left  :=0;
        rdest.Right :=rsource.Right-rsource.Left;
        rdest.Top   :=0;
        rdest.bottom:=rsource.bottom-rsource.Top;

        if mToch[i].bitmap.Width<>rdest.Right then begin
          mToch[i].bitmap.Width:=rdest.Right;
        end;
        if mToch[i].bitmap.Height<>rdest.Bottom then begin
          mToch[i].bitmap.Height:=rdest.Bottom;
        end;

        mToch[i].bitmap.Canvas.CopyRect(rdest,TekCanvas,Rsource);

        TekCanvas.Pen.Color:=clBlack;

        Tekcanvas.Pen.Mode:=pmCopy;
        TekCanvas.Brush.Color:=clBlack;

        Tekcanvas.Pen.Width:=LWidth;
        Tekcanvas.Pen.style:=LStyle;

        dx1:=Round((x-2)*maprnx);
        dy1:=Round((y-2)*maprny);
        dx2:=Round((x+3)*maprnx);
        dy2:=Round((y+3)*maprny);

        TekCanvas.Rectangle(dx1,dy1,dx2,dy2);

        TekCanvas.Brush.Style:=bsClear;

        TekCanvas.TextOut(round((x+3)*maPrnx),round((y-3)*maPrnY),strR);

    end;
  end;
end;
{-------------------------------------------}
function TIzometrG.KOR(n:integer;X:arrayX;Y:real;var Vtkor:array2):integer;
var
  ii,L,i:integer;
  xkor,aaa,bbb,ccc,d:real;
begin
  I:=self.I_Y;
  aaa:=b2[I][n];
  bbb:=b[I][n];
  ccc:=b0[i]-Y;
  for ii:=1 to Nm do begin
    if ii<>n then begin
      ccc:=ccc+B[I][ii]*X[ii]+B2[I][ii]*X[ii]*X[ii];
    end;
    if ii<>1 then begin
      for L:=1 to ii-1 do begin
        if L=n then begin
          bbb:=bbb+bb[I][ii,L]*X[ii];
        end
        else begin
          if ii=n then begin
            bbb:=bbb+bb[I][ii,L]*X[L];
          end
          else begin
            ccc:=ccc+bb[I][ii,L]*X[ii]*X[L];
          end;
        end;
      end;
    end;
  end;
  if (abs(aaa)<0.0000001) then begin
    if (abs(bbb)<0.0000001) then begin
      result:=0;
      exit;
    end
    else begin
      result:=1;
      vtkor[1]:=-ccc/bbb;
      exit;
    end;
  end;
  d:=bbb*bbb-4*aaa*ccc;
  if abs(d)<0.0000001 then begin
    result:=1;
    vtkor[1]:=-bbb/(2*aaa);
  end
  else begin
    if d<0 then begin
      result:=0;
    end
    else begin
      result:=2;
      vtkor[1]:=(-bbb+sqrt(d))/(2*aaa);
      vtkor[2]:=(-bbb-sqrt(d))/(2*aaa);
      if vtkor[2]<vtkor[1] then begin
        Xkor:=vtkor[2];
        vtkor[2]:=vtkor[1];
        vtkor[1]:=Xkor;
      end;
    end;
  end;
end;
{-------------------------------------------}
Procedure Point3(TekCanvas:Tcanvas;X1,Y1,Z1:real;col:Tcolor;RWidth:Integer;RStyle:TPenStyle;razmer:integer;flprin:integer;maprnx,maprny:real);
var
  x,y:integer;
begin
  xplYpl(x,y,x1,y1,z1,razmer,flPrin);

  Tekcanvas.Pen.Color:=col;
  Tekcanvas.Pen.Mode:=pmCopy;

  Tekcanvas.Pen.Width:=RWidth;
  Tekcanvas.Pen.style:=RStyle;

  {Tekcanvas.MoveTo(round((x+sdviGor)*maprnx),round((y+sdviver)*maprny));}
  Tekcanvas.MoveTo(round(X*maprnx),round(Y*maprny));
end;{Point3}

{--------------------------------------------}
function WWir(ugol:integer):integer;
begin
  result:=0;
  if (ugol>90) and (ugol<=180) then
    result:=2;
  if (ugol>180) and (ugol<=270) then
    result:=3;
  if (ugol>270) and (ugol<360) then
    result:=2;
end;
{-------------------------------------------}
Procedure Line3(TekCanvas:TCanvas;X1,Y1,Z1:real;col:Tcolor;RWidth:Integer;RStyle:TPenStyle;razmer:integer;flprin:integer;maprnx,maprny:real);
var
  x,y:integer;
begin
  XplYpl(x,y,x1,y1,z1,razmer,flPrin);
  with TekCanvas do begin
    Pen.Color:=col;
    Pen.Mode:=pmCopy;

    Tekcanvas.Pen.Width:=RWidth;
    Tekcanvas.Pen.style:=RStyle;

 { TekCanvas.LineTo(round((x+sdviGor)*maprnx),round((y+sdviver)*maprny));}
    LineTo(round(X*maprnx),round(Y*maprny));
  end;
end;
{--------------------------------------------}
procedure LineEd(TekCanvas:Tcanvas;x1,y1,z1:real;dx,dy:integer;col:Tcolor;RWidth:Integer;RStyle:TPenStyle;razmer:integer;flprin:integer;maPrnx,maprny:real);
var
  x,y:integer;
begin
  xplYpl(x,y,x1,y1,z1,razmer,flPrin);
  {if flprin then begin}
  {dx:=round(dx*maPrnx);
  dy:=round(dy*maPrny);}
  {end;}
  Tekcanvas.Pen.Color:=col;
  Tekcanvas.Pen.Mode:=pmCopy;
  Tekcanvas.Pen.Width:=RWidth;
  Tekcanvas.Pen.style:=RStyle;
  {Tekcanvas.MoveTo(round((x+sdviGor)*maprnx),round((y+sdviver)*maprny));
  Tekcanvas.lineTo(round((x+dx+sdviGor)*maprnx),round((y+dy+sdviver)*maprnY));
  Tekcanvas.MoveTo(round((x+sdviGor)*maprnx),round((y+sdviver)*maprny));
  Tekcanvas.lineTo(round((x-dx+sdviGor)*maprnx),round((y-dy+sdviver)*maprny));}

  Tekcanvas.MoveTo(round(x*maprnx),round(y*maprny));
  Tekcanvas.lineTo(round((x+dx)*maprnx),round((y+dy)*maprnY));
  Tekcanvas.MoveTo(round(x*maprnx),round(y*maprny));
  Tekcanvas.lineTo(round((x-dx)*maprnx),round((y-dy)*maprny));

end;
 {-----------------------------------------------------}
procedure WText(TekCanvas:TCanvas;wir:integer;x1,y1,z1:real;col:Tcolor;razmer:integer;flprin:integer;StrR:string;maprnx,maprny:real);
var
  x,y,h,w:integer;
begin
    XplYpl(x,y,x1,y1,z1,razmer,flPrin);
    x:=Round(x*maprnX);
    y:=round(y*maprny);
  {if not flprin then begin}


    Tekcanvas.Pen.Color:=col;
    Tekcanvas.Pen.Mode:=pmCopy;
    Tekcanvas.Pen.Width:=LWidth;
    Tekcanvas.Pen.style:=LStyle;
   { Tekcanvas.Font.color:=TekFont.FColor;}

   { TekCanvas.Font:=GrFont;}

    Tekcanvas.brush.Style:=bsClear;

    h:=TekCanvas.TextHeight(StrR);
    w:=TekCanvas.TextWidth(StrR);

    case wir of
      1:begin
         {if x-w/2>=0 then}
           x:=round(x-w/2);
      end;
      2:begin
         {if x-w>=0 then}
           x:=x-w;
      end;
      3:begin
         {if x-w>=0 then}
           x:=x-w;
         y:=y-h;
      end;
      4:begin
         {if x-w/2>=0 then}
           x:=round(x-w/2);
         y:=y-h;
      end;
      5:begin
         y:=y-h;
      end;
      6:begin
         {if x-w/2>=0 then}
           x:=round(x-w/2);
         y:=round(y-h/2);
      end;
    end;

   { Tekcanvas.TextOut(round(x+sdviGor*maPrnX),round(y+sdviver*maPrny),strR);}
    Tekcanvas.TextOut(X,Y,strR);
end;{WText}
{-------------------------------------------}
procedure   TIzometrG.Linurv(TekCanvas:tcanvas;razmer:integer;ris:boolean;flprin:integer;Y:real;maprnx,maprny:real);

var
  ii:integer;
  col:TColor;
  nxx,nxy,nxg,nxv:integer;
  minX,maxX,minY,maxY:real;
  kolSh,kolShY:integer;
  dx,dy:real;
  vtlin,i1kor,nnach:boolean ;
  nomkor,kolkor,kolkpr:integer;
  Xpred,Ypred:real;
  Vtkor:array2;
  Xs:arrayX;
  kol:integer;
  xx1,yy1,zz1:real;
  xnov,xpred2:real;

  n1,n2:integer;
  i,L:integer;
  bv:real;
begin
   if ris then begin
     col:=self.colorG;
   end
   else begin
     col:=FonColIzo;
   end;

   for ii:=1 to nm do begin
     Xnm[ii]:=self.XnmFix[ii];
   end;
   minX:=self.XminGr;
   maxX:=self.XmaxGr;
   minY:=self.XminGr;
   maxY:=self.XmaxGr;

   nxg:=self.IzoNxx;
   nxv:=self.IzoNxy;

   nxx:=nxg;
   nxy:=nxv;

   if nxg>nxv then begin
     n1:=nxg;
     n2:=nxv;
   end
   else begin
     n1:=nxv;
     n2:=nxg;
   end;

   i:=self.I_Y;
   If abs(BB[i][N1,N2])<0.0000001 then begin
     bv:=b[i][nxv];

     for ii:=2 to nm do begin
       for L:=1 to ii-1 do begin
         if L=nxv then bv:=bv+bb[i][ii,L]*Xnm[L];
         if I=nxv then bv:=bv+bb[i][ii,L]*Xnm[ii];
       end;
     end;
     if (abs(bv)<0.0000001) and (abs(b2[i][nxv])<0.0000001) then begin
       nxx:=nxv;
       nxy:=nxg;
     end;
   end;

   kolSh:=self.KolFX*self.KolRX;
   kolShY:=self.KolFY*self.KolRY;
   dy:=(maxY-minY)/kolShY;
   nomkor:=1;
   repeat
     vtlin:=False;
     i1kor:=false;
     nnach:=false;
     dx:=(maxX-minX)/kolSh;
     Xnm[nxx]:=minX-dX;
     xpred:=Xnm[nxx];

     kolkor:=KOR(nxy,Xnm,Y,Vtkor);
     ypred:=Vtkor[nomkor];
     Xnm[nxx]:=minX;

     repeat
       kolkor:=KOR(nxy,Xnm,Y,Vtkor);
       if kolkor=2 then begin
         xpred2:=(vtkor[1]+vtkor[2])/2;
         if abs(vtkor[1]-vtkor[2])<=dy/2 then begin
           kolkor:=1;
           vtkor[1]:=(vtkor[1]+vtkor[2])/2;
           vtkor[2]:=vtkor[1];
         end;
         vtlin:=true;
       end;

       if Xnm[nxx]=minX then
         kolkpr:=kolkor;

       if abs(kolkor-kolkpr)=2 then begin
         kolkor:=1;
         if kolkpr=2 then begin
           Xnm[nxx]:=Xnm[nxx]-dx;
         end;
         vtkor[1]:=xpred2;
         vtkor[2]:=vtkor[1];
       end;

       if kolkor>0 then
         Xnm[nxy]:=vtkor[nomkor];
       if kolkor<>0 then begin
           if (vtkor[nomkor]<=maxY) and (vtkor[nomkor]>=minY) then begin
             if nnach then begin
               xx1:=(Xnm[Nxg]-minX)/(maxX-minX);
               yy1:=(Xnm[Nxv]-minY)/(maxY-minY);
               zz1:=(Y-self.YminGr)/(self.YmaxGr-self.YminGr);
               Line3(TekCanvas,Xx1,Yy1,zz1,col,self.G_Width,self.G_Style,razmer,flPrin,maprnx,maprny);
             end
             else begin
               {�� ������� �� �����}
               nnach:=true;
               if (kolkpr>0) and (Xnm[nxx]>minX) then begin
                 for ii:=1 to Nm do begin
                   Xs[ii]:=Xnm[ii];
                 end;
                 Xnov:=Xnm[nxx];
                 if Ypred<=minY then begin
                   Xnm[nxy]:=minY;
                 end
                 else begin
                   Xnm[nxy]:=maxY;
                 end;
                 kol:=KOR(Nxx,Xnm,Y,Vtkor);
                 if kol>0 then begin
                   for ii:=1 to kol do begin
                     if (vtkor[ii]>Xpred) and (vtkor[ii]<Xnov) then begin
                       Xnm[nxx]:=vtkor[ii];
                     end;
                   end;
                 end;
                 xx1:=(Xnm[Nxg]-minX)/(maxX-minX);
                 yy1:=(Xnm[Nxv]-minY)/(maxY-minY);
                 zz1:=(Y-self.YminGr)/(self.YmaxGr-self.YminGr);
                 Point3(TekCanvas,Xx1,Yy1,zz1,col,self.G_Width,self.G_Style,razmer,flPrin,maprnx,maprny);

                 for ii:=1 to Nm do begin
                   Xnm[ii]:=Xs[ii];
                 end;
                 xx1:=(Xnm[Nxg]-minX)/(maxX-minX);
                 yy1:=(Xnm[Nxv]-miny)/(maxy-miny);
                 zz1:=(Y-self.YminGr)/(self.YmaxGr-self.YminGr);
                 Line3(TekCanvas,Xx1,Yy1,zz1,col,self.G_Width,self.G_Style,razmer,flPrin,maprnx,maprny);
               end
               else begin
                 xx1:=(Xnm[Nxg]-minX)/(maxX-minX);
                 yy1:=(Xnm[Nxv]-miny)/(maxy-miny);
                 zz1:=(Y-self.YminGr)/(self.YmaxGr-self.YminGr);
                 point3(TekCanvas,Xx1,Yy1,zz1,col,self.G_Width,self.G_Style,razmer,flPrin,maprnx,maprny);
               end;
             end;
           end
           else begin
             if Nnach then begin
             {�� ����� �� �������}
               Nnach:=false;

               for ii:=1 to Nm do begin
                 Xs[ii]:=Xnm[ii];
               end;
               Xnov:=Xnm[nxx];
               if Xnm[nxy]<=minY then begin
                 Xnm[nxy]:=minY
               end
               else begin
                 Xnm[nxy]:=maxY;
               end;
               kol:=KOR(Nxx,Xnm,Y,Vtkor);
               if kol>0 then begin
                 for ii:=1 to kol do begin
                   if (vtkor[ii]>Xpred) and (vtkor[ii]<Xnov) then begin
                     Xnm[nxx]:=vtkor[ii];
                   end;
                 end;
               end;
               xx1:=(Xnm[Nxg]-minX)/(maxX-minX);
               yy1:=(Xnm[Nxv]-miny)/(maxy-miny);
               zz1:=(Y-self.YminGr)/(self.YmaxGr-self.YminGr);
               Line3(TekCanvas,Xx1,Yy1,zz1,col,self.G_Width,self.G_Style,razmer,flPrin,maprnx,maprny);
               for ii:=1 to Nm do begin
                 Xnm[ii]:=Xs[ii];
               end;

             end;
           end;

       end;
       kolkpr:=kolkor;
       Xpred:=Xnm[nxx];
       Ypred:=Xnm[nxy];
       Xnm[nxx]:=xpred+dx;
     until(Xnm[nxx]>maxX);
     nomkor:=nomkor+1;
   until ((nomkor>2) or not vtlin) ;
end;
{--------------------------------------------}
procedure   TIzometrG.RisOsi2(TekCanvas:TCanvas;ris:boolean;flprin:integer;maprnx,maprny:real);

  var
  ii,jj,wirX,wirY:integer;
  col:Tcolor;
  r,rt:real;
  de:integer;
  KolxE,kolyE,kolxt,kolyt,kolzt:integer;
  strR:string;

  n1,n2:integer;
begin


   de:=4;{������ ������� �� ����}
   kolxE:=self.kolfx;
   kolyE:=self.kolfy;

   kolxt:=self.kolxt0;
   kolyt:=self.kolyt0;


   if ris then begin
     col:=ColOsi3;
   end
   else begin
     col:=FonColIzo;
   end;

   n1:=self.IzoNxx;
   n2:=self.IzoNxy;

   {��� �}
   Point3(TekCanvas,0,0,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
   Line3(TekCanvas,1,0,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
   Point3(TekCanvas,0,1,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
   Line3(TekCanvas,1,1,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);

   for ii:=0 to kolxE do begin
     r:=(1/kolxE)*ii;
     if ii mod kolxt=0 then begin
       LineEd(TekCanvas,r,0,0,0,de+3,col,LWidth,LStyle,2,flprin,maprnx,maprny);
       LineEd(TekCanvas,r,1,0,0,de+3,col,LWidth,LStyle,2,flprin,maprnx,maprny);
       rt:=Xmin_Gr[n1]+(Xmax_Gr[n1]-Xmin_Gr[n1])*r;
       strR:=FormatFloat(FormatX3,rt);
       WText(TekCanvas,0,r,0,0,col,2,flprin,strR,maprnx,maprny);
     end
     else begin
       LineEd(TekCanvas,r,0,0,0,de,col,LWidth,LStyle,2,flprin,maprnx,maprny);
       LineEd(TekCanvas,r,1,0,0,de,col,LWidth,LStyle,2,flprin,maprnx,maprny);
     end;
   end;
   strR:=NameXY[1][n1];
   WText(TekCanvas,5,1.01,0.01,0,col,2,flprin,strR,maprnx,maprny);

   {��� Y}
   Point3(TekCanvas,0,0,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
   Line3(TekCanvas,0,1,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
   Point3(TekCanvas,1,0,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
   Line3(TekCanvas,1,1,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);

   for ii:=0 to KolyE do begin
     r:=(1/kolyE)*ii;

     if ii mod kolyt=0 then begin
       LineEd(TekCanvas,0,r,0,de+3,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
       LineEd(TekCanvas,1,r,0,de+3,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
       rt:=Xmin_Gr[n2]+(Xmax_Gr[n2]-Xmin_Gr[n2])*r;
       strR:=FormatFloat(FormatY3,rt);
       WText(TekCanvas,3,0,r,0,col,2,flPrin,strR,maprnx,maprny);
     end
     else begin
       LineEd(TekCanvas,0,r,0,de,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
       LineEd(TekCanvas,1,r,0,de,0,col,LWidth,LStyle,2,flprin,maprnx,maprny);
     end;
   end;
   strR:=NameXY[1][n2];
   WText(TekCanvas,5,0.01,1.01,0,col,2,flprin,strR,maprnx,maprny);

end;


{----------------------------------------------}
procedure TIzometrG.risSe(TekCanvas:tcanvas;razmer:integer;Ris:boolean;flprin:integer;maprnx,maprny:real);
var

  kollin:integer;
  dy,ymn,ymx,y:real;
  ii:integer;

begin

   ymn:=self.yminGr;
   ymx:=self.ymaxGr;
   kollin:=self.KolUrSe;
   dy:=(ymx-ymn)/(kollin+1);
   y:=ymn+dy;

   for ii:=1 to kollin do begin
     self.Linurv(TekCanvas,razmer,Ris,FlPrin,y,maprnx,maprny);
     Y:=Y+dy;
   end;

end;



{-------------------------------------------}
procedure TIzometrG.RisOsi3(TekCanvas:tcanvas;Ris:boolean;flprin:integer;maprnx,maprny:real);

var
  ii,jj,wirX,wirY:integer;
  col:Tcolor;
  r,rt:real;
  de:integer;
  KolxE,kolyE,kolzE,kolxt,kolyt,kolzt:integer;
  strR:string;
  n1,n2:integer;
begin
   de:=4;{������ ������� �� ����}
   kolxE:=self.kolfx;
   kolyE:=self.kolfy;
   kolZE:=self.kolZE0;
   kolxt:=self.kolxt0;
   kolyt:=self.kolyt0;
   kolzt:=self.kolzt0;

   if ris then begin
     col:=ColOsi3;
   end
   else begin
     col:=FonColIzo;
   end;

   n1:=self.IzoNxx;
   n2:=self.IzoNxy;

   {��� �}
   wirX:=WWir(alpha);
   Point3(TekCanvas,0,0,0,col,LWidth,LStyle,3,flprin,maprnx,maprny);

   Line3(TekCanvas,1,0,0,col,LWidth,LStyle,3,flprin,maprnx,maprny);
   OsX3KoorX:=KoorX;
   OsX3KoorY:=KoorY;
   for ii:=1 to kolxE do begin
     r:=(1/kolxE)*ii;
     LineEd(TekCanvas,r,0,0,0,de,col,LWidth,LStyle,3,flprin,maprnx,maprny);
     if ii mod kolxt=0 then begin
       rt:=Xmin_Gr[n1]+(Xmax_Gr[n1]-Xmin_Gr[n1])*r;
       strR:=FormatFloat(FormatX3,rt);
       WText(TekCanvas,WirX,r,0,0,col,3,flprin,strR,maprnx,maprny);
     end;
   end;
   strR:=NameXY[1][n1];
   if (alpha>180) and (alpha<=270) then
     WText(TekCanvas,WirX,1.1,0,0,col,3,flprin,strR,maprnx,maprny)
   else
     WText(TekCanvas,WirX,1.1,0.1,0,col,3,flprin,strR,maprnx,maprny);

   {��� Y}
   wirY:=wwir(beta);
   Point3(TekCanvas,0,0,0,col,LWidth,LStyle,3,flprin,maprnx,maprny);
   Line3(TekCanvas,0,1,0,col,LWidth,LStyle,3,flprin,maprnx,maprny);
   OsY3KoorX:=KoorX;
   OsY3KoorY:=KoorY;
   for ii:=1 to KolyE do begin
     r:=(1/kolyE)*ii;
     LineEd(TekCanvas,0,r,0,0,de,col,LWidth,LStyle,3,flprin,maprnx,maprny);
     if ii mod kolyt=0 then begin
       rt:=Xmin_Gr[n2]+(Xmax_Gr[n2]-Xmin_Gr[n2])*r;
       strR:=FormatFloat(FormatY3,rt);
       WText(TekCanvas,wirY,0,r,0,col,3,flPrin,strR,maprnx,maprny);
     end;
   end;
   strR:=NameXY[1][n2];

   if (beta>180) and (beta<=270) then
     WText(TekCanvas,WirY,0,1.1,0,col,3,flprin,strR,maprnx,maprny)
   else
     WText(TekCanvas,WirY,0,1.1,0.1,col,3,flprin,strR,maprnx,maprny);

   {��� z}
   Point3(TekCanvas,0,0,0,col,LWidth,LStyle,3,flprin,maprnx,maprny);
   Line3(TekCanvas,0,0,1,col,LWidth,LStyle,3,flprin,maprnx,maprny);
   OsZ3KoorX:=KoorX;
   OsZ3KoorY:=KoorY;
   for ii:=1 to KolzE do begin
     r:=(1/kolzE)*ii;
     LineEd(TekCanvas,0,0,r,de,0,col,LWidth,LStyle,3,flprin,maprnx,maprny);
     if ii mod kolzt=0 then begin
       rt:=Ymin0+(Ymax0-Ymin0)*r;
       strR:=FormatFloat(FormatZ,rt);
       WText(TekCanvas,0,0,0,r,col,3,flprin,strR,maprnx,maprny);
     end;
   end;
   strR:=NameXY[2][self.I_Y];
   WText(TekCanvas,0,0,0,1.1,col,3,flprin,strR,maprnx,maprny);
end;
{-------------------------------------------}
procedure TIzometrG.Trimer(TekCanvas:tcanvas;Ris:boolean;flprin:integer;maprnx,maprny:real);
var
  ii,jj,kolX,kolY:integer;
  dx,dy,x1,y1:real;
  minX,maxX,minY,maxY:real;
  col:TColor;
  razmer:integer;
begin
   razmer:=3;
   for ii:=1 to nm do begin
     Xnm[ii]:=self.XnmFix[ii];
   end;
   minX:=self.XminGr;
   maxX:=self.XmaxGr;
   minY:=self.XminGr;
   maxY:=self.XmaxGr;
   if ris then begin
     col:=self.colorG;

   end
   else begin
     col:=FonColIzo;
   end;

   kolX:=self.kolFx;
   kolY:=self.kolFy;

   Dx:=(maxX-minX)/kolx;
   Dy:=(maxY-minY)/koly;
   X1:=MinX;
   for ii:=1 to kolX+1 do begin
     Y1:=minY;
     for jj:=1 to KolY+1 do begin
       if jj<=kolY then
         PolyLine3(TekCanvas,1,X1,y1,y1+dy,col,self.G_Width,self.G_Style,razmer,flprin,maprnx,maprny);
       if ii<=kolX then
         PolyLine3(TekCanvas,2,Y1,x1,x1+dx,col,self.G_Width,self.G_Style,razmer,flprin,maprnx,maprny);
       y1:=y1+dy;
     end;
     x1:=x1+dx;
   end;

end;


{----------------------------------------------}
procedure TIzometrG.PolyLine3(TekCanvas:tcanvas;ixy:integer;fzna,zna1,zna2:real;col:Tcolor;RWidth:Integer;RStyle:TPenStyle;razmer:integer;flprin:integer;maprnx,maprny:real);
var
  kolr,nf,ni:integer;
  jj:integer;
  dx,x1,xx1,y1,yy1,z1,zz1:real;
  minX,maxX:real;
begin

       if ixy=1 then begin
         kolr:=self.kolRy;
         nf:=self.izoNxx;
         ni:=self.izoNxy;
         Xnm[nf]:=fzna;
       end
       else begin
         kolr:=self.kolRx;
         nf:=self.izoNxy;
         ni:=self.izoNxx;
         Xnm[nf]:=fzna;
       end;

       y1:=fzna;
       x1:=zna1;

       dx:=(zna2-zna1)/kolr;
       minX:=self.XminGr;
       maxX:=self.XmaxGr;
       yy1:=(y1-minX)/(maxX-minX);

       for jj:=1 to kolR+1 do begin
         xx1:=(x1-minX)/(maxX-minX);
         Xnm[ni]:=X1;
         Z1:=Yras(self.I_Y,Xnm);
         if abs(self.Ymax0-self.Ymin0)<0.0000001 then
           zz1:=0
         else
           zz1:=(z1-self.Ymin0)/(self.Ymax0-self.Ymin0);
         if jj=1 then begin
           if ixy=1 then
             Point3(TekCanvas,Yy1,xx1,Zz1,col,RWidth,RStyle,razmer,flPrin,maprnx,maprny)
           else
             Point3(TekCanvas,Xx1,Yy1,Zz1,col,RWidth,RStyle,razmer,flPrin,maprnx,maprny);

         end
         else begin
           if ixy=1 then begin
             Line3(TekCanvas,Yy1,xx1,Zz1,col,RWidth,RStyle,razmer,flprin,maprnx,maprny)
           end
           else begin
             Line3(TekCanvas,Xx1,Yy1,Zz1,col,RWidth,RStyle,razmer,flprin,maprnx,maprny);
           end;
         end;

         X1:=X1+dx;
       end;
end;
{--------------------------------------------}
procedure XplYpl(var Xpl:integer;var Ypl:integer;X1,Y1,Z1:real;razmer:integer;flprin:integer);
begin
  if razmer=3 then begin

   {x1:=KmashX*x1+deltaX;
   y1:=KmashY*y1+deltaY;
   z1:=kmashZ*z1+deltaZ; }

   Xpl:=Round(XOpl
              +X1*DOx*Cos(Ralpha)
              +y1*DOy*Cos(Rbeta));
   Ypl:=Round(YOpl
             - Z1*DOz
             - X1*DOx*Sin(Ralpha)
             - y1*DOy*sin(Rbeta));
  {Ypl:=Round(YOpl
              -Z1*Doz*Cos(Rgamma)
              -X1*Dox*Sin(Ralpha)*sin(RGamma)
              -y1*Doy*sin(Rbeta) *Sin(Rgamma) );}

   (*Xpl:=Xpl{+SdviGor3};
   Ypl:=Ypl{+sdviVer3};*)

   {if flprin then begin
     Xpl:=Round(Xpl*maPrnx);
   end;}

   {if flprin then begin
     Ypl:=Round(Ypl*maPrny);
   end;}

  end
  else begin

    Xpl:=Round(XOpl2+X1*DOx2);
    Ypl:=Round(YOpl2-y1*DOy2);

 (*   Xpl:=Xpl{+SdviGor2};
    Ypl:=Ypl{+sdviver2};*)

    {if flprin then begin
     Xpl:=Round(Xpl*maPrnx);
    end;}
    {if flprin then begin
     Ypl:=Round(Ypl*maPrny);
    end;}

  end;

  KoorX:=Xpl;
  KoorY:=Ypl;

end;{XplYpl}
{---------------------------------------------}
procedure SetFont(TekCanvas:TCanvas;
                  RFontName:string;
                  RFontColor:TColor;
                  RFontStyle:TFontStyles;
                  RFontSize:Integer;
                  flprin:integer;
                  maprnx:real);
var
  RSize:integer;
begin
  with TekCanvas.Font do begin
    Name:=RFontName;
    Color:=RFontColor;
    Style:=RFontStyle;
    Size:=RFontSize;
    if (flprin<3) then begin
       Size:=Round(RFontSize*maprnX);
    end;
  end;
end;{SetFont}
{-------------------------------------------------------}
procedure SpisToch(TekCanvas:TCanvas;maprnx,maprny:real);
var
  kk:integer;
  HiTe,ht,wt:integer;
  iix,iiy:integer;
  xx1,yy1:real;
  strR,strR1:string;
  Nomizo:integer;
  j,i:integer;
  rr:real;
begin
  kk:=0;
  HiTe:=Abs(TekCanvas.Font.Height);
  for i:=1 to kolToch do begin
    iix:=mToch[i].xToch;
    iiy:=mToch[i].yToch;
    xx1:=(iix-XnSe)/(XkSe-XnSe);
    yy1:=(YkSe-iiy)/(YkSe-YnSe);

    str(mToch[i].nToch,StrR);

    strR:=Fors('�.' + StrR,5);

    for nomizo:=1 to kolizo do begin
      kk:=kk+1; {����� ������ ������ �����}
      strR:=strR+' '+Fors(Izo[nomizo].NameG,KolSimNameG);
      with izo[nomizo] do begin
        for j:=1 to Nm do begin
          Xnm[j]:=izo[nomizo].XnmFix[j];
        end;
        Xnm[IzoNxx]:=XminGr+xx1*(XmaxGr-XminGr);
        Xnm[IzoNxy]:=XminGr+yy1*(XmaxGr-XminGr);
        Rr:=YRas(I_Y,Xnm);

        StrR1:=NameXY[2,I_Y]+' = ';
        StrR1:=StrR1+FormatFloat(FormatZ,rr);
        strR:=strR+' '+Fors(strR1,ShiCol);

        strR1:=NameXY[1,IzoNxx]+' = ';
        rr:=Xmin_Gr[IzoNxx]+xx1*(Xmax_Gr[IzoNxx]-Xmin_Gr[IzoNxx]);
        StrR1:=strR1+FormatFloat(FormatX3,rr);
        strR:=strR+' '+Fors(strR1,ShiCol);

        strR1:=NameXY[1,IzoNxy]+' = ';
        rr:=Xmin_Gr[IzoNxy]+yy1*(Xmax_Gr[IzoNxy]-Xmin_Gr[IzoNxy]);
        StrR1:=strR1+FormatFloat(FormatY3,rr);
        strR:=strR+' '+Fors(strR1,ShiCol);

        for j:=1 to Nm do begin
          if (j<>izoNxx) and (j<>izoNxy) then begin
            strR1:=NameXY[1,j]+' = ';
            rr:=XnmFakt[j];
            StrR1:=strR1+FormatFloat(FormatX3,rr);
            strR:=strR+' '+Fors(strR1,ShiCol);
          end;
        end;
      end;

      ht:=TekCanvas.TextHeight(StrR);
      wt:=TekCanvas.TextWidth(StrR);
      HiTe:=HiTe+ht;
      TekCanvas.TextOut(Round((sdviTochGor2)*maPrnx),Round((Yopl2+sdviTochVer2)*maPrny)+Round((HiTe*1.2)),strR);
      strR:='     ';
    end;
  end;

end;{SpisTosh}
{---------------------------------------------}
procedure PrintGr(TekCanvas:TCanvas;flprin:integer;maprnx,maprny:real;ColFon:TColor);
var
  i,j,kk,nomizo,iix,iiy:integer;
  strR,strR1:string;
  HiTe,HiTeP:integer;
  xx1,yy1,rr:real;
  raz:Trect;
  wp,hp,wt,ht:integer;
  rrp,rrt,rte,rpr,rteT,rprT:real;
  ppr,pte:integer;
begin

   if (flprin<3) then begin {flprin:=1-�����;2-��������������� ��������;3-�������}

     raz:=TekCanvas.ClipRect;


     {raz.left:=round(sdviGor*maprnx);
     raz.top:=round(sdviVer*maprny);
     raz.Right:=raz.left+round(printer.PageWidth*maprnx/maPrnxn);
     raz.Bottom:=raz.Top+round(printer.PageHeight*maprny/maPrnyn);}

     tekcanvas.Brush.color:=ColFon;
     tekcanvas.Pen.color:=ColFon;
     Tekcanvas.Pen.Width:=LWidth;
     Tekcanvas.Pen.style:=LStyle;
     
     tekcanvas.Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);

     {ppr:=printer.PageWidth;
     pte:=raz.right-raz.Left;

     Tekcanvas.Font:=TekFont;
     rprT:=printer.canvas.textWidth('1234567890qwertyuiopasdfghjklzxcvbnm');
     rteT:=Tekcanvas.textWidth('1234567890qwertyuiopasdfghjklzxcvbnm');
     rrP:=(rprT/rpr);
     rrT:=(rteT/rte); }
   end;


   SetFont(TekCanvas,
           GrFont.Name,
           GrFont.Color,
           GrFont.Style,
           GrFont.Size,
           flPrin,
           maprnx);

   if kolizo>0 then begin
     if ZagGr<>'' then begin
       WZag(TekCanvas,flprin,ZagGr,maprnx,maprny);
     end;

     for nomizo:=1 to kolizo do begin
       if FlRadBut1 then begin
         Izo[NomIzo].Trimer(TekCanvas,True,Flprin,maprnx,maprny);
       end;

       if FlRadBut2 then begin
         Izo[NomIzo].risSe(tekCanvas,2,True,Flprin,maprnx,maprny);
       end;

       if FlRadBut3 then begin
         Izo[NomIzo].risSe(tekCanvas,3,True,Flprin,maprnx,maprny);
       end;
     end;

     if FlRadBut2 then begin
       if koltoch>0 then begin
         {������ ����� � �������� ������ �����}

        { RisToch0(TekCanvas,1,kolToch,flprin,sdviGor2,SdviVer2,maPrnX,maPrnY);}
         if flprin>1 then begin
           RisToch0(TekCanvas,1,kolToch,flprin,maPrnX,maPrnY);
           SpisToch(TekCanvas,maprnx,maprny); {������ �����}
         end;
     (*
         kk:=0;
         {TekCanvas.Font.Size:=8;
         TekCanvas.Font.name:='Courier New';
         TekCanvas.Font.Pitch:=fpFixed;     }
         HiTe:=Abs(TekCanvas.Font.Height);
         HiTeP:=Abs(printer.Canvas.Font.Height);
         for i:=1 to kolToch do begin
           iix:=mToch[i].xToch;
           iiy:=mToch[i].yToch;
           xx1:=(iix-XnSe)/(XkSe-XnSe);
           yy1:=(YkSe-iiy)/(YkSe-YnSe);
           str(mToch[i].nToch,StrR);
           strR:=Fors('�.' + StrR,5);
           for nomizo:=1 to kolizo do begin
             kk:=kk+1; {����� ������ ������ �����}
             strR:=strR+' '+Fors(Izo[nomizo].NameG,KolSimNameG);
             with izo[nomizo] do begin
               for j:=1 to Nm do begin
                 Xnm[j]:=izo[nomizo].XnmFix[j];
               end;
               Xnm[IzoNxx]:=XminGr+xx1*(XmaxGr-XminGr);
               Xnm[IzoNxy]:=XminGr+yy1*(XmaxGr-XminGr);
               Rr:=YRas(I_Y,Xnm);
               StrR1:=NameXY[2,I_Y]+' = ';
               StrR1:=StrR1+FormatFloat(FormatZ,rr);
               strR:=strR+' '+Fors(strR1,ShiCol);
               strR1:=NameXY[1,IzoNxx]+' = ';
               rr:=Xmin_Gr[IzoNxx]+xx1*(Xmax_Gr[IzoNxx]-Xmin_Gr[IzoNxx]);
               StrR1:=strR1+FormatFloat(FormatX3,rr);
               strR:=strR+' '+Fors(strR1,ShiCol);
               strR1:=NameXY[1,IzoNxy]+' = ';
               rr:=Xmin_Gr[IzoNxy]+yy1*(Xmax_Gr[IzoNxy]-Xmin_Gr[IzoNxy]);
               StrR1:=strR1+FormatFloat(FormatY3,rr);
               strR:=strR+' '+Fors(strR1,ShiCol);
               for j:=1 to Nm do begin
                 if (j<>izoNxx) and (j<>izoNxy) then begin
                   strR1:=NameXY[1,j]+' = ';
                   rr:=XnmFakt[j];
                   StrR1:=strR1+FormatFloat(FormatX3,rr);
                   strR:=strR+' '+Fors(strR1,ShiCol);
                 end;
               end;
             end;
            { if flprin then begin}
              {HiTe:=Abs(TekCanvas.Font.Height)+;
               HiTeP:=Abs(printer.Canvas.Font.Height);}
           {   TekCanvas.TextOut(Round((Xopl2+sdviGor2+sdviTochGor2+sdviGor)*maPrnx),Round((Yopl2+sdviver2-sdviTochVer2+sdviver)*maPrny)+Round((HiTe*1.2)*kk),strR);}
             {  TekCanvas.Font:=GrFont;}
               ht:=TekCanvas.TextHeight(StrR);
               wt:=TekCanvas.TextWidth(StrR);

               hp:=Printer.Canvas.TextHeight(StrR);
               wp:=Printer.Canvas.TextWidth(StrR);
               HiTe:=HiTe+ht;
               HiTeP:=HiTeP+hp;
               TekCanvas.TextOut(Round((sdviTochGor2)*maPrnx),Round((Yopl2+sdviTochVer2)*maPrny)+Round((HiTe*1.2)),strR);
             {end
             else begin
               TekCanvas.TextOut(Round(Xopl2+sdviGor2+sdviTochGor2+sdviGor),Round(Yopl2+sdviver2-sdviTochVer2+sdviver)+Round((HiTe*1.2)*kk),strR);
             end;}
          {   printer.Canvas.Font.Size:=kk;
             TekCanvas.Font.Size:=kk; }
            { strR1:= IntToStr(kk)+ ' ht=' + IntToStr(ht) + ' wt=' + IntToStr(wt)+ ' hp=' + IntToStr(hp) + ' wp=' + IntToStr(wp);}
            { printer.Canvas.Font.Size:=8;
             TekCanvas.Font.Size:=8;}
            { TekCanvas.TextOut(400,400+kk*hitep,strR1);}
           {  printer.Canvas.Font.Size:=kk;
             TekCanvas.Font.Size:=kk;  }
             strR:='     ';
           end;
         end; *)


       end;
     end;
     {PixelsPerInch}
     {������ ���}
     if teknomizo>0 then begin
       if Flradbut1 or Flradbut3 then
         izo[teknomizo].risOsi3(Tekcanvas,True,flprin,maprnx,maprny);
       if FlRadBut2 then
         izo[teknomizo].risOsi2(TekCanvas,True,flprin,maprnx,maprny);

       {tekcanvas.pen.color:=clBlack;
       tekcanvas.moveTo(xopl,yopl);
       tekcanvas.lineto(xopl+100,yopl-100);}

     end;
     if flprin=1 then begin
       if flRectangle2 and (Flradbut1 or Flradbut3) then begin
         FlRectangle2:=False;
         RisRectangle(TekCanvas,FlRectangle2,X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2);
       end;
       if flRectangle1 and Flradbut2 then begin
         FlRectangle1:=False;
         RisRectangle(TekCanvas,FlRectangle1,X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1);
       end;
     end;
   end;
end;{}
{-------------------------------------------}

constructor TIzometrG.Create;
var
 ii:integer;
 StrR:string;

begin
  inherited Create;
end;
{-------------------------------------------}
destructor TIzometrG.Destroy;
begin
  inherited Destroy;
end;
{--------------------------------------------}
procedure WZag(TekCanvas:TCanvas;flprin:integer;StrR:string;maprnx,maprny:real);
var
  kx,ky,HiTe:integer;
begin
     if Flradbut1 then begin
       xplYpl(kx,ky,0,0,1,3,flprin);
     end;
     if Flradbut2 then begin
       xplYpl(kx,ky,0,1,0,2,flprin);
     end;
     if Flradbut3 then begin
       xplYpl(kx,ky,0,0,1,3,flprin);
     end;

     {TekCanvas.Font.Size:=8;
     TekCanvas.Font.name:='Courier New';
     TekCanvas.Font.Pitch:=fpFixed;}



     {TekCanvas.Font:=GrFont;}

     HiTe:=abs(TekCanvas.Font.Height);

    { TekCanvas.TextOut(round((kx+sdviGor)*maprnx),round((ky+sdviver)*maprny)-HiTe*3,strR);}
     TekCanvas.TextOut(round(kx*maprnx),round(ky*maprny)-HiTe*3,strR);
end;{WZag}
{--------------------------------------------}
function Fors(stroka:string;k:integer):string;
var
  strP:string;
begin
  strP:='                                                        ';
  stroka:=stroka+strP;
  Fors:=copy(stroka,1,k);
end;
{--------------------------------------------}
function UDPP(stroka:string):string;
    var
      l,i:integer;
    begin
      l:=LENGTH(stroka);
      i:=l;
      while (i>0)and(stroka[i]=' ') do
        i:=i-1;
      if i=0 then
        begin
          UDPP:=' ';
        end
      else
        UDPP:=COPY(stroka,1,i);
  end;{UDPP}
{------------------------------}
  function UDP(stroka:string):string;
    var
      l,i:integer;
    begin
      l:=LENGTH(stroka);
      i:=l;
      while (i>0)and(stroka[i]=' ') do
        i:=i-1;
      if i=0 then
        UDP:=''
      else
        begin
          stroka:=COPY(stroka,1,i);
          l:=i;
          i:=1;
          while (i<=l)and(stroka[i]=' ') do
            i:=i+1;
          UDP:=COPY(stroka,i,l-i+1);
        end;
    end;{UDP}
{----------------------------------------------------------}
  function ZIF(ss:integer;st:string;var dr:integer):integer;
    var
      l,n,k,i,znak:integer;
    begin
      n:=0;
      znak:=1;
      L:=Length(st);
      dr:=0;
      for i:=1 to L do
	begin
	  if st[i]<>' ' then
	    begin
	      k:=POS(st[i],'0123456789ABCDEF');
	      if k>0 then
		begin
		  n:=n*ss+k-1;
                  if dr>0 then
                    dr:=dr+1;
		end
              else begin
                if st[i]='.' then begin
                  dr:=1;
                end;
                if st[i]='-' then begin
                  znak:=-1;
                end;
              end;
	    end;
	end;
      
      if dr>0 then
        dr:=dr-1;
      zif:=n*znak;
    end;{ZIF}

{--------------------------------------------}
{function GetValue(strR:string):integer;
const
  DefValue:integer=0;

begin
  try
    
    result:=StrToInt(StrR);
  except

    on EConvertError do
      Result := DefValue;
    end;
end; }
{-----------------------------------------------------------}
procedure RasGrSe;  {������ ������ �������}
var
  i:integer;
  xx1,yy1:real;
  {XnseP,XkseP,YnseP,YkseP:integer;}
begin
  {XnSeP:=XnSe;
  YkSeP:=YkSe;
  XkSeP:=XkSe;
  YnSeP:=YnSe;}

  {XnSe:=Xopl2+sdviGor2;
  YkSe:=YOpl2+sdviver2;}

  XnSe:=Xopl2;
  YkSe:=YOpl2;

  XkSe:=XnSe+Dox2;
  YnSe:=YkSe-Doy2;

  for i:=1 to kolToch do begin
    xx1:=mToch[i].xx1Toch;
    yy1:=mToch[i].yy1Toch;

    mToch[i].xToch:=Round(XnSe+(XkSe-XnSe)*xx1);
    mToch[i].yToch:=Round(YkSe-(YkSe-YnSe)*yy1);
  end;
end;
{-----------------------------------------------------------}
procedure SaveFileNast;
begin
  try

  assign(fconf,'config.txt');
  rewrite(fconf);
  writeln(fconf,rfolder);
  close(fconf);
  except
    on EInOutError   do begin
      MessageDlg('���������� ������� ���� config.txt' , mtWarning, [mbOk], 0);

    end;

  end;
end;
{-----------------------------------------}
procedure LoadFileNast;
begin
 try

 assign(fconf,'config.txt');
 reset(fconf);
 readln(fconf,rfolder);
 rdrive:=rfolder[1];
 close(fconf);

  except
    on EInOutError   do begin
      MessageDlg('��� ����� config.txt' , mtWarning, [mbOk], 0);
      rfolder:='c:';
      rdrive:=rfolder[1];
      SaveFileNast;
    end;
 end;
end;
{----------------------------------------------}
procedure WXoplYopl;
var
  xXopl,xYopl,yXopl,yYopl:integer;
begin
      if (alpha>90) and (alpha<270) then begin
        xXOpl:=Round(DOx*(-cos(Ralpha)))+PoleX;
      end
      else begin
        xXOpl:=PoleX;
      end;
      if (alpha>0) and (alpha<180) then begin
        xYOpl:=Lver-PoleY;
      end
      else begin
        xYOpl:=Lver + Round(DOx*sin(Ralpha))-PoleY;
      end;

      if (beta>90) and (beta<270) then begin
        yXOpl:=Round(DOy*(-cos(Rbeta)))+PoleX;
      end
      else begin
        yXOpl:=PoleX;
      end;
      if (beta>0) and (beta<180) then begin
        yYOpl:=Lver-PoleY;
      end
      else begin
        yYOpl:=Lver + Round(DOy*sin(Rbeta))-PoleY;
      end;

      Xopl:=xXOpl;
      if yXOpl>Xopl then
        Xopl:=yXopl;
      Yopl:=xYOpl;
      if yYOpl<Yopl then
        Yopl:=yYopl;

end;

{-------------------------------------------}
constructor TypToch.Create;
begin
  inherited Create;
  nToch:=1;
  xToch:=0;
  YToch:=0;
  yy1Toch:=0;
  xx1Toch:=0;

end;
{-------------------------------------------}
destructor TypToch.Destroy;
begin
  inherited Destroy;
 
end;
{-------------------------------------------}
constructor TypIzo.Create;
var
 ii:integer;
 StrR:string;
begin
    inherited Create;
    colorG:=clBlack;
    G_Width:=LWidth;
    G_Style:=LStyle;

    I_Y:=1; {����� ������� �������}
    nameG:='������01';
    KolFX:=15; {���������� ����� �� X=10}
    KolFY:=15; {���������� ����� �� Y=10}

    kolZE0:=20;
    kolxt0:=5;
    kolyt0:=5;
    kolzt0:=5;

    KolRX:=10; {���������� ����� ����� ������� �� X=10}
    KolRY:=10; {���������� ����� ����� ������� �� Y=10}
    kolUrSe:=40; {���������� ������� �������}
    FormatZ:='0.####E+00';
    for ii:=1 to MaxNm do begin
      self.XnmFix[ii]:=0.0;
      self.XnmFakt[ii]:=Xmin[ii]+(Xmax[ii]-Xmin[ii])/2;
    end;

    IzoNxx:=1;
    izoNxy:=2;

    Nom:=1;

    YminGr:=0;
    YmaxGr:=0;
    Ymin0:=0;
    Ymax0:=0;


    XminGr:=-Gran; {������� �������������� ����������� ���������� ��� �������}
    XmaxGr:=Gran;



end;
{-------------------------------------------}
destructor TypIzo.Destroy;
begin
  inherited Destroy;
end;
{-------------------------------------------}
function TypIzo.Yproiz(X:arrayX;I,N:integer;Var Rx:real):real;
var
  rr,rb:real;
  ii:integer;

begin

  rr:=0;
  for ii:=1 to Nm do begin
    rb:=0;
    if n>ii then
      rb:=bb[i][n][ii]*X[ii]
    else
      if n<ii then
        rb:=bb[i][ii][n]*X[ii];
    rr:=rr+rb;
  end;
  rr:=rr+B[I][N];
  if abs(B2[I][N])>0.0000001 then
    Rx:=-(rr)/(2*B2[I][N])
  else
    if rr>0 then
      Rx:=self.YminGr
    else
      Rx:=self.YmaxGr;

  X[n]:=Rx;

  Yproiz:=Yras(I,X);
end;
{---------------------------------------------}
procedure TypIzo.YMinMax(Var Ymin:real;Var YMax:real);
var
  i,ii:integer;
  RYmin,RYmax:real;
  YXext,Xext:real;
  smax,smin,DX,DY:real;
  YXmin,YXmax:real;
  Nxx,Nxy:integer;
  kolX,KolY:integer;
  Xnm:arrayX;
  begin

  Xnm :=self.XnmFix;
  Nxx :=self.IzoNxx;
  Nxy :=self.izoNxy;
  KolX:=self.KolFX;
  KolY:=self.KolFY;
  I   :=self.I_Y;
  smax:=self.XmaxGr;
  smin:=self.XminGr;

  Xnm[NxX]:=self.XminGr;
  Xnm[NxY]:=self.XminGr;

  Ymax    :=Yras(I,Xnm);
  Ymin    :=Ymax;

  DY:=(smax-smin)/KolY;
  for ii:=1 to KolY+1 do begin

    YXext:=Yproiz(Xnm,I,Nxx,Xext);

    Xnm[NxX]:=smin;
    YXmin:=Yras(I,Xnm);

    Xnm[NxX]:=smax;
    YXmax:=Yras(I,Xnm);

    RYmin:=YXmin;
    RYmax:=YXmax;
    if (Xext>=smin) and (Xext<=smax) then begin
      Xnm[Nxx]:=Xext;
      {YXext:=Yras(I,Xnm);}
      if RYmin>YXext then
        RYmin:=YXext;
      if RYmax<YXext then
        RYmax:=YXext;
    end;
    if RYmin>YXmax then
      RYmin:=YXmax;
    if RYmax<YXmax then
      RYmax:=YXmax;

    if Ymin>RYmin then
      Ymin:=RYmin;
    if Ymax<RYmax then
      Ymax:=RYmax;

    Xnm[NxY]:=Xnm[NxY]+DY;
    if ii=kolY+1 then
      Xnm[NxY]:=smax;
  end;
{------------}
  Xnm[Nxx]:=smin;
  Xnm[Nxy]:=smin;
  DX:=(smax-smin)/KolX;
  for ii:=1 to kolX+1 do begin

    YXext:=Yproiz(Xnm,I,Nxy,Xext);

    Xnm[Nxy]:=smin;
    YXmin:=Yras(I,Xnm);
    Xnm[NxY]:=smax;
    YXmax:=Yras(I,Xnm);

    RYmin:=YXmin;
    RYmax:=YXmax;
    if (Xext>=smin) and (Xext<=smax) then begin
      Xnm[Nxx]:=Xext;
     { YXext:=Yras(I,Xnm);}
      if RYmin>YXext then
        RYmin:=YXext;
      if RYmax<YXext then
        RYmax:=YXext;
    end;
    if RYmin>YXmax then
      RYmin:=YXmax;
    if RYmax<YXmax then
      RYmax:=YXmax;

    if Ymin>RYmin then
      Ymin:=RYmin;
    if Ymax<RYmax then
      Ymax:=RYmax;

    Xnm[Nxx]:=Xnm[Nxx]+Dx;
    if ii=kolX+1 then
      Xnm[Nxx]:=smax;
  end;

end;{Yminmax}
{-------------------------------------------}
function Yras(I:integer;X:ArrayX):real;
  var
    II,L:integer;
  begin
    Result:=B0[I];
    for II:=1 to Nm do begin
      Result:=Result+B[I][II]*X[II]+B2[I][II]*Sqr(X[II]);
      if II>1 then begin
        for L:=1 to II-1 do begin
          Result:=Result+BB[I][II,L]*X[II]*X[L];
        end;
      end;
    end;
  end;{Yras}
{--------------------------------------------}
end.
