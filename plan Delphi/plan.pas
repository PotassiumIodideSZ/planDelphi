unit plan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls,Printers, ExtCtrls, ComCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N7: TMenuItem;
    N15: TMenuItem;
    OpenDialog1: TOpenDialog;
    Print1: TMenuItem;
    Memo1: TMemo;
    N11: TMenuItem;
    FontDialog1: TFontDialog;
    SaveDialog1: TSaveDialog;
    Save: TMenuItem;
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Splitter1: TSplitter;


    procedure N7Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure Memo1Load;
    procedure N2Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    {procedure save1Click(Sender: TObject);}
    procedure N15Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintCurrentFile;

  end;

var
  Form1: TForm1;

implementation

uses Unit1, Unit2, Unit3, Unit4, Unit5, unit9;

{$R *.DFM}
{---------------------------------------------------------}
procedure TForm1.PrintCurrentFile;
var
  LeftMargin,
  LineCoord,
  LineOnPage,
  CurrentLine,
  TextHeight,
  LinesPerPage:Integer;
  {--------------------}
  Procedure StartDoc;
    begin
      LeftMargin:=Printer.Canvas.Font.PixelsPerInch;
      Printer.Canvas.Font:=Memo1.Font;
      Printer.Canvas.TextOut(0,0,' ');
      TextHeight:=Abs(Printer.Canvas.Font.Height);
      LinesPerPage:=Printer.PageHeight div TextHeight;
      CurrentLine:=0;
    end;{StartDoc}
  function MorePages:boolean;
    begin
      Result:=(CurrentLine<=Memo1.Lines.Count) and not Printer.Aborted;
    end;{MorePages}
  procedure StartPage;
    begin
      LineOnPage:=0;
      LineCoord:=0;
    end;{StartPage}
  procedure NextPage;
    begin
      if MorePages then
        Printer.NewPage;
    end;{NextPage}
  function MoreLines:boolean;
    begin
      Result:=(LineOnPage<LinesPerPage) and not printer.Aborted;
    end;{MoreLines}
  procedure NextLine;
    begin
      Inc(LineOnPage);
      Inc(LineCoord,TextHeight);
      Inc(CurrentLine);
    end;{NextLine}
  procedure PrintLine;
    begin
      with Printer.Canvas do begin
        TextOut(LeftMargin,LineCoord,Memo1.Lines[CurrentLine]);
      end;
    end;{PrintLine}
begin
  if Memo1.Lines.Count=0 then
    Exit;
  Printer.Title:=Caption;Printer.BeginDoc;
  StartDoc;
  while MorePages do begin
    StartPage;
    while MoreLines do begin
      PrintLine;
      NextLine;
      Application.ProcessMessages;
    end;
    NextPage;
  end;
  Printer.EndDoc;
end;{TForm1.PrintCurrentFile}

{---------------------------------------------------------}
procedure VVOD(AfileName:string);{���� ������ �� �����}
  var
    ATF :Text;
    ii,i,j,k,m:integer;
    mst:array[1..MaxNm] of integer;
    Zvpl:array[1..MaxNm] of real;
    nstr,estr:integer;
    sstr:string;
begin
  try
  if IMemo1=1 then begin
    Zvpl[1]:=1; Zvpl[2]:=1; Zvpl[3]:=1.215;
    Zvpl[4]:=1.414; {Zvpl[5]:=1.414; Zvpl[6]:=1.414;}
    Gran:=1.5; {������� �������������� ����������� ���������� ��� �������}
  end;
  if IMemo1=4 then begin
    Zvpl[1]:=1;     Zvpl[2]:=1.414; Zvpl[3]:=1.682; Zvpl[4]:=2.000;
    {Zvpl[5]:=2.378; Zvpl[6]:=2.828;} {Zvpl[7]:=3.364; Zvpl[8]:=4.000;}
    Gran:=2.0;{������� �������������� ����������� ���������� ��� �������}
  end;
  nstr:=0;
  mst[1]:=2;
  for i:=2 to MaxNm do begin
    mst[i]:=mst[i-1]*2;
  end;


  Assign(ATF,AFileName);
  Reset(ATF);
{$I-}

  if Eof(ATF) then begin
    estr:=nstr;
    Ifile:=False;
  end
  else begin
    Ifile:=True;
    nstr:=nstr+1;
    Readln(ATF,Nm);{���� Nm}
    ii:=IOresult;
    if ii <> 0 then begin
      estr:=nstr;
      sstr:=IntToStr(nstr);
      MessageDlg('�������� ������ �����, ������ ' + sstr, mtWarning, [mbOk], 0);
      ifile:=False;
      close(ATF);
      exit;
    end;
    if (Nm<=1) or (Nm>MaxNm) then begin
      iFile:=false;
      estr:=nstr;
    end
    else begin
      if IMemo1=1 then begin
        Nb:=mst[Nm]+2*Nm+1;
      end;
      if IMemo1=4 then begin
        case Nm of
          2:begin
              Nb:=13;N0:=5;
              AAAr[1]:=0.2000; AAAr[2]:=0.1000; AAAr[3]:=0.1250;
              AAAr[4]:=0.2500; AAAr[5]:=0.1251; AAAr[6]:=0.0187; AAAr[7]:=0.1438;
            end;
          3:begin
              Nb:=20;N0:=6;
              AAAr[1]:=0.1663; AAAr[2]:=0.0568; AAAr[3]:=0.0732;
              AAAr[4]:=0.1250; AAAr[5]:=0.0675; AAAr[6]:=0.0069; AAAr[7]:=0.0695;
            end;
          4:begin
              Nb:=31;N0:=7;
              AAAr[1]:=0.1428; AAAr[2]:=0.0357; AAAr[3]:=0.0417;
              AAAr[4]:=0.0625; AAAr[5]:=0.0312; AAAr[6]:=0.0037; AAAr[7]:=0.0350;
            end;
          {5:begin
              Nb:=52;N0:=10;
            end;
          6:begin
              Nb:=91;N0:=15;
            end;  }

        end;
      end;
      i:=0;
      while (i<Nm)and ifile do begin
        i:=i+1;
        if not eof(ATF) then begin
          nstr:=nstr+1;
          readln(ATF,NameXY[1][i]);{���� ���� ����������� ����������}
        end
        else begin
          estr:=nstr;
          ifile:=False;
        end;
      end;

      if ifile then begin
        i:=0;
        while (i<Nm)and ifile do begin
          i:=i+1;
          if not eof(ATF) then begin
            nstr:=nstr+1;

            readln(ATF,Xmin[i],Xmax[i]); {���� ��������� ��������� �����������}

            ii:=IOresult;

            if ii <> 0 then begin
              estr:=nstr;
              sstr:=IntToStr(nstr);
              MessageDlg('�������� ������ �����, ������ ' + sstr, mtWarning, [mbOk], 0);
              ifile:=False;
              close(ATF);
              exit;
            end;
            if imemo1=1 then begin
              Xmin_Gr[i]:=Xmin[i]+(Xmax[i]-Xmin[i])/2-(Xmax[i]-Xmin[i])/2*Gran;
              Xmax_Gr[i]:=Xmin[i]+(Xmax[i]-Xmin[i])/2+(Xmax[i]-Xmin[i])/2*Gran;
            end
            else begin
              Xmin_Gr[i]:=Xmin[i]+(Xmax[i]-Xmin[i])/2-(Xmax[i]-Xmin[i])/2*Gran;
              Xmax_Gr[i]:=Xmin[i]+(Xmax[i]-Xmin[i])/2+(Xmax[i]-Xmin[i])/2*Gran;
            end;
          end
          else begin
            estr:=nstr;
            ifile:=False;
          end;
        end;

        if ifile then begin
          if eof(ATF) then begin
            estr:=nstr;
            ifile:=false;
          end
          else begin
            nstr:=nstr+1;
            readln(ATF,Ny);{���� ����� �������}
            if (Ny<=0) or (Ny>MaxNy) then begin
              estr:=nstr;
              ifile:=false;
            end
            else begin
              i:=0;
              while (i<Ny)and ifile do begin
                i:=i+1;
                if not eof(ATF) then begin
                  nstr:=nstr+1;
                  readln(ATF,NameXY[2][i]); {���� �������� �������}
                end
                else begin
                  estr:=nstr;
                  ifile:=False;
                end;
              end;
              if ifile then begin
                i:=0;
                while (i<Ny)and ifile do begin
                  i:=i+1;
                  if not eof(ATF) then begin
                    read(ATF,C[i]); {���� ����� ������ ��� ������ �������}
                    if (C[i]<=0) and (C[i]>MaxNo) then begin
                      estr:=nstr;
                      ifile:=False;
                    end;
                  end
                  else begin
                    estr:=nstr;
                    ifile:=False;
                  end;
                end;
                if ifile then begin
                  nstr:=nstr+1;
                  readln(ATF); {������� �� ����� ������ ��� ������ ����� X � Y}
                  i:=0;
                  while (i<Nb)and ifile do begin
                    i:=i+1;
                    m:=0;
                    while (m<Nm) and ifile do begin
                      m:=m+1;
                      if not eof(ATF) then begin
                        read(ATF,X[m][i]);   {���� X}
                        if i>mst[nm] then begin
                          X[m][i]:=X[m][i]*Zvpl[Nm]; {�������� �����}
                        end;
                      end
                      else begin
                        estr:=nstr;
                        ifile:=false;
                      end;
                    end;
                    if ifile then begin
                      j:=0;
                      while (j<Ny)and ifile do begin
                        j:=j+1;
                        k:=0;
                        while (k<C[j])and ifile do begin
                          k:=k+1;
                          if not eof(ATF) then begin
                            read(ATF,Y[j][i][k]); {���� Y}

                            ii:=IOresult;
                            if ii <> 0 then begin
                              estr:=nstr;
                              sstr:=IntToStr(nstr);
                              MessageDlg('�������� ������ �����, ������ ' + sstr , mtWarning, [mbOk], 0);
                              ifile:=False;
                              close(ATF);
                              exit;
                            end;

                          end
                          else begin
                            ifile:=false;
                            estr:=nstr;
                          end;
                        end;
                      end;
                      if ifile then begin
                        if not eof(ATF) then begin
                           nstr:=nstr+1;
                           readln(ATF);  {������� �� ����� ������ }
                        end;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  for ii:=1 to MaxNm do begin
      izor.XnmFix[ii]:=0.0;
      izor.XnmFakt[ii]:=Xmin[ii]+(Xmax[ii]-Xmin[ii])/2;
  end;
  if  not ifile then begin
    sstr:=IntToStr(estr);
    MessageDlg('�������� ������ �����, ������ '+ sstr, mtWarning, [mbOk], 0);
  end;

  close(ATF);
{$I+}
  except
    on EInOutError   do begin
      sstr:=IntToStr(nstr);
      MessageDlg('�������� ������ �����, ������ '+ sstr, mtWarning, [mbOk], 0);
      Ifile:=False;
      exit;
    end;
  end;

