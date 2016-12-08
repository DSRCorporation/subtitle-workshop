// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Timed Text subtitle format saving functionality

function SubtitlesToFile_TIMEDTEXT(Subtitles: TSubtitles; const FileName: String; const charset: Byte = DEFAULT_CHARSET; const utf8: Boolean = False; From: Integer = -1; UpTo: Integer = -1): Boolean;

const
  FULL_TIMECODE:          SubtitleString = 'hh:mm:ss.zzz';
  SERVICE_TAG:            SubtitleString = 'service_tag';
  
  TTML_NS_URI:            SubtitleString = 'http://www.w3.org/ns/ttml';
  TTML_STYLING_NS_URI:    SubtitleString = 'http://www.w3.org/ns/ttml#styling';
  TTML_METADATA_NS_URI:   SubtitleString = 'http://www.w3.org/ns/ttml#metadata';
  TTML_PARAMETER_NS_URI:  SubtitleString = 'http://www.w3.org/ns/ttml#parameter';

var
  doc               : IXMLDocument;
  root, head, body  : IXMLNode;
  tmpSubFile        : TSubtitleFile;
  i                 : Integer;

  procedure InitDoc(doc: IXMLDocument);
  begin
    with doc do begin
      Version     := '1.0';
      {$IFNDEF UTF8}
      if (utf8 = True) then
      {$ENDIF}
        Encoding  := 'UTF-8'
      {$IFNDEF UTF8}
      else
        Encoding  := GetCharsetEncoding(charset);
      {$ENDIF}
      StandAlone  := 'no';
      Options     := [doNodeAutoIndent];
    end;
  end;
   
  function AppendRoot(doc: IXMLDocument): IXMLNode;
  var
    root: IXMLNode;
  begin
    root := doc.AddChild('tt');

    with root do begin
      DeclareNamespace('', TTML_NS_URI);
      DeclareNamespace('tts', TTML_STYLING_NS_URI);
      DeclareNamespace('ttm', TTML_METADATA_NS_URI);
      DeclareNamespace('ttp', TTML_PARAMETER_NS_URI);
    end;

    Result := root;
  end;

  function AppendHead(root: IXMLNode; title: SubtitleString): IXMLNode;
  var
    head, metadata: IXMLNode;
  begin
    head := root.AddChild('head', TTML_NS_URI);

    metadata := head.AddChild('metadata');
    metadata.AddChild('ttm:title').Text := title;

    Result := head;
  end;

  function AppendStyling(head: IXMLNode): IXMLNode;
  var
    styling, style: IXMLNode;
  begin
    styling := head.AddChild('styling');

    style := styling.AddChild('style');
    with style do begin
      Attributes['tts:color']       := 'white';
      Attributes['tts:fontStyle']   := 'normal';
      Attributes['tts:fontWeight']  := 'normal';
      Attributes['tts:fontFamily']  := 'Arial';
      Attributes['tts:fontSize']    := '100%';
      Attributes['xml:id']          := 'basic';
    end;

    Result := styling;
  end;

  function AppendLayout(head: IXMLNode): IXMLNode;
  var
    layout, region1, region2: IXMLNode;
  begin
    layout := head.AddChild('layout');

    region1 := layout.AddChild('region');
    with region1 do begin
      Attributes['tts:extent']        := '80% 40%';
      Attributes['tts:origin']        := '10% 10%';
      Attributes['tts:textAlign']     := 'center';
      Attributes['tts:displayAlign']  := 'before';
      Attributes['xml:id']            := 'topCenter';
    end;

    region2 := layout.AddChild('region');
    with region2 do begin
      Attributes['tts:extent']        := '80% 40%';
      Attributes['tts:origin']        := '10% 50%';
      Attributes['tts:textAlign']     := 'center';
      Attributes['tts:displayAlign']  := 'after';
      Attributes['xml:id']            := 'bottomCenter';
    end;

    Result := layout;
  end;

  function AppendBody(root: IXMLNode): IXMLNode;
  var
    body: IXMLNode;
  begin
    body := root.AddChild('body', TTML_NS_URI);
    
    body.AddChild('div').AddChild(SERVICE_TAG);

    Result := body;
  end;

  function AppendSpan(parentNode: IXMLNode; tag: SubtitleString; params: SubtitleString): IXMLNode;
  var
    span: IXMLNode;
  begin
    span := parentNode.AddChild('span');

    with span do begin
      if (tag = 'b') then Attributes['tts:fontWeight']      := 'bold';
      if (tag = 'i') then Attributes['tts:fontStyle']       := 'italic';
      if (tag = 'u') then Attributes['tts:textDecoration']  := 'underline';
      if (tag = 'c') then Attributes['tts:color']           := ReplaceString(params, ':', '');
    end;

    Result := span;
  end;

  procedure AddText(parentNode: IXMLNode; text: SubtitleString);
  var
    strings : TStringList;
    i       : Integer;
  begin
    strings := TStringList.Create;
    strings.Text := text;

    for i := 0 to strings.Count - 1 do begin
      if (i <> 0) then parentNode.AddChild('br');
      parentNode.ChildNodes.Add(parentNode.OwnerDocument.CreateNode(strings[i], ntText));
    end;
  end;

  procedure ProcessContent(parentNode: IXMLNode; content: WideString);
  var
    tagNode   : IXMLNode;
    tagFinder : TTagFinder;
  begin
    while (content <> '') do begin
      tagFinder := FindFirstTag(content, ['b', 'i', 'u', 'c']);

      if (tagFinder.Left <> '') then
        AddText(parentNode, tagFinder.Left);

      if tagFinder.Found then begin
        tagNode := AppendSpan(parentNode, tagFinder.Tag, tagFinder.Params);

        ProcessContent(tagNode, tagFinder.Content);
      end;

      content := tagFinder.Right;
    end;
  end;
  
  function CreateParagraph(subtitle: TSubtitleItem): IXMLNode;
  var
    p       : IXMLNode;
    start,
    final   : SubtitleString;
    content : WideString;
  begin
    start := TimeToString(subtitle.InitialTime, FULL_TIMECODE);
    final := TimeToString(subtitle.FinalTime,   FULL_TIMECODE);

    p := NewXMLDocument.CreateElement('p', '');
    with p do begin
      Attributes['begin']   := start;
      Attributes['end']     := final;
      Attributes['region']  := 'bottomCenter';
      Attributes['style']   := 'basic';
    end;

    {$IFDEF UTF8}
    content := subtitle.Text;
    {$ELSE}
    if (utf8 = True) then begin
      content := StringToWideStringEx(subtitle.Text, CharSetToCodePage(charset));
      content := UTF8Encode(content);
    end else
      content := subtitle.Text;
    {$ENDIF}
    ProcessContent(p, content);

    Result := p;
  end;

  procedure FindServiceTag(const strings: TStrings; var row, spaceCount: Integer);
  var
    i, index: Integer;
  begin
    row         := strings.Count;
    spaceCount  := 0;

    for i := 0 to strings.Count - 1 do begin
      index := Pos(Format('<%s/>', [SERVICE_TAG]), strings[i]);

      if (index <> 0) then begin
        row         := i;
        spaceCount  := index - 1;
        Exit;
      end;
    end;
  end;

  procedure AppendParagraphs(doc: IXMLDocument; subtitles: TSubtitles);
  var
    p         : IXMLNode;
    i, row,
    spaceCount: Integer;
  begin
    FindServiceTag(doc.XML, row, spaceCount);
    doc.XML.Delete(row);
    
    for i := From to UpTo do begin
      p := CreateParagraph(subtitles[i]);
      doc.XML.Insert(row, StringOfChar(' ', spaceCount) + p.XML);
      Inc(row);
    end;
  end;

begin
  Result := True;

  // Xml document processing
  doc := NewXMLDocument;
  doc.Active := True;

  InitDoc(doc);
  root := AppendRoot(doc);
  head := AppendHead(root, ExtractFileName(FileName));
  body := AppendBody(root);
  AppendStyling(head);
  AppendLayout(head);

  AppendParagraphs(doc, subtitles);
  
  doc.Active := False;

  tmpSubFile := TSubtitleFile.Create;
  try
    for i := 0 to doc.XML.Count - 1 do
      tmpSubFile.Add(doc.XML[i], False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False
    end;
    
  finally
    tmpSubFile.Free;
  end;
end;
