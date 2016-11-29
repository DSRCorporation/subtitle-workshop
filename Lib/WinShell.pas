// Windows Shell context menu handling

unit WinShell;

interface

uses SysUtils, Windows, Registry, ActiveX, ShlObj,
		 Classes, Forms; //added by adenry

type
 EShellOleError = class(Exception);

 TShellLinkInfo = record
  PathName: string;
  Arguments: string;
  Description: string;
  WorkingDirectory: string;
  IconLocation: string;
  IconIndex: integer;
  ShowCmd: integer;
  HotKey: word;
 end;

 TSpecialFolderInfo = record
  Name: string;
  ID: Integer;
 end;

const
 SpecialFolders: array[0..29] of TSpecialFolderInfo = (
  (Name: 'Alt Startup'; ID: CSIDL_ALTSTARTUP),
  (Name: 'Application Data'; ID: CSIDL_APPDATA),
  (Name: 'Recycle Bin'; ID: CSIDL_BITBUCKET),
  (Name: 'Common Alt Startup'; ID: CSIDL_COMMON_ALTSTARTUP),
  (Name: 'Common Desktop'; ID: CSIDL_COMMON_DESKTOPDIRECTORY),
  (Name: 'Common Favorites'; ID: CSIDL_COMMON_FAVORITES),
  (Name: 'Common Programs'; ID: CSIDL_COMMON_PROGRAMS),
  (Name: 'Common Start Menu'; ID: CSIDL_COMMON_STARTMENU),
  (Name: 'Common Startup'; ID: CSIDL_COMMON_STARTUP),
  (Name: 'Controls'; ID: CSIDL_CONTROLS),
  (Name: 'Cookies'; ID: CSIDL_COOKIES),
  (Name: 'Desktop'; ID: CSIDL_DESKTOP),
  (Name: 'Desktop Directory'; ID: CSIDL_DESKTOPDIRECTORY),
  (Name: 'Drives'; ID: CSIDL_DRIVES),
  (Name: 'Favorites'; ID: CSIDL_FAVORITES),
  (Name: 'Fonts'; ID: CSIDL_FONTS),
  (Name: 'History'; ID: CSIDL_HISTORY),
  (Name: 'Internet'; ID: CSIDL_INTERNET),
  (Name: 'Internet Cache'; ID: CSIDL_INTERNET_CACHE),
  (Name: 'Network Neighborhood'; ID: CSIDL_NETHOOD),
  (Name: 'Network Top'; ID: CSIDL_NETWORK),
  (Name: 'Personal'; ID: CSIDL_PERSONAL),
  (Name: 'Printers'; ID: CSIDL_PRINTERS),
  (Name: 'Printer Links'; ID: CSIDL_PRINTHOOD),
  (Name: 'Programs'; ID: CSIDL_PROGRAMS),
  (Name: 'Recent Documents'; ID: CSIDL_RECENT),
  (Name: 'Send To'; ID: CSIDL_SENDTO),
  (Name: 'Start Menu'; ID: CSIDL_STARTMENU),
  (Name: 'Startup'; ID: CSIDL_STARTUP),
  (Name: 'Templates'; ID: CSIDL_TEMPLATES));

function CreateShellLink(const AppName, Desc: string; Dest: Integer): string;
function GetSpecialFolderPath(Folder: Integer; CanCreate: Boolean): string;
procedure GetShellLinkInfo(const LinkFile: WideString; var SLI: TShellLinkInfo);
procedure SetShellLinkInfo(const LinkFile: WideString; const SLI: TShellLinkInfo);
procedure add_context_menu (const command_name, extensions: string); //added by adenry
procedure remove_context_menu (const command_name, extensions: string); //added by adenry

implementation

uses ComObj;

// -----------------------------------------------------------------------------

function GetSpecialFolderPath(Folder: Integer; CanCreate: Boolean): string;
var
 FilePath: array[0..MAX_PATH] of WideChar; //char changed to WideChar by adenry
begin
 { Get path of selected location }
 SHGetSpecialFolderPathW(0, FilePath, Folder, CanCreate);
 Result := FilePath;
end;

// -----------------------------------------------------------------------------

