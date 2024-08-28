unit Unit2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, Mask,
  unit4, Dialogs, RxCombos;

type
  TPagesDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    OKBtn: TButton;
    CancelBtn: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MaskEdit4: TMaskEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    Label25: TLabel;
    Edit1: TEdit;
    Label26: TLabel;
    MaskEdit14: TMaskEdit;
    ButFont: TButton;
    Label27: TLabel;
    meRazmer: TMaskEdit;
    ComboBox9: TComboBox;
    Label28: TLabel;
    FontDialog1: TFontDialog;
    ColorComboBox1: TColorComboBox;
    Label29: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ButFontClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagesDlg: TPagesDlg;
  strFo,strFoX,strFoY,StrFoD,StrFoK,StrRaz:string;
implementation

{$R *.DFM}
{---------------------------------------------------}
procedure TPagesDlg.OKBtnClick(Sender: TObject);
var
  dr:integer;
  rr:real;
  Rstr:string;
begin
 ZagGr   :=Edit1.Text ;
 StrFo   :=ComboBox1.Text;
 StrFoX  :=ComboBox2.Text;
 StrFoY  :=ComboBox3.Text;
 StrFoD  :=ComboBox4.Text;
 StrRaz  :=ComboBox5.Text;
 StrFoK  :=ComboBox6.Text;

 FormatX3:=ComboBox7.Text;
 FormatY3:=ComboBox8.Text;

 MaPrnxn   :=Zif(10,Maskedit1.Text,dr);
 MaPrnyn   :=Zif(10,Maskedit14.Text,dr);
 if dr>0 then begin
   rr:=  1/Exp(ln(10)*dr);
   MaPrnxn:=MaPrnxn/rr;
   MaPrnyn:=MaPrnyn/rr;

 end;
 Xopl    :=Zif(10,maskedit2.Text,dr);
 Yopl    :=Zif(10,maskedit3.Text,dr);

 Dox     :=Zif(10,maskedit4.Text,dr);
 Doy     :=Zif(10,maskedit5.Text,dr);
 Doz     :=Zif(10,maskedit6.Text,dr);

 Xopl2   :=Zif(10,maskedit7.Text,dr);
 Yopl2   :=Zif(10,maskedit8.Text,dr);



 Dox2    :=Zif(10,maskedit9.Text,dr);
 Doy2    :=Zif(10,maskedit10.Text,dr);

 alpha   :=Zif(10,maskedit11.Text,dr);
 Ralpha:=alpha/radiana;

 beta    :=Zif(10,MaskEdit12.Text,dr);
 Rbeta   :=beta/radiana;
 LWidth:=StrToInt(meRazmer.Text);
 rstr:=Combobox9.text;
 if Copy(rstr,1,8)='psSolid.' then
   LStyle:=psSolid;
 if Copy(rstr,1,7)='psDash.' then
     LStyle:=psDash;
 if Copy(rstr,1,10)='psDashDot.' then
   LStyle:=psDashDot;
 if Copy(rstr,1,6)='psDot.' then
   LStyle:=psDot;
 if Copy(rstr,1,13)='psDashDotDot.' then
   LStyle:=psDashDotDot;
 if Copy(rstr,1,8)='psClear.' then
   LStyle:=psClear;

{psSolid	A solid line.
psDash	A line made up of a series of dashes
psDot	A line made up of a series of dots
psDashDot	A line made up of alternating dashes and dots
psDashDotDot	A line made up of a serious of dash-dot-dot combinations
psClear	No line is drawn (used to omit the line around shapes that draw an outline using the current pen).}


 ShiCol    :=Zif(10,MaskEdit13.Text,dr);
 RasGrSe;
 FonColIzo:=ColorCombobox1.ColorValue;
 close;
end;
{--------------------------------------}
procedure TPagesDlg.FormCreate(Sender: TObject);
begin
end;
{--------------------------------------}
procedure TPagesDlg.CancelBtnClick(Sender: TObject);
begin
 close;
end;
{----------------------------------------}
procedure TPagesDlg.ButFontClick(Sender: TObject);
begin
 if FontDialog1.execute then begin
   GrFont:=FontDialog1.Font;
 end;
