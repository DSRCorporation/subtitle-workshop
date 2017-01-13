program SubtitleAPITests;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  TestFramework,
  TextTestRunner,
  TagFinderTestCases in 'TagFinderTestCases.pas',
  TimedTextTestCases in 'TimedTextTestCases.pas',
  TtmlTimeConverterTestCases in 'TtmlTimeConverterTestCases.pas';

{$R *.RES}

begin
  TextTestRunner.RunRegisteredTests;
  Readln;
end.