function CreateShellLink(const AppName, Desc: string; Dest: Integer): string;
{ Creates a shell link for application or document specified in }
{ AppName with description Desc. Link will be located in folder }
{ specified by Dest, which is one of the string constants shown }
{ at the top of this unit. Returns the full path name of the  }
{ link file. }
var
 SL: IShellLink;
 PF: IPersistFile;
 LnkName: WideString;
begin
 OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
  IShellLink, SL));
 { The IShellLink implementer must also support the IPersistFile }
 { interface. Get an interface pointer to it. }
 PF := SL as IPersistFile;
 OleCheck(SL.SetPath(PChar(AppName))); // set link path to proper file
 if Desc <> '' then
  OleCheck(SL.SetDescription(PChar(Desc))); // set description
 { create a path location and filename for link file }
 LnkName := GetSpecialFolderPath(Dest, True) + '\' +
       ChangeFileExt(AppName, 'lnk');
 PF.Save(PWideChar(LnkName), True);     // save link file
 Result := LnkName;
end;

// -----------------------------------------------------------------------------

procedure GetShellLinkInfo(const LinkFile: WideString;
 var SLI: TShellLinkInfo);
{ Retrieves information on an existing shell link }
var
 SL: IShellLink;
 PF: IPersistFile;
 FindData: TWin32FindData;
 AStr: array[0..MAX_PATH] of char;
begin
 OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
  IShellLink, SL));
 { The IShellLink implementer must also support the IPersistFile }
 { interface. Get an interface pointer to it. }
 PF := SL as IPersistFile;
 { Load file into IPersistFile object }
 OleCheck(PF.Load(PWideChar(LinkFile), STGM_READ));
 { Resolve the link by calling the Resolve interface function. }
 OleCheck(SL.Resolve(0, SLR_ANY_MATCH or SLR_NO_UI));
 { Get all the info! }
 with SLI do
 begin
  OleCheck(SL.GetPath(AStr, MAX_PATH, FindData, 0)); //SLGP_SHORTPATH replaced with 0 by adenry - we want the full path
  PathName := AStr;
  OleCheck(SL.GetArguments(AStr, MAX_PATH));
  Arguments := AStr;
  OleCheck(SL.GetDescription(AStr, MAX_PATH));
  Description := AStr;
  OleCheck(SL.GetWorkingDirectory(AStr, MAX_PATH));
  WorkingDirectory := AStr;
  OleCheck(SL.GetIconLocation(AStr, MAX_PATH, IconIndex));
  IconLocation := AStr;
  OleCheck(SL.GetShowCmd(ShowCmd));
  OleCheck(SL.GetHotKey(HotKey));
 end;
end;

// -----------------------------------------------------------------------------

procedure SetShellLinkInfo(const LinkFile: WideString;
 const SLI: TShellLinkInfo);
{ Sets information for an existing shell link }
var
 SL: IShellLink;
 PF: IPersistFile;
begin
 OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
  IShellLink, SL));
 { The IShellLink implementer must also support the IPersistFile }
 { interface. Get an interface pointer to it. }
 PF := SL as IPersistFile;
 { Load file into IPersistFile object }
 OleCheck(PF.Load(PWideChar(LinkFile), STGM_SHARE_DENY_WRITE));
 { Resolve the link by calling the Resolve interface function. }
 OleCheck(SL.Resolve(0, SLR_ANY_MATCH or SLR_UPDATE or SLR_NO_UI));
 { Set all the info! }
 with SLI, SL do
 begin
  OleCheck(SetPath(PChar(PathName)));
  OleCheck(SetArguments(PChar(Arguments)));
  OleCheck(SetDescription(PChar(Description)));
  OleCheck(SetWorkingDirectory(PChar(WorkingDirectory)));
  OleCheck(SetIconLocation(PChar(IconLocation), IconIndex));
  OleCheck(SetShowCmd(ShowCmd));
  OleCheck(SetHotKey(HotKey));
 end;
 PF.Save(PWideChar(LinkFile), True);  // save file
end;

// -----------------------------------------------------------------------------