end; {VVOD}

{---------------------------------------------------------}
function T(V:integer;A:real):real;
  const
    NV=26;
    NA=2;
  var
    ts:array[1..NV,1..Na] of real;
    vd:array[1..NV] of integer;
    ad:array[1..NA] of real;
    ii,jj:integer;
  begin
    Ad[1]:=0.05;Ad[2]:=0.1;

    Vd[1]:=1;Vd[2]:=2;Vd[3]:=3;Vd[4]:=4;Vd[5]:=5;Vd[6]:=6;
    Vd[7]:=7;Vd[8]:=8;Vd[9]:=9;Vd[10]:=10;Vd[11]:=11;Vd[12]:=12;
    Vd[13]:=13;Vd[14]:=14;Vd[15]:=15;Vd[16]:=16;Vd[17]:=17;Vd[18]:=18;
    Vd[19]:=19;Vd[20]:=20;Vd[21]:=25;Vd[22]:=30;Vd[23]:=40;Vd[24]:=50;
    Vd[25]:=100;Vd[26]:=500;

    Ts[1,1] :=12.71; Ts[2,1] :=4.302; Ts[3,1] :=3.182; Ts[4,1] :=2.776;
    Ts[5,1] :=2.571; Ts[6,1] :=2.446; Ts[7,1] :=2.365; Ts[8,1] :=2.306;
    Ts[9,1] :=2.262; Ts[10,1]:=2.228; Ts[11,1]:=2.201; Ts[12,1]:=2.179;
    Ts[13,1]:=2.160; Ts[14,1]:=2.145; Ts[15,1]:=2.131; Ts[16,1]:=2.119;
    Ts[17,1]:=2.110; Ts[18,1]:=2.101; Ts[19,1]:=2.093; Ts[20,1]:=2.086;
    Ts[21,1]:=2.059; Ts[22,1]:=2.042; Ts[23,1]:=2.021; Ts[24,1]:=2.009;
    Ts[25,1]:=1.984; Ts[26,1]:=1.964;

    Ts[1,2] :=6.313; Ts[2,2] :=2.920;Ts[3,2] :=2.353;Ts[4,2]:=2.132;
    Ts[5,2] :=2.015; Ts[6,2] :=1.943;Ts[7,2] :=1.895;Ts[8,2]:=1.859;
    Ts[9,2] :=1.833; Ts[10,2]:=1.812;Ts[11,2]:=1.795;Ts[12,2]:=1.782;
    Ts[13,2]:=1.771; Ts[14,2]:=1.761;Ts[15,2]:=1.753;Ts[16,2]:=1.745;
    Ts[17,2]:=1.740; Ts[18,2]:=1.734;Ts[19,2]:=1.729;Ts[20,2]:=1.725;
    Ts[21,2]:=1.708; Ts[22,2]:=1.697;Ts[23,2]:=1.684;Ts[24,2]:=1.676;
    Ts[25,2]:=1.660; Ts[26,2]:=1.647;

    ii:=1;
    while (V>Vd[ii]) and (ii<Nv) do
      ii:=ii+1;

    jj:=1;
    while (A>Ad[jj]) and (jj<Na) do
      jj:=jj+1;

    T:=ts[ii,jj];
  end;{T}
  {---------------------------------------------------------}
