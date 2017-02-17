unit formExecutionProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmExecutionProgress = class(TForm)
    lblMsg: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FCanClose: Boolean;
    FProcessHandle: Cardinal;
    FMessage: string;
    
    procedure WaitForProcess();
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Msg: String; hProcess: Cardinal);
  end;

var
  frmExecutionProgress: TfrmExecutionProgress;

implementation

{$R *.dfm}

constructor TfrmExecutionProgress.Create(AOwner: TComponent; Msg: String; hProcess: Cardinal);
begin
  Inherited Create(AOwner);
  FMessage := Msg;
  lblMsg.Caption := Msg;
  FCanClose := False;
  FProcessHandle := hProcess;
end;

procedure TfrmExecutionProgress.WaitForProcess();
var
  TimePassed: Integer;
  ProgressState: String;
const
  WaitInterval = 50;
begin
  TimePassed := 0;
  while WaitForSingleObject(FProcessHandle, WaitInterval) = WAIT_TIMEOUT do
  begin
    Application.ProcessMessages;
    TimePassed := TimePassed + WaitInterval;
    
    case TimePassed div 1000 mod 3 of
      0: ProgressState := '/';
      1: ProgressState := '-';
      2: ProgressState := '\';
    end;  

    lblMsg.Caption := FMessage + ' ' + ProgressState;
  end;
  FCanClose := True;
  PostMessage(Self.Handle, wm_close, 0, 0);
end;

procedure TfrmExecutionProgress.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := FCanClose;
end;

procedure TfrmExecutionProgress.FormActivate(Sender: TObject);
begin
  WaitForProcess();
end;

end.
