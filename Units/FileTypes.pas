// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: File extensions functionality

unit FileTypes;

interface

uses
  Forms, Windows, Classes, SysUtils, Registry, ShlObj;

// -----------------------------------------------------------------------------

procedure SeparateExtensions(var List: TStrings; ExtStr: String; TxtAndScr: Boolean = False);
function GetExtStr(List: TStrings): String;
function GetExtensionsList: String;
procedure AssociateExtensions(Extensions: String; Associate: Boolean = True; OnlyIfNotAssociateWithAnything: Boolean = False);

// -----------------------------------------------------------------------------

implementation

uses
  General, USubtitlesFunctions;

// -----------------------------------------------------------------------------

procedure SeparateExtensions(var List: TStrings; ExtStr: String; TxtAndScr: Boolean = False);
var
  i      : Integer;
  NewExt : String;
begin
  if not Assigned(List) then List := TStringList.Create;
  List.Clear;
  if ExtStr = '' then exit;
  for i := 0 to StringCount(';', ExtStr) do
  begin
    if Pos(';', ExtStr) > 0 then
      NewExt := Copy(ExtStr, 0, Pos(';', ExtStr)-1) else
      NewExt := ExtStr;
    if TxtAndScr = False then
    begin
      if (NewExt <> '*.scr') and (NewExt <> '*.txt') and (NewExt <> '*.rtf') then
        List.Add(NewExt);
    end else
      List.Add(NewExt);
    ExtStr := Copy(ExtStr, Pos(';', ExtStr)+1, Length(ExtStr));
  end;
end;

// -----------------------------------------------------------------------------

function GetExtStr(List: TStrings): String;
var
  i: Integer;
begin
  Result := '';
  if Assigned(List) then
  begin
    for i := 0 to List.Count-1 do
      Result := Result + List[i] + ';';
    Delete(Result, Length(Result), 1);
  end;
end;

// -----------------------------------------------------------------------------

function GetExtensionsList: String;
var
  i,a  : Integer;
  Name : String;
  Ext  : String;
  Exts : String;
begin
  Exts := '';
  for i := 1 to SubtitleAPI.FormatsCount do
  begin
    SubtitleAPI.GetFormatInfo(i, Name, Ext);
    if Pos(';', Ext) = 0 then
    begin
      if Pos(Ext, Exts) = 0 then
        Exts := Exts + Ext + ';';
    end else
    begin
      for a := 0 to StringCount(';', Ext) do
      begin
        if Pos(';', Ext) > 0 then
        begin
          if (Pos(Copy(Ext, 0, Pos(';', Ext) - 1), Exts) = 0) then
            Exts := Exts + Copy(Ext, 0, Pos(';', Ext) - 1) + ';';
        end else
        begin
          if (Pos(Ext, Exts) = 0) then
            Exts := Exts + Ext + ';';
        end;
        Ext := Copy(Ext, Pos(';', Ext) + 1, Length(Ext));
      end;
    end;
  end;
  if Exts[Length(Exts)] = ';' then
    Delete(Exts, Length(Exts), 1);
  Result := Exts;
end;

// -----------------------------------------------------------------------------

procedure AssociateExtensions(Extensions: String; Associate: Boolean = True; OnlyIfNotAssociateWithAnything: Boolean = False); //OnlyIfNotAssociateWithAnything added by adenry
var
  Reg           : TRegistry;
  i             : Integer;
  Exts          : TStrings;
  FileType      : String;
  //CurFileType   : String; //added by adenry
  Exe           : String;
  Description   : String;
  AssocChanged  : Boolean; //added by adenry
begin
  if Extensions = '' then exit;
  //removed by adenry: begin
  {if Associate = True then
  begin
    FileType    := 'SubtitleWorkshop';
    Description := 'Subtitle file';
    Exe         := Application.ExeName;
  end else
  begin
    FileType    := '';
    Description := '';
    Exe         := '';
  end;}
  //removed by adenry: end
  
  //added by adenry: begin
  FileType      := 'SubtitleWorkshop';
  Description   := 'Subtitle file';
  Exe           := Application.ExeName;
  AssocChanged  := False;
  //added by adenry: end

  Reg := TRegistry.Create;
  try
    SeparateExtensions(Exts, Extensions);

    for i := 0 to Exts.Count-1 do
    begin
      Exts[i] := Copy(Exts[i], 2, Length(Exts[i]));

      with Reg do
      begin
        RootKey := HKEY_CLASSES_ROOT;

        //removed by adenry: begin
        {OpenKey(Exts[i], True);
        WriteString('', FileType);
        CloseKey;

        OpenKey(FileType, True);
        WriteString('', Description);
        CloseKey;

        OpenKey(FileType + '\DefaultIcon', True);
        if Associate = True then
          WriteString('', Exe + ',0') else // 0 = Icon index
          WriteString('', '');
        CloseKey;

        OpenKey(FileType + '\Shell\Open', True);
        if Associate = True then
          WriteString('', '&Open with ' + ID_PROGRAM) else
          WriteString('', '');
        CloseKey;

        OpenKey(FileType + '\Shell\Open\Command', True);
        if Associate = True then
          WriteString('', '"' + Exe + '" /OPEN("%1")') else
          WriteString('', '""');
        CloseKey;}
        //removed by adenry: end

        //added by adenry: begin
        if (OnlyIfNotAssociateWithAnything = False) or not KeyExists(Exts[i]) then
        begin
          OpenKey(Exts[i], True);
          if Associate = True then
          begin //associate and write backup
            if ReadString('') <> FileType then
            begin
              WriteString('SubtitleWorkshopBackup', ReadString(''));
              WriteString('', FileType);
              AssocChanged := True; //added by adenry
            end;
          end else
            if ReadString('') = FileType then
            begin //unassociate, restore backup, and delete backup
              WriteString('', ReadString('SubtitleWorkshopBackup'));
              DeleteValue('SubtitleWorkshopBackup');
              AssocChanged := True; //added by adenry
            end;
          //if the extension is not associated with anything, delete it
          if ReadString('') = '' then
          begin
            CloseKey;
            DeleteKey(Exts[i]);
          end else
            CloseKey;
        end;

        if (Associate = True) and not KeyExists(FileType) then
        begin //add SubtitleWorkshop Subtitle file type
          OpenKey(FileType, True);
          WriteString('', Description);
          CloseKey;

          OpenKey(FileType + '\DefaultIcon', True);
          WriteString('', Exe + ',0'); // 0 = Icon index
          CloseKey;

          OpenKey(FileType + '\Shell\Open\Command', True);
          WriteString('', '"' + Exe + '" /OPEN("%1")');
          CloseKey;
        end;
        //added by adenry: end

      end;
    end;
  finally
    Reg.Free;
    Exts.Free;
  end;
  if AssocChanged then //added by adenry
    SHChangeNotify(SHCNE_ASSOCCHANGED,SHCNF_IDLIST,nil, nil);
end;

// -----------------------------------------------------------------------------

end.
