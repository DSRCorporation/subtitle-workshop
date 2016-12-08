program SubtitleAPITests;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  TestFramework,
  TextTestRunner,
  TagFinderTestCases in 'TagFinderTestCases.pas',
  TimedTextTestCases in 'TimedTextTestCases.pas';

{$R *.RES}

begin
  TextTestRunner.RunRegisteredTests;
  Readln;
end.
