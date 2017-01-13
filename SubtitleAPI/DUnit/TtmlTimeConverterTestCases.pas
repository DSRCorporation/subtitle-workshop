unit TtmlTimeConverterTestCases;

interface

uses
  TestFrameWork,
  SysUtils,
  Classes,
  USubtitlesFunctions,
  UTimedTextUtils,
  UTtmlTimeConverter;

type

  TTtmlTimeConverterTestCase = class(TTestCase)
  private
    FTimeConverter  : TTtmlTimeConverter;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  published
    procedure TestClockTimeFrames;
    procedure TestClockTimeMillis;
    procedure TestOffsetTime;
  end;

implementation

procedure TTtmlTimeConverterTestCase.SetUp;
begin
  FTimeConverter := TTtmlTimeConverter.Create(25, 1, 1, 10, 10);
end;

procedure TTtmlTimeConverterTestCase.TearDown;
begin
  FTimeConverter.Destroy;
end;

procedure TTtmlTimeConverterTestCase.TestClockTimeFrames;
begin
  CheckEquals(1480, FTimeConverter.ParseTimeExpression('00:00:01:12'));
  CheckEquals(1500, FTimeConverter.ParseTimeExpression('00:00:01:12.5'));
end;

procedure TTtmlTimeConverterTestCase.TestClockTimeMillis;
begin
  CheckEquals(1000, FTimeConverter.ParseTimeExpression('00:00:01'));
  CheckEquals(1520, FTimeConverter.ParseTimeExpression('00:00:01.520'));
end;

procedure TTtmlTimeConverterTestCase.TestOffsetTime;
begin
  CheckEquals(3600000,  FTimeConverter.ParseTimeExpression('1h'));
  CheckEquals(600000,   FTimeConverter.ParseTimeExpression('10m'));
  CheckEquals(1000,     FTimeConverter.ParseTimeExpression('1s'));
  CheckEquals(150,      FTimeConverter.ParseTimeExpression('150ms'));
  CheckEquals(40,       FTimeConverter.ParseTimeExpression('1f'));
  CheckEquals(100,      FTimeConverter.ParseTimeExpression('1t'));
end;

initialization

  TestFramework.RegisterTest(TTtmlTimeConverterTestCase.Suite);

end.
