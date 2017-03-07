unit formNetflixQcResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls;

type
  TfrmNetflixQcResult = class(TForm)
    lblLink1: TTntLabel;
    lblPref1: TTntLabel;
    lblPostf1: TTntLabel;
    lblLink2: TTntLabel;
    lblPref2: TTntLabel;
    lblPostf2: TTntLabel;
    btnLocateFile: TButton;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblLinkClick(Sender: TObject);
    procedure btnLocateFileClick(Sender: TObject);
  private
    { Private declarations }
    FFileToLocate: WideString;

    procedure PlaceLabels(PrefLbl: TTntLabel; LinkLbl: TTntLabel; PostfLbl: TTntLabel;
      Msg: WideString; Link: WideString);
    procedure PlaceButtons;
    procedure OpenFileLocation(FilePath: WideString); 

  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
      Msg1: WideString; Path1: WideString;
      Msg2: WideString; Path2: WideString; LocatePath: WideString); reintroduce;

  end;

var
  frmNetflixQcResult: TfrmNetflixQcResult;

implementation

uses Math, ShellApi;

{$R *.dfm}

constructor TfrmNetflixQcResult.Create(AOwner: TComponent;
  Msg1: WideString; Path1: WideString;
  Msg2: WideString; Path2: WideString; LocatePath: WideString);
begin
  Inherited Create(AOwner);

  PlaceLabels(lblPref1, lblLink1, lblPostf1, Msg1, Path1);
  PlaceLabels(lblPref2, lblLink2, lblPostf2, Msg2, Path2);

  btnLocateFile.Visible := LocatePath <> '';
  PlaceButtons;

  FFileToLocate := LocatePath;

  KeyPreview := True;
end;

procedure TfrmNetflixQcResult.PlaceLabels(PrefLbl: TTntLabel; LinkLbl: TTntLabel; PostfLbl: TTntLabel;
  Msg: WideString; Link: WideString);
var
  LinkStartPos: Integer;
  LinkEngPos: Integer;
begin
  LinkStartPos := Pos(Link, Msg);
  LinkEngPos := LinkStartPos + Length(Link);

  if LinkStartPos <> 0 then
  begin
    PrefLbl.Caption := Copy(Msg, 1, LinkStartPos - 1);
    LinkLbl.Caption := Link;
    PostfLbl.Caption := Copy(Msg, LinkEngPos, Length(Msg) - LinkEngPos + 1);
  end else
  begin
    PrefLbl.Caption := Msg;
    LinkLbl.Caption := '';
    PostfLbl.Caption := '';
  end;

  if Link = '' then
    LinkLbl.Cursor := crArrow;

  LinkLbl.Left := PrefLbl.Left + PrefLbl.Width;
  PostfLbl.Left := LinkLbl.Left + LinkLbl.Width;

  LinkLbl.Top := PrefLbl.Top;
  PostfLbl.Top := PrefLbl.Top;
end;

procedure TfrmNetflixQcResult.PlaceButtons;
var
  ButtonsMid: Integer;
begin
  Width := Max(lblPostf1.Left + lblPostf1.Width,
    lblPostf2.Left + lblPostf2.Width) + 10;

  if btnLocateFile.Visible then
    ButtonsMid := btnLocateFile.Left + ((btnOk.Left + btnOk.Width) - btnLocateFile.Left) div 2
  else
    ButtonsMid := btnOk.Left + btnOk.Width div 2;  
  
  btnLocateFile.Left := btnLocateFile.Left - ButtonsMid + Width div 2;
  btnOk.Left := btnOk.Left - ButtonsMid + Width div 2;
end;

procedure TfrmNetflixQcResult.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

procedure TfrmNetflixQcResult.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

procedure TfrmNetflixQcResult.OpenFileLocation(FilePath: WideString);
begin
  ShellExecuteW(0, nil, 'explorer.exe',
    PWideChar(WideFormat('/select,"%s"', [FilePath])), nil, SW_SHOWNORMAL);
end;

procedure TfrmNetflixQcResult.lblLinkClick(Sender: TObject);
var
  Caption: WideString;
begin
  Caption := (Sender as TTntLabel).Caption;

  if Caption <> '' then
    OpenFileLocation(Caption);
end;

procedure TfrmNetflixQcResult.btnLocateFileClick(Sender: TObject);
begin
  OpenFileLocation(FFileToLocate);
  Close;
end;

end.
