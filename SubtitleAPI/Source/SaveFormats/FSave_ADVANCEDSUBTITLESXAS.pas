// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Advanced Subtitles subtitle format saving functionality

// by Bedazzle 2007.01.27 start
// modified by adenry to use XASAttributes instead of TXASSave form 2013.08.09
function SubtitlesToFile_ADVANCEDSUBTITLESXAS(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  tmpStr     : String;
  FontSize   : Cardinal;
  fc, sc, t  : Cardinal;
  sf         : ShortString;
  buff       : String;
  Alignment  : String;

  procedure OutputDIV(f: TSubtitleFile; NeedJoin, NeedWrap: boolean; JoinShort: Byte; font, sx, sy, sw, sh: shortstring);
  var
    i : Integer;
  begin
    tmpSubFile.Add(#09#09+'<div style:position="absolute" '+
                          'style:x="'+sx+'" '+
                          'style:y="'+sy+'" '+
                          'style:width="'+sw+'" '+
                          'style:height="'+sh+'">', False);

    for i := From to UpTo do
    begin
      tmpStr := RemoveSWTags(Subtitles.Text[i], True, True, True, True);

      if NeedJoin = TRUE then
      begin
        // avoid joining dialogues, they start with "-" sign
        if ((copy(tmpStr, 1, 1)<>'-') and (pos(#13#10+'-', tmpStr)=0)) then
        begin
          buff := FastReplace(tmpStr, #13#10, ' ');

          if NeedWrap then
          begin
            tmpStr := WrapText(buff, #13#10, [' ', '.', '?', '!'], JoinShort );
            tmpStr := FastReplace(tmpStr, ' '+#13#10, #13#10);
          end
          else
            if (length(buff)<= JoinShort) then tmpStr := buff;
        end;
      end;

      tmpStr := FastReplace(tmpStr, '&', '&amp;');
      tmpStr := FastReplace(tmpStr, '<', '&lt');
      tmpStr := FastReplace(tmpStr, '>', '&gt');
      tmpStr := FastReplace(tmpStr, '"', '&quot;');
      tmpStr := FastReplace(tmpStr, '''', '&apos;');
      tmpStr := ReplaceEnters(tmpStr,'<br />');

      f.Add(#09#09#09+'<p style="'+ font + '" begin="' +
                      TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz') +
                      '" end="' +
                      TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz') +
                      '">' +
                      tmpStr +
                      '</p>', False);
    end;

    tmpSubFile.Add(#09#09+'</div>', False);
  end;

  function PixStr(p: boolean; v: cardinal): shortstring;
  begin
    if p = TRUE then
      result := IntToStr(v)+'%'
    else
      result := IntToStr(v)+'px';
  end;

  procedure OutputPlane(f: TSubtitleFile; fontAttr: shortstring; dx, dy: integer);
  const
    IntMod = 0.2;
    RealMod = 0.02;
  var
    sx, sy, sw, sh : shortstring;
    x, y, w, h : cardinal;
  begin
    x := XASAttributes.X;
    y := XASAttributes.Y;
    w := XASAttributes.Width;
    h := XASAttributes.Height;

    if XASAttributes.XInPercent = TRUE then
      sx := FastReplace(FloatToStr(x+IntMod*dx)+'%', ',', '.')
    else
      sx := IntToStr(round(x*(1+RealMod*dx)))+'px';

    if XASAttributes.YInPercent = TRUE then
      sy := FastReplace(FloatToStr(y+IntMod*dy)+'%', ',', '.')
    else
      sy := IntToStr(round(y*(1+RealMod*dy)))+'px';

    if XASAttributes.WidthInPercent = TRUE then
      sw := FloatToStr(w)+'%'  // unchanged
    else
      sw := IntToStr(round(w))+'px';

    if XASAttributes.HeightInPercent = TRUE then
      sh := FloatToStr(h)+'%'
    else
      sh := IntToStr(round(h))+'px';

    OutputDIV(f, XASAttributes.JoinShortLines, XASAttributes.WrapLines, XASAttributes.WrapLinesValue, fontAttr, sx, sy, sw, sh);
  end;

begin
  Result := True;

      if XASAttributes.Assigned = FALSE then
        with XASAttributes do
        begin
          //Font
          FontName          := 'arialbd.ttf';
          FontSize          := 60;
          FontSizeInPercent := False;
          TextColor         := $FFFFFF; //white
          Shadow            := True;
          ShadowColor       := $000000; //black
          Transparency      := 255;
          //Position
          X                 := 10;
          Y                 := 89;
          Width             := 80;
          Height            := 11;
          XInPercent        := False;
          YInPercent        := False;
          WidthInPercent    := False;
          HeightInPercent   := False;
          Alignment         := 0;
          //Language
          Encoding          := 'windows-1252';
          Language          := 'en';
          //Join
          JoinShortLines    := True;
          WrapLines         := False;
          WrapLinesValue    := 50;
        end;

      try
        FontSize := XASAttributes.FontSize;
        t := XASAttributes.Transparency;
        fc := XASAttributes.TextColor;
        sc := XASAttributes.ShadowColor;
        sf := PixStr(XASAttributes.FontSizeInPercent, FontSize);
        case XASAttributes.Alignment of
          1:    Alignment := 'left';
          2:    Alignment := 'right';
          else  Alignment := 'center';
        end;


        tmpSubFile := TSubtitleFile.Create;
        try
          tmpSubFile.Add('<?xml version="1.0" encoding="'+XASAttributes.Encoding+'"?>', False);
          tmpSubFile.Add('<root xml:lang="'+XASAttributes.Language+'" xmlns="http://www.dvdforum.org/2005/ihd" xmlns:style="http://www.dvdforum.org/2005/ihd#style" xmlns:state="http://www.dvdforum.org/2005/ihd#state">', False);
          tmpSubFile.Add(#09+'<head>', False);
          tmpSubFile.Add(#09#09+'<styling>', False);
          tmpSubFile.Add(#09#09#09+
                         '<style id="pText" style:font="file:///dvddisc/ADV_OBJ/'+XASAttributes.FontName+'" '+
                         'style:fontSize="'+sf+'" '+
                         'style:color="rgba('+IntToStr(GetRValue(fc))+', '+IntToStr(GetGValue(fc))+', '+IntToStr(GetBValue(fc))+', '+IntToStr(t)+')" '+
                         'style:textAlign="'+Alignment+'" />', False);


          if XASAttributes.Shadow = TRUE then
          begin
            tmpSubFile.Add(#09#09#09+
                           '<style id="pOutline" style:font="file:///dvddisc/ADV_OBJ/'+XASAttributes.FontName+'" '+
                           'style:fontSize="'+sf+'" '+
                           'style:color="rgba('+IntToStr(GetRValue(sc))+', '+IntToStr(GetGValue(sc))+', '+IntToStr(GetBValue(sc))+', '+IntToStr(t)+')" '+
                           'style:textAlign="'+Alignment+'" />', False);
          end;

          tmpSubFile.Add(#09#09+'</styling>', False);
          tmpSubFile.Add(#09+'</head>', False);

          tmpSubFile.Add(#09+'<body xml:base="file:///dvddisc/ADV_OBJ/">', False);

          if XASAttributes.Shadow = TRUE then
          begin
//            OutputPlane(tmpSubFile, 'pOutline', -1, -1);
//            OutputPlane(tmpSubFile, 'pOutline',  1, -1);
//            OutputPlane(tmpSubFile, 'pOutline', -1,  1);
            OutputPlane(tmpSubFile, 'pOutline',  1,  1);
          end;

          OutputPlane(tmpSubFile, 'pText', 0, 0);


          tmpSubFile.Add(#09+'</body>', False);
          tmpSubFile.Add('</root>', False);

          try
            tmpSubFile.SaveToFile(FileName);
          except
            Result := False;
          end;
        finally
          tmpSubFile.Free;
        end;
      except on E:Exception do
        ShowMessage('ERROR: '+E.Message);
      end; 

end;
// by Bedazzle 2007.01.27 end
