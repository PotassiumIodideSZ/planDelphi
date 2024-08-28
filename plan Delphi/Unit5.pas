unit Unit5;

interface                    


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,Printers, ComCtrls, Grids, Mask, Spin,  Buttons, unit4;


type
  TForm5 = class(TForm)
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    Panel3: TPanel;
    ListBox1: TListBox;
    Splitter5: TSplitter;
    Panel5: TPanel;
    Panel2: TPanel;
    Splitter6: TSplitter;
    Panel7: TPanel;
    Splitter7: TSplitter;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Image2: TImage;
    Image1: TImage;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Button6: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    UpDown2: TUpDown;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    UpDown3: TUpDown;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    UpDown4: TUpDown;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    UpDown5: TUpDown;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    UpDown6: TUpDown;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    UpDown7: TUpDown;
    SpeedButton1: TSpeedButton;
    Button7: TButton;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure pereris(IndToch:integer);
  

    procedure FormShow(Sender: TObject);

    procedure OBNOW;
    procedure OBNOWSe(razmer:integer);
    procedure NZStringGrid1;

    {procedure PrintGr(TekCanvas:Tcanvas);}



   {function  OnomFT(xx1,yy1:real):integer;}



    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure ListBox1Click(Sender: TObject);
    procedure MaskEdit1DblClick(Sender: TObject);
    procedure MaskEdit2DblClick(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown7Click(Sender: TObject; Button: TUDBtnType);
    procedure NZLabel;
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit7KeyPress(Sender: TObject; var Key: Char);

    procedure ZGridString2;
    {procedure Button4Click(Sender: TObject);}
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button7Click(Sender: TObject);

    procedure SaveBitMap(TekCanvas:TCanvas;X1,X2,Y1,Y2:integer);


  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form5: TForm5;
  ArrayMash:array[1..maxNom,1..3] of real;


  function MaxNomIzo:integer;
implementation

uses
  unit2,unit3, plan, Unit10;
var
  {sdviGor,sdviVer:integer;}  {сдвиг, который вносит данная форма}
  maPrnXF,maPrnYF:real;{коэффициенты масштабирования для данной формы}
{$R *.DFM}
{-----------------------------------------------}
function MaxNomIzo:integer;
var
  l,ii,kk,n,jj:integer;
  ch,strR:string;
  st:integer;
begin
  result:=0;
  for ii:=1 to kolIzo do begin
    StrR:=copy(izo[ii].NameG,1,5);
    L:=Length(StrR);
    n:=0;
    jj:=L;
    st:=1;
    while jj>0  do begin
      ch:=copy(StrR,jj,1);
      if ch<>' ' then begin
        kk:=Pos(copy(StrR,jj,1),'0123456789');
        if  kk>0 then begin
          n:=n+st*(kk-1);
          st:=st*10;
        end
        else begin
          Break;
        end;
      end;
      jj:=jj-1;
    end;
    if n>result then begin
      result:=n;
    end;
  end;
end;{}
{---------------------------------------------}
procedure TForm5.Button1Click(Sender: TObject);
var
  RYmin,RYmax:real;
  IForm:integer;
  kk:integer;
  strR:string;
  RFont:TFont;
begin

  if KolIzo<MaxKolIzo then begin
    OkForm3:=False;
    kk:=MaxNomIzo;
    izoR.nameG:='Гр.' + IntToStr(kk+1);

    IForm:=Form3.ShowModal;

    if OkForm3 then begin
      KolIzo:=KolIzo+1;
      Izo[KolIzo]:=TIzometrG.Create;
      with izo[kolizo] do begin

        colorG:=IzoR.colorG;   {цвет линии графика}
        G_Width:=Izor.G_Width; {толщина линии графика}
        G_Style:=Izor.G_Style; {стиль линии графика}


        I_Y   :=izor.I_Y; {Номер функции отклика}
        nameG  :=IzoR.NameG;
        KolFX :=IzoR.KolFX ; {количество фиксаций по X=10}
        KolFY :=IzoR.KolFY ; {количество фиксаций по Y=10}

        kolZE0:=IzoR.kolZE0;  // Колич отметок о оси Z
        kolxt0:=IzoR.kolxt0;  // Шаг надписей по x
        kolyt0:=IzoR.kolyt0;  // Шаг надписей по y
        kolzt0:=IzoR.kolzt0;  // Шаг надписей по z


        KolRX :=IzoR.KolRX ; {количество разбиений по X=100}
        KolRY :=IzoR.KolRY ; {количество разбиений по Y=100}
        KolUrSe :=IzoR.KolUrSe;
        XnmFix:=IzoR.XnmFix;
        XnmFakt:=IzoR.XnmFakt;
        izoNxx:=IzoR.izoNxx;
        izoNxy:=IzoR.izoNxy;
        Nom   :=IzoR.Nom   ;
        FormatZ:=IzoR.FormatZ;
        YMinMax(RYmin,RYmax);
        YminGr:=RYmin;
        YmaxGr:=RYmax;
        if not FlY00[I_Y][Nom] then begin
          ZnYmin0[I_Y][Nom]:=RYmin;
          ZnYmax0[i_Y][Nom]:=RYmax;
          if Iraschet then begin
            FlY00[I_Y][Nom]  :=True;
          end;
        end;
        Ymin0:=ZnYmin0[I_Y][Nom];
        Ymax0:=ZnYmax0[I_Y][Nom];
        nameG:=Copy(nameG + '       ',1,5) + ' / '+NameXY[2,i_Y] +
              ' / ' +  NameXY[1,izoNxx] + ' / ' + NameXY[1,izoNxy] ;
        ListBox1.Items.Add(nameG);

        ListBox1.ItemIndex:=kolizo-1;

        strR:=listbox1.Items[kolizo-1];
        teknomizo:=Onomizo(strR);

        NZLabel;


        pereris(2);
        {if kolToch>0 then begin
          if FlRadBut2 then begin
            RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

          end;
        end;}
  { else begin
     for ii:=kolToch downto 1 do begin

      mToch[ii].bitmap.Free;
      mToch[ii].destroy;
    end;
    kolToch:=0;
   end;}

        NZStringGrid1;
      end;
    end;
  end
  else begin
    messageDlg('Слишком много графиков',mtInformation,[mbOk],0);
  end;

end;
{---------------------------------------------}
procedure TForm5.Button2Click(Sender: TObject);
var
  jj,ii,kk:integer;
  rymin,rymax:real;
  strR:string;
  rFont:Tfont;
begin

   OkForm3:=False;
   nomizo:=0;
   kk:=ListBox1.items.Count;
   if kk>0 then begin
     jj:=ListBox1.itemIndex;
     if (jj<0) or (jj>=kk) then begin
       exit;
     end;
     strR:=listBox1.items[jj];
     nomIzo:=ONomIzo(strR);
     if NomIzo=0 then begin
       messageDlg('график не найден',mtInformation,[mbOk],0);
       exit;
     end;

     with Izor do begin
         colorG:=izo[nomizo].colorG;
         G_Width:=Izo[nomizo].G_Width; {толщина линии графика}
         G_Style:=Izo[nomizo].G_Style; {стиль линии графика}

         I_Y   :=izo[nomizo].I_Y; {Номер функции отклика}
         nameG  :=izo[nomizo].NameG;
         KolFX :=izo[nomizo].KolFX ; {количество фиксаций по X=10}
         KolFY :=izo[nomizo].KolFY ; {количество фиксаций по Y=10}

         kolZE0:=Izo[nomizo].kolZE0;  // Колич отметок о оси Z
         kolxt0:=Izo[nomizo].kolxt0;  // Шаг надписей по x
         kolyt0:=Izo[nomizo].kolyt0;  // Шаг надписей по y
         kolzt0:=Izo[nomizo].kolzt0;  // Шаг надписей по z


         KolRX :=izo[nomizo].KolRX ; {количество разбиений по X=100}
         KolRY :=izo[nomizo].KolRY ; {количество разбиений по Y=100}
         KolUrSe :=izo[nomizo].KolUrSe ;
         XnmFix:=izo[nomizo].XnmFix;
         XnmFakt:=izo[nomizo].XnmFakt;
         izoNxx:=izo[nomizo].izoNxx;
         izoNxy:=izo[nomizo].izoNxy;
         Nom   :=izo[nomizo].Nom   ;
         YminGr:=izo[nomizo].YminGr;
         YmaxGr:=izo[nomizo].YmaxGr;
         Ymin0:=izo[nomizo].Ymin0;
         Ymax0:=izo[nomizo].Ymax0;
         XminGr:=izo[nomizo].XminGr;
         XmaxGr:=izo[nomizo].XmaxGr;
         FormatZ:=Izo[nomizo].FormatZ;
       end;


     Form3.ShowModal;
     if OkForm3 then begin

       with Izo[NomIzo] do begin
         colorG:=IzoR.colorG;
         G_Width:=Izor.G_Width; {толщина линии графика}
         G_Style:=Izor.G_Style; {стиль линии графика}

         I_Y   :=izor.I_Y; {Номер функции отклика}
         nameG  :=IzoR.NameG;
         KolFX :=IzoR.KolFX ; {количество фиксаций по X=10}
         KolFY :=IzoR.KolFY ; {количество фиксаций по Y=10}

         kolZE0:=IzoR.kolZE0;  // Колич отметок о оси Z
         kolxt0:=IzoR.kolxt0;  // Шаг надписей по x
         kolyt0:=IzoR.kolyt0;  // Шаг надписей по y
         kolzt0:=IzoR.kolzt0;  // Шаг надписей по z

         KolRX :=IzoR.KolRX ; {количество разбиений по X=100}
         KolRY :=IzoR.KolRY ; {количество разбиений по Y=100}
         KolUrSe :=IzoR.KolUrSe ;
         XnmFix:=IzoR.XnmFix;
         XnmFakt:=IzoR.XnmFakt;
         izoNxx:=IzoR.izoNxx;
         izoNxy:=IzoR.izoNxy;
         Nom   :=IzoR.Nom   ;
         FormatZ:=IzoR.FormatZ;
         YMinMax(RYmin,RYmax);
         YminGr:=RYmin;
         YmaxGr:=RYmax;

         if not FlY00[I_Y][Nom] then begin
           ZnYmin0[I_Y][Nom]:=RYmin;
           ZnYmax0[I_Y][Nom]:=RYmax;
           FlY00[I_Y][Nom]  :=True;
         end;
         Ymin0:=ZnYmin0[I_Y][Nom];
         Ymax0:=ZnYmax0[I_Y][Nom];
         ListBox1.Items[jj]:=nameG;
         NzLabel;

         pereris(2);
         {if kolToch>0 then begin
           if FlRadBut2 then begin
             RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

           end;
         end;}

         NZStringGrid1;
       end;
     end;
   end;
end;

(*
 procedure TForm1.Button1Click(Sender: TObject);

var
 BitMap1 : TBitMap;
begin
  try
    BitMap1 := TBitMap.Create;
    BitMap1.LoadFromResourceName(HInstance,'THEBITMAP');
    Canvas.Draw(12,12,BitMap1);
  finally
    BitMap1.Free;
  end;
end;


 type
  TFancyControl = class(TGraphicControl)
  protected
    procedure Paint; override;	{ override the Paint method }
  end;
  procedure TFancyControl.Paint;
var
  Bitmap: TBitmap;	{ temporary variable for the offscreen bitmap }
begin
  Bitmap := TBitmap.Create;	{ construct the bitmap object }
 try
    { draw on the bitmap }
   { copy the result into the control's canvas }
 finally
    Bitmap.Free;	{ destroy the bitmap object }
  end;
end; *)
{---------------------------------------------}
procedure TForm5.Button3Click(Sender: TObject);
var
  i1,j1,k1:integer;
  strR:string;
  RFont:TFont;
begin

 k1:=ListBox1.items.count;
 if k1>0 then begin
   j1:=ListBox1.itemIndex;
   if (j1<0) and (j1>=k1) then begin
     exit;
   end;
   NomIzo:=0;
   strR:=listBox1.items[j1];
   NomIzo:=ONomIzo(StrR);

   if nomizo=0 then begin
     messageDlg('график не найден',mtInformation,[mbOk],0);
     exit;
   end;

     if nomizo<kolizo then begin
       for i1:=nomIzo To KolIzo-1 do begin

         izo[i1].colorG:=izo[i1+1].colorG;
         izo[i1].G_Width:=izo[i1+1].G_Width;
         izo[i1].G_Style:=izo[i1+1].G_Style;
         izo[i1].I_Y   :=izo[i1+1].I_Y; {Номер функции отклика}
         izo[i1].nameG  :=izo[i1+1].NameG;
         izo[i1].KolFX :=izo[i1+1].KolFX ; {количество фиксаций по X=10}
         izo[i1].KolFY :=izo[i1+1].KolFY ; {количество фиксаций по Y=10}

         izo[i1].kolZE0:=Izo[i1+1].kolZE0;  // Колич отметок о оси Z
         izo[i1].kolxt0:=Izo[i1+1].kolxt0;  // Шаг надписей по x
         izo[i1].kolyt0:=Izo[i1+1].kolyt0;  // Шаг надписей по y
         izo[i1].kolzt0:=Izo[i1+1].kolzt0;  // Шаг надписей по z


         izo[i1].KolRX :=izo[i1+1].KolRX ; {количество разбиений по X=100}
         izo[i1].KolRY :=izo[i1+1].KolRY ; {количество разбиений по Y=100}
         izo[i1].KolUrSe :=izo[i1+1].KolUrSe ;
         izo[i1].XnmFix:=izo[i1+1].XnmFix;
         izo[i1].XnmFakt:=izo[i1+1].XnmFakt;
         izo[i1].izoNxx:=izo[i1+1].izoNxx;
         izo[i1].izoNxy:=izo[i1+1].izoNxy;
         izo[i1].Nom   :=izo[i1+1].Nom   ;
         izo[i1].YminGr:=izo[i1+1].YminGr;
         izo[i1].YmaxGr:=izo[i1+1].YmaxGr;
         izo[i1].Ymin0:=izo[i1+1].Ymin0;
         izo[i1].Ymax0:=izo[i1+1].Ymax0;
         izo[i1].XminGr:=izo[i1+1].XminGr;
         izo[i1].XmaxGr:=izo[i1+1].XmaxGr;
         izo[i1].FormatZ:=izo[i1+1].FormatZ;
       end;
     end;
     Izo[KolIzo].destroy;
     KolIzo:=KolIzo-1;

     for i1:=j1 to k1-2 do begin
       listBox1.items[i1]:=listBox1.items[i1+1];
     end;

     listBox1.items.Delete(k1-1);

     nomizo:=0;
     k1:=ListBox1.items.Count;
     if k1>0 then begin
       if j1<k1 then begin
         ListBox1.itemIndex:=j1;
         strR:=listbox1.Items[j1];
         teknomizo:=Onomizo(StrR);
       end
       else begin
         ListBox1.itemIndex:=k1-1;
         strR:=listbox1.Items[k1-1];
         teknomizo:=Onomizo(StrR);
         j1:=k1-1;
       end;
       StrR:=listBox1.items[j1];
       NomIzo:=ONomIzo(StrR);

     end;
     NZLabel;

     pereris(2);
     {if kolToch>0 then begin
       if FlRadBut2 then begin
         RisToch(Image1.canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

       end;
     end;}

     NZStringGrid1;
 end;
end;
{---------------------------------------------}
procedure Tform5.OBNOW;
var
  ii,jj:integer;
  kk:integer;
  strR:string;
  raz:Trect;
  begin
   (*
   {raz:=clientRect;
   canvas.Brush.color:=FonColIzo;
   canvas.Pen.color:=FonColIzo;
   canvas.Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);}
   if FlRadBut2 then begin
     with Image1.Canvas do begin
       raz:=ClientRect;
       Brush.color:=FonColIzo;
       Pen.color:=clBlack;{FonColIzo;}
       Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);
     end;
   end
   else begin
     with Image2.Canvas do begin
       raz:=image2.ClientRect;
       Brush.color:=FonColIzo;
       Pen.color:=clBlack;
       Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);
     end;
   end;

   if kolizo>0 then begin
     kk:=ListBox1.items.count;
     if kk=0 then begin
       exit;
     end;
     jj:=ListBox1.itemIndex;
     nomizo:=0;
     if (jj<0) and (jj>=kk) then begin
       jj:=0;
       ListBox1.ItemIndex:=0;
       teknomizo:=0;
     end;

     for ii:=1 to kolizo do begin
       nomizo:=ii;
       if FlRadBut2 then begin
         Izo[NomIzo].Trimer(Image1.Canvas,True,False,maPrnXF,maPrnYF);
       end
       else begin
         Izo[NomIzo].Trimer(Image2.Canvas,True,False,maPrnXF,maPrnYF);
       end;
       listBox1.ItemIndex:=ii-1;
     end;
     listBox1.ItemIndex:=jj;
     StrR:=listBox1.Items[jj];
     nomizo:=ONomIzo(StrR);
     teknomizo:=nomizo;
     if nomizo>0 then begin
        if FlRadBut2 then begin
          izo[nomizo].risOsi3(Image1.Canvas,True,False,maPrnXF,maPrnYF);
        end
        else begin
          izo[nomizo].risOsi3(Image2.Canvas,True,False,maPrnXF,maPrnYF);
        end;
     end;
     if FlRadBut2 then begin
       Wzag(Image1.Canvas,False,ZagGr,maPrnXF,maPrnYF);
     end
     else begin
       Wzag(Image2.Canvas,False,ZagGr,maPrnXF,maPrnYF);
     end;
   end;
   *)
    PrintGr(Image2.canvas,1,1.0,1.0,FonColIzo);