function Fi(V1,v2:integer;A:real):real;
  const
    NV1=21;
    NV2=26;
  var
    v1d:array[1..nv1] of integer;
    v2d:array[1..nv2] of integer;
    F:array[1..nv1,1..nv2] of real;
    ii,jj:integer;
  begin
    F[1,1] :=161; F[2,1] :=200; F[3,1] :=216; F[4,1] :=225; F[5,1] :=230;
    F[6,1] :=234; F[7,1] :=237; F[8,1] :=239; F[9,1] :=241; F[10,1]:=242;
    F[11,1]:=243; F[12,1]:=244; F[13,1]:=245; F[14,1]:=246; F[15,1]:=248;
    F[16,1]:=249; F[17,1]:=250; F[18,1]:=251; F[19,1]:=252; F[20,1]:=253;
    F[21,1]:=254;
    F[1,2] :=18.51; F[2,2] :=19.00; F[3,2] :=19.16; F[4,2] :=19.25; F[5,2] :=19.30;
    F[6,2] :=19.33; F[7,2] :=19.36; F[8,2] :=19.37; F[9,2] :=19.38; F[10,2]:=19.39;
    F[11,2]:=19.40; F[12,2]:=19.41; F[13,2]:=19.42; F[14,2]:=19.43; F[15,2]:=19.44;
    F[16,2]:=19.45; F[17,2]:=19.46; F[18,2]:=19.47; F[19,2]:=19.47; F[20,2]:=19.49;
    F[21,2]:=19.50;
    F[1,3] :=10.13; F[2,3] :=9.55; F[3,3] :=9.28; F[4,3] :=9.12; F[5,3] :=9.01;
    F[6,3] :=8.94; F[7,3] :=8.88; F[8,3] :=8.84; F[9,3] :=8.81; F[10,3]:=8.78;
    F[11,3]:=8.76; F[12,3]:=8.74; F[13,3]:=8.71; F[14,3]:=8.69; F[15,3]:=8.66;
    F[16,3]:=8.64; F[17,3]:=8.62; F[18,3]:=8.60; F[19,3]:=8.58; F[20,3]:=8.56;
    F[21,3]:=8.53;
    F[1,4] :=7.71; F[2,4] :=6.94; F[3,4] :=6.59; F[4,4] :=6.39; F[5,4] :=6.26;
    F[6,4] :=6.16; F[7,4] :=6.09; F[8,4] :=6.04; F[9,4] :=6.00; F[10,4]:=5.96;
    F[11,4]:=5.93; F[12,4]:=5.91; F[13,4]:=5.87; F[14,4]:=5.84; F[15,4]:=5.80;
    F[16,4]:=5.77; F[17,4]:=5.74; F[18,4]:=5.71; F[19,4]:=5.70; F[20,4]:=5.66;
    F[21,4]:=5.63;
    F[1,5] :=6.61; F[2,5] :=5.79; F[3,5] :=5.41; F[4,5] :=5.19; F[5,5] :=5.05;
    F[6,5] :=4.95; F[7,5] :=4.88; F[8,5] :=4.82; F[9,5] :=4.78; F[10,5] :=4.74;
    F[11,5] :=4.70; F[12,5] :=4.68; F[13,5] :=4.64; F[14,5] :=4.60; F[15,5]:=4.56;
    F[16,5]:=4.53; F[17,5]:=4.50; F[18,5]:=4.46; F[19,5]:=4.44; F[20,5]:=4.40;
    F[21,5]:=4.36;

    F[1,6]  :=5.99; F[2,6] :=5.14; F[3,6]   :=4.76; F[4,6] :=4.53; F[5,6] :=4.39;
    F[6,6]  :=4.28; F[7,6] :=4.21; F[8,6]   :=4.15; F[9,6] :=4.10; F[10,6]:=4.06;
    F[11,6] :=4.03; F[12,6]:=4.00; F[13,6]  :=3.96; F[14,6]:=3.92; F[15,6]:=3.87;
    F[16,6] :=3.84; F[17,6]:=3.81; F[18,6]  :=3.77; F[19,6]:=3.75; F[20,6]:=3.71;
    F[21,6] :=3.67;
    F[1,7]  :=5.59; F[2,7] :=4.74; F[3,7]   :=4.35; F[4,7] :=4.12; F[5,7] :=3.97;
    F[6,7]  :=3.87; F[7,7] :=3.79; F[8,7]   :=3.73; F[9,7] :=3.68; F[10,7]:=3.63;
    F[11,7] :=3.60; F[12,7]:=3.57; F[13,7]  :=3.52; F[14,7]:=3.49; F[15,7]:=3.44;
    F[16,7] :=3.41; F[17,7]:=3.38; F[18,7]  :=3.34; F[19,7]:=3.32; F[20,7]:=3.28;
    F[21,7] :=3.23;
    F[1,8]  :=5.32; F[2,8]  :=4.46; F[3,8]  :=4.07; F[4,8]  :=3.84; F[5,8] :=3.69;
    F[6,8]  :=3.58; F[7,8]  :=3.50; F[8,8]  :=3.44; F[9,8]  :=3.39; F[10,8]:=3.34;
    F[11,8] :=3.31; F[12,8] :=3.28; F[13,8] :=3.23; F[14,8] :=3.20; F[15,8]:=3.15;
    F[16,8] :=3.12; F[17,8] :=3.08; F[18,8] :=3.05; F[19,8] :=3.03; F[20,8]:=2.98;
    F[21,8] :=2.93;
    F[1,9]  :=5.12; F[2,9]  :=4.26; F[3,9]  :=3.86; F[4,9]  :=3.63; F[5,9] :=3.48;
    F[6,9]  :=3.37; F[7,9]  :=3.29; F[8,9]  :=3.23; F[9,9]  :=3.18; F[10,9]:=3.13;
    F[11,9] :=3.10; F[12,9] :=3.07; F[13,9] :=3.02; F[14,9] :=2.98; F[15,9]:=2.93;
    F[16,9] :=2.90; F[17,9] :=2.86; F[18,9] :=2.82; F[19,9] :=2.80; F[20,9]:=2.76;
    F[21,9] :=2.71;
    F[1,10] :=4.96; F[2,10] :=4.10; F[3,10] :=3.71; F[4,10] :=3.48; F[5,10] :=3.33;
    F[6,10] :=3.22; F[7,10] :=3.14; F[8,10] :=3.07; F[9,10] :=3.02; F[10,10]:=2.97;
    F[11,10]:=2.94; F[12,10]:=2.91; F[13,10]:=2.86; F[14,10]:=2.82; F[15,10]:=2.77;
    F[16,10]:=2.74; F[17,10]:=2.70; F[18,10]:=2.67; F[19,10]:=2.64; F[20,10]:=2.59;
    F[21,10]:=2.54;
    F[1,11] :=4.84; F[2,11] :=3.98; F[3,11] :=3.59; F[4,11] :=3.36; F[5,11] :=3.20;
    F[6,11] :=3.09; F[7,11] :=3.01; F[8,11] :=2.95; F[9,11] :=2.90; F[10,11]:=2.86;
    F[11,11]:=2.82; F[12,11]:=2.79; F[13,11]:=2.74; F[14,11]:=2.70; F[15,11]:=2.65;
    F[16,11]:=2.61; F[17,11]:=2.57; F[18,11]:=2.53; F[19,11]:=2.50; F[20,11]:=2.45;
    F[21,11]:=2.40;
    F[1,12] :=4.75; F[2,12] :=3.88; F[3,12] :=3.49; F[4,12] :=3.26; F[5,12] :=3.11;
    F[6,12] :=3.00; F[7,12] :=2.92; F[8,12] :=2.85; F[9,12] :=2.80; F[10,12]:=2.76;
    F[11,12]:=2.72; F[12,12]:=2.69; F[13,12]:=2.64; F[14,12]:=2.60; F[15,12]:=2.54;
    F[16,12]:=2.50; F[17,12]:=2.46; F[18,12]:=2.42; F[19,12]:=2.40; F[20,12]:=2.35;
    F[21,12]:=2.30;
    F[1,13] :=4.67; F[2,13] :=3.80; F[3,13] :=3.41; F[4,13] :=3.18; F[5,13] :=3.02;
    F[6,13] :=2.92; F[7,13] :=2.84; F[8,13] :=2.77; F[9,13] :=2.72; F[10,13]:=2.67;
    F[11,13]:=2.63; F[12,13]:=2.60; F[13,13]:=2.55; F[14,13]:=2.51; F[15,13]:=2.46;
    F[16,13]:=2.42; F[17,13]:=2.38; F[18,13]:=2.34; F[19,13]:=2.32; F[20,13]:=2.28;
    F[21,13]:=2.21;
    F[1,14] :=4.60; F[2,14] :=3.74; F[3,14] :=3.34; F[4,14] :=3.11; F[5,14] :=2.96;
    F[6,14] :=2.85; F[7,14] :=2.77; F[8,14] :=2.70; F[9,14] :=2.65; F[10,14]:=2.60;
    F[11,14]:=2.56; F[12,14]:=2.53; F[13,14]:=2.48; F[14,14]:=2.44; F[15,14]:=2.39;
    F[16,14]:=2.35; F[17,14]:=2.31; F[18,14]:=2.27; F[19,14]:=2.24; F[20,14]:=2.19;
    F[21,14]:=2.13;
    F[1,15] :=4.54; F[2,15] :=3.68; F[3,15] :=3.29; F[4,15] :=3.06; F[5,15] :=2.90;
    F[6,15] :=2.79; F[7,15] :=2.70; F[8,15] :=2.64; F[9,15] :=2.59; F[10,15]:=2.55;
    F[11,15]:=2.51; F[12,15]:=2.48; F[13,15]:=2.43; F[14,15]:=2.39; F[15,15]:=2.33;
    F[16,15]:=2.29; F[17,15]:=2.25; F[18,15]:=2.21; F[19,15]:=2.18; F[20,15]:=2.12;
    F[21,15]:=2.07;
    F[1,16] :=4.49; F[2,16] :=3.63; F[3,16] :=3.24; F[4,16] :=3.01; F[5,16] :=2.85;
    F[6,16] :=2.74; F[7,16] :=2.66; F[8,16] :=2.59; F[9,16] :=2.54; F[10,16]:=2.49;
    F[11,16]:=2.45; F[12,16]:=2.42; F[13,16]:=2.37; F[14,16]:=2.33; F[15,16]:=2.28;
    F[16,16]:=2.24; F[17,16]:=2.22; F[18,16]:=2.16; F[19,16]:=2.13; F[20,16]:=2.07;
    F[21,16]:=2.01;
    F[1,17] :=4.45; F[2,17] :=3.59; F[3,17] :=3.20; F[4,17] :=2.96; F[5,17] :=2.81;
    F[6,17] :=2.70; F[7,17] :=2.62; F[8,17] :=2.55; F[9,17] :=2.50; F[10,17]:=2.45;
    F[11,17]:=2.41; F[12,17]:=2.38; F[13,17]:=2.33; F[14,17]:=2.29; F[15,17]:=2.23;
    F[16,17]:=2.19; F[17,17]:=2.15; F[18,17]:=2.11; F[19,17]:=2.08; F[20,17]:=2.02;
    F[21,17]:=1.96;
    F[1,18] :=4.41; F[2,18] :=3.55; F[3,18] :=3.16; F[4,18] :=2.93; F[5,18] :=2.77;
    F[6,18] :=2.66; F[7,18] :=2.58; F[8,18] :=2.51; F[9,18] :=2.46; F[10,18]:=2.41;
    F[11,18]:=2.37; F[12,18]:=2.34; F[13,18]:=2.29; F[14,18]:=2.25; F[15,18]:=2.19;
    F[16,18]:=2.15; F[17,18]:=2.11; F[18,18]:=2.07; F[19,18]:=2.04; F[20,18]:=1.98;
    F[21,18]:=1.92;
    F[1,19] :=4.38; F[2,19] :=3.52; F[3,19] :=3.13; F[4,19] :=2.90; F[5,19] :=2.74;
    F[6,19] :=2.63; F[7,19] :=2.55; F[8,19] :=2.48; F[9,19] :=2.43; F[10,19]:=2.38;
    F[11,19]:=2.34; F[12,19]:=2.31; F[13,19]:=2.26; F[14,19]:=2.21; F[15,19]:=2.15;
    F[16,19]:=2.11; F[17,19]:=2.07; F[18,19]:=2.02; F[19,19]:=2.00; F[20,19]:=1.91;
    F[21,19]:=1.88;
    F[1,20] :=4.35; F[2,20] :=3.49; F[3,20] :=3.10; F[4,20] :=2.87; F[5,20] :=2.71;
    F[6,20] :=2.60; F[7,20] :=2.52; F[8,20] :=2.45; F[9,20] :=2.40; F[10,20]:=2.35;
    F[11,20]:=2.31; F[12,20]:=2.28; F[13,20]:=2.23; F[14,20]:=2.18; F[15,20]:=2.12;
    F[16,20]:=2.08; F[17,20]:=2.04; F[18,20]:=1.99; F[19,20]:=1.96; F[20,20]:=1.87;
    F[21,20]:=1.84;
    F[1,21] :=4.26; F[2,21] :=3.40; F[3,21] :=3.01; F[4,21] :=2.78; F[5,21] :=2.62;
    F[6,21] :=2.51; F[7,21] :=2.43; F[8,21] :=2.36; F[9,21] :=2.30; F[10,21]:=2.26;
    F[11,21]:=2.22; F[12,21]:=2.18; F[13,21]:=2.13; F[14,21]:=2.09; F[15,21]:=2.02;
    F[16,21]:=1.98; F[17,21]:=1.94; F[18,21]:=1.89; F[19,21]:=1.86; F[20,21]:=1.80;
    F[21,21]:=1.73;
    F[1,22] :=4.20; F[2,22] :=3.34; F[3,22] :=2.95; F[4,22] :=2.71; F[5,22] :=2.56;
    F[6,22] :=2.44; F[7,22] :=2.36; F[8,22] :=2.29; F[9,22] :=2.24; F[10,22]:=2.19;
    F[11,22]:=2.15; F[12,22]:=2.12; F[13,22]:=2.06; F[14,22]:=2.02; F[15,22]:=1.96;
    F[16,22]:=1.91; F[17,22]:=1.87; F[18,22]:=1.81; F[19,22]:=1.78; F[20,22]:=1.72;
    F[21,22]:=1.65;
    F[1,23] :=4.15; F[2,23] :=3.30; F[3,23] :=2.90; F[4,23] :=2.67; F[5,23] :=2.51;
    F[6,23] :=2.40; F[7,23] :=2.32; F[8,23] :=2.25; F[9,23] :=2.19; F[10,23]:=2.14;
    F[11,23]:=2.10; F[12,23]:=2.07; F[13,23]:=2.02; F[14,23]:=1.97; F[15,23]:=1.91;
    F[16,23]:=1.86; F[17,23]:=1.82; F[18,23]:=1.76; F[19,23]:=1.74; F[20,23]:=1.67;
    F[21,23]:=1.59;
    F[1,24] :=4.03; F[2,24] :=3.18; F[3,24] :=2.79; F[4,24] :=2.56; F[5,24] :=2.40;
    F[6,24] :=2.29; F[7,24] :=2.20; F[8,24] :=2.13; F[9,24] :=2.07; F[10,24]:=2.02;
    F[11,24]:=1.98; F[12,24]:=1.95; F[13,24]:=1.90; F[14,24]:=1.85; F[15,24]:=1.78;
    F[16,24]:=1.74; F[17,24]:=1.69; F[18,24]:=2.63; F[19,24]:=1.60; F[20,24]:=1.52;
    F[21,24]:=1.44;
    F[1,25] :=3.94; F[2,25] :=3.09; F[3,25] :=2.70; F[4,25] :=2.46; F[5,25] :=2.30;
    F[6,25] :=2.19; F[7,25] :=2.10; F[8,25] :=2.03; F[9,25] :=1.97; F[10,25]:=1.92;
    F[11,25]:=1.88; F[12,25]:=1.85; F[13,25]:=1.79; F[14,25]:=1.75; F[15,25]:=1.68;
    F[16,25]:=1.63; F[17,25]:=1.57; F[18,25]:=1.51; F[19,25]:=1.48; F[20,25]:=1.39;
    F[21,25]:=1.28;
    F[1,26] :=3.84; F[2,26] :=2.99; F[3,26] :=2.60; F[4,26] :=2.37; F[5,26] :=2.21;
    F[6,26] :=2.09; F[7,26] :=2.01; F[8,26] :=1.94; F[9,26] :=1.88; F[10,26]:=1.83;
    F[11,26]:=1.79; F[12,26]:=1.75; F[13,26]:=1.69; F[14,26]:=1.64; F[15,26]:=1.57;
    F[16,26]:=1.52; F[17,26]:=1.46; F[18,26]:=1.40; F[19,26]:=1.35; F[20,26]:=1.24;
    F[21,26]:=1.00;

    v1d[1]:=1;v1d[2]:=2;v1d[3]:=3;v1d[4]:=4;v1d[5]:=5;v1d[6]:=6;
    v1d[7]:=7;v1d[8]:=8;v1d[9]:=9;v1d[10]:=10;v1d[11]:=11;v1d[12]:=12;
    v1d[13]:=14;v1d[14]:=16;v1d[15]:=20;v1d[16]:=24;v1d[17]:=30;v1d[18]:=40;
    v1d[19]:=50;v1d[20]:=100;v1d[21]:=10000;

    v2d[1]:=1;v2d[2]:=2;v2d[3]:=3;v2d[4]:=4;v2d[5]:=5;v2d[6]:=6;
    v2d[7]:=7;v2d[8]:=8;v2d[9]:=9;v2d[10]:=10;v2d[11]:=11;v2d[12]:=12;
    v2d[13]:=13;v2d[14]:=14;v2d[15]:=15;v2d[16]:=16;v2d[17]:=17;v2d[18]:=18;
    v2d[19]:=19;v2d[20]:=20;v2d[21]:=24;v2d[22]:=28;v2d[23]:=32;v2d[24]:=50;
    v2d[25]:=100;v2d[26]:=10000;

    Fi:=0;
    if Abs(A-0.05)<0.000001 then begin
      ii:=1;
      while (V1>V1D[ii]) and (ii<nv1) do
        ii:=ii+1;
      jj:=1;
      while (V2>V2D[jj]) and (jj<nv2) do
        jj:=jj+1;

      fi:=F[ii,jj];
    end;
  end;{Fi}
{---------------------------------------------------------}
function G(V1,V2:integer;A:real):real;
  const
    nv1=14;
    nv2=18;
  var
    Gkr:array[1..nv1,1..nv2] of real;
    v1d:array[1..nv1] of integer;
    v2d:array[1..nv2] of integer;
    ii,jj:integer;
  begin

    Gkr[ 1,1]:=0.998;Gkr[ 2,1]:=0.975;Gkr[ 3,1]:=0.939;Gkr[ 4,1]:=0.906;
    Gkr[ 5,1]:=0.877;Gkr[ 6,1]:=0.853;Gkr[ 7,1]:=0.833;Gkr[ 8,1]:=0.816;
    Gkr[ 9,1]:=0.801;Gkr[10,1]:=0.788;Gkr[11,1]:=0.734;Gkr[12,1]:=0.660;
    Gkr[13,1]:=0.581;Gkr[14,1]:=0.500;

    Gkr[ 1,2]:=0.967;Gkr[ 2,2]:=0.871;Gkr[ 3,2]:=0.798;Gkr[ 4,2]:=0.746;
    Gkr[ 5,2]:=0.707;Gkr[ 6,2]:=0.677;Gkr[ 7,2]:=0.653;Gkr[ 8,2]:=0.633;
    Gkr[ 9,2]:=0.617;Gkr[10,2]:=0.602;Gkr[11,2]:=0.657;Gkr[12,2]:=0.475;
    Gkr[13,2]:=0.403;Gkr[14,2]:=0.333;

    Gkr[ 1,3]:=0.906;Gkr[ 2,3]:=0.768;Gkr[ 3,3]:=0.784;Gkr[ 4,3]:=0.629;
    Gkr[ 5,3]:=0.589;Gkr[ 6,3]:=0.560;Gkr[ 7,3]:=0.536;Gkr[ 8,3]:=0.517;
    Gkr[ 9,3]:=0.502;Gkr[10,3]:=0.488;Gkr[11,3]:=0.437;Gkr[12,3]:=0.372;
    Gkr[13,3]:=0.309;Gkr[14,3]:=0.250;

    Gkr[ 1,4]:=0.841;Gkr[ 2,4]:=0.684;Gkr[ 3,4]:=0.598;Gkr[ 4,4]:=0.544;
    Gkr[ 5,4]:=0.506;Gkr[ 6,4]:=0.478;Gkr[ 7,4]:=0.456;Gkr[ 8,4]:=0.439;
    Gkr[ 9,4]:=0.424;Gkr[10,4]:=0.412;Gkr[11,4]:=0.364;Gkr[12,4]:=0.307;
    Gkr[13,4]:=0.251;Gkr[14,4]:=0.200;

    Gkr[ 1,5]:=0.781;Gkr[ 2,5]:=0.616;Gkr[ 3,5]:=0.532;Gkr[ 4,5]:=0.480;
    Gkr[ 5,5]:=0.445;Gkr[ 6,5]:=0.418;Gkr[ 7,5]:=0.398;Gkr[ 8,5]:=0.382;
    Gkr[ 9,5]:=0.368;Gkr[10,5]:=0.357;Gkr[11,5]:=0.313;Gkr[12,5]:=0.261;
    Gkr[13,5]:=0.212;Gkr[14,5]:=0.167;

    Gkr[ 1,6]:=0.727;Gkr[ 2,6]:=0.561;Gkr[ 3,6]:=0.480;Gkr[ 4,6]:=0.431;
    Gkr[ 5,6]:=0.397;Gkr[ 6,6]:=0.373;Gkr[ 7,6]:=0.353;Gkr[ 8,6]:=0.338;
    Gkr[ 9,6]:=0.326;Gkr[10,6]:=0.315;Gkr[11,6]:=0.276;Gkr[12,6]:=0.228;
    Gkr[13,6]:=0.183;Gkr[14,6]:=0.143;

    Gkr[ 1,7]:=0.680;Gkr[ 2,7]:=0.516;Gkr[ 3,7]:=0.438;Gkr[ 4,7]:=0.391;
    Gkr[ 5,7]:=0.359;Gkr[ 6,7]:=0.336;Gkr[ 7,7]:=0.318;Gkr[ 8,7]:=0.304;
    Gkr[ 9,7]:=0.293;Gkr[10,7]:=0.283;Gkr[11,7]:=0.246;Gkr[12,7]:=0.202;
    Gkr[13,7]:=0.162;Gkr[14,7]:=0.125;

    Gkr[ 1,8]:=0.638;Gkr[ 2,8]:=0.477;Gkr[ 3,8]:=0.403;Gkr[ 4,8]:=0.358;
    Gkr[ 5,8]:=0.329;Gkr[ 6,8]:=0.307;Gkr[ 7,8]:=0.290;Gkr[ 8,8]:=0.277;
    Gkr[ 9,8]:=0.266;Gkr[10,8]:=0.257;Gkr[11,8]:=0.227;Gkr[12,8]:=0.182;
    Gkr[13,8]:=0.145;Gkr[14,8]:=0.111;

    Gkr[ 1,9]:=0.602;Gkr[ 2,9]:=0.445;Gkr[ 3,9]:=0.373;Gkr[ 4,9]:=0.331;
    Gkr[ 5,9]:=0.303;Gkr[ 6,9]:=0.282;Gkr[ 7,9]:=0.266;Gkr[ 8,9]:=0.254;
    Gkr[ 9,9]:=0.244;Gkr[10,9]:=0.235;Gkr[11,9]:=0.203;Gkr[12,9]:=0.165;
    Gkr[13,9]:=0.131;Gkr[14,9]:=0.100;

    Gkr[ 1,10]:=0.541;Gkr[ 2,10]:=0.392;Gkr[ 3,10]:=0.326;Gkr[ 4,10]:=0.288;
    Gkr[ 5,10]:=0.262;Gkr[ 6,10]:=0.244;Gkr[ 7,10]:=0.230;Gkr[ 8,10]:=0.219;
    Gkr[ 9,10]:=0.210;Gkr[10,10]:=0.202;Gkr[11,10]:=0.174;Gkr[12,10]:=0.140;
    Gkr[13,10]:=0.110;Gkr[14,10]:=0.083;

    Gkr[ 1,11]:=0.471;Gkr[ 2,11]:=0.335;Gkr[ 3,11]:=0.276;Gkr[ 4,11]:=0.242;
    Gkr[ 5,11]:=0.219;Gkr[ 6,11]:=0.203;Gkr[ 7,11]:=0.191;Gkr[ 8,11]:=0.181;
    Gkr[ 9,11]:=0.174;Gkr[10,11]:=0.167;Gkr[11,11]:=0.143;Gkr[12,11]:=0.114;
    Gkr[13,11]:=0.089;Gkr[14,11]:=0.067;


    Gkr[ 1,12]:=0.398;Gkr[ 2,12]:=0.270;Gkr[ 3,12]:=0.220;Gkr[ 4,12]:=0.192;
    Gkr[ 5,12]:=0.173;Gkr[ 6,12]:=0.160;Gkr[ 7,12]:=0.150;Gkr[ 8,12]:=0.142;
    Gkr[ 9,12]:=0.136;Gkr[10,12]:=0.130;Gkr[11,12]:=0.111;Gkr[12,12]:=0.088;
    Gkr[13,12]:=0.067;Gkr[14,12]:=0.050;


    Gkr[ 1,13]:=0.343;Gkr[ 2,13]:=0.235;Gkr[ 3,13]:=0.191;Gkr[ 4,13]:=0.166;
    Gkr[ 5,13]:=0.149;Gkr[ 6,13]:=0.137;Gkr[ 7,13]:=0.129;Gkr[ 8,13]:=0.122;
    Gkr[ 9,13]:=0.116;Gkr[10,13]:=0.111;Gkr[11,13]:=0.094;Gkr[12,13]:=0.074;
    Gkr[13,13]:=0.057;Gkr[14,13]:=0.042;

    Gkr[ 1,14]:=0.293;Gkr[ 2,14]:=0.198;Gkr[ 3,14]:=0.159;Gkr[ 4,14]:=0.138;
    Gkr[ 5,14]:=0.124;Gkr[ 6,14]:=0.114;Gkr[ 7,14]:=0.106;Gkr[ 8,14]:=0.100;
    Gkr[ 9,14]:=0.096;Gkr[10,14]:=0.092;Gkr[11,14]:=0.077;Gkr[12,14]:=0.060;
    Gkr[13,14]:=0.046;Gkr[14,14]:=0.033;

    Gkr[ 1,15]:=0.237;Gkr[ 2,15]:=0.158;Gkr[ 3,15]:=0.126;Gkr[ 4,15]:=0.108;
    Gkr[ 5,15]:=0.097;Gkr[ 6,15]:=0.098;Gkr[ 7,15]:=0.083;Gkr[ 8,15]:=0.078;
    Gkr[ 9,15]:=0.074;Gkr[10,15]:=0.071;Gkr[11,15]:=0.059;Gkr[12,15]:=0.046;
    Gkr[13,15]:=0.035;Gkr[14,15]:=0.250;

    Gkr[ 1,16]:=0.174;Gkr[ 2,16]:=0.113;Gkr[ 3,16]:=0.089;Gkr[ 4,16]:=0.076;
    Gkr[ 5,16]:=0.068;Gkr[ 6,16]:=0.062;Gkr[ 7,16]:=0.058;Gkr[ 8,16]:=0.055;
    Gkr[ 9,16]:=0.052;Gkr[10,16]:=0.050;Gkr[11,16]:=0.041;Gkr[12,16]:=0.032;
    Gkr[13,16]:=0.023;Gkr[14,16]:=0.017;

    Gkr[ 1,17]:=0.099;Gkr[ 2,17]:=0.063;Gkr[ 3,17]:=0.050;Gkr[ 4,17]:=0.042;
    Gkr[ 5,17]:=0.037;Gkr[ 6,17]:=0.034;Gkr[ 7,17]:=0.031;Gkr[ 8,17]:=0.029;
    Gkr[ 9,17]:=0.028;Gkr[10,17]:=0.027;Gkr[11,17]:=0.022;Gkr[12,17]:=0.017;
    Gkr[13,17]:=0.012;Gkr[14,17]:=0.008;

    Gkr[ 1,18]:=0.000;Gkr[ 2,18]:=0.000;Gkr[ 3,18]:=0.000;Gkr[ 4,18]:=0.000;
    Gkr[ 5,18]:=0.000;Gkr[ 6,18]:=0.000;Gkr[ 7,18]:=0.000;Gkr[ 8,18]:=0.000;
    Gkr[ 9,18]:=0.000;Gkr[10,18]:=0.000;Gkr[11,18]:=0.000;Gkr[12,18]:=0.000;
    Gkr[13,18]:=0.000;Gkr[14,18]:=0.000;

    v1d[1]:=1;v1d[2]:=2;v1d[3]:=3;v1d[4]:=4;v1d[5]:=5;v1d[6]:=6;
    v1d[7]:=7;v1d[8]:=8;v1d[9]:=9;v1d[10]:=10;v1d[11]:=16;v1d[12]:=36;
    v1d[13]:=14;v1d[14]:=10000;

    v2d[1]:=2;v2d[2]:=3;v2d[3]:=4;v2d[4]:=5;v2d[5]:=6;v2d[6]:=7;
    v2d[7]:=8;v2d[8]:=9;v2d[9]:=10;v2d[10]:=12;v2d[11]:=15;v2d[12]:=20;
    v2d[13]:=24;v2d[14]:=30;v2d[15]:=40;v2d[16]:=60;v2d[17]:=120;v2d[18]:=10000;
    Result:=0;
    if Abs(A-0.05)<0.000001 then begin
      ii:=1;
      while (V1>V1D[ii]) and (ii<nv1) do
        ii:=ii+1;
      jj:=1;
      while (V2>V2D[jj]) and (jj<nv2) do
        jj:=jj+1;

      Result:=Gkr[ii,jj];
    end;
  end;{G}
{---------------------------------------------------------}
function KOHREN(I:integer) : boolean;
  var
    V1,V2:integer;
    A:real;
    J,K:integer;
    S2Ymax:real;
 begin
   A:=0.05;
   for J:=1 to Nb do begin
     Ysr[I,J]:=0;
     for K:=1 to C[I] do begin
       Ysr[I][J]:=Ysr[I][J]+Y[I][J][K];
     end;
     Ysr[I][J]:=Ysr[I][J]/C[I];
   end;
   SS2Y[I]:=0.0;
   for J:=1 to Nb do begin
     S2Y[I][J]:=0;
     for K:=1 to C[I] do begin
       S2Y[I][J]:=S2Y[I][J]+SQr(Y[I][J][K]-Ysr[I][J]);
     end;
     if C[I]>1 then
       S2y[I][J]:=S2Y[I][J]/(C[I]-1)
     else
       S2y[I][J]:=0;
     SS2Y[I]:=SS2Y[I]+S2Y[I][J];
     if J=1 then
       S2YMAX:=s2Y[I][J]
     else
       if S2YMAX<s2Y[I][J] then
         S2YMAX:=s2Y[I][J];
   end;
   If SS2y[I]<>0 then
     Gmax[I]:=S2YMAX/SS2Y[I]
   else
     Gmax[I]:=1;
   SS2Y[I]:=SS2Y[I]/Nb; {��������� �����������������}
   V1:=C[I]-1;
   V2:=Nb*(C[I]-1);
   GTABL[I]:=G(V1,V2,A);

   if GTABL[I]<=Gmax[I] then
     KOHREN:=False
   else
     KOHREN:=True;

 end;{KOHREN}
{---------------------------------------------------------}
procedure KOEFIC(I:integer);
 var
   A:real;
   V:integer;
   d:integer;
   Zn:real;
   Db:real;
   Xvol:real;
   S2ad:real;
   II,JJ,L,kkk:integer;
 begin
   A:=0.05;
   V:=Nb*(C[I]-1);
   d:=round((Nm+1)*(Nm+2)/2); {����� �-��� ������������ ������}
   S2[I]:=SS2Y[I]/Nb;
   B0[I]:=0.0;
   for JJ:=1 to Nb do begin
     B0[I]:=B0[I]+Ysr[I,JJ];
   end;
   B0[I]:=B0[I]/Nb;
   for II:=1 to Nm do begin
     B[I][II]:=0.0;
     Zn:=0.0;
     for JJ:=1 to Nb do begin
       B[I][II]:=B[I][II]+X[II][JJ]*Ysr[I][JJ];
       Zn:=Zn+Sqr(X[II][JJ]);
     end;
     B[I][II]:=B[I][II]/Zn;
     Db:=T(V,A)*Sqrt( SS2Y[I]/(Zn*C[I]) ); {����������� �������� �-��}
     if Abs(Db)>=Abs(B[I][II]) then begin
       B[I][II]:=0.0;
       D:=D-1;{����� �-��� �����������}
     end;
     If (II>1) then begin
       For L:=1 to II-1 do begin
         BB[I][II,L]:=0.0;
         Zn:=0.0;
         for JJ:=1 to Nb do begin
           BB[I][II,L]:=BB[I][II,L]+X[II][JJ]*X[L][JJ]*Ysr[I][JJ];
           Zn:=Zn+Sqr(X[II][JJ]*X[L][JJ]);
         end;
         BB[I][II,L]:=BB[I][II,L]/Zn;
         Db:=T(V,A)*Sqrt(SS2Y[I]/(C[I]*Zn));
         if Abs(Db)>=Abs(BB[I][II,L]) then begin
           BB[I][II,L]:=0.0;
           D:=D-1;{����� �-��� �����������}
         end;
       end;
     end;
     B2[I][II]:=0.0;
     Zn:=0.0;
     Xvol:=0.0;
     for JJ:=1 to Nb do begin
       Xvol:=Xvol+Sqr(X[II][JJ]);
     end;
     Xvol:=XVol/Nb;
     for JJ:=1 to Nb do begin
       B2[I][II]:=B2[I][II]+(Sqr(X[II][JJ])-Xvol)*Ysr[I][JJ];
       Zn:=Zn+Sqr(Sqr(X[II][JJ])-Xvol);
     end;
     B2[I][II]:=B2[I][II]/Zn;
     B0[I]:=B0[I]-Xvol*B2[I][II];
     Db:=T(V,A)*Sqrt(SS2Y[I]/(C[I]*Zn));
     if Abs(Db)>=Abs(B2[I][II]) then begin
       B2[I][II]:=0.0;
       D:=D-1;{����� �-��� �����������}
     end;
     S2[I]:=S2[I]+(SS2Y[I]/(C[I]*Zn))*Sqr(Xvol);
   end;
   Db:=T(V,A)*Sqrt(S2[I]);
   if Abs(Db)>=Abs(B0[I]) then begin
     B0[I]:=0.0;
     D:=D-1;{����� �-��� �����������}
   end;
   S2ad:=0.0;
   for JJ:=1 to Nb do begin
     for kkk:=1 to Nm do begin
       Xnm[kkk]:=X[kkk][JJ];
     end;
     S2ad:=S2ad+Sqr(Ysr[I][JJ]-Yras(I,Xnm));
   end;
   S2ad:=S2ad/(Nb-d);
   Fras[I]:=S2ad/SS2Y[I];
   Ftab[I]:=Fi(Nb-D,Nb-1,0.05);

 end;{koefic}
{---------------------------------------------------------}
procedure GAUSS(IFuO:integer);   {IFuO-����� ������� �������}
  var
    iter:integer;
    osh:real;{������ ������ �� ������ �������� }
    aag:array[1..MaxK2,1..MaxK2] of real;
    bbg,bbg0:array[1..MaxK2] of real;
    xxg,xxg0:array[1..MaxK2] of real;
    k:integer;{����� ���������, ������� ���������� �� ��������� }
    i:integer;{����� ���������, �� �������� ����������� ����������� }
    j:integer;{����� �������}
    n:integer;{���������� ����������� � ������� �������� ���������}
    ii,jj,kk,iii,jjj,L,m:integer;
    rm,rr:real;
    XX:array[1..maxNb,1..MaxK2] of real; {X0,...Xnm,X1^2,...,Xnm^2,X1*X2,...X1*Xnm,...}
                                        {������� ������������ ������������}
   { X:array[1..MaxNM] of array[1..MaxNB] of Real; �����������}
   { Ysr  :array[1..MaxNY] of array[1..MaxNB] of Real; ������� ����.���������}
  begin
    {��������� XX}
    for ii:=1 to Nb do begin
      XX[ii,1]:=1.0;
    end;
    for ii:=1 to Nm do begin
      for jj:=1 to Nb do begin
        rr:=X[ii][jj];
        XX[jj,1+ii]:=rr;
        rr:=X[ii][jj];
        rr:=rr*rr;
        XX[jj,1+Nm+ii]:=rr;
      end;
    end;
    for jj:=1 to Nb do begin
      kk:=1+Nm+nm;
      for iii:=1 to Nm do begin
        for jjj:=iii+1 to Nm do begin
          kk:=kk+1;
          rr:=X[iii][jj];
          rm:=X[jjj][jj];
          rr:=rr*rm;
          XX[jj,kk]:=rr;
        end;
      end;
    end;
    n:=Round(0.5 * (Nm+1)* (Nm+2));
    {��������� aag}

    for ii:=1 to n do begin
      for jj:=1 to n do begin
        rr:=0.0;
        for kk:=1 to Nb do begin
          rr:=rr+XX[kk,ii]*XX[kk,jj];
        end;
        aag[ii,jj]:=rr;
      end;
    end;
    for jj:=1 to n do begin
      rr:=0.0;
      for kk:=1 to Nb do begin
        rr:=rr+XX[kk,jj]*Ysr[IFuO][kk];
      end;
      bbg[jj]:=rr;
    end;
  {-------------------------------}
  iter:=0;
  repeat
    iter:=iter+1;
    {������� ������� �������� ��������� ������� ������(������� ����������)}
    {������� ������ �������� aag �������� ��������� ������ bbg, ������� � ������� xxg }
    for k:=1 to n-1 do begin
      {-------------------}
      {������������ ��������� ����� aag[k,k]<>0 � ��� ����������}
      L:=k;
      for m:=k+1 to n do begin
        if Abs(aag[m,k])>Abs(aag[L,k]) then
          L:=m;
      end;
      if L<>k then begin
        for j:=k to n do begin
          rr:=aag[k,j];
          aag[k,j]:=aag[L,j];
          aag[L,j]:=rr;
        end;
        rr:=bbg[k];
        bbg[k]:=bbg[L];
        bbg[L]:=rr;
      end;
      {-------------------}
      for i:=k+1 to n do begin

        rm:=aag[i,k]/aag[k,k];
        aag[i,k]:=0.0;
        if rm<>0 then begin
          for j:=k+1 to n do begin
            rr:=aag[i,j]-rm*aag[k,j];
            aag[i,j]:=rr;
          end;
          rr:=bbg[i]-rm*bbg[k];
          bbg[i]:=rr;
        end;
      end;
    end;
    {-----------�������� �����������(���������� �����������)-----------}
    xxg[n]:=bbg[n]/aag[n,n];
    for i:=n-1 downto 1 do begin
      rr:=0;
      for j:=i+1 to n do begin
        rr:=rr+aag[i,j]*xxg[j];
      end;
      xxg[i]:=(bbg[i]-rr)/aag[i,i];
    end;

    {-------------------------------}
    if iter=1 then begin
      for ii:=1 to n do begin
        xxg0[ii]:=xxg[ii];
        bbg0[ii]:=bbg[ii];
      end;
      for ii:=1 to n do begin
        rr:=0.0;
        for jj:=1 to n do begin
          rr:=rr+aag[ii,jj]*xxg[jj];
        end;
        bbg[ii]:=bbg0[ii]-rr;
      end;
    end
    else begin
      osh:=0.0;
      for ii:=1 to n do begin
        if abs(xxg[ii])>osh then
          osh:=abs(xxg[ii]);
        xxg0[ii]:=xxg0[ii]+xxg[ii];
      end;
      for ii:=1 to n do begin
        rr:=0.0;
        for jj:=1 to n do begin
          rr:=rr+aag[ii,jj]*xxg0[jj];
        end;
        bbg[ii]:=bbg0[ii]-rr;
      end;
    end;
  until (iter>1) and (osh<0.0000001);

    {������������ ������}
    B0[IFuO]:=xxg0[1];
    for jj:=1 to Nm do begin
      B[IFuO][jj]:=xxg0[1+jj];
      B2[IFuO][jj]:=xxg0[1+Nm+jj];
    end;
    kk:=1+Nm+Nm;
    for jj:=1 to Nm do begin
      for ii:=jj+1 to Nm do begin
        kk:=kk+1;
        BB[IFuO][ii,jj]:=xxg0[kk];
      end;
    end;

  end;{GAUSS}
{---------------------------------------------------------}
procedure KOEFICR(I:integer);   {I-����� ������� �������}
 var
   A:real;
   V:integer;
   d:integer;
   Zn:real;
   Db:real;
   S2ad:real;
   II,JJ,L,kkk:integer;
   r1,r2,rr,r5,r6:real;
   Y0sr,F0,F1:real;
   rr5,rr6,rr2:real;


 begin
   A:=0.05;

   d:=round((Nm+1)*(Nm+2)/2);
           {����� �-��� ������������ ������}

   S2[I]:=SS2Y[I]/Nb;


   {r1:=0.0;
   for JJ:=1 to Nb do begin
     r1:=r1+Ysr[I,JJ];
   end;


   r2:=0.0;
   for II:=1 to Nm do begin
     rr:=0.0;
     for JJ:=1 to Nb do begin
       rr:=rr+X[II][JJ]*X[II][JJ]*Ysr[I,JJ];
     end;
     r2:=r2+rr;
   end;

   B0[I]:=AAAr[1]*r1-AAAr[2]*r2;

   for II:=1 to Nm do begin
     rr:=0.0;
     for JJ:=1 to Nb do begin
       rr:=rr+X[II][JJ]*Ysr[I][JJ];
     end;
     B[I][II]:=AAAr[3]*rr;
     for L:=1 to II-1 do begin
       rr:=0.0;
       for JJ:=1 to Nb do begin
         rr:=rr+X[II][JJ]*X[L][JJ]*Ysr[I][JJ];
       end;
       BB[I][II,L]:=AAAr[4]*rr;
     end;

     r5:=0.0;
     for JJ:=1 to Nb do begin
       r5:=r5+X[II][JJ]*X[II][JJ]*Ysr[I][JJ];
     end;
     rr5:=AAAr[5]*r5;
     rr6:=AAAr[6]*r2;
     rr2:=AAAr[2]*r1;
     B2[I][II]:=rr5+rr6-rr2;
   end;}

   GAUSS(I); {����������� ������ ������� ������� � ������������ ����������
              ��������� �� ������ ���������� ���������}

   {�������������� ������ ��������� ���������}
   {1) �������������� ����� ��������� ����������
          ������� ����������� ����� N0 �� �� ������� ��������������}

   Y0sr:=0.0;
   for JJ:=Nb-N0 to Nb do begin
     Y0sr:=Y0sr+Ysr[I][JJ];
   end;
   Y0sr:=Y0sr/N0;  {������� �������������� ����������� �����}

   F0:=0.0;
   for JJ:=Nb-N0 to Nb do begin
     F0:=F0+Sqr(Ysr[I][JJ]-Y0sr);
   end;

   {2) ����������� �������� ���������� ��������� �������� ������ �������
     �� ����������������� �� ���� ������ }
   F1:=0.0;
   for JJ:=1 to Nb do begin
     for kkk:=1 to Nm do begin
       Xnm[kkk]:=X[kkk][JJ];
     end;
     F1:=F1+Sqr(Yras(I,Xnm)-Ysr[I][JJ]);
   end;

   {3) ��������� F1 �������� F0 ������� �� ��������}
   S2ad:=F1-F0;
   {4) ��������� ��������� ��������������}
   S2ad:=S2ad/(Nb-d-N0+1);


   if SS2Y[i]<>0 then
     Fras[I]:=S2ad/SS2Y[I]
   else
     Fras[I]:=0;

   Ftab[I]:=Fi(Nb-D-N0+1,Nb-1,0.05);

 end;{koeficr}
{---------------------------------------------------------}
procedure TForm1.N7Click(Sender: TObject);
var ii,jj:integer;
begin
  OpenDialog1.defaultExt:='txt';
  if OpenDialog1.execute  then begin

    VVOD(OpenDialog1.FileName);

    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    memo1.SelStart:=0;
    Memo1.Modified:=False;
    Caption:=ExtractFileName(OpenDialog1.FileName);
    nameF:=OpenDialog1.FileName;
    memo1ch:=False;
    if ifile then begin
      N1.Enabled:=true;
      N2.Enabled:=true;
      N3.Enabled:=true;

      N5.Enabled:=true;
      N15.Enabled:=true;
      N6.Enabled:=true;
      N7.Enabled:=true;
      N8.Enabled:=true;
      N9.Enabled:=False;

      N_MIsFil:=memo1.lines.Count;
      if N_MisFil>0 then begin
        for ii:=0 to N_Misfil-1 do begin
          Misfil[ii]:=memo1.lines[ii];
        end;
      end;

      for ii:=1 to maxNy do begin
        for jj:=1 to maxNom do begin
          FlY00[ii][jj]:=False;{Ymax0 � Ymin0-��� ������� ���� ������� �������}
        end;
      end;

    end
    else begin
      N1.Enabled:=true;
      N2.Enabled:=false;
      N3.Enabled:=false;

      N5.Enabled:=True;
      N15.Enabled:=True;
      N6.Enabled:=True;
      N7.Enabled:=True;
      N8.Enabled:=False;
      N9.Enabled:=False;
    end;
  end;
