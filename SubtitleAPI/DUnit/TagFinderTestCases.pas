unit TagFinderTestCases;

interface

uses
  TestFrameWork,
  USubtitlesFunctions,
  UTagFinder;

type

  TTagFinderTestCase = class(TTestCase)
  private
    FTagFinder : TTagFinder;
  protected
    procedure SetUp;    override;
  published
    procedure TestRegularText;
    procedure TestTaggedText;
    procedure TestTaggedTextWithParams;
    procedure TestTaggedTextInTheMiddle;
    procedure TestMultiTaggedText;
    procedure TestBrokenTaggedText;
  end;

  TFindFirstTagCase = class(TTestCase)
  published
    procedure TestFindFirstNoTags;
    procedure TestFindFirstOneTag;
    procedure TestFindFirstMissingTags;
    procedure TestFindFirstMultipleTags;
    procedure TestFindFirstIntersectTags;
  end;

implementation

//  TTagFinderTestCase

procedure TTagFinderTestCase.SetUp;
begin
  FTagFinder := TTagFinder.Create;
end;

procedure TTagFinderTestCase.TestRegularText;
begin
  FTagFinder.Source := 'content';
  FTagFinder.Tag    := 'tag';
  FTagFinder.Build;

  CheckFalse(FTagFinder.Found);
  CheckEquals(0, FTagFinder.TagStart);
  CheckEquals(0, FTagFinder.TagEnd);

  CheckEquals('content', FTagFinder.Left);
  CheckEquals('', FTagFinder.Content);
  CheckEquals('', FTagFinder.Right);
  CheckEquals('', FTagFinder.Params);
end;

procedure TTagFinderTestCase.TestTaggedText;
begin
  FTagFinder.Source := '<tag>content</tag>';
  FTagFinder.Tag    := 'tag';
  FTagFinder.Build;

  CheckTrue(FTagFinder.Found);
  CheckEquals(1, FTagFinder.TagStart);
  CheckEquals(Length(FTagFinder.Source) + 1, FTagFinder.TagEnd);

  CheckEquals('', FTagFinder.Left);
  CheckEquals('content', FTagFinder.Content);
  CheckEquals('', FTagFinder.Right);
  CheckEquals('', FTagFinder.Params);
end;

procedure TTagFinderTestCase.TestTaggedTextWithParams;
begin
  FTagFinder.Source := '<tag params>content</tag>';
  FTagFinder.Tag    := 'tag';
  FTagFinder.Build;

  CheckTrue(FTagFinder.Found);
  CheckEquals(1, FTagFinder.TagStart);
  CheckEquals(Length(FTagFinder.Source) + 1, FTagFinder.TagEnd);
  
  CheckEquals('', FTagFinder.Left);
  CheckEquals('content', FTagFinder.Content);
  CheckEquals('', FTagFinder.Right);
  CheckEquals('params', FTagFinder.Params);
end;

procedure TTagFinderTestCase.TestTaggedTextInTheMiddle;
begin
  FTagFinder.Source := 'left<tag>content</tag>right';
  FTagFinder.Tag    := 'tag';
  FTagFinder.Build;

  CheckTrue(FTagFinder.Found);
  CheckEquals(5, FTagFinder.TagStart);
  CheckEquals(Length(FTagFinder.Source) - 4, FTagFinder.TagEnd);

  CheckEquals('left', FTagFinder.Left);
  CheckEquals('content', FTagFinder.Content);
  CheckEquals('right', FTagFinder.Right);
  CheckEquals('', FTagFinder.Params);
end;

procedure TTagFinderTestCase.TestMultiTaggedText;
begin
  FTagFinder.Source := '<tag2>outer1<tag1>content</tag1>outer2</tag2>';
  FTagFinder.Tag    := 'tag1';
  FTagFinder.Build;
   
  CheckTrue(FTagFinder.Found);
  CheckEquals(13, FTagFinder.TagStart);
  CheckEquals(Length(FTagFinder.Source) - 12, FTagFinder.TagEnd);

  CheckEquals('<tag2>outer1', FTagFinder.Left);
  CheckEquals('content', FTagFinder.Content);
  CheckEquals('outer2</tag2>', FTagFinder.Right);
  CheckEquals('', FTagFinder.Params);
end;

procedure TTagFinderTestCase.TestBrokenTaggedText;
begin
  FTagFinder.Source := 'left<tag>content</tag';
  FTagFinder.Tag    := 'tag';
  FTagFinder.Build;

  CheckFalse(FTagFinder.Found);
  CheckEquals(0, FTagFinder.TagStart);
  CheckEquals(0, FTagFinder.TagEnd);

  CheckEquals('left<tag>content</tag', FTagFinder.Left);
  CheckEquals('', FTagFinder.Content);
  CheckEquals('', FTagFinder.Right);
  CheckEquals('', FTagFinder.Params);
end;

//  TFindFirstTagCase

procedure TFindFirstTagCase.TestFindFirstNoTags;
var
  tagFinder: TTagFinder;
begin
  tagFinder := FindFirstTag('content', ['tag1', 'tag2', 'tag3']);

  CheckEquals('content', tagFinder.Left);
  CheckEquals('', tagFinder.Content);
  CheckEquals('', tagFinder.Right);
  CheckEquals('', tagFinder.Tag);
end;

procedure TFindFirstTagCase.TestFindFirstOneTag;
var
  tagFinder: TTagFinder;
begin
  tagFinder := FindFirstTag('left<tag2>content</tag2>right', ['tag1', 'tag2', 'tag3']);

  CheckEquals('left', tagFinder.Left);
  CheckEquals('content', tagFinder.Content);
  CheckEquals('right', tagFinder.Right);
  CheckEquals('tag2', tagFinder.Tag);
end;

procedure TFindFirstTagCase.TestFindFirstMissingTags;
var
  tagFinder: TTagFinder;
begin
  tagFinder := FindFirstTag('left<tag><tag0>content</tag0>right<tag>', ['tag1', 'tag2', 'tag3']);

  CheckEquals('left<tag><tag0>content</tag0>right<tag>', tagFinder.Left);
  CheckEquals('', tagFinder.Content);
  CheckEquals('', tagFinder.Right);
  CheckEquals('', tagFinder.Tag);
end;

procedure TFindFirstTagCase.TestFindFirstMultipleTags;
var
  tagFinder: TTagFinder;
begin
  tagFinder := FindFirstTag('left<tag3>content3<tag2>content2</tag2></tag3>right<tag1>content1</tag1>', ['tag1', 'tag2', 'tag3']);

  CheckEquals('left', tagFinder.Left);
  CheckEquals('content3<tag2>content2</tag2>', tagFinder.Content);
  CheckEquals('right<tag1>content1</tag1>', tagFinder.Right);
  CheckEquals('tag3', tagFinder.Tag);
end;

procedure TFindFirstTagCase.TestFindFirstIntersectTags;
var
  tagFinder: TTagFinder;
begin
  tagFinder := FindFirstTag('left<tag3>content3<tag2>content32</tag3>content2</tag2>right', ['tag1', 'tag2', 'tag3']);

  CheckEquals('left', tagFinder.Left);
  CheckEquals('content3<tag2>content32', tagFinder.Content);
  CheckEquals('content2</tag2>right', tagFinder.Right);
  CheckEquals('tag3', tagFinder.Tag);
end;

initialization

  TestFramework.RegisterTest(TTagFinderTestCase.Suite);
  TestFramework.RegisterTest(TFindFirstTagCase.Suite);
  
end.