end;{}
{---------------------------------------------}
procedure Tform5.OBNOWSe(razmer:integer);
var
  ii,jj:integer;
  kk:integer;
  strR:string;
  raz:trect;
begin
   (*
   {raz:=clientRect;
   canvas.pen.color:=FonColIzo;
   canvas.Brush.color:=FonColIzo;
   canvas.Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);}

   if FlRadBut2 then begin
     with Image1.Canvas do begin
       raz:=Image1.ClientRect;
       Brush.color:=clTeal;{FonColIzo};
       Pen.color:=clBlack;{FonColIzo;}
       Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);
     end;
   end
   else begin
     with Image2.Canvas do begin
       raz:=Image2.ClientRect;
       Brush.color:=FonColIzo;
       Pen.color:=clBlack;{FonColIzo;}
       Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);
     end;
   end;

   if kolizo>0 then begin
     kk:=ListBox1.items.count;
     if kk=0 then begin
       exit;
     end;
     jj:=ListBox1.itemIndex;
     nomizo:=0;
     if (jj<0) and (jj>=kk) then begin
       jj:=0;
       ListBox1.ItemIndex:=0;
       teknomizo:=0;
     end;
     for ii:=1 to kolizo do begin
       nomizo:=ii;
       if FlRadBut2 then begin
         Izo[NomIzo].RisSe(Image1.Canvas,razmer,True,1,maPrnXF,maPrnYF);
       end
       else begin
         Izo[NomIzo].RisSe(Image2.Canvas,razmer,True,1,maPrnXF,maPrnYF);
       end;
       listBox1.ItemIndex:=ii-1;
     end;
     listBox1.ItemIndex:=jj;
     StrR:=listBox1.Items[jj];
     nomizo:=ONomIzo(StrR);
     teknomizo:=nomizo;
     if nomizo>0 then begin
       if FlRadBut2 then begin
         if razmer=2 then
           izo[nomizo].risOsi2(Image1.Canvas,True,1,maPrnXF,maPrnYF)
         else
           izo[nomizo].risOsi3(Image1.Canvas,True,1,maPrnXF,maPrnYF);
       end
       else begin
         if razmer=2 then
           izo[nomizo].risOsi2(Image2.Canvas,True,1,maPrnXF,maPrnYF)
         else
           izo[nomizo].risOsi3(Image2.Canvas,True,1,maPrnXF,maPrnYF);
       end;
     end;
     if FlRadBut2 then begin
       Wzag(Image1.Canvas,1,ZagGr,maPrnXF,maPrnYF);
     end
     else begin
       Wzag(Image2.Canvas,1,ZagGr,maPrnXF,maPrnYF);
     end;

   end;*)
   if FlRadBut2  then begin
     PrintGr(Image1.canvas,1,1.0,1.0,FonColIzo);
     //form5.Repaint;
   end
   else
     PrintGr(Image2.canvas,1,1.0,1.0,FonColIzo);
   zGridString2;