end;  {TForm1.N7Click}
{-------------------------------------------------}
procedure TForm1.Print1Click(Sender: TObject);
begin
  PrintCurrentFile;
end;
{--------------------------------------------}
procedure TForm1.N6Click(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------}
procedure TForm1.New1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Caption:='NotePrinter';
end;
{-------------------------------------------}
procedure TForm1.N8Click(Sender: TObject);
var
  I:integer;
begin
  IRaschet:=False;
  if IFile then begin    {���� ������ �������}
    for I:=1 to Ny do begin
      Ikohren[I]:=KOHREN(i); {�������� �����������������}
      if radiobutton11.Checked then begin
        KOEFIC(I);
      end;
      if radiobutton14.Checked then begin
        KOEFICR(I);
      end;
    end;
    IRaschet:=True;
    n9.Enabled:=True;
  end;
end; {TForm1.N8Click}
{---------------------------------------}
procedure TForm1.Memo1Load;
  var
    I,ii,jj,ll,l,kk,dlY,DlImY,kkk:integer;
    StrR,str1,str2,strR1,strP:string;
    nach:boolean;
    Yr,s2ad:real;
    mdl:array[1..120] of integer;
    ndl:integer;
    Rsim:string[5];
begin
  strP:='                                                ';
  Case  Imemo1 of
    1,4:begin
      memo1.lines.Clear;
      if N_MisFil>0 then begin
        for II:=0 to N_MIsFil do begin
          memo1.lines.Add(MIsFil[II]);

        end;
      memo1.lines[0]:=memo1.lines[0];
      end;
    end;

    2:begin
      Rsim:=StrRaz;
      memo1.lines.Clear;
      for ii:=1 to 120 do
        mdl[ii]:=0;
      ndl:=0;
      for I:=1 to Ny do begin
        {----������ mdl[]-----------------------}
        ndl:=ndl+1;
        mdl[ndl]:=3;
        {Str1:='  N'+Rsim;
        Str2:='   '+Rsim;}

        for ii:=1 to Nm do begin
          ndl:=ndl+1;
          mdl[ndl]:=Length(NameXY[1][ii]);
          {Str1:=Str1+Copy(NameXY[1][ii]+strP,1,mdl[ndl])+Rsim;
          str2:=str2+Copy(strP,1,mdl[ndl])+Rsim;}
        end;


        for ii:=1 to C[I] do begin
          ndl:=ndl+1;
          LL:=length(NameXY[2][I]);
          mdl[ndl]:=length(NameXY[2][I]);
          {Str1:=StR1+Copy(NameXY[2][I]+strP,1,mdl[ndl])+Rsim;
          Str(ii,StrR);}
          jj:=Length(StrR);
          If jj>=mdl[ndl] then begin
            mdl[ndl]:=JJ;
            {Str2:=Str2+strR+Rsim;}
          end;
        end;
        ndl:=ndl+1;
        LL:=Length(NameXY[2][I]);
        if LL>mdl[ndl] then begin
          mdl[ndl]:=LL;
        end;
        {Str1:=str1+Copy(NameXY[2][I]+strP,1,mdl[ndl])+Rsim;}
        if mdl[ndl]<7 then
          mdl[ndl]:=7;
        {Str2:=str2+Copy('�������'+strP,1,mdl[ndl])+Rsim;}

        ndl:=ndl+1;
        mdl[ndl]:=10;
       { Str1:=str1+Copy('���������'+strP,1,mdl[ndl])+Rsim;
        Str2:=str2+Copy('���������.'+strP,1,mdl[ndl])+Rsim;}

        ndl:=ndl+1;
        mdl[ndl]:=Length(NameXY[2][I]);
       { Str1:=str1+Copy(NameXY[2][I]+strP,1,mdl[ndl])+Rsim;}
        if mdl[ndl]<9 then
          mdl[ndl]:=9;
       { Str2:=str2+Copy('���������'+strP,1,mdl[ndl])+Rsim; }

        ndl:=ndl+1;
        mdl[ndl]:=9;
        {Str1:=str1+Copy('���������'+strP,1,mdl[ndl]);
        Str2:=str2+Copy('��������.'+strP,1,mdl[ndl]);}
        kk:=0;

        for jj:=1 to Nb do begin
          ndl:=0;
          for kkk:=1 to Nm do
            Xnm[kkk]:=X[kkk][JJ];
          Yr:=Yras(I,Xnm);
          S2ad:=Sqr(Ysr[I][jj]-Yr);
          kk:=kk+1;
          STR(kk,StrR);
          LL:=Length(StrR);
          ndl:=ndl+1;
          if mdl[ndl]<=LL then begin
            mdl[ndl]:=LL;
          end;

          for ii:=1 to Nm do begin
            StrR:=FormatFloat(StrFoX,X[II][jj]);
            LL:=Length(StrR);
            ndl:=ndl+1;
            if mdl[ndl]<=LL then begin
              mdl[ndl]:=LL;
            end;
          end;
          for ii:=1 to C[I] do begin
            ndl:=ndl+1;
            StrR:=FormatFloat(StrFoY,Y[I][jj][ii]);
            LL:=Length(StrR);
            if mdl[ndl]<LL then begin
              mdl[ndl]:=LL;
            end;
          end;

          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoY,Ysr[I][jj]);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
            mdl[ndl]:=LL;
          end;


          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoD,S2Y[I][jj]);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
            mdl[ndl]:=LL;
          end;

          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoY,Yr);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
            mdl[ndl]:=LL;

          end;

          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoD,S2ad);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
            mdl[ndl]:=LL;
          end;
        end;{���� �� jj}

        {---------------------------}
        Str1:='  N'+Rsim;
        Str2:='   '+Rsim;
        ndl:=0;
        ndl:=ndl+1;
       { mdl[ndl]:=3;}

        for ii:=1 to Nm do begin
          ndl:=ndl+1;
          {mdl[ndl]:=Length(NameXY[1][ii]);}
          Str1:=Str1+Copy(NameXY[1][ii]+strP,1,mdl[ndl])+Rsim;
          str2:=str2+Copy(strP,1,mdl[ndl])+Rsim;
        end;

        {LL:=length(NameXY[2][I]);}
        for ii:=1 to C[I] do begin
          ndl:=ndl+1;
          Str1:=StR1+Copy(NameXY[2][I]+strP,1,mdl[ndl])+Rsim;
          Str(ii,StrR);
          JJ:=Length(StrR);
          L:=Round((mdl[ndl]-JJ)/2);
          if mdl[ndl]=JJ then begin
            Str2:=str2+StrR+Rsim
          end
          else begin
            if L=1 then begin
              Str2:=str2+Copy(Strp,1,L)+StrR+Rsim
            end
            else begin
              Str2:=str2+Copy(Strp,1,L)+StrR+Copy(Strp,1,mdl[ndl]-JJ-L)+Rsim;
            end;
          end;
        end;{���� �� ii}
        ndl:=ndl+1;
            {mdl[ndl]:=LL;}
        Str1:=str1+Copy(NameXY[2][I]+strP,1,mdl[ndl])+Rsim;
            {if mdl[ndl]<7 then
               mdl[ndl]:=7;}
        Str2:=str2+Copy('�������'+strP,1,mdl[ndl])+Rsim;

        ndl:=ndl+1;
            {mdl[ndl]:=10;}
        Str1:=str1+Copy('���������'+strP,1,mdl[ndl])+Rsim;
        Str2:=str2+Copy('���������.'+strP,1,mdl[ndl])+Rsim;

        ndl:=ndl+1;
             {mdl[ndl]:=Length(NameXY[2][I]);}
        Str1:=str1+Copy(NameXY[2][I]+strP,1,mdl[ndl])+Rsim;
           { if mdl[ndl]<9 then
              mdl[ndl]:=9;}
        Str2:=str2+Copy('���������'+strP,1,mdl[ndl])+Rsim;

        ndl:=ndl+1;
            {mdl[ndl]:=9;}
        Str1:=str1+Copy('���������'+strP,1,mdl[ndl]);
        Str2:=str2+Copy('��������.'+strP,1,mdl[ndl]);

        memo1.lines.Add(str1);
        memo1.lines.Add(str2);
        memo1.lines.Add(' ');

        kk:=0;

        for jj:=1 to Nb do begin
          ndl:=0;
          for kkk:=1 to Nm do
            Xnm[kkk]:=X[kkk][JJ];
          Yr:=Yras(I,Xnm);
          S2ad:=Sqr(Ysr[I][jj]-Yr);
          kk:=kk+1;
          STR(kk,StrR);
          LL:=Length(StrR);
          ndl:=ndl+1;
          if mdl[ndl]<=LL then begin
            {mdl[ndl]:=LL;}
            Str1:=StrR+Rsim;
          end
          else begin
            Str1:=Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
          end;

          for ii:=1 to Nm do begin
            StrR:=FormatFloat(StrFoX,X[II][jj]);
            LL:=Length(StrR);
            ndl:=ndl+1;
            if mdl[ndl]<=LL then begin
             { mdl[ndl]:=LL;}
              str1:=Str1+strR+Rsim;
            end
            else begin
              Str1:=str1+Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
            end;
          end;
          for ii:=1 to C[I] do begin
            ndl:=ndl+1;
            StrR:=FormatFloat(StrFoY,Y[I][jj][ii]);
            LL:=Length(StrR);
            if mdl[ndl]<LL then begin
             { mdl[ndl]:=LL;  }
              str1:=str1+StrR+Rsim;
            end
            else begin
              Str1:=str1+Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
            end;
          end;

          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoY,Ysr[I][jj]);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
            {mdl[ndl]:=LL;}
            str1:=str1+StrR+Rsim;
          end
          else begin
            Str1:=str1+Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
          end;


          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoD,S2Y[I][jj]);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
            {mdl[ndl]:=LL;}
            str1:=str1+StrR+Rsim;
          end
          else begin
            Str1:=str1+Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
          end;

          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoY,Yr);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
           { mdl[ndl]:=LL;}
            str1:=str1+StrR+Rsim;
          end
          else begin
            Str1:=str1+Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
          end;

          ndl:=ndl+1;
          StrR:=FormatFloat(StrFoD,S2ad);
          LL:=Length(StrR);
          if mdl[ndl]<LL then begin
           { mdl[ndl]:=LL;   }
            str1:=str1+StrR+Rsim;
          end
          else begin
            Str1:=str1+Copy(strp,1,mdl[ndl]-LL)+StrR+Rsim;
          end;

          memo1.lines.Add(str1);
        end;{���� �� jj}

        memo1.lines.Add(' ');

        StrR:=FormatFloat(StrFoK,Gmax[I]);
        Str1:='Gmax='+StrR;
        StrR:=FormatFloat(StrFoK,Gtabl[I]);
        Str1:=Str1+ '       Gtabl='+StrR;
        memo1.lines.Add(str1);
        if Gtabl[I]<=Gmax[I] then begin
          memo1.lines.Add('�� �������� �� �������� �������');
        end;
        StrR:=FormatFloat(StrFoK,Fras[I]);
        Str1:='Fras='+StrR;
        StrR:=FormatFloat(StrFoK,Ftab[I]);
        Str1:=Str1+ '       Ftabl='+StrR;
        memo1.lines.Add(str1);
        if Fras[I]>Ftab[I] then begin
          memo1.lines.Add('�� �������� �� �������� ������');
        end;
        memo1.lines.Add('-------------------------------------------------------');
      end;{���� �� I}
      memo1.lines[0]:=memo1.lines[0];

    end;

    3:begin
      memo1.lines.Clear;
      kk:=-1;
      for II:=1 to Ny do begin
        if B0[II]<> 0 then begin
          {Str(B0[II],StrR1);}
          StrR1:=FormatFloat(strFo,B0[II]);
          StrR:=NameXY[2,II] + ' = ' + StrR1;
          nach:=false;
        end
        else begin
          StrR:=NameXY[2,II] + ' = ' ;
          nach:=true;
        end;
        kk:=kk+1;
        memo1.Lines.Add(' ');
        memo1.Lines[kk]:=StrR;
        StrR:='';

        for JJ:=1 to Nm do begin
          if B[II,JJ]<>0 then begin
            {Str(B[II,JJ],StrR1);   }
            StrR1:=FormatFloat(strFo,B[II,JJ]);
            if (B[II,JJ]>0)and not nach then
              strR:=StrR+'+';
            StrR:=StrR + StrR1+ ' * ' +NameXY[1,JJ];
            nach:=false;
            kk:=kk+1;
            memo1.Lines.Add(' ');
            memo1.lines[kk]:=StrR;
            StrR:='';

          end;
        end;
        for JJ:=1 to Nm do begin
          if B2[II,JJ]<>0 then begin
            if (B2[II,JJ]>0)and not nach then
              strR:=StrR+'+';
          {  Str(B2[II,JJ],StrR1);}
            StrR1:=FormatFloat(strFo,B2[II,JJ]);
            StrR:=StrR + StrR1+ ' * ' +NameXY[1,JJ]+ '^2' ;
            nach:=false;
            kk:=kk+1;
            memo1.Lines.Add(' ');
            memo1.lines[kk]:=StrR;
            StrR:='';

          end;
        end;
        for JJ:=1 to Nm do begin
          if JJ>1 then begin
            for L:=1 to JJ-1 do begin
              if BB[II][JJ,L]<>0 then begin
                if (BB[II][JJ,L]>0)and not nach then
                  strR:=StrR+'+';
                StrR1:=FormatFloat(strFo,BB[II,JJ,L]);
                StrR:=StrR + StrR1+ ' * ' +NameXY[1,L] + ' * ' +NameXY[1,JJ];
                nach:=false;
                kk:=kk+1;
                memo1.Lines.Add(' ');
                memo1.lines[kk]:=StrR;
                StrR:='';

              end;
            end;
          end;
        end;
        kk:=kk+1;
        memo1.Lines.Add(' ');
        memo1.lines[kk]:='--------------------------------------';
      end;
      if kk>=0 then begin
        memo1.lines[0]:=memo1.lines[0];
       { memo1.SelStart:=0;
        Memo1.Modified:=False;}
      end;
    end;
  end;
