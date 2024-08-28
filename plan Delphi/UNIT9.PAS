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
      MessageDlg('Папка указанная в файле config.txt не найдена.' , mtWarning, [mbOk], 0);
      rfolder:=' ';
      rdrive:=rfolder[1];
    end;
 end; }
end;

end.