end;{}
{---------------------------------------------}
procedure TForm5.pereris(IndToch:integer);
var
  ii,jj:integer;
  kk:integer;
begin

    if FlRadBut1 then
      OBNOW;

    if FlRadBut2 then begin
      OBNOWSe(2);
      if kolToch>0 then begin
        case IndToch of
          1:RisToch0(Image1.Canvas,1,kolToch,1,maPrnXF,maPrnYF);
          2:RisToch(Image1.Canvas,1,kolToch,maPrnXF,maPrnYF);
        end;
      end;
    end;

    if Flradbut3 then
      OBNOWSe(3);

end;{}
{---------------------------------------------}
{procedure TForm5.Panel1Click(Sender: TObject);
begin
  Panel1.Visible:=false;
  pereris(1);

end;}
{--------------------------------------------}
procedure TForm5.FormShow(Sender: TObject);
var kff,kfp:integer;


begin

  {FonColIzo:=form5.Color;}

 { PixelsPerInchY:=Image1.PixelsPerInch;}
  PixelsPerInchY:=Round(Image1.Width/8.5);
  FlSpeedButton1:=False;
  SpeedButton1.down:=False;

  Panel2.visible:=False;
  Panel2.Enabled:=False;

  FlRectangle2:=False; {нет контура рисунка на Image1}
  FlRectangle1:=False; {нет контура рисунка на Image2}
  FlOsi3:=false;
  NomOsi3:=0;
  ColOsi3:=clBlack;

    {  TekFontSize:=8;
      TekFontName:='Courier New';
      TekFontPitch:=fpFixed;

      maPrnxn:=4.0;
      maPrnyn:=4.0;


     form5.canvas.font.Size:=8;
     form5.canvas.font.Name:='Courier New';
     form5.canvas.font.Pitch:=fpFixed;

     printer.canvas.font.Size:=8;
     printer.canvas.font.Name:='Courier New';
     printer.canvas.font.Pitch:=fpFixed;

     kff:=form5.canvas.font.PixelsPerInch;
     kfp:=printer.canvas.font.PixelsPerInch;
     maPrnxn:=kfp/kff;
     maPrnyn:=kfp/kff; }



  Form5.RadioButton1.Checked:=FlRadBut1;
  Form5.RadioButton2.Checked:=FlRadBut2;
  Form5.RadioButton3.Checked:=FlRadBut3;

  form5.UpDown1.Position:=round(alpha/5);
  form5.UpDown2.Position:=round(beta/5);

  if Flradbut2=True then begin
   { form5.UpDown3.Position:=round(sdviGor2);
    form5.UpDown4.Position:=round(sdviVer2);}
    form5.UpDown3.Position:=round(XOpl2);
    form5.UpDown4.Position:=round(YOpl2);
  end
  else begin
    {form5.UpDown3.Position:=round(sdviGor3);
    form5.UpDown4.Position:=round(sdviVer3);}

    form5.UpDown3.Position:=round(XOpl);
    form5.UpDown4.Position:=round(YOpl);
  end;

  form5.UpDown5.Position:=round(Dox);
  form5.UpDown6.Position:=round(Doy);
  form5.UpDown6.Position:=round(Doz);

  XMouse:=-1;
  YMouse:=-1;

  {sdviGor:=10;
  sdviVer:=10;}

  maPrnXF:=1.0;
  maPrnYF:=1.0;

  NZLabel;

end;

{--------------------------------------------}
procedure TForm5.Button5Click(Sender: TObject);

begin
  Printer.BeginDoc;
  PrintGr(Printer.Canvas,3,maprnxn,maprnyn,clWhite);
  Printer.EndDoc;
end;
{--------------------------------------------}
procedure TForm5.NZLabel;
var
  jj:integer;
  strR:string;