end;{Form1.LoadMemo1}
{----------------------------------------------------}
procedure TForm1.RadioButton14Click(Sender: TObject);
begin
   if RadioButton14.Checked then
    IMemo1:=4;
  if RadioButton13.Checked then
    IMemo1:=3;
  if RadioButton12.Checked then
    IMemo1:=2;
  if RadioButton11.Checked then
    IMemo1:=1;
  Memo1Load;
end;
{-----------------------------------------------------}
procedure TForm1.RadioButton13Click(Sender: TObject);

begin
  if RadioButton14.Checked then
    IMemo1:=4;
  if RadioButton13.Checked then
    IMemo1:=3;
  if RadioButton12.Checked then
    IMemo1:=2;
  if RadioButton11.Checked then
    IMemo1:=1;
  Memo1Load;
end;
{------------------------------------------------------}
procedure TForm1.RadioButton11Click(Sender: TObject);
begin
  if RadioButton14.Checked then
    IMemo1:=4;
  if RadioButton13.Checked then
    IMemo1:=3;
  if RadioButton12.Checked then
    IMemo1:=2;
  if RadioButton11.Checked then
    IMemo1:=1;
  Memo1Load;
end;
{------------------------------------------------------}
procedure TForm1.RadioButton12Click(Sender: TObject);
begin
  if RadioButton14.Checked then
    IMemo1:=4;
  if RadioButton13.Checked then
    IMemo1:=3;
  if RadioButton12.Checked then
    IMemo1:=2;
  if RadioButton11.Checked then
    IMemo1:=1;
  Memo1Load;

