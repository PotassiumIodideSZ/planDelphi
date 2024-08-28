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
program Project1;

uses
  Forms,
  plan in 'plan.pas' {Form1},
  Unit1 in 'Unit1.pas' {FileDlg},
  Unit2 in 'Unit2.pas' {PagesDlg},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas',
  Unit5 in 'Unit5.pas' {Form5},
  Unit9 in 'Unit9.pas' {OKRightDlg},
  Unit10 in 'Unit10.pas' {Form10};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFileDlg, FileDlg);
  Application.CreateForm(TPagesDlg, PagesDlg);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TOKRightDlg, OKRightDlg);
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
unit Unit1;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, FileCtrl;

type
  TFileDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    FilterComboBox1: TFilterComboBox;
    Edit1: TEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileDlg: TFileDlg;

implementation

{$R *.DFM}



end.
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
    procedure TrackBar1DragDrop(Sender, Source: TObject; X, Y: Integer);


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
  StringGrid1.Cells[0,0]:='�� X';
  StringGrid1.Cells[1,0]:='�� Y';
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

  StringGrid2.Cells[0,0]:='���';
  StringGrid2.Cells[1,0]:='��������';
  for jj:=1 to Nm do begin
    StringGrid2.Cells[0,jj]:=NameXY[1,jj];
    strR:=FormatFloat(rFormatX,izor.XnmFakt[jj]);
    StringGrid2.Cells[1,jj]:=StrR;
  end;
  StringGrid2.Row:=RowStringGrid2;

  StringGrid3.RowCount:=12;
  StringGrid3.Cells[0,0]:='�������� ��������';
  StringGrid3.Cells[1,0]:='��������';


  StringGrid3.Cells[0,1]:='���';
  StringGrid3.Cells[1,1]:=izoR.nameG;

  StringGrid3.Cells[0,2]:='�����.����� �� X';
  StringGrid3.Cells[1,2]:=IntToStr(izoR.KolFX);

  StringGrid3.Cells[0,3]:='�����.����� �� Y';
  StringGrid3.Cells[1,3]:=IntToStr(izoR.KolFY);

  StringGrid3.Cells[0,4]:='�����.����� ����� ������� �� X';
  StringGrid3.Cells[1,4]:=IntToStr(izoR.KolRX);

  StringGrid3.Cells[0,5]:='�����.����� ����� ������� �� Y';
  StringGrid3.Cells[1,5]:=IntToStr(izoR.KolRY);

  StringGrid3.Cells[0,6]:='�����.������� ������� ';
  StringGrid3.Cells[1,6]:=IntToStr(izoR.KolUrSe);

  StringGrid3.Cells[0,7]:='������� ����� ';
  StringGrid3.Cells[1,7]:=IntToStr(izoR.G_Width);
 //   kolZE0:integer;  // ����� ������� � ��� Z
 //   kolxt0:integer;  // ��� �������� �� x
 //   kolyt0:integer;  // ��� �������� �� y
 //   kolzt0:integer;  // ��� �������� �� z
  StringGrid3.Cells[0,8]:='���������� ������� �� ��� Z';
  StringGrid3.Cells[1,8]:=IntToStr(izoR.kolZE0);

  StringGrid3.Cells[0,9]:='��� �������� �� ��� X';
  StringGrid3.Cells[1,9]:=IntToStr(izoR.kolxt0);

  StringGrid3.Cells[0,10]:='��� �������� �� ��� Y';
  StringGrid3.Cells[1,10]:=IntToStr(izoR.kolyt0);

  StringGrid3.Cells[0,11]:='��� �������� �� ��� Z';
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
    MessageDlg('�������� ������ �����',mtInformation,[mbOk],0);
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




  izor.Nom:=StringGrid1.Row; {������� ����}
  Izor.izoNxx:=RNxx;
  Izor.izoNxy:=RNxy;
  Izor.I_Y:=listBox1.ItemIndex+1;
  if FlTrackBar then begin
    for ii:=1 to Nm do begin
      izor.XnmFix[ii]:=Xmi+(Xma-Xmi)*(izor.XnmFakt[ii]-Xmin[ii])/(Xmax[ii]-Xmin[ii]);
    end;
  end;

  {'���'}
  izoR.nameG:=StringGrid3.Cells[1,1];

  {'���������� �������� �� X'}
  izoR.KolFX:=StrToInt(StringGrid3.Cells[1,2]);

  {'���������� �������� �� Y'}
  izoR.KolFY:=StrToInt(StringGrid3.Cells[1,3]);

  {'���������� ��������� �� X'}
  izoR.KolRX:=StrToInt(StringGrid3.Cells[1,4]);

  {'���������� ��������� �� Y'}
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
    colorG:=clBlue;
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
unit Unit5;