begin
  if kolizo >0 then begin
    jj:=ListBox1.ItemIndex;
    strR:=listBox1.items[jj];
    nomIzo:=ONomIzo(strR);
    if nomizo>0 then begin

      Label1.Caption:='Угол оси X/' + NameXY[1,izo[nomizo].izoNxx];
      MaskEdit1.Text:=IntToStR(alpha);
      UpDown1.Position:=alpha;

      Label2.Caption:='Угол оси Y/' + NameXY[1,izo[nomizo].izoNxy];
      MaskEdit2.Text:=IntToStR(beta);
      UpDown2.Position:=beta;

      Label7.Caption:='Ось Z/' + NameXY[2,izo[nomizo].I_Y];
      MaskEdit7.Text:=IntToStR(Doz);
      UpDown7.Position:=Doz;

      if FlRadbut2 then begin

        Image2.Enabled:=False;
        image2.Visible:=False;
        Image1.Enabled:=True;
        image1.Visible:=True;

        speedButton1.Visible:=True;
        speedButton1.Enabled:=True;
        if speedbutton1.Down then begin
          panel2.Visible:=True;
          panel2.Enabled:=True;
        end
        else begin
          panel2.Visible:=False;
          panel2.Enabled:=False;
        end;

        {MaskEdit3.Text:=IntToStR(SdviGor2);
        UpDown3.Position:=SdviGor2;}
        MaskEdit3.Text:=IntToStR(XOpl2);
        UpDown3.Position:=XOpl2;

        {MaskEdit4.Text:=IntToStR(SdviVer2);
        UpDown4.Position:=SdviVer2;}
        MaskEdit4.Text:=IntToStR(YOpl2);
        UpDown4.Position:=YOpl2;

        Label5.Caption:='Ось X/' + NameXY[1,izo[nomizo].izoNxx];
        MaskEdit5.Text:=IntToStR(Dox2);
        UpDown5.Position:=Dox2;

        Label6.Caption:='Ось Y/' + NameXY[1,izo[nomizo].izoNxy];
        MaskEdit6.Text:=IntToStR(Doy2);
        UpDown6.Position:=Doy2;


        Label1.Enabled:=False;
        Label2.Enabled:=False;
        maskedit1.Enabled:=False;
        maskedit2.Enabled:=False;
        maskedit7.Enabled:=False;
        UpDown1.Enabled:=False;
        UpDown2.Enabled:=False;
        UpDown7.Enabled:=False;
      end
      else begin
        Image1.Enabled:=False;
        image1.Visible:=False;
        Image2.Enabled:=True;
        image2.Visible:=True;

        speedButton1.Visible:=False;
        speedButton1.Enabled:=False;
        panel2.Visible:=False;
        panel2.Enabled:=False;


        {MaskEdit3.Text:=IntToStR(SdviGor3);
        UpDown3.Position:=SdviGor3;

        MaskEdit4.Text:=IntToStR(SdviVer3);
        UpDown4.Position:=SdviVer3;}

        MaskEdit3.Text:=IntToStR(XOpl);
        UpDown3.Position:=XOpl;

        MaskEdit4.Text:=IntToStR(YOpl);
        UpDown4.Position:=YOpl;

        Label5.Caption:='Ось X/' + NameXY[1,izo[nomizo].izoNxx];
        MaskEdit5.Text:=IntToStR(Dox);
        UpDown5.Position:=Dox;

        Label6.Caption:='Ось Y/' + NameXY[1,izo[nomizo].izoNxy];
        MaskEdit6.Text:=IntToStR(Doy);
        UpDown6.Position:=Doy;


        Label1.Enabled:=True;
        Label2.Enabled:=True;
        Label7.Enabled:=True;
        maskedit1.Enabled:=True;
        maskedit2.Enabled:=True;
        maskedit7.Enabled:=True;
        UpDown1.Enabled:=True;
        UpDown2.Enabled:=True;
        UpDown7.Enabled:=True;
      end;

      button1.Enabled:=True;
      button2.Enabled:=True;
      button3.Enabled:=True;
      button5.Enabled:=True;
      button4.Enabled:=True;

      Label3.Enabled:=True;
      Label4.Enabled:=True;
      Label5.Enabled:=True;
      Label6.Enabled:=True;


      maskedit3.Enabled:=True;
      maskedit4.Enabled:=True;
      maskedit5.Enabled:=True;
      maskedit6.Enabled:=True;

      UpDown3.Enabled:=True;
      UpDown4.Enabled:=True;
      UpDown5.Enabled:=True;
      UpDown6.Enabled:=True;
    end;
  end
  else begin
    Label1.Caption:='Угол оси X' ;
    MaskEdit1.Text:=IntToStR(alpha);
    UpDown1.Position:=alpha;


    Label2.Caption:='Угол оси Y' ;
    MaskEdit2.Text:=IntToStR(beta);
    UpDown2.Position:=beta;

    if Flradbut2 then begin
      {MaskEdit3.Text:=IntToStR(sdviGor2);
      UpDown3.Position:=sdviGor2;

      MaskEdit4.Text:=IntToStR(sdviVer2);
      UpDown4.Position:=sdviVer2;}

      MaskEdit3.Text:=IntToStR(XOpl2);
      UpDown3.Position:=XOpl2;

      MaskEdit4.Text:=IntToStR(YOpl2);
      UpDown4.Position:=YOpl2;

      Label5.Caption:='Ось X' ;
      MaskEdit5.Text:=IntToStR(Dox2);
      UpDown5.Position:=Dox2;

      Label6.Caption:='Ось Y' ;
      MaskEdit6.Text:=IntToStR(Doy2);
      UpDown6.Position:=Doy2;

    Label7.Caption:='Ось Z' ;
      MaskEdit7.Text:=IntToStR(Doz);
      UpDown7.Position:=Doz;
    end
    else begin
      {MaskEdit3.Text:=IntToStR(sdviGor3);
      UpDown3.Position:=sdviGor3;

      MaskEdit4.Text:=IntToStR(sdviVer3);
      UpDown4.Position:=sdviVer3;}

      MaskEdit3.Text:=IntToStR(XOpl);
      UpDown3.Position:=XOpl;

      MaskEdit4.Text:=IntToStR(YOpl);
      UpDown4.Position:=YOpl;

      Label5.Caption:='Ось X' ;
      MaskEdit5.Text:=IntToStR(Dox);
      UpDown5.Position:=Dox;

      Label6.Caption:='Ось Y' ;
      MaskEdit6.Text:=IntToStR(Doy);
      UpDown6.Position:=Doy;

      Label7.Caption:='Ось Z' ;
      MaskEdit7.Text:=IntToStR(Doz);
      UpDown7.Position:=Doz;
    end;

    panel2.Visible:=False;
    panel2.Enabled:=False;
    speedButton1.Visible:=False;
    speedButton1.Enabled:=False;

    button1.Enabled:=True;
    button2.Enabled:=False;
    button3.Enabled:=False;
    button5.Enabled:=False;
    button4.Enabled:=False;

    Label1.Enabled:=False;
    Label2.Enabled:=False;
    Label3.Enabled:=False;
    Label4.Enabled:=False;
    Label5.Enabled:=False;
    Label6.Enabled:=False;
    Label7.Enabled:=False;

    maskedit1.Enabled:=False;
    maskedit2.Enabled:=False;
    maskedit3.Enabled:=False;
    maskedit4.Enabled:=False;
    maskedit5.Enabled:=False;
    maskedit6.Enabled:=False;
    maskedit7.Enabled:=False;

    UpDown1.Enabled:=False;
    UpDown2.Enabled:=False;
    UpDown3.Enabled:=False;
    UpDown4.Enabled:=False;
    UpDown5.Enabled:=False;
    UpDown6.Enabled:=False;
    UpDown7.Enabled:=False;

  end;
end;
{--------------------------------------------}
procedure TForm5.RadioButton1Click(Sender: TObject);
begin
   FlRadBut1:=True;
   FlRadBut2:=False;
   FlRadBut3:=False;
   NZLabel;
   OBNOW;
end;

{--------------------------------------------}
procedure TForm5.RadioButton2Click(Sender: TObject);
begin
   FlRadBut1:=False;
   FlRadBut2:=True;
   FlRadBut3:=False;

   NZStringGrid1;

   NZLabel;
   ObnowSe(2);

   if kolToch>0 then begin
     if FlRadBut2 then begin
       RisToch(Image1.Canvas,1,kolToch,maPrnXF,maPrnYF);
     end;
   end;
end;

{-------------------------------------------}
procedure TForm5.RadioButton3Click(Sender: TObject);
begin
   FlRadBut1:=False;
   FlRadBut2:=False;
   FlRadBut3:=True;

   NZLabel;
   ObnowSe(3);
end;
{--------------------------------------------}
procedure TForm5.FormPaint(Sender: TObject);
begin
 // pereris(1);
  {if kolToch>0 then begin
    if FlRadBut2 then begin
      RisToch0(Image1.Canvas,1,kolToch,False,sdviGor,SdviVer,maPrnXF,maPrnYF);
    end;
  end;}
end;
{---------------------------------------------}
procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
var
 k1,j1:integer;
begin
  k1:=ListBox1.items.count;
  if k1>0 then begin
    for j1:=kolizo downto 1 do begin
      Izo[j1].destroy;
    end;
    for j1:=kolToch downto 1 do begin
      mToch[j1].bitmap.Free;
      mToch[j1].destroy;
    end;
    kolToch:=0;
    listBox1.items.Clear;
    kolizo:=0;
  end;
  panel2.Visible:=False;

end;

{
procedure TForm5.NZStringGrid2;
var
  ii,jj,kk:integer;
  strR,strR1:string;
  xx1,yy1,rr:real;
begin
    stringgrid2.
    for ii:=0 to  stringgrid1.RowCount-1 do
      for jj:=0 to stringgrid1.ColCount-1 do
        stringgrid1.Cells[jj,ii]:=' ';
    stringgrid1.cells[0,0]:='График';
    stringgrid1.cells[1,0]:='Функция';
    stringgrid1.cells[2,0]:='Значение';
    stringgrid1.cells[3,0]:='X-имя';
    stringgrid1.cells[4,0]:='X-значение';
    stringgrid1.cells[5,0]:='Y-имя';
    stringgrid1.cells[6,0]:='Y-значение';
    stringgrid1.cells[7,0]:='имя';
    stringgrid1.cells[8,0]:='значение';
    stringgrid1.cells[9,0]:='имя';
    stringgrid1.cells[10,0]:='значение';
    for ii:=0 to listbox1.Items.Count-1 do begin
      if ii<=StringGrid1.RowCount then begin
        StrR:=listbox1.items[ii];
        nomizo:=ONomIzo(StrR);
        if nomizo>0 then begin
          stringgrid1.cells[0,ii+1]:=Izo[nomizo].NameG;
          stringgrid1.cells[1,ii+1]:=NameXY[2,Izo[nomizo].I_Y];
          nxx:=Izo[nomizo].izoNxx;
          nxy:=Izo[nomizo].izoNxy;
          stringgrid1.cells[3,ii+1]:=NameXY[1,Nxx];
          stringgrid1.cells[5,ii+1]:=NameXY[1,Nxy];
          kk:=0;
          for jj:=1 to Nm do begin
            Xnm[jj]:=izo[nomizo].XnmFix[jj];
            if (jj<>nxx) and (jj<>nxy) then begin
              kk:=kk+1;
              stringgrid1.cells[5+kk*2,ii+1]:=NameXY[1,jj];
              StrR1:=FormatFloat(FormatX,izo[nomizo].XnmFakt[jj]);
              StringGrid1.Cells[5+kk*2+1,ii+1]:=StrR1;
            end;
          end;
        end;
      end;
    end;
end;    }

{------------------------------------------}
procedure TForm5.NZStringGrid1;
var
  ii,jj,kk:integer;
  strR,strR1:string;
  xx1,yy1,rr:real;