end;
{------------------------------------------------------}
procedure TForm1.N2Click(Sender: TObject);
begin
  PagesDlg.Show;
  end;
{------------------------------------------------------}
procedure TForm1.N11Click(Sender: TObject);
begin
  FontDialog1.execute;
  memo1.Font:=FontDialog1.Font;
end;
{------------------------------------------------------}
procedure TForm1.N9Click(Sender: TObject);
begin
  form5.Show;
end;
{---------------------------------------------------------}
procedure TForm1.FormCreate(Sender: TObject);
var i,j:integer;
begin

     LoadFileNast;

     for i:=1 to maxNy do begin
       for j:=1 to maxNom  do begin
         FlY00[i][j]:=False;
       end;
     end;
      LWidth:=1; {������� ����}
      LStyle:=psSolid;
      izor:=TypIzo.Create;
      N1.Enabled:=true;
      N2.Enabled:=false;
      N3.Enabled:=false;

      N5.Enabled:=true;
      N15.Enabled:=true;
      N6.Enabled:=true;
      N7.Enabled:=true;
      N8.Enabled:=false;

      ifile:=false;
      RadioButton11.Checked:=True;
      Imemo1:=1;
      StrFo:='0.####E+00';
      StrFoX:='#0.###';
      StrFoY:='0.####E+00';
      StrFoD:='0.####E+00';
      StrFoK:='0.####E+00';
      StrRaz:='   ';

      FormatX:='0.####E+00';

      FormatX3:='0.####E+00';
      FormatY3:='0.####E+00';

      FormatZ0:='0.####E+00';

      for i:=1 to Nm do begin
        Xnm[i]:=0.;
      end;

      RowStringGrid2:=1;
      Nxx:=1;
      Nxy:=2;

      FonColIzo:=clSilver;//==ati

       {clFuchsia, clGray, clGreen, clLime, clLtGray}
       {clMaroon, clNavy, clOlive, clPurple, clRed}
       {clSilver, clTeal, clWhite, and clYellow}

      alpha:=225;
      Radiana:=57.2957795;
      Ralpha:=alpha/radiana;

      beta:=0;
      Rbeta:=beta/radiana;
      DOz:=220;
      DOx:=220;
      DOy:=220;
      DOx2:=300;
      DOy2:=280;

      PoleX:=50;
      Poley:=30;

      LGor:=300;
      LVer:=370;

      WXoplYOpl;

      XOpl2:=50;
      YOpl2:=350;

      RasGrSe;

      GrFont:=TFont.create;
      GrFont:=Form1.Canvas.Font;
      GrFont.Size:=7;

      {GrFont.Name:='Courier New';
      GrFont.Pitch:=fpFixed;}



      {TekFontPrn.Name:='Courier New';
      TekFontPrn.Size:=1;
      TekFontPrn.Pitch:=fpFixed;}

      maPrnxn:=4.0;
      maPrnyn:=4.0;

      {sdviVer2:=0;
      sdviVer3:=0;
      sdviGor2:=0;
      sdviGor3:=0; }

      nameF:='';
      ShiCol:=20;

      gamma:=35;
      Rgamma:=gamma/radiana;

      FlRadBut1:=False;
      FlRadBut2:=True;
      FlRadBut3:=False;

      memo1ch:=False;
      teknomizo:=0;
      kolSimNameG:=5;

      sdviTochGor2:=20;
      sdviTochVer2:=50;

      {TekCanvas.Font.Size:=8;
         TekCanvas.Font.name:='Courier New';
         TekCanvas.Font.Pitch:=fpFixed;     }


