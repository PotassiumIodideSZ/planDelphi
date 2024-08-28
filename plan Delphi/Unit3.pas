unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, ComCtrls,unit4, ColorGrd, Buttons, RxCombos;



type
  TForm3 = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    Panel2: TPanel;
    Panel3: TPanel;
    StringGrid3: TStringGrid;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter2: TSplitter;
    Panel6: TPanel;
    ListBox1: TListBox;
    Panel7: TPanel;
    ColorComboBox1: TColorComboBox;
    Label1: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label28: TLabel;
    ComboBox9: TComboBox;
    Splitter3: TSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    StringGrid1: TStringGrid;
    Panel10: TPanel;
    StaticText4: TStaticText;
    ComboBox1: TComboBox;
    TrackBar1: TTrackBar;
    Splitter4: TSplitter;
    Panel11: TPanel;
    Splitter5: TSplitter;
    Panel12: TPanel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure TrackBar1Change(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

    procedure FormActivate(Sender: TObject);

    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form3: TForm3;
  RNxx,RNxy:integer;
  rFormatX:string;
  fl_trackBar:boolean;

implementation
{$R *.DFM}

{---------------------------------------------}
procedure TForm3.FormShow(Sender: TObject);
var ii,jj,kk:integer;
    strR:string;
begin

  ListBox1.items.Clear;
  for ii:=0 to StringGrid1.ColCount-1 do begin
    for jj:=0 to StringGrid1.RowCount-1 do begin
       StringGrid1.Cells[ii,jj]:='';
    end;
  end;
  for ii:=0 to StringGrid2.ColCount-1 do begin
    for jj:=0 to StringGrid2.RowCount-1 do begin
       StringGrid2.Cells[ii,jj]:='';
    end;
  end;
  for ii:=0 to StringGrid3.ColCount-1 do begin
    for jj:=0 to StringGrid3.RowCount-1 do begin
       StringGrid3.Cells[ii,jj]:='';
    end;
  end;
  for ii:=1 to Ny do begin
    ListBox1.items.Add(NameXY[2][ii]);
  end;
  ColorComboBox1.ColorValue:=Izor.colorG;
  ListBox1.itemIndex:=Izor.I_Y-1;
  StringGrid1.Cells[0,0]:='По X';
  StringGrid1.Cells[1,0]:='По Y';
  {StringGrid1.Row:=RowStringGrid1;}
  StringGrid1.Row:=izoR.Nom;
  StringGrid1.col:=1;

  StringGrid2.col:=1;
  kk:=0;
  for ii:=1 to Nm do begin
    for jj:=1 to Nm do begin
      if ii<>jj then begin
        kk:=kk+1;
        if kk=izor.nom then begin
          RNxx:=ii;
          RNxy:=jj;
        end;
        StringGrid1.Cells[0,kk]:=NameXY[1,ii];
        StringGrid1.Cells[1,kk]:=NameXY[1,jj];
      end;
    end;
  end;
  StringGrid1.RowCount:=kk+1;
  StringGrid1.Row:=izor.nom;
  StringGrid1.col:=0;

  StringGrid2.Cells[0,0]:='Имя';
  StringGrid2.Cells[1,0]:='Значение';
  for jj:=1 to Nm do begin
    StringGrid2.Cells[0,jj]:=NameXY[1,jj];
    strR:=FormatFloat(rFormatX,izor.XnmFakt[jj]);
    StringGrid2.Cells[1,jj]:=StrR;
  end;
  StringGrid2.Row:=RowStringGrid2;

  StringGrid3.RowCount:=12;
  StringGrid3.Cells[0,0]:='Название свойства';
  StringGrid3.Cells[1,0]:='Значение';


  StringGrid3.Cells[0,1]:='Имя';
  StringGrid3.Cells[1,1]:=izoR.nameG;

  StringGrid3.Cells[0,2]:='Колич.линий по X';
  StringGrid3.Cells[1,2]:=IntToStr(izoR.KolFX);

  StringGrid3.Cells[0,3]:='Колич.линий по Y';
  StringGrid3.Cells[1,3]:=IntToStr(izoR.KolFY);

  StringGrid3.Cells[0,4]:='Колич.шагов между линиями по X';
  StringGrid3.Cells[1,4]:=IntToStr(izoR.KolRX);

  StringGrid3.Cells[0,5]:='Колич.шагов между линиями по Y';
  StringGrid3.Cells[1,5]:=IntToStr(izoR.KolRY);

  StringGrid3.Cells[0,6]:='Колич.уровней сечения ';
  StringGrid3.Cells[1,6]:=IntToStr(izoR.KolUrSe);

  StringGrid3.Cells[0,7]:='Толщина линии ';
  StringGrid3.Cells[1,7]:=IntToStr(izoR.G_Width);
 //   kolZE0:integer;  // Колич отметок о оси Z
 //   kolxt0:integer;  // Шаг надписей по x
 //   kolyt0:integer;  // Шаг надписей по y
 //   kolzt0:integer;  // Шаг надписей по z
  StringGrid3.Cells[0,8]:='Количество отметок по оси Z';
  StringGrid3.Cells[1,8]:=IntToStr(izoR.kolZE0);

  StringGrid3.Cells[0,9]:='Шаг надписей по оси X';
  StringGrid3.Cells[1,9]:=IntToStr(izoR.kolxt0);

  StringGrid3.Cells[0,10]:='Шаг надписей по оси Y';
  StringGrid3.Cells[1,10]:=IntToStr(izoR.kolyt0);

  StringGrid3.Cells[0,11]:='Шаг надписей по оси Z';
  StringGrid3.Cells[1,11]:=IntToStr(izoR.kolzt0);

  if izoR.G_Style=psSolid then
   ComboBox9.text:='psSolid.';
  if izoR.G_Style=psDash then
   ComboBox9.text:='psDash.';
  if izoR.G_Style=psDot then
   ComboBox9.text:='psDot.';
  if izoR.G_Style=psDashDot then
   ComboBox9.text:='psDashDot.';
  if izoR.G_Style=psDashDotDot then
   ComboBox9.text:='psDashDotDot.';
  if izoR.G_Style=psClear then
   ComboBox9.text:='psClear.';


  fl_trackBar:=false;
  TrackBar1.Position:=Round(TrackBar1.min+(izor.XnmFix[RowStringGrid2]-Xmi)/(Xma-Xmi)*(TrackBar1.max-TrackBar1.min));
  fl_trackBar:=true;

  ComboBox1.text:=FormatX;
  rFormatX:=FormatX;
  ComboBox1.Items.Clear;
  ComboBox1.Items.Add('#######0.########');
  ComboBox1.Items.Add('#######0.#######');
  ComboBox1.Items.Add('#######0.######');
  ComboBox1.Items.Add('#######0.#####');
  ComboBox1.Items.Add('#######0.####');
  ComboBox1.Items.Add('#######0.###');
  ComboBox1.Items.Add('#######0.##');
  ComboBox1.Items.Add('#######0.#');
  ComboBox1.Items.Add('0.########E-00');
  ComboBox1.Items.Add('0.#######E-00');
  ComboBox1.Items.Add('0.######E-00');
  ComboBox1.Items.Add('0.#####E-00');
  ComboBox1.Items.Add('0.####E-00');
  ComboBox1.Items.Add('0.###E-00');
  ComboBox1.Items.Add('0.##E-00');
  ComboBox1.Items.Add('0.#E-00');

  ComboBox2.text:=izor.FormatZ;
  ComboBox2.Items.Clear;
  ComboBox2.Items.Add('#######0.########');
  ComboBox2.Items.Add('#######0.#######');
  ComboBox2.Items.Add('#######0.######');
  ComboBox2.Items.Add('#######0.#####');
  ComboBox2.Items.Add('#######0.####');
  ComboBox2.Items.Add('#######0.###');
  ComboBox2.Items.Add('#######0.##');
  ComboBox2.Items.Add('#######0.#');
  ComboBox2.Items.Add('0.########E-00');
  ComboBox2.Items.Add('0.#######E-00');
  ComboBox2.Items.Add('0.######E-00');
  ComboBox2.Items.Add('0.#####E-00');
  ComboBox2.Items.Add('0.####E-00');
  ComboBox2.Items.Add('0.###E-00');
  ComboBox2.Items.Add('0.##E-00');
  ComboBox2.Items.Add('0.#E-00');

end;
{-------------------------------------------}
procedure TForm3.StringGrid1SelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
var kk,ii,jj:integer;
begin
  if  CanSelect then begin
    kk:=0;
    for ii:=1 to Nm do begin
      for jj:=1 to Nm do begin
        if ii<>jj then begin
          kk:=kk+1;
          if kk=Row then begin
            RNxx:=ii;
            RNxy:=jj;
            break;
          end;
        end;
      end;
    end;
  end;
end;
{-------------------------------------------}
procedure TForm3.StringGrid2SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var
  RR:extended;
begin
   RR:=StrToFloat(StringGrid2.cells[Acol,ARow]);
   izor.XnmFakt[Arow]:=RR;
try
  except
  on EConvertError do begin
    MessageDlg('Неверный формат числа',mtInformation,[mbOk],0);
  end;
end;
end;
{-------------------------------------------}
procedure TForm3.TrackBar1Change(Sender: TObject);
var
 p,i:integer;
 StrR:string;
begin
   if not fl_trackBar then exit;
   p:=TrackBar1.Position;
   i:=StringGrid2.Row;
   izor.XnmFix[i] :=Xmi    +(Xma    -Xmi    )*(p/(TrackBar1.max-TrackBar1.min));
   izor.XnmFakt[i]:=Xmin[i]+(Xmax[i]-Xmin[i])*(p/(TrackBar1.max-TrackBar1.min));
   rFormatX:=ComboBox1.text;

   strR:=FormatFloat(rFormatX,izor.XnmFakt[i]);
   StringGrid2.cells[1,i]:=StrR;
   FlTrackBar:=true;

end;
{-------------------------------------------}
procedure TForm3.StringGrid2SelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
var
  P:integer;
begin
    p:=Round(TrackBar1.min+(izor.XnmFix[row]-Xmi)/(Xma-Xmi)*(TrackBar1.max-TrackBar1.min));
    fl_trackBar:=false;
    TrackBar1.Position:=P;
    fl_trackBar:=true;
    RowStringGrid2:=Row;
end;
{-------------------------------------------}
procedure TForm3.ComboBox1Exit(Sender: TObject);
var
 jj:integer;
 StrR:string;
begin
  StrR:=ComboBox1.Text;
  If rFormatX<>StrR then begin
    rFormatX:=StrR;
    for jj:=1 to Nm do begin
      strR:=FormatFloat(rFormatX,izor.XnmFakt[jj]);
      StringGrid2.Cells[1,jj]:=StrR;
    end;
  end;
end;
{-------------------------------------------}
procedure TForm3.ComboBox1Change(Sender: TObject);
var
  jj:integer;
  StrR:string;
begin
  StrR:=ComboBox1.Text;
  If rFormatX<>StrR then begin
    rFormatX:=StrR;
    for jj:=1 to Nm do begin
      strR:=FormatFloat(rFormatX,izor.XnmFakt[jj]);
      StringGrid2.Cells[1,jj]:=StrR;
    end;
  end;
end;
{-------------------------------------------}
procedure TForm3.FormActivate(Sender: TObject);
begin
  FlTrackBar:=False;
end;
{-----------------------------------------------}
procedure TForm3.BitBtn1Click(Sender: TObject);
var
  ii:integer;
  RStr:string;
begin
  OkForm3:=True;
  izor.colorG:=ColorComboBox1.colorvalue;//ColorGrid1.ForegroundColor;

  izor.G_Width:=StrToInt(StringGrid3.Cells[1,7]);
  rstr:=Combobox9.text;
  if Copy(rstr,1,8)='psSolid.' then
    izor.G_Style:=psSolid;
  if Copy(rstr,1,7)='psDash.' then
    izor.G_Style:=psDash;
  if Copy(rstr,1,10)='psDashDot.' then
    izor.G_Style:=psDashDot;
  if Copy(rstr,1,6)='psDot.' then
    izor.G_Style:=psDot;
  if Copy(rstr,1,13)='psDashDotDot.' then
    izor.G_Style:=psDashDotDot;
  if Copy(rstr,1,8)='psClear.' then
    izor.G_Style:=psClear;




  izor.Nom:=StringGrid1.Row; {вариант осей}
  Izor.izoNxx:=RNxx;
  Izor.izoNxy:=RNxy;
  Izor.I_Y:=listBox1.ItemIndex+1;
  if FlTrackBar then begin
    for ii:=1 to Nm do begin
      izor.XnmFix[ii]:=Xmi+(Xma-Xmi)*(izor.XnmFakt[ii]-Xmin[ii])/(Xmax[ii]-Xmin[ii]);
    end;
  end;

  {'Имя'}
  izoR.nameG:=StringGrid3.Cells[1,1];

  {'Количество фиксаций по X'}
  izoR.KolFX:=StrToInt(StringGrid3.Cells[1,2]);

  {'Количество фиксаций по Y'}
  izoR.KolFY:=StrToInt(StringGrid3.Cells[1,3]);

  {'Количество разбиений по X'}
  izoR.KolRX:=StrToInt(StringGrid3.Cells[1,4]);

  {'Количество разбиений по Y'}
  izoR.KolRY:=StrToInt(StringGrid3.Cells[1,5]);

  izoR.KolUrSe:=StrToInt(StringGrid3.Cells[1,6]);

  izoR.kolZE0:=StrToInt(StringGrid3.Cells[1,8]);
  izoR.kolxt0:=StrToInt(StringGrid3.Cells[1,9]);
  izoR.kolyt0:=StrToInt(StringGrid3.Cells[1,10]);
  izoR.kolzt0:=StrToInt(StringGrid3.Cells[1,11]);

  FormatX:=rFormatX;
  izor.FormatZ:=ComboBox2.text;

  close;
end;
{-----------------------------------------------}
procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  OkForm3:=False;
  close;
end;
{-----------------------------------------------}
end.