begin
    for ii:=0 to  stringgrid1.RowCount-1 do
      for jj:=0 to stringgrid1.ColCount-1 do
        stringgrid1.Cells[jj,ii]:=' ';
    stringgrid1.cells[0,0]:='График';
    stringgrid1.cells[1,0]:='Функция';
    stringgrid1.cells[2,0]:='Значение';
    stringgrid1.cells[3,0]:='X-имя';
    stringgrid1.cells[4,0]:='X-значение';
    stringgrid1.cells[5,0]:='Y-имя';
    stringgrid1.cells[6,0]:='Y-значение';
    stringgrid1.cells[7,0]:='имя';
    stringgrid1.cells[8,0]:='значение';
    stringgrid1.cells[9,0]:='имя';
    stringgrid1.cells[10,0]:='значение';
    for ii:=0 to listbox1.Items.Count-1 do begin
      if ii<=StringGrid1.RowCount then begin
        StrR:=listbox1.items[ii];
        nomizo:=ONomIzo(StrR);
        if nomizo>0 then begin
          stringgrid1.cells[0,ii+1]:=Izo[nomizo].NameG;
          stringgrid1.cells[1,ii+1]:=NameXY[2,Izo[nomizo].I_Y];
          nxx:=Izo[nomizo].izoNxx;
          nxy:=Izo[nomizo].izoNxy;
          stringgrid1.cells[3,ii+1]:=NameXY[1,Nxx];
          stringgrid1.cells[5,ii+1]:=NameXY[1,Nxy];
          kk:=0;
          for jj:=1 to Nm do begin
            Xnm[jj]:=izo[nomizo].XnmFix[jj];
            if (jj<>nxx) and (jj<>nxy) then begin
              kk:=kk+1;
              stringgrid1.cells[5+kk*2,ii+1]:=NameXY[1,jj];
              StrR1:=FormatFloat(FormatX,izo[nomizo].XnmFakt[jj]);
              StringGrid1.Cells[5+kk*2+1,ii+1]:=StrR1;
            end;
          end;
        end;
      end;
    end;
end;
{-------------------------------------------}
procedure TForm5.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
   p,ugol:integer;
begin
   if Flradbut2 then
     exit;
   {
   if button=btNext then begin
     alpha:=alpha+5
   end
   else begin
     if button=btPrev then begin
       alpha:=alpha-5;
     end;
   end;

   if alpha>=360 then begin
     while alpha>=360 do
       alpha:=alpha-360;
   end
   else begin
     if alpha<0 then begin
       while alpha<0 do
         alpha:=alpha+360;
     end;
   end;
   Form5.MaskEdit1.Text:=IntToStR(alpha);
   UpDown1.Position:=alpha;
   Ralpha:=alpha/radiana;
   }

   p:=form5.UpDown1.Position;
   if p<=0 then begin
     p:=72;
     form5.UpDown1.Position:=p;
   end;
   if p>=73 then begin
     p:=1;
     form5.UpDown1.Position:=p;
   end;

   ugol:=(p-1)*5;
   Form5.MaskEdit1.Text:=IntToStR(ugol);
   alpha:=ugol;
   Ralpha:=ugol/radiana;

   {WXoplYOPl; }
   pereris(0);
end;

{-------------------------------------------}
procedure TForm5.UpDown2Click(Sender: TObject; Button: TUDBtnType);
var
   p,ugol:integer;
begin
   if Flradbut2 then
     exit;
   p:=form5.UpDown2.Position;
   if p<=0 then begin
     p:=72;
     form5.UpDown2.Position:=p;
   end;
   if p>=73 then begin
     p:=1;
     form5.UpDown2.Position:=p;
   end;

   ugol:=(p-1)*5;
   Form5.MaskEdit2.Text:=IntToStR(ugol);

   beta:=ugol;
   Rbeta:=ugol/radiana;

   {WXoplYOPl;}

   pereris(0);
end;

{-------------------------------------------}

procedure TForm5.ListBox1Click(Sender: TObject);
var
 k:integer;
 strR:string;
begin
     NZLabel;
     k:=listbox1.ItemIndex;
     strR:=listbox1.Items[k];
     teknomizo:=Onomizo(strR);

     pereris(1);
     {if kolToch>0 then begin
       if FlRadBut2 then begin
         RisToch0(Image1.Canvas,1,kolToch,False,sdviGor,SdviVer,maPrnXF,maPrnYF);
       end;
     end;}
end;
{------------------------------------------------}
procedure TForm5.MaskEdit1DblClick(Sender: TObject);
var
  dr:integer;
begin
  alpha:=Zif(10,MaskEdit1.Text,dr);
  Ralpha:=alpha/radiana;
  form5.UpDown1.Position:=round(alpha/5);

  pereris(0);
end;
{------------------------------------------------}
procedure TForm5.MaskEdit2DblClick(Sender: TObject);
var
  dr:integer;
begin
   beta:=Zif(10,MaskEdit2.Text,dr);
   Rbeta:=beta/radiana;
   form5.UpDown2.Position:=round(beta/5);
   pereris(0);
end;
{------------------------------------------------}
procedure TForm5.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
   if ord(key)=13 then begin
     beta:=Zif(10,MaskEdit2.Text,dr);
     Rbeta:=beta/radiana;
     form5.UpDown2.Position:=round(beta/5);
     pereris(0);
   end;
end;
{-----------------------------------------------}
procedure TForm5.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
  if ord(key)=13 then begin
    alpha:=Zif(10,MaskEdit1.Text,dr);
    Ralpha:=alpha/radiana;
    form5.UpDown1.Position:=round(alpha/5);
    pereris(0);
  end;
end;
{--------------------------------------------------------}
procedure TForm5.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  if kolizo>0 then begin
    if FlRadBut1 or FlRadBut3 then begin
     { SdviGor3:=UpDown3.Position;
      Form5.MaskEdit3.Text:=IntToStR(SdviGor3);}
      XOpl:=UpDown3.Position;
      Form5.MaskEdit3.Text:=IntToStR(XOpl);
    end
    else begin
     { SdviGor2:=UpDown3.Position;}
      XOpl:=UpDown3.Position;
      RasGrSe;
      {Form5.MaskEdit3.Text:=IntToStR(SdviGor2);}
      Form5.MaskEdit3.Text:=IntToStR(XOpl2);
    end;

    pereris(2);
    {if kolToch>0 then begin
      if FlRadBut2 then begin
        RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

      end;
    end; }
  end;
end;
{----------------------------------------------------------}
procedure TForm5.UpDown4Click(Sender: TObject; Button: TUDBtnType);
begin
  if kolizo>0 then begin
    if FlRadBut1 or FlRadBut3 then begin
      {SdviVer3:=UpDown4.Position;}
      YOpl:=UpDown4.Position;
     { Form5.MaskEdit4.Text:=IntToStR(SdviVer3);}
      Form5.MaskEdit4.Text:=IntToStR(YOpl);
    end
    else begin
     { SdviVer2:=UpDown4.Position;}
      Yopl2:=UpDown4.Position;
      RasGrSe;
      {Form5.MaskEdit4.Text:=IntToStR(SdviVer2);}
      Form5.MaskEdit4.Text:=IntToStR(YOpl2);
    end;
    pereris(2);
    {if kolToch>0 then begin
      if FlRadBut2 then begin
        RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

      end;
    end; }
  end;
end;
{--------------------------------------------------------}
procedure TForm5.UpDown5Click(Sender: TObject; Button: TUDBtnType);
begin
  if kolizo>0 then begin
    if FlRadBut1 or FlRadBut3 then begin
      Dox:=UpDown5.Position;
      Form5.MaskEdit5.Text:=IntToStR(dox);
    end
    else begin
      Dox2:=UpDown5.Position;
      RasGrSe;
      Form5.MaskEdit5.Text:=IntToStR(dox2);
    end;
    pereris(2);
    {if kolToch>0 then begin
      if FlRadBut2 then begin
        RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

      end;
    end; }
  end;
end;
{--------------------------------------------------------}
procedure TForm5.UpDown6Click(Sender: TObject; Button: TUDBtnType);
begin
   if kolizo>0 then begin
    if FlRadBut1 or FlRadBut3 then begin
      Doy:=UpDown6.Position;
      Form5.MaskEdit6.Text:=IntToStR(doy);
    end
    else begin
      Doy2:=UpDown6.Position;
      RasGrSe;
      Form5.MaskEdit6.Text:=IntToStR(doy2);
    end;
    pereris(2);
    {if kolToch>0 then begin
      if FlRadBut2 then begin
        RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

      end;
    end;}
  end;
end;
{--------------------------------------------------------}
procedure TForm5.UpDown7Click(Sender: TObject; Button: TUDBtnType);
begin
  if kolizo>0 then begin
    if FlRadBut1 or FlRadBut3 then begin
      Doz:=UpDown7.Position;
      Form5.MaskEdit7.Text:=IntToStR(doz);
    end;
    pereris(0);
  end;
end;
{--------------------------------------------}
procedure TForm5.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
   if ord(key)=13 then begin
     if Flradbut2 then begin
       {sdviGor2:=Zif(10,MaskEdit3.Text,dr);}
       XOpl2:=Zif(10,MaskEdit3.Text,dr);
       RasGrSe;
       {form5.UpDown3.Position:=sdviGor2;}
       form5.UpDown3.Position:=XOpl2;
     end
     else begin
      { sdviGor3:=Zif(10,MaskEdit3.Text,dr);
       form5.UpDown3.Position:=sdviGor3;}
       XOpl:=Zif(10,MaskEdit3.Text,dr);
       form5.UpDown3.Position:=XOpl;
     end;
     pereris(2);
     {if kolToch>0  and then begin
       if FlRadBut2 then begin
         RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

       end;
     end; }
   end;
end;

{--------------------------------------------}
procedure TForm5.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
   if ord(key)=13 then begin
     if Flradbut2 then begin
      { sdviVer2:=Zif(10,MaskEdit4.Text,dr);}
       YOpl2:=Zif(10,MaskEdit4.Text,dr);
       RasGrSe;
       {form5.UpDown4.Position:=sdviVer2;}
       form5.UpDown4.Position:=YOpl2;
     end
     else begin
      { sdviVer3:=Zif(10,MaskEdit4.Text,dr);
       form5.UpDown4.Position:=sdviVer3;}
       YOpl:=Zif(10,MaskEdit4.Text,dr);
       form5.UpDown4.Position:=YOpl;
     end;
     pereris(2);
     {if kolToch>0 then begin
       if FlRadBut2 then begin
         RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

       end;
     end;}
   end;
