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
