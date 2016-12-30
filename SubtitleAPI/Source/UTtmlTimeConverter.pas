unit UTtmlTimeConverter;

interface

uses
  SysUtils,
  Classes,
  Windows,
  XMLIntf,
  XMLDoc,
  USubtitleFile,
  USubtitlesFunctions,
  UTagFinder;

type

  TTtmlTimeConverter = class
  private
    FFrameRate    : Integer;
    FFrNumerator  : Integer;
    FFrDenominator: Integer;
  public
    constructor Create(frameRate, frNumerator, frDenominator: Integer);
    function ParseTimeExpression(timeExpression: SubtitleString): Integer;
  end;
  
implementation

constructor TTtmlTimeConverter.Create(frameRate, frNumerator, frDenominator: Integer);
begin

end;

function TTtmlTimeConverter.ParseTimeExpression(timeExpression: SubtitleString): Integer;
begin

end;

end.
