unit formExecutionProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, MiscToolsUnit;

type
  TfrmExecutionProgress = class(TForm)
    lblMsg: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FMessage        : WideString;
    FProcessHandle  : THandle;
    FCancelled      : Boolean;
    FFinished       : Boolean;
  protected
    procedure CancelExecution;
    procedure SetProcessHandle(var msg: TMessage);  message WM_EET_SET_PROCESS_HANDLE;
    procedure UpdateProgress(var msg: TMessage);    message WM_EET_UPDATE_PROGRESS;
    procedure FinishExection(var msg: TMessage);    message WM_EET_PROCESS_FINISHED;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Msg: WideString);
    
    function ExecutionCancelled: Boolean;
  end;

var
  frmExecutionProgress: TfrmExecutionProgress;

implementation

{$R *.dfm}

constructor TfrmExecutionProgress.Create(AOwner: TComponent; Msg: WideString);
begin
  Inherited Create(AOwner);
  FMessage        := Msg;
  lblMsg.Caption  := Msg;
  
  FCancelled  := False;
  FFinished   := False;
end;

procedure TfrmExecutionProgress.CancelExecution;
begin
  TerminateProcess(FProcessHandle, NO_ERROR);
  FCancelled := True;
end;

procedure TfrmExecutionProgress.SetProcessHandle(var msg: TMessage);
begin
  FProcessHandle := msg.WParam;
end;

procedure TfrmExecutionProgress.UpdateProgress(var msg: TMessage);
var
  ProgressState: String;
begin
  case msg.WParam mod 3 of
    0: ProgressState := '/';
    1: ProgressState := '-';
    2: ProgressState := '\';
  end;
  lblMsg.Caption := FMessage + ' ' + ProgressState;
end;

procedure TfrmExecutionProgress.FinishExection(var msg: TMessage);
begin
  FFinished := True;
  Close;
end;

function TfrmExecutionProgress.ExecutionCancelled: Boolean;
begin
  Result := FCancelled;
end;

procedure TfrmExecutionProgress.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TfrmExecutionProgress.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not FFinished then CancelExecution;
end;

end.