end;
{--------------------------------------------}
procedure TForm5.MaskEdit5KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
   if ord(key)=13 then begin
     if Flradbut2 then begin
       dox2:=Zif(10,MaskEdit5.Text,dr);
       RasGrSe;
       form5.UpDown5.Position:=Dox2;
     end
     else begin
       Dox:=Zif(10,MaskEdit5.Text,dr);
       form5.UpDown5.Position:=Dox;
     end;
     pereris(2);
     {if kolToch>0 then begin
       if FlRadBut2 then begin
         RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

       end;
     end;}
   end;
end;
{--------------------------------------------}
procedure TForm5.MaskEdit6KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
   if ord(key)=13 then begin
     if Flradbut2 then begin
       doy2:=Zif(10,MaskEdit6.Text,dr);
       RasGrSe;
       form5.UpDown6.Position:=Doy2;
     end
     else begin
       Doy:=Zif(10,MaskEdit6.Text,dr);
       form5.UpDown6.Position:=Doy;
     end;
     pereris(2);
     {if kolToch>0 then begin
       if FlRadBut2 then begin
         RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

       end;
     end;}
   end;
end;
{--------------------------------------------}
procedure TForm5.MaskEdit7KeyPress(Sender: TObject; var Key: Char);
var
  dr:integer;
begin
   if ord(key)=13 then begin
     if not Flradbut2 then begin
       Doz:=Zif(10,MaskEdit7.Text,dr);
       form5.UpDown7.Position:=Doz;
     end;
     pereris(0);
   end;
end;
{--------------------------------------------}
procedure TForm5.ZGridString2;
var
  i,ii,jj,kk,ll,j:integer;
  nomizo:integer;
  xx1,yy1,rr:real;

  iix,iiy:integer;
  strR:string;
begin
  stringgrid2.cells[0,0]:='Точка';
  stringgrid2.cells[1,0]:='График';
  stringgrid2.cells[2,0]:='функц.';
  stringgrid2.cells[3,0]:='Знач.Ф';

  stringgrid2.cells[2,0]:='Имя X';
  stringgrid2.cells[3,0]:='Знач.X';

  stringgrid2.cells[2,0]:='Имя Y';
  stringgrid2.cells[3,0]:='Знач.Y';
  kk:=1;

  ll:=listbox1.Items.Count-1;
  for i:=1 to form5.StringGrid2.RowCount-1 do begin
    for j:=0 to form5.StringGrid2.ColCount-1 do begin
      stringgrid2.cells[j,i]:=' ';
    end;
  end;
  for i:=1 to kolToch do begin

    {xx1:=mToch[i].xToch;
    yy1:=mToch[i].yToch;}

    iix:=mToch[i].xToch;
    iiy:=mToch[i].yToch;

    xx1:=(iix-XnSe)/(XkSe-XnSe);
    yy1:=(YkSe-iiy)/(YkSe-YnSe);

    str(mToch[i].nToch,StrR);
    strR:='т.' + StrR;
    stringgrid2.cells[0,kk]:=StrR;
    for ii:=0 to ll  do begin

      kk:=kk+1;
      if kk>stringgrid2.RowCount then begin
        stringgrid2.RowCount:=kk;
      end;

      Str(i,StrR);

      StrR:=listbox1.items[ii];
      stringgrid2.cells[1,kk-1]:=StrR;
      nomizo:=ONomIzo(StrR);
      if nomizo>0 then begin
        with izo[nomizo] do begin
          for jj:=1 to Nm do begin
            Xnm[jj]:=izo[nomizo].XnmFix[jj];
          end;
          Xnm[IzoNxx]:=XminGr+xx1*(XmaxGr-XminGr);
          Xnm[IzoNxy]:=XminGr+yy1*(XmaxGr-XminGr);
          Rr:=YRas(I_Y,Xnm);

          stringgrid2.cells[2,kk-1]:=NameXY[2,I_Y];


          StrR:=FormatFloat(FormatZ,rr);
          stringgrid2.cells[3,kk-1]:=StrR;

          stringgrid2.cells[4,kk-1]:=NameXY[1,IzoNxx];
          rr:=Xmin_Gr[IzoNxx]+xx1*(Xmax_Gr[IzoNxx]-Xmin_Gr[IzoNxx]);
          StrR:=FormatFloat(FormatX3,rr);
          stringgrid2.cells[5,kk-1]:=StrR;

          stringgrid2.cells[6,kk-1]:=NameXY[1,IzoNxy];
          rr:=Xmin_Gr[IzoNxy]+yy1*(Xmax_Gr[Izonxy]-Xmin_Gr[IzoNxy]);
          StrR:=FormatFloat(FormatY3,rr);
          stringgrid2.cells[7,kk-1]:=StrR;
          {=========
                str(mToch[i].xToch,StrR);
      stringgrid2.cells[1,kk-1]:=StrR;

      str(mToch[i].yToch,StrR);
      stringgrid2.cells[2,kk-1]:=StrR;
      ============}
        end;
      end;
    end;
  end;

end;
{-------------------------------------}
procedure TForm5.Button4Click(Sender: TObject);

begin
  form10.ShowModal;
end;
{-------------------------------------}
procedure TForm5.Button6Click(Sender: TObject);
begin
  if pagesDlg.ShowModal >0  then begin
    RasGrSe;
    pereris(2);
    {if kolToch>0 then begin
      if FlRadBut2 then begin
        RisToch(Image1.Canvas,1,kolToch,sdviGor,SdviVer,maPrnXF,maPrnYF);

      end;
    end;}
  end;
end;
{-------------------------------------}
procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
  if SpeedButton1.down then begin
    FlSpeedButton1:=True;
    panel2.visible:=True;
    panel2.Enabled:=True;
    if FlRectangle1 then
      RisRectangle(Image1.canvas,FlRectangle1,
                    X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1);
           {стираем нарисованый контур}
    {Stringgrid1.visible:=True;
    StringGrid2.Visible:=True;
    Stringgrid1.Enabled:=True;
    StringGrid2.Enabled:=True;}
  end
  else begin
    FlSpeedButton1:=False;
    panel2.visible:=False;
    panel2.Enabled:=False;
    {Stringgrid1.visible:=False;
    StringGrid2.Visible:=False;
    Stringgrid1.Enabled:=False;
    StringGrid2.Enabled:=False;}
  end;
end;
{---------------------------------------------------}
procedure TForm5.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FlRectangle1 then
    RisRectangle(Image1.canvas,FlRectangle1,
                       X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1);
           {стираем нарисованый контур}


  FlMouseDown:=True; {Мышь нажата на Image1}
  XMouseDown:=X;
  YMouseDown:=Y;{координаты начала нажатия мыши на Image1}


end;
{---------------------------------------------------}
procedure TForm5.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FlRectangle2 then
    RisRectangle(Image2.canvas,FlRectangle2,X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2);
           {стираем нарисованый контур}

  FlMouseDown:=True; {Мышь нажата на Image2}
  XMouseDown:=X;
  YMouseDown:=Y;{координаты начала нажатия мыши на Image2}

end;
{------------------------------------------}
 procedure TForm5.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

var
  ii,jj,kk:integer;
  strR,strR1:string;
  xx1,yy1,rr:real;