end;
{-----------------------------------------------------------}
procedure TForm1.saveClick(Sender: TObject);
begin
  if IFile   then begin
    SaveDialog1.defaultExt:='txt';
    if SaveDialog1.execute  then begin
      nameF:=OpenDialog1.FileName;
      if nameF<>'' then
        Memo1.Lines.SaveToFile(NameF);
    end;
  end
  else begin
    MessageDlg('������� ��������� ����', mtWarning, [mbOk], 0);
  end;
 end;
{--------------------------------------------}
procedure TForm1.N15Click(Sender: TObject);
begin
  if OkRightDlg.ShowModal = idok Then begin
    SaveFileNast;
  end;
end;
{--------------------------------------------}
procedure TForm1.Memo1Change(Sender: TObject);
begin
  memo1ch:=True;
end;
{--------------------------------------}
procedure TForm1.FormShow(Sender: TObject);
var hff,hfp,wff,wfp:integer;
begin
     form1.canvas.font.Size:=8;
     form1.canvas.font.Name:='Courier New';
     form1.canvas.font.Pitch:=fpFixed;
     hff:=form1.canvas.TextHeight('a');
     wff:=form1.canvas.TextWidth('a');

     printer.canvas.font.Size:=8;
     printer.canvas.font.Name:='Courier New';
     printer.canvas.font.Pitch:=fpFixed;
     hfp:=printer.canvas.TextHeight('a');
     wfp:=printer.canvas.TextWidth('a');

      maPrnxn:=hfp/hff;
      maPrnyn:=hfp/hff;

end;


end.