interface                    


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,Printers, ComCtrls, Grids, Mask, Spin,  Buttons, unit4;


type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    UpDown3: TUpDown;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    Button6: TButton;
    Button4: TButton;
    SpeedButton1: TSpeedButton;
    Button7: TButton;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    Panel3: TPanel;
    ListBox1: TListBox;
    Splitter5: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter6: TSplitter;
    Panel7: TPanel;
    Splitter7: TSplitter;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Image2: TImage;
    Image1: TImage;

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
  {sdviGor,sdviVer:integer;}  {�����, ������� ������ ������ �����}
  maPrnXF,maPrnYF:real;{������������ ��������������� ��� ������ �����}
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
    izoR.nameG:='��.' + IntToStr(kk+1);

    IForm:=Form3.ShowModal;

    if OkForm3 then begin
      KolIzo:=KolIzo+1;
      Izo[KolIzo]:=TIzometrG.Create;
      with izo[kolizo] do begin

        colorG:=IzoR.colorG;   {���� ����� �������}
        G_Width:=Izor.G_Width; {������� ����� �������}
        G_Style:=Izor.G_Style; {����� ����� �������}


        I_Y   :=izor.I_Y; {����� ������� �������}
        nameG  :=IzoR.NameG;
        KolFX :=IzoR.KolFX ; {���������� �������� �� X=10}
        KolFY :=IzoR.KolFY ; {���������� �������� �� Y=10}

        kolZE0:=IzoR.kolZE0;  // ����� ������� � ��� Z
        kolxt0:=IzoR.kolxt0;  // ��� �������� �� x
        kolyt0:=IzoR.kolyt0;  // ��� �������� �� y
        kolzt0:=IzoR.kolzt0;  // ��� �������� �� z


        KolRX :=IzoR.KolRX ; {���������� ��������� �� X=100}
        KolRY :=IzoR.KolRY ; {���������� ��������� �� Y=100}
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
    messageDlg('������� ����� ��������',mtInformation,[mbOk],0);
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
       messageDlg('������ �� ������',mtInformation,[mbOk],0);
       exit;
     end;

     with Izor do begin
         colorG:=izo[nomizo].colorG;
         G_Width:=Izo[nomizo].G_Width; {������� ����� �������}
         G_Style:=Izo[nomizo].G_Style; {����� ����� �������}

         I_Y   :=izo[nomizo].I_Y; {����� ������� �������}
         nameG  :=izo[nomizo].NameG;
         KolFX :=izo[nomizo].KolFX ; {���������� �������� �� X=10}
         KolFY :=izo[nomizo].KolFY ; {���������� �������� �� Y=10}

         kolZE0:=Izo[nomizo].kolZE0;  // ����� ������� � ��� Z
         kolxt0:=Izo[nomizo].kolxt0;  // ��� �������� �� x
         kolyt0:=Izo[nomizo].kolyt0;  // ��� �������� �� y
         kolzt0:=Izo[nomizo].kolzt0;  // ��� �������� �� z


         KolRX :=izo[nomizo].KolRX ; {���������� ��������� �� X=100}
         KolRY :=izo[nomizo].KolRY ; {���������� ��������� �� Y=100}
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
         G_Width:=Izor.G_Width; {������� ����� �������}
         G_Style:=Izor.G_Style; {����� ����� �������}

         I_Y   :=izor.I_Y; {����� ������� �������}
         nameG  :=IzoR.NameG;
         KolFX :=IzoR.KolFX ; {���������� �������� �� X=10}
         KolFY :=IzoR.KolFY ; {���������� �������� �� Y=10}

         kolZE0:=IzoR.kolZE0;  // ����� ������� � ��� Z
         kolxt0:=IzoR.kolxt0;  // ��� �������� �� x
         kolyt0:=IzoR.kolyt0;  // ��� �������� �� y
         kolzt0:=IzoR.kolzt0;  // ��� �������� �� z

         KolRX :=IzoR.KolRX ; {���������� ��������� �� X=100}
         KolRY :=IzoR.KolRY ; {���������� ��������� �� Y=100}
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
     messageDlg('������ �� ������',mtInformation,[mbOk],0);
     exit;
   end;

     if nomizo<kolizo then begin
       for i1:=nomIzo To KolIzo-1 do begin

         izo[i1].colorG:=izo[i1+1].colorG;
         izo[i1].G_Width:=izo[i1+1].G_Width;
         izo[i1].G_Style:=izo[i1+1].G_Style;
         izo[i1].I_Y   :=izo[i1+1].I_Y; {����� ������� �������}
         izo[i1].nameG  :=izo[i1+1].NameG;
         izo[i1].KolFX :=izo[i1+1].KolFX ; {���������� �������� �� X=10}
         izo[i1].KolFY :=izo[i1+1].KolFY ; {���������� �������� �� Y=10}

         izo[i1].kolZE0:=Izo[i1+1].kolZE0;  // ����� ������� � ��� Z
         izo[i1].kolxt0:=Izo[i1+1].kolxt0;  // ��� �������� �� x
         izo[i1].kolyt0:=Izo[i1+1].kolyt0;  // ��� �������� �� y
         izo[i1].kolzt0:=Izo[i1+1].kolzt0;  // ��� �������� �� z


         izo[i1].KolRX :=izo[i1+1].KolRX ; {���������� ��������� �� X=100}
         izo[i1].KolRY :=izo[i1+1].KolRY ; {���������� ��������� �� Y=100}
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

  FlRectangle2:=False; {��� ������� ������� �� Image1}
  FlRectangle1:=False; {��� ������� ������� �� Image2}
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

      Label1.Caption:='���� ��� X/' + NameXY[1,izo[nomizo].izoNxx];
      MaskEdit1.Text:=IntToStR(alpha);
      UpDown1.Position:=alpha;

      Label2.Caption:='���� ��� Y/' + NameXY[1,izo[nomizo].izoNxy];
      MaskEdit2.Text:=IntToStR(beta);
      UpDown2.Position:=beta;

      Label7.Caption:='��� Z/' + NameXY[2,izo[nomizo].I_Y];
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

        Label5.Caption:='��� X/' + NameXY[1,izo[nomizo].izoNxx];
        MaskEdit5.Text:=IntToStR(Dox2);
        UpDown5.Position:=Dox2;

        Label6.Caption:='��� Y/' + NameXY[1,izo[nomizo].izoNxy];
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

        Label5.Caption:='��� X/' + NameXY[1,izo[nomizo].izoNxx];
        MaskEdit5.Text:=IntToStR(Dox);
        UpDown5.Position:=Dox;

        Label6.Caption:='��� Y/' + NameXY[1,izo[nomizo].izoNxy];
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
    Label1.Caption:='���� ��� X' ;
    MaskEdit1.Text:=IntToStR(alpha);
    UpDown1.Position:=alpha;


    Label2.Caption:='���� ��� Y' ;
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

      Label5.Caption:='��� X' ;
      MaskEdit5.Text:=IntToStR(Dox2);
      UpDown5.Position:=Dox2;

      Label6.Caption:='��� Y' ;
      MaskEdit6.Text:=IntToStR(Doy2);
      UpDown6.Position:=Doy2;

    Label7.Caption:='��� Z' ;
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

      Label5.Caption:='��� X' ;
      MaskEdit5.Text:=IntToStR(Dox);
      UpDown5.Position:=Dox;

      Label6.Caption:='��� Y' ;
      MaskEdit6.Text:=IntToStR(Doy);
      UpDown6.Position:=Doy;

      Label7.Caption:='��� Z' ;
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
    stringgrid1.cells[0,0]:='������';
    stringgrid1.cells[1,0]:='�������';
    stringgrid1.cells[2,0]:='��������';
    stringgrid1.cells[3,0]:='X-���';
    stringgrid1.cells[4,0]:='X-��������';
    stringgrid1.cells[5,0]:='Y-���';
    stringgrid1.cells[6,0]:='Y-��������';
    stringgrid1.cells[7,0]:='���';
    stringgrid1.cells[8,0]:='��������';
    stringgrid1.cells[9,0]:='���';
    stringgrid1.cells[10,0]:='��������';
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
    stringgrid1.cells[0,0]:='������';
    stringgrid1.cells[1,0]:='�������';
    stringgrid1.cells[2,0]:='��������';
    stringgrid1.cells[3,0]:='X-���';
    stringgrid1.cells[4,0]:='X-��������';
    stringgrid1.cells[5,0]:='Y-���';
    stringgrid1.cells[6,0]:='Y-��������';
    stringgrid1.cells[7,0]:='���';
    stringgrid1.cells[8,0]:='��������';
    stringgrid1.cells[9,0]:='���';
    stringgrid1.cells[10,0]:='��������';
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
  stringgrid2.cells[0,0]:='�����';
  stringgrid2.cells[1,0]:='������';
  stringgrid2.cells[2,0]:='�����.';
  stringgrid2.cells[3,0]:='����.�';

  stringgrid2.cells[2,0]:='��� X';
  stringgrid2.cells[3,0]:='����.X';

  stringgrid2.cells[2,0]:='��� Y';
  stringgrid2.cells[3,0]:='����.Y';
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
    strR:='�.' + StrR;
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
           {������� ����������� ������}
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
           {������� ����������� ������}


  FlMouseDown:=True; {���� ������ �� Image1}
  XMouseDown:=X;
  YMouseDown:=Y;{���������� ������ ������� ���� �� Image1}


end;
{---------------------------------------------------}
procedure TForm5.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FlRectangle2 then
    RisRectangle(Image2.canvas,FlRectangle2,X1Rectangle2,Y1Rectangle2,X2Rectangle2,Y2Rectangle2);
           {������� ����������� ������}

  FlMouseDown:=True; {���� ������ �� Image2}
  XMouseDown:=X;
  YMouseDown:=Y;{���������� ������ ������� ���� �� Image2}

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
               strR:='�.'+strR;
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
    else begin {������� � ����� ������������ ��������}
      if kolizo>0 then begin
        if not FlMouseDown then begin
         { if (Abs(x/maprnxf-(XnSe+sdviGor))<=2) and
                 (Abs(Y/maprnyf-(YkSe+sdviver))<=2) then begin}
          if (Abs(x/maprnxf-XnSe)<=2) and
             (Abs(Y/maprnyf-YkSe)<=2) then begin
                 {������ � ������ ���������}
              Form5.Cursor:=crCross;
              GdeDown:=1;
          end
          else begin
           { if (Abs(x/maprnxf-(XkSe+sdviGor))<=2) and
               (Abs(Y/maprnyf-(YkSe+sdviver))<=2) then begin}
            if (Abs(x/maprnxf-XkSe)<=2) and
               (Abs(Y/maprnyf-YkSe)<=2) then begin
                 {������ � ����� ��� � }
              Form5.Cursor:=crSizeWe;
              GdeDown:=2;

            end
            else begin
              {if (Abs(x/maprnxf-(XnSe+sdviGor))<=2) and
                 (Abs(Y/maprnyf-(YnSe+sdviver))<=2) then begin}
              if (Abs(x/maprnxf-XnSe)<=2) and
                 (Abs(Y/maprnyf-YnSe)<=2) then begin
                 {������ � ����� ��� Y }
                Form5.Cursor:=crSizeNs;
                GdeDown:=3;
              end
              else begin
                {if (Abs(x/maprnxf-(XkSe+sdviGor))<=2) and
                   (Abs(Y/maprnyf-(YnSe+sdviver))<=2) then begin}
                if (Abs(x/maprnxf-XkSe)<=2) and
                   (Abs(Y/maprnyf-YnSe)<=2) then begin
                   {������ � ����� ��� � � Y}
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
           {������� ����������� ������}
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
            {������ ����� ������}
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
             {������ � ������ ���������}
          Form5.Cursor:=crCross;
          GdeDown:=5;
      end
      else begin
        if (Abs(x/maprnxf-OsX3KoorX)<=4) and
         (Abs(Y/maprnyf-OsX3KoorY)<=4) then begin
          {������ � ����� ��� X 3-� ������� �������}
          Form5.Cursor:=crSizeNESW;;
          GdeDown:=6;
        end
        else begin
          if (Abs(x/maprnxf-OsY3KoorX)<=4) and
           (Abs(Y/maprnyf-OsY3KoorY)<=4) then begin
            {������ � ����� ��� Y 3-� ������� �������}
            Form5.Cursor:=crSizeNESW;
            GdeDown:=7;
          end
          else begin
            if (Abs(x/maprnxf-OsZ3KoorX)<=4) and
             (Abs(Y/maprnyf-OsZ3KoorY)<=4) then begin
            {������ � ����� ��� Z 3-� ������� �������}
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
           {������� ����������� ������}
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
         {������ ����� ������}
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
            messageDlg('������� ����� �����',mtInformation,[mbOk],0);
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
              {������� ����������� ������}
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
           {������� ����������� ������}
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
unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Grids, Outline, DirOutln;

type
  TForm7 = class(TForm)
    DirectoryOutline1: TDirectoryOutline;
    DriveComboBox1: TDriveComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.DFM}

end.
unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm8 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.DFM}

end.
 unit Unit9;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,Messages,
  Buttons, ExtCtrls, FileCtrl,Dialogs,
  unit4;

type
  TOKRightDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OKRightDlg: TOKRightDlg;

implementation

{$R *.DFM}
{-------------------------------------------}
procedure TOKRightDlg.OKBtnClick(Sender: TObject);
begin
  RDrive:=OKRightDlg.DirectoryListBox1.Drive;
  RFolder:=OKRightDlg.DirectoryListBox1.Directory;
end;
{-------------------------------------------}
procedure TOKRightDlg.CancelBtnClick(Sender: TObject);
begin
  close;
end;
{-------------------------------------------}
procedure TOKRightDlg.FormCreate(Sender: TObject);
begin
 { try

  OKRightDlg.DirectoryListBox1.Drive:=rdrive;
  OKRightDlg.DirectoryListBox1.Directory:=rfolder;

  except
    on EInOutError   do begin
      MessageDlg('����� ��������� � ����� config.txt �� �������.' , mtWarning, [mbOk], 0);
      rfolder:=' ';
      rdrive:=rfolder[1];
    end;
 end; }
