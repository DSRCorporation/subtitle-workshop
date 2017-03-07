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
    FCanClose: Boolean;
    FMessage: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Msg: String);
    procedure UpdateProgress(var msg: TMessage); message WM_UPDATE_PROGRESS;
    procedure ForcedClose(var msg: TMessage); message WM_CLOSE_EX;
  end;

var
  frmExecutionProgress: TfrmExecutionProgress;

implementation

{$R *.dfm}

constructor TfrmExecutionProgress.Create(AOwner: TComponent; Msg: String);
begin
  Inherited Create(AOwner);
  FMessage := Msg;
  lblMsg.Caption := Msg;
  FCanClose := False;
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

procedure TfrmExecutionProgress.ForcedClose(var msg: TMessage);
begin
  FCanClose := True;
  Close;
end;

procedure TfrmExecutionProgress.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TfrmExecutionProgress.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := FCanClose;
end;

end.