begin

  if FlRadbut2  then begin
    if FlSpeedButton1 then begin
      if kolizo>0 then begin

     {   if (x/maprnxf>=XnSe+sdviGor) and (x/maprnxf<=XkSe+sdviGor) and (Y/maprnyf>=YnSe+sdviver) and (Y/maprnyf<=YkSe+sdviver) then begin}
        if (x/maprnxf>=XnSe)
            and (x/maprnxf<=XkSe)
            and (Y/maprnyf>=YnSe)
            and (Y/maprnyf<=YkSe) then begin
        {  xx1:=(x/maprnxf-(XnSe+sdviGor))/(XkSe-XnSe);
          yy1:=((YkSe+sdviver)-y/maprnyf)/(YkSe-YnSe);}
          xx1:=(x/maprnxf-XnSe)/(XkSe-XnSe);
          yy1:=(YkSe-y/maprnyf)/(YkSe-YnSe);

          for ii:=0 to listbox1.Items.Count-1 do begin
            if ii<=StringGrid1.RowCount then begin
              StrR:=listbox1.items[ii];
              nomizo:=ONomIzo(StrR);
              if nomizo>0 then begin
                with izo[nomizo] do begin
                  Xnm[IzoNxx]:=XminGr+xx1*(XmaxGr-XminGr);
                  Xnm[IzoNxy]:=XminGr+yy1*(XmaxGr-XminGr);
                  Rr:=YRas(I_Y,Xnm);

                  StrR1:=FormatFloat(FormatZ,rr);
                  stringgrid1.cells[2,ii+1]:=StrR1;

                  rr:=Xmin_Gr[IzoNxx]+xx1*(Xmax_Gr[IzoNxx]-Xmin_Gr[IzoNxx]);
                  StrR1:=FormatFloat(FormatX3,rr);
                  StringGrid1.cells[4,ii+1]:=StrR1;

                  rr:=Xmin_Gr[IzoNxy]+yy1*(Xmax_Gr[Izonxy]-Xmin_Gr[IzoNxy]);
                  StrR1:=FormatFloat(Formaty3,rr);
                  StringGrid1.cells[6,ii+1]:=StrR1;

                end;
              end;
            end;
          end;
          form5.Cursor:=crDefault;
          for ii:=1 to kolToch do begin
           { if (abs(mToch[ii].xToch+sdviGor-x/maprnxf)<=2) and
               (abs(mToch[ii].yToch+sdviver-y/maprnyf)<=2) then begin}
            if (abs(mToch[ii].xToch-x/maprnxf)<=2)
                and (abs(mToch[ii].yToch-y/maprnyf)<=2) then begin
               Form5.Cursor:=crCross;
               Form5.StringGrid2.Col:=0;

               str(mToch[ii].nToch,strR);
               strR:='т.'+strR;
               for jj:=1 to StringGrid2.RowCount-1 do begin
                 if strR=StringGrid2.Cells[0,jj] then begin
                   form5.StringGrid2.Row:=jj;
                   break;
                 end;
               end;
               break;
            end;
          end;

        end;
      end;
    end
    else begin {Сечение и режим исследования отключен}
      if kolizo>0 then begin
        if not FlMouseDown then begin
         { if (Abs(x/maprnxf-(XnSe+sdviGor))<=2) and
                 (Abs(Y/maprnyf-(YkSe+sdviver))<=2) then begin}
          if (Abs(x/maprnxf-XnSe)<=2) and
             (Abs(Y/maprnyf-YkSe)<=2) then begin
                 {курсор в начале координат}
              Form5.Cursor:=crCross;
              GdeDown:=1;
          end
          else begin
           { if (Abs(x/maprnxf-(XkSe+sdviGor))<=2) and
               (Abs(Y/maprnyf-(YkSe+sdviver))<=2) then begin}
            if (Abs(x/maprnxf-XkSe)<=2) and
               (Abs(Y/maprnyf-YkSe)<=2) then begin
                 {курсор в конце оси Х }
              Form5.Cursor:=crSizeWe;
              GdeDown:=2;

            end
            else begin
              {if (Abs(x/maprnxf-(XnSe+sdviGor))<=2) and
                 (Abs(Y/maprnyf-(YnSe+sdviver))<=2) then begin}
              if (Abs(x/maprnxf-XnSe)<=2) and
                 (Abs(Y/maprnyf-YnSe)<=2) then begin
                 {курсор в конце оси Y }
                Form5.Cursor:=crSizeNs;
                GdeDown:=3;
              end
              else begin
                {if (Abs(x/maprnxf-(XkSe+sdviGor))<=2) and
                   (Abs(Y/maprnyf-(YnSe+sdviver))<=2) then begin}
                if (Abs(x/maprnxf-XkSe)<=2) and
                   (Abs(Y/maprnyf-YnSe)<=2) then begin
                   {курсор в конце оси Х и Y}
                   Form5.Cursor:=crSizeNESW;
                  GdeDown:=4;
                end
                else begin
                  form5.Cursor:=crDefault;
                  GdeDown:=0;
                end;
              end;
            end;
          end;
        end {if not FlMouseDown}
        else begin
          if GdeDown=0 then begin
            if FlRectangle1 then begin
              RisRectangle(Image1.canvas,FlRectangle1,
                        X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1);
           {стираем нарисованый контур}
            end;
            if XMouseDown<X then begin
              X1Rectangle1:=XMouseDown;
              X2Rectangle1:=X;
            end
            else begin
              X2Rectangle1:=XMouseDown;
              X1Rectangle1:=X;
            end;
            if YMouseDown<Y then begin
              Y1Rectangle1:=YMouseDown;
              Y2Rectangle1:=Y;
            end
            else begin
              Y2Rectangle1:=YMouseDown;
              Y1Rectangle1:=Y;
            end;


            RisRectangle(Image1.canvas,FlRectangle1,
                        X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1);
            {Рисуем новый контур}
          end;
        end;
      end;
    end;
  end;

end;{}

{---------------------------------------------------}
procedure TForm5.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    if not FlMouseDown then begin
      {if (Abs(x/maprnxf-(XOpl+sdviGor))<=4) and
         (Abs(Y/maprnyf-(YOpl+sdviVer))<=4) then begin}
      if (Abs(x/maprnxf-XOpl)<=4) and
         (Abs(Y/maprnyf-YOpl)<=4) then begin
             {курсор в начале координат}
          Form5.Cursor:=crCross;
          GdeDown:=5;
      end
      else begin
        if (Abs(x/maprnxf-OsX3KoorX)<=4) and
         (Abs(Y/maprnyf-OsX3KoorY)<=4) then begin
          {курсор в конце оси X 3-х мерного графика}
          Form5.Cursor:=crSizeNESW;;
          GdeDown:=6;
        end
        else begin
          if (Abs(x/maprnxf-OsY3KoorX)<=4) and
           (Abs(Y/maprnyf-OsY3KoorY)<=4) then begin
            {курсор в конце оси Y 3-х мерного графика}
            Form5.Cursor:=crSizeNESW;
            GdeDown:=7;
          end
          else begin
            if (Abs(x/maprnxf-OsZ3KoorX)<=4) and
             (Abs(Y/maprnyf-OsZ3KoorY)<=4) then begin
            {курсор в конце оси Z 3-х мерного графика}
              Form5.Cursor:=crSizeNS;;
              GdeDown:=8;
            end
            else begin
              form5.Cursor:=crDefault;
              GdeDown:=0;
            end;
          end;
        end;
      end;
    end {if not FlMouseDown}
    else begin
      if GdeDown=0 then begin
        if FlRectangle2 then begin
          RisRectangle(Image2.canvas,FlRectangle2,
                        X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2);
           {стираем нарисованый контур}
        end;
        if XMouseDown<X then begin
              X1Rectangle2:=XMouseDown;
              X2Rectangle2:=X;
        end
        else begin
              X2Rectangle2:=XMouseDown;
              X1Rectangle2:=X;
        end;
        if YMouseDown<Y then begin
              Y1Rectangle2:=YMouseDown;
              Y2Rectangle2:=Y;
        end
        else begin
              Y2Rectangle2:=YMouseDown;
              Y1Rectangle2:=Y;
        end;

        RisRectangle(Image2.canvas,FlRectangle2,
                        X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2);
         {Рисуем новый контур}
      end;
    end;

end;
{-------------------------------------}
procedure TForm5.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var
  i,j:integer;
  xx1,yy1:real;
  FlNowToch:boolean;
  NTochMax:integer;