procedure add_context_menu (const command_name, extensions: string);
var
  extns: TStringList;
  reg: TRegistry;
  idx: integer;
  name: string;
  command: string;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CLASSES_ROOT;
  extns := TStringList.Create;
  extns.CommaText := extensions;
  // Build the command string we want to store
  command := '"' + Application.ExeName + '" "%1"';

  //removed by adenry: begin
  {//Application.MessageBox('step 1.','msg');
  // Loop over extensions we can handle
  for idx := 0 to extns.Count - 1 do
  try
    // See if this extension is already known in HKCR
    if reg.OpenKeyReadOnly ('\' + extns.Strings[idx]) then
    begin
      name := reg.ReadString ('');   // Get the name of this type
    //Application.MessageBox(PAnsiChar('step 2.' + name),'msg');
      if (name <> '') then
      begin
        success := False; //added by adenry
        // If not blank, open this type's shell key, but don't create it //actually create it
      //Application.MessageBox('step 3.','msg');
        if reg.OpenKey ('\' + name + '\shell', True) then //False changed to True by adenry
        begin //added by adenry
        //Application.MessageBox('step 4.','msg');
          // Try to create a new key called command_name
          // Note that for Delphi5 we need to set the access explicitly
          reg.Access := KEY_READ or KEY_WRITE;
        //Application.MessageBox(PAnsiChar('Access: ' + IntToStr(reg.Access)),'msg');
          if reg.OpenKey (command_name, True) then
          begin
          //Application.MessageBox('step 5.','msg');
            // The default value will be displayed in the context menu
            reg.WriteString ('', '&' + command_name);
            // So now open the command key, creating it if required
            reg.Access := KEY_READ or KEY_WRITE;
            if reg.OpenKey ('command', True) then
            begin
              // and write the command string as the default value
              reg.WriteString ('', command);
            //Application.MessageBox('step 6.','msg');
              success := True; //added by adenry
            end;
          end;
        end;//added by adenry
        if success = False then Result := False; //added by adenry
      end;
    end;
  except
  end;}
  //removed by adenry: end

  //added by adenry: begin
  for idx := 0 to extns.Count - 1 do
  try
    name := '';
    reg.OpenKey(extns.Strings[idx], True);
    name := reg.ReadString(''); //get the name of this type, e.g. if .srt is assosiated with KMPlayer it will be 'KMPlayer.srt'
    reg.CloseKey;
    if name <> '' then
    begin
      if reg.OpenKey(name + '\Shell\' + command_name, True) then
      begin
        reg.WriteString ('', '&' + command_name);
        reg.CloseKey;
      end;

      if reg.OpenKey(name + '\Shell\' + command_name + '\Command', True) then
      begin
        reg.WriteString ('', command);
        reg.CloseKey;
      end;
    end;
  finally
  end;
  //added by adenry: end

  extns.Free;
  reg.Free;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure remove_context_menu (const command_name, extensions: string);
var
  extns: TStringList;
  reg: TRegistry;
  idx: integer;
  name: string;
  command: string;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CLASSES_ROOT;
  extns := TStringList.Create;
  extns.CommaText := extensions;
  // Build the command string we want to store
  command := '"' + Application.ExeName + '" "%1"';

  //removed by adenry: begin
  {// Loop over extensions we can handle
  for idx := 0 to extns.Count - 1 do
  try
    // See if this extension is already known in HKCR
    if reg.OpenKeyReadOnly ('\' + extns.Strings[idx]) then
    begin
      name := reg.ReadString ('');   // Get the name of this type
      if (name <> '') then
      begin
        success := False; //added by adenry
        // If not blank, open this type's shell key, but don't create it
        if reg.OpenKey ('\' + name + '\shell', False) then
        begin//added by adenry
          // Check if the command_name key exists
          // Note that for Delphi5 we need to set the access explicitly
          reg.Access := KEY_READ or KEY_WRITE;
          if reg.KeyExists (command_name) then
          begin //added by adenry
            // Delete the key
            reg.DeleteKey(command_name);
            success := True; //added by adenry
          end; //added by adenry
        end;//added by adenry
        if success = False then Result := False; //added by adenry
      end;
    end;
  except
  end;}
  //removed by adenry: end

  //added by adenry: begin
  for idx := 0 to extns.Count - 1 do
  try
    name := '';
    reg.OpenKey(extns.Strings[idx], False);
    name := reg.ReadString('');
    reg.CloseKey;
    if name <> '' then
    begin
      if reg.OpenKey(name + '\Shell', False) then
      begin
        reg.DeleteKey(command_name);
        reg.CloseKey;
      end;
    end;
  finally
  end;
  //added by adenry: end

  extns.Free;
  reg.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.