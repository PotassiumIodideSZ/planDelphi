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