end;

end.
unit Unit10;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls,printers;

type
  TForm10 = class(TForm)
    ToolBar: TPanel;
    PrintSB: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure InitGlobals;
    procedure FormActivate(Sender: TObject);
    procedure PrintSBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
  uses
    Unit4;
{$R *.DFM}
const
  border=10;
{-------------------------------------------------}
procedure TForm10.FormCreate(Sender: TObject);
begin
  PreBits:=TBitmap.create;
end;
{-------------------------------------------------}
procedure TForm10.FormDestroy(Sender: TObject);
begin
  PreBits.Free;
end;
{-------------------------------------------------}
procedure TForm10.FormPaint(Sender: TObject);
var
  raz:Trect;
begin
   with Form10.Canvas do begin
       raz:=ClientRect;
       Brush.color:=clGray;{FonColIzo;}
       Pen.color:=clBlack;{FonColIzo;}
       Rectangle(raz.Left,raz.Top,raz.right,raz.bottom);
     end;
   Canvas.Draw(ClientWidth div 4, ToolBar.Height +border,PreBits);
end;
{-------------------------------------------------}
procedure TForm10.InitGlobals;
begin
  PreBits.Width:=ClientWidth div 2;
  PreBits.Height:=Round(1.3*Prebits.Width);{��������(1.3=8,5x11)}
  PpiX:=Round(PreBits.Width/8.5);
  PpiY:=Round(PreBits.Height/11.0);
  if WindowState<>wsMaximized then
    ClientHeight:= ToolBar.Height+Prebits.Height+border*2;
end;{InitGlobals}
{-------------------------------------------------}
procedure TForm10.FormResize(Sender: TObject);
var
  rmashX,rmashY:real;
begin
  InitGlobals;
  rmashX:=ppiX/PixelsPerInchY;
  rmashY:=ppiY/PixelsPerInchY;
  PrintGr(PreBits.Canvas,2,rmashX,rmashY,clWhite);
  Invalidate;
end;
{-------------------------------------------------}
procedure TForm10.FormActivate(Sender: TObject);
var
  rmashX,rmashY:real;
begin
  InitGlobals;
  rmashX:=ppiX/PixelsPerInchY;
  rmashY:=ppiY/PixelsPerInchY;
  PrintGr(PreBits.Canvas,2,rmashX,rmashY,clWhite);
  Invalidate;
end;
{-------------------------------------------------}
procedure TForm10.PrintSBClick(Sender: TObject);
var
  rmashX,rmashY:real;
  RX,RY:real;
begin
  Printer.BeginDoc;
  InitGlobals;
  RX:=printer.PageWidth/8.5;
  RY:=printer.PageHeight/11.0;
  rmashX:=RX/PixelsPerInchY;
  rmashY:=RY/PixelsPerInchY;
  PrintGr(Printer.Canvas,3,rmashX,rmashY,clWhite);
  Invalidate;
  Printer.EndDoc;
end;

end.