end;
{---------------------------------------------}
procedure TPagesDlg.FormShow(Sender: TObject);
var
  maFormat:array[1..16] of string;
  ii:integer;
begin
  maFormat[1] :='#######0.########';
  maFormat[2] :='#######0.#######';
  maFormat[3] :='#######0.######';
  maFormat[4] :='#######0.#####';
  maFormat[5] :='#######0.####';
  maFormat[6] :='#######0.###';
  maFormat[7] :='#######0.##';
  maFormat[8] :='#######0.#';
  maFormat[9] :='0.########E-00';
  maFormat[10]:='0.#######E-00';
  maFormat[11]:='0.######E-00';
  maFormat[12]:='0.#####E-00';
  maFormat[13]:='0.####E-00';
  maFormat[14]:='0.###E-00';
  maFormat[15]:='0.##E-00';
  maFormat[16]:='0.#E-00';


  MaskEdit1.Text:=FormatFloat('####0.####',maPrnxn);
  MaskEdit14.Text:=FormatFloat('####0.####',maPrnyn);

  MaskEdit2.Text:=IntToStr(Xopl);
  MaskEdit3.Text:=IntToStr(Yopl);
  MaskEdit4.Text:=IntToStr(Dox);
  MaskEdit5.Text:=IntToStr(Doy);
  MaskEdit6.Text:=IntToStr(Doz);
  MaskEdit7.Text:=IntToStr(Xopl2);
  MaskEdit8.Text:=IntToStr(Yopl2);
  MaskEdit9.Text:=IntToStr(Dox2);
  MaskEdit10.Text:=IntToStr(Doy2);
  MaskEdit11.Text:=IntToStr(alpha);
  MaskEdit12.Text:=IntToStr(beta);
  MaskEdit13.Text:=IntToStr(ShiCol);
  meRazmer.Text:=IntToStr(LWidth);
  ComboBox1.Text:= StrFo;
  ComboBox2.Text:= StrFoX;
  ComboBox3.Text:= StrFoY;
  ComboBox4.Text:= StrFoD;
  ComboBox5.Text:= StrRaz;
  ComboBox6.Text:= StrFoK;
  ComboBox7.Text:= FormatX3;
  ComboBox8.Text:= FormatY3;

  if LStyle=psSolid then
   ComboBox9.text:='psSolid.';
  if LStyle=psDash then
   ComboBox9.text:='psDash.';
  if LStyle=psDot then
   ComboBox9.text:='psDot.';
  if LStyle=psDashDot then
   ComboBox9.text:='psDashDot.';
  if LStyle=psDashDotDot then
   ComboBox9.text:='psDashDotDot.';
  if LStyle=psClear then
   ComboBox9.text:='psClear.';
{psSolid	The pen draws a solid line.
psDash	The pen draws a line made up of a series of dashes.
psDot	The pen draws a line made up of a series of dots.
psDashDot	The pen draws a line made up of alternating dashes and dots.
psDashDotDot	The pen draws a line made up of a series of dash-dot-dot combinations.
psClear	The pen draws lines made up no visible marks.}

  for ii:=1 to 16 do begin
    ComboBox1.Items.Add(maFormat[ii]);
    ComboBox2.Items.Add(maFormat[ii]);
    ComboBox3.Items.Add(maFormat[ii]);
    ComboBox4.Items.Add(maFormat[ii]);
    ComboBox6.Items.Add(maFormat[ii]);
    ComboBox7.Items.Add(maFormat[ii]);
    ComboBox8.Items.Add(maFormat[ii]);
  end;

 {ComboBox2.Items.Add('#0.###');
  ComboBox2.Items.Add('#0.000');}


  ComboBox5.Items.Add('   ');
  ComboBox5.Items.Add('  ');
  ComboBox5.Items.Add(' ');
  Edit1.Text:=ZagGr ;
  ColorComboBox1.ColorValue:=foncolizo;
end;
{-------------------------------------------------}

{--------------------------------------------------}
end.