begin
  if Flradbut2 then begin
    if FlSpeedButton1 then begin
     { if (x>=round((XnSe+sdviGor)*maprnxf))
          and (x<=round((XkSe+sdviGor)*maprnxf))
          and (Y>=round((YnSe+sdviver)*maprnyf))
          and (Y<=round((YkSe+sdviver)*maprnyf)) then begin}
      if (x>=round(XnSe*maprnxf))
          and (x<=round(XkSe*maprnxf))
          and (Y>=round(YnSe*maprnyf))
          and (Y<=round(YkSe*maprnyf)) then begin
          { xx1:=(x/maprnxf-(XnSe+sdviGor))/(XkSe-XnSe);
           yy1:=((YkSe+sdviver)-Y/maprnyf)/(YkSe-YnSe);}
           xx1:=(x/maprnxf-XnSe)/(XkSe-XnSe);
           yy1:=(YkSe-Y/maprnyf)/(YkSe-YnSe);

        FlNowToch:=true;
        NTochMax:=0;
        for i:=1 to kolToch do begin
          if NTochMax<mToch[i].nToch then  begin
            NTochMax:=mToch[i].nToch;
          end;

          {if (abs(mToch[i].xToch+sdviGor-x/maprnxf)<=2) and
             (abs(mToch[i].yToch+sdviver-y/maprnyf)<=2) then begin}
          if (abs(mToch[i].xToch-x/maprnxf)<=2) and
             (abs(mToch[i].yToch-y/maprnyf)<=2) then begin
            FlNowToch:=False;
            SteToch(Image1.Canvas,i,kolToch,maPrnXF,maPrnYF);
            if i<kolToch then begin
              for j:=i+1 to kolToch do begin
                mToch[j-1].nToch:=mToch[j].nToch;
                mToch[j-1].xToch:=mToch[j].xToch;
                mToch[j-1].yToch:=mToch[j].yToch;
                mToch[j-1].xx1Toch:=mToch[j].xx1Toch;
                mToch[j-1].yy1Toch:=mToch[j].yy1Toch;
              end;
            end;
            RisToch(Image1.Canvas,i,kolToch-1,maPrnXF,maPrnYF);
            mToch[kolToch].destroy;
            kolToch:=kolToch-1;
            break;
          end;
        end;
        if FlNowToch then begin
          if kolToch<maxToch then begin
            KolToch:=KolToch+1;
            mToch[KolToch]:=TypToch.Create;
            mToch[kolToch].BitMap := TBitMap.Create;
            mToch[kolToch].bitmap.Width:=24;
            mToch[kolToch].bitmap.Height:=12;

            with mToch[kolToch] do begin
              mToch[kolToch].nToch:=nTochMax+1;

              mToch[kolToch].xx1Toch:=xx1;
              mToch[kolToch].yy1Toch:=yy1;

             { mToch[kolToch].xToch:=round(x/maPrnxF-sdviGor);
              mToch[kolToch].yToch:=round(y/maprnyF-sdviVer);}
              mToch[kolToch].xToch:=round(x/maPrnxF);
              mToch[kolToch].yToch:=round(y/maprnyF);

            end;
            RisToch(Image1.Canvas,kolToch,kolToch,maPrnXF,maPrnYF);
          end
          else  begin
            messageDlg('Слишком много точек',mtInformation,[mbOk],0);
          end;
        end;
        ZGridString2;
      end;
    end {if FlSpeedButton1}
    else begin
      Panel1.Visible:=True;
      if FlMouseDown then begin
        if (X-XMouseDown<>0) or (Y-YMouseDown<>0) then begin
          if GdeDown=1 then begin
            XOpl2:=XOpl2+(X-XMouseDown);
            YOpl2:=YOpl2+(Y-YMouseDown);
          {  XnSe:=Xopl2+sdviGor2;
            YkSe:=YOpl2+sdviver2;}
            XnSe:=Xopl2;
            YkSe:=YOpl2;

            XkSe:=XnSe+Dox2;
            YnSe:=YkSe-Doy2;
            RasGrSe;
            Pereris(1);
          end
          else begin
            if GdeDown=2 then begin
              DOx2:=DoX2+(X-XMouseDown);
              XkSe:=XnSe+Dox2;

              MaskEdit5.Text:=IntToStR(Dox2);
              UpDown5.Position:=Dox2;
              RasGrSe;
              Pereris(1);
            end
            else begin
              if GdeDown=3 then begin
                DOy2:=Doy2+(YMouseDown-Y);
                YnSe:=YkSe-Doy2;

                MaskEdit6.Text:=IntToStR(DoY2);
                UpDown6.Position:=DoY2;
                RasGrSe;
                Pereris(1);
              end
              else begin
                if GdeDown=4 then begin
                  DOx2:=DoX2+(X-XMouseDown);
                  XkSe:=XnSe+Dox2;

                  MaskEdit5.Text:=IntToStR(Dox2);
                  UpDown5.Position:=Dox2;

                  DOy2:=Doy2+(YMouseDown-Y);
                  YnSe:=YkSe-Doy2;

                  MaskEdit6.Text:=IntToStR(DoY2);
                  UpDown6.Position:=DoY2;
                  RasGrSe;
                  Pereris(1);
                end;
              end;
            end;
          end;
        end
        else begin
          if FlRectangle1 then begin
            RisRectangle(Image1.canvas,FlRectangle1,
                 X1Rectangle1,Y1Rectangle1,X2Rectangle1,Y2Rectangle1);
              {стираем нарисованый контур}
          end;
        end;
      end; {if FlMouseDown}
    end;{else SpeedButton1}

  end  {FlRadBut2}
  else begin
    Panel1.Visible:=True;
  end;
  FlMouseDown:=False;
  form5.Cursor:=crDefault;
  GdeDown:=0;

end;{Image1MouseUp}
{-------------------------------------}
procedure RasUgol(X,Y:integer;Var alpha:integer;Var Ralpha:real);
begin
    if (x<>XOpl) then begin
      Ralpha:=ArcTan(abs(Y-YOpl)/abs(X-XOpl));
      alpha:=Round(ralpha*radiana);
      if (X>XOpl) then begin
        if (Y>YOpl) then begin
          alpha:=360-alpha;
        end;
      end
      else begin
        if (Y<YOpl) then begin
          alpha:=180-alpha;
        end
        else begin
          alpha:=180+alpha;
        end;
      end;
    end
    else begin
      alpha:=90;
    end;
    Ralpha:=alpha/radiana;
end;{RasUgol}
{--------------------------------------------------}
procedure rasOsi(x,y:integer;nOsi:integer;rast:integer;var doxy:integer);
var
    i:integer;
    xr,yr,dor,minr:integer;
begin

          i:=0;
          minr:=rast+rast;
          if nOsi=1 then begin
            dox:=0;
            dor:=dox;
          end
          else begin
            doy:=0;
            dor:=doy;
          end;

          if nOsi=1 then begin
            while (i<Rast) do begin
              i:=i+1;
              dox:=dox+1;
              XplYpl(xr,yr,1.0,0,0,3,0);
              if ((xr-x)*(xr-x)+(yr-y)*(yr-y))<minr then begin
                minr:=(xr-x)*(xr-x)+(yr-y)*(yr-y);
                dor:=dox;
                if (minr=0) then
                 i:=Rast;
              end;
            end;
          end
          else begin
            while (i<Rast) do begin
              i:=i+1;
              doy:=doy+1;
              XplYpl(xr,yr,0,1.0,0,3,0);
              if ((xr-x)*(xr-x)+(yr-y)*(yr-y))<minr then begin
                minr:=(xr-x)*(xr-x)+(yr-y)*(yr-y);
                dor:=doy;
                if (minr=0) then
                  i:=Rast;
              end;
            end;
          end;
          doxy:=dor;
end;
{---------------------------------------------------}
procedure TForm5.Image2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  rast:integer;
begin
  if FlMouseDown then begin
    if (X-XMouseDown<>0) or (Y-YMouseDown<>0) then begin
      if GdeDown=5 then begin
        XOpl:=XOpl+(X-XMouseDown);
        YOpl:=YOpl+(Y-YMouseDown);
        Pereris(1);
      end
      else begin
        rast:=image2.Width;
        if image2.Height>rast then
          rast:=image2.Height;
        if GdeDown=6 then begin
          RasUgol(X,Y,alpha,Ralpha);
          MaskEdit1.Text:=IntToStR(alpha);
          UpDown1.Position:=alpha;

          rasOsi(x,y,1,rast,dox);

          MaskEdit5.Text:=IntToStR(Dox);
          UpDown5.Position:=Dox;

          Pereris(1);
        end
        else begin
          if GdeDown=7 then begin
            RasUgol(X,Y,beta,Rbeta);
            MaskEdit2.Text:=IntToStR(beta);
            UpDown2.Position:=beta;

            rasOsi(x,y,2,rast,doy);

            MaskEdit6.Text:=IntToStR(DoY);
            UpDown6.Position:=DoY;

            Pereris(1);
          end
          else begin
            if GdeDown=8 then begin
              if Y<=YOpl then begin
                DOz:=YOpl-Y;
                MaskEdit7.Text:=IntToStR(Doz);
                UpDown6.Position:=Doz;
                RasGrSe;
                Pereris(1);
              end;
            end;
          end;
        end;
      end;
    end
    else begin
      if FlRectangle2 then begin
        RisRectangle(Image2.canvas,FlRectangle2,
                        X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2);
           {стираем нарисованый контур}
      end;
    end;
  end;
  FlMouseDown:=False;
  form5.Cursor:=crDefault;
  GdeDown:=0;

end;{Image2MouseUp}
{---------------------------------------------------}
procedure TForm5.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FlMouseDown:=False;
  Form5.cursor:=crDefault;
  GdeDown:=0;
end;
{---------------------------------------------------}
procedure TForm5.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FlMouseDown:=False;
  Form5.cursor:=crDefault;
  GdeDown:=0;
end;
{---------------------------------------------------}
procedure TForm5.SaveBitMap(TekCanvas:TCanvas;X1,X2,Y1,Y2:integer);
var
  bit1:TBitmap;
  SaveName:string;
  rdest,rSource:Trect;
begin
  bit1:=Tbitmap.create;
  try
    bit1.Width:=X2-X1;
    bit1.Height:=Y2-Y1;

    RSource.Left:=X1;
    RSource.Right:=X2;
    RSource.Top:=Y1;
    RSource.Bottom:=Y2;

    rdest.Left:=0;
    rdest.Right:=bit1.Width;
    rdest.Top:=0;
    rdest.Bottom:=bit1.Height;

    bit1.Canvas.CopyRect(rdest,TekCanvas,Rsource);
    SaveDialog1.defaultExt:='bmp';

    if SaveDialog1.execute then begin
      SaveName:=SaveDialog1.FileName;
      Bit1.SaveToFile(SaveName);
    end;
  finally
    bit1.Destroy;
  end;
end;{SaveBitMap}
{---------------------------------------------------}
procedure TForm5.Button7Click(Sender: TObject);
  var
    bit1:TBitmap;
    SaveName:string;
    rdest,rSourse:Trect;
begin
  if FlRadBut2 then begin
    if FlRectangle1 then begin
      SaveBitMap(Image1.canvas,
                          X1Rectangle1+1,X2Rectangle1-1,Y1Rectangle1+1,Y2Rectangle1-1);
    end
    else begin
      SaveBitMap(Image1.canvas,0,Image1.Width,0,Image1.Height);
    end;
  end
  else begin
    if FlRadBut1 or FlRadBut2 then begin
      if FlRectangle2 then begin
        SaveBitMap(Image2.canvas,
                          X1Rectangle2+1,X2Rectangle2-1,Y1Rectangle2+1,Y2Rectangle2-1);
      end
      else begin
        SaveBitMap(Image2.canvas,0,Image1.Width,0,Image1.Height);
      end;
    end;
  end;
end;
{---------------------------------------------------------}
end.
