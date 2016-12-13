unit TimedTextTestCases;

interface

uses
  TestFrameWork,
  SysUtils,
  Classes,
  XMLIntf,
  XMLDoc,
  ActiveX,
  USubtitlesFunctions,
  UTimedTextUtils;

type

  TTagProcessorTestCase = class(TTestCase)
  private
    FParentNode   : IXMLNode;
    FTagProcessor : TTagProcessor;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  published
    procedure TestRegularContent;
    procedure TestTaggedContent;
    procedure TestMultilineContent;
  end;

implementation

procedure TTagProcessorTestCase.SetUp;
var
  doc: IXMLDocument;
begin
  CoInitialize(nil);
  doc := NewXMLDocument;
  FParentNode   := doc.AddChild('tag');
  FTagProcessor := TTagProcessor.Create(FParentNode);
end;

procedure TTagProcessorTestCase.TearDown;
begin
  FTagProcessor.Destroy;
end;

procedure TTagProcessorTestCase.TestRegularContent;
begin
  FTagProcessor.Process('content');

  CheckEquals('content', FParentNode.Text);
end;

procedure TTagProcessorTestCase.TestTaggedContent;
var
  b, i, u, r: IXMLNode;

begin
  FTagProcessor.Process('<b><i>italic</i>bold</b>regular<u>underline</u>');

  CheckEquals(3, FParentNode.ChildNodes.Count);

  // b checks
  b := FParentNode.ChildNodes[0];
  CheckEquals(2, b.ChildNodes.Count);
  CheckEquals('span', b.NodeName);
  CheckEquals('bold', b.Attributes['tts:fontWeight']);
  CheckEquals('bold', b.ChildNodes[1].Text);

  // i checks
  i := b.ChildNodes[0];
  CheckEquals(1, i.ChildNodes.Count);
  CheckEquals('span', i.NodeName);
  CheckEquals('italic', i.Attributes['tts:fontStyle']);
  CheckEquals('italic', i.Text);

  // regular text checks
  r := FParentNode.ChildNodes[1];
  CheckEquals('regular', r.Text);
  CheckEquals('regular', r.XML);

  // u checks
  u := FParentNode.ChildNodes[2];
  CheckEquals(1, u.ChildNodes.Count);
  CheckEquals('span', u.NodeName);
  CheckEquals('underline', u.Attributes['tts:textDecoration']);
  CheckEquals('underline', u.Text);
end;

procedure TTagProcessorTestCase.TestMultilineContent;
var
  br, line1, line2: IXMLNode;
begin
  FTagProcessor.Process('first line' + #13#10 + 'second line');

  CheckEquals(3, FParentNode.ChildNodes.Count);

  // regular text checks
  line1 := FParentNode.ChildNodes[0];
  CheckEquals('first line', line1.Text);
  CheckEquals('first line', line1.XML);

  // br checks
  br := FParentNode.ChildNodes[1];
  CheckEquals(0, br.ChildNodes.Count);
  CheckEquals('br', br.NodeName);
  CheckEquals('', br.Text);

  // regular text checks
  line2 := FParentNode.ChildNodes[2];
  CheckEquals('second line', line2.Text);
  CheckEquals('second line', line2.XML);
end;

initialization

  TestFramework.RegisterTest(TTagProcessorTestCase.Suite);

end.
