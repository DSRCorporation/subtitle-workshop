; This file is part of Subtitle Workshop
; URL: subworkshop.sf.net
; Licesne: GPL v3
; Copyright: See Subtitle Workshop's copyright information
; File Description: NSIS Installer Script File

; Program information
!define PRODUCT "Subtitle Workshop"
!define PRODUCT_SHORTNAME "SubtitleWorkshop"
!define PRODUCT_EXENAME "subtitleworkshop.exe"
!define VER_MAJOR 6
!define VER_MINOR "0b"
!define BUILD_NUM 131121
!define VERSION "${VER_MAJOR}.${VER_MINOR}"
!define VERSION_FULL "${VERSION} (build ${BUILD_NUM})"
!define WEBSITE "http://subworkshop.sf.net/"
Name "${PRODUCT}"

; Various settings
SetCompressor lzma
BrandingText "Subtitle Workshop ${VERSION_FULL}"
SetOverwrite on
!include "MUI2.nsh"
!include "Sections.nsh"
!include "LogicLib.nsh"
!define MUI_ABORTWARNING
!define MUI_UNINSTALLER
!define MUI_UNCONFIRMPAGE

; Cosmetic settings
;!define MUI_UI "Res\usmodern.exe"
!define THE_HEADER_IMAGE "Res\SW_Installer_Header_r.bmp"
!define THE_SIDE_IMAGE "Res\SW-Welcome-Finish-bitmap.bmp" 
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${THE_HEADER_IMAGE}"
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
!define MUI_HEADERIMAGE_UNBITMAP "${THE_HEADER_IMAGE}"
!define MUI_HEADERIMAGE_UNBITMAP_NOSTRETCH
!define MUI_HEADERIMAGE_RIGHT
!define MUI_BGCOLOR ffffff
!define MUI_WELCOMEFINISHPAGE_BITMAP "${THE_SIDE_IMAGE}"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${THE_SIDE_IMAGE}" 
;Icon "Res\my-install.ico"
;UninstallIcon "Res\my-uninstall.ico"

; Path to files & installer output
!define FILESPATH "..\Bin"
!define LICENSEPATH "..\Bin"
OutFile "${PRODUCT_SHORTNAME}_${VERSION}_${BUILD_NUM}_installer.exe"

!define MUI_FINISHPAGE_LINK ${WEBSITE}
!define MUI_FINISHPAGE_LINK_LOCATION ${WEBSITE}

; Path to EXE, to display in the finish page after successful instalation
!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT_EXENAME}"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\changelog.txt"

; Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE $(gpllicense)
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Installer language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Bulgarian"
!insertmacro MUI_LANGUAGE "Russian"

; License file
LicenseLangString gpllicense ${LANG_ENGLISH} "${LICENSEPATH}\gpl-3.0.txt"
LicenseLangString gpllicense ${LANG_BULGARIAN} "${LICENSEPATH}\gpl-3.0.txt"
LicenseLangString gpllicense ${LANG_RUSSIAN} "${LICENSEPATH}\gpl-3.0.txt"

; Language strings for component-selection page - Titles
LangString TITLE_MainFiles ${LANG_ENGLISH} "Main files"
LangString TITLE_MainFiles ${LANG_BULGARIAN} "Основни файлове"
LangString TITLE_MainFiles ${LANG_RUSSIAN} "Основные файлы"
LangString TITLE_Manual ${LANG_ENGLISH} "Manual"
LangString TITLE_Manual ${LANG_BULGARIAN} "Ръководство"
LangString TITLE_Manual ${LANG_RUSSIAN} "Руководство пользователя"
LangString TITLE_CustomFormats ${LANG_ENGLISH} "Custom formats"
LangString TITLE_CustomFormats ${LANG_BULGARIAN} "Потребителски формати"
LangString TITLE_CustomFormats ${LANG_RUSSIAN} "Свои форматы"
LangString TITLE_LangFiles ${LANG_ENGLISH} "Language files"
LangString TITLE_LangFiles ${LANG_BULGARIAN} "Езикови файлове"
LangString TITLE_LangFiles ${LANG_RUSSIAN} "Файлы языков"
LangString TITLE_ShortCuts ${LANG_ENGLISH} "Shortcuts"
LangString TITLE_ShortCuts ${LANG_BULGARIAN} "Шорткъти"
LangString TITLE_ShortCuts ${LANG_RUSSIAN} "Ярлыки"
LangString TITLE_StartMenuShortCuts ${LANG_ENGLISH} "Start Menu"
LangString TITLE_StartMenuShortCuts ${LANG_BULGARIAN} "Старт-меню"
LangString TITLE_StartMenuShortCuts ${LANG_RUSSIAN} "Меню Пуск"
LangString TITLE_DesktopShortCuts ${LANG_ENGLISH} "Desktop"
LangString TITLE_DesktopShortCuts ${LANG_BULGARIAN} "Работен плот"
LangString TITLE_DesktopShortCuts ${LANG_RUSSIAN} "Рабочий стол"
LangString TITLE_QuickLaunchShortCuts ${LANG_ENGLISH} "Quick Launch"
LangString TITLE_QuickLaunchShortCuts ${LANG_BULGARIAN} "Лента за бързо стартиране"
LangString TITLE_QuickLaunchShortCuts ${LANG_RUSSIAN} "Быстрый запуск"

; Language strings for component-selection page - Descriptions
LangString DESC_MainFiles ${LANG_ENGLISH} "Installs ${PRODUCT}'s core files."
LangString DESC_MainFiles ${LANG_BULGARIAN} "Инсталира основните файлове на ${PRODUCT}."
LangString DESC_MainFiles ${LANG_RUSSIAN} "Установка основных файлов ${PRODUCT}."
LangString DESC_Manual ${LANG_ENGLISH} "Installs the manual in the selected languages."
LangString DESC_Manual ${LANG_BULGARIAN} "Инсталира ръководството в избраните езици."
LangString DESC_Manual ${LANG_RUSSIAN} "Установка руководства пользователя для выбранных языков."
LangString DESC_CustomFormats ${LANG_ENGLISH} "Installs custom format examples."
LangString DESC_CustomFormats ${LANG_BULGARIAN} "Инсталира примерни файлове за потребителски формати."
LangString DESC_CustomFormats ${LANG_RUSSIAN} "Установка примеров своего формата."
LangString DESC_LangFiles ${LANG_ENGLISH} "Installs all available user interface language files."
LangString DESC_LangFiles ${LANG_BULGARIAN} "Инсталира всички налични езикови файлове за интерфейса на програмата."
LangString DESC_LangFiles ${LANG_RUSSIAN} "Установка всех языков интерфейса программы."
LangString DESC_ShortCuts ${LANG_ENGLISH} "Creates shortcuts."
LangString DESC_ShortCuts ${LANG_BULGARIAN} "Създава избраните шорткъти."
LangString DESC_ShortCuts ${LANG_RUSSIAN} "Создание ярлыков."
LangString DESC_StartMenuShortCuts ${LANG_ENGLISH} "Creates shortcuts in the start menu."
LangString DESC_StartMenuShortCuts ${LANG_BULGARIAN} "Създава шорткъти в старт-менюто."
LangString DESC_StartMenuShortCuts ${LANG_RUSSIAN} "Создание ярлыков в меню Пуск."
LangString DESC_DesktopShortCuts ${LANG_ENGLISH} "Creates a shortcut on the desktop."
LangString DESC_DesktopShortCuts ${LANG_BULGARIAN} "Създава шорткуъ на работния плот."
LangString DESC_DesktopShortCuts ${LANG_RUSSIAN} "Создание ярлыков на рабочем столе."
LangString DESC_QuickLaunchShortCuts ${LANG_ENGLISH} "Creates a shortcut in the Quick Launch toolbar."
LangString DESC_QuickLaunchShortCuts ${LANG_BULGARIAN} "Създава шоткът в Лентата за бързо стартиране."
LangString DESC_QuickLaunchShortCuts ${LANG_RUSSIAN} "Создание ярлыков в панели Быстрого запуска."

; Translations of the manual
LangString TITLE_ManualEnglish ${LANG_ENGLISH} "English"
LangString TITLE_ManualEnglish ${LANG_BULGARIAN} "Английски"
LangString TITLE_ManualEnglish ${LANG_RUSSIAN} "Английский"
LangString TITLE_ManualBulgarian ${LANG_ENGLISH} "Bulgarian"
LangString TITLE_ManualBulgarian ${LANG_BULGARIAN} "Български"
LangString TITLE_ManualBulgarian ${LANG_RUSSIAN} "Болгарский"
LangString TITLE_ManualRussian ${LANG_ENGLISH} "Russian"
LangString TITLE_ManualRussian ${LANG_BULGARIAN} "Руски"
LangString TITLE_ManualRussian ${LANG_RUSSIAN} "Русский"

; Function to remove the "Open with" shell context menu item
Function un.RemoveContextMenu
  ReadRegStr $1 HKCR "$R0" "" ; get the name for this extension
	DeleteRegKey HKCR "$1\shell\Open with ${PRODUCT}" ; delete the "Open with" menu item
FunctionEnd

; Function to restore file association
Function un.RestoreAssociation
  ReadRegStr $1 HKCR "$R0" "" ; get the name for this extension
  StrCmp $1 "${PRODUCT_SHORTNAME}" 0 NotAssociated ; check if the extension is actually associated    
    ReadRegStr $1 HKCR "$R0" "${PRODUCT_SHORTNAME}Backup" ; read the old value from the backup
    StrCmp $1 "" 0 Restore ; if the backup is empty, then delete the whole extension key
      DeleteRegKey HKCR "$R0"
			Goto NotAssociated
Restore:
      WriteRegStr HKCR "$R0" "" $1 ; restore old value
      DeleteRegValue HKCR "$R0" "${PRODUCT_SHORTNAME}Backup" ; delete backup value
NotAssociated:
FunctionEnd

; macro to remove the "Open with" shell context menu item
!macro UnRemoveContextMenu EXT
  Push $R0
  StrCpy $R0 ${EXT}
  Call un.RemoveContextMenu
  Pop $R0
!macroend

; macro to restore file association
!macro UnRestoreAssociation EXT
  Push $R0
  StrCpy $R0 ${EXT}
  Call un.RestoreAssociation
  Pop $R0
!macroend

; macro to execute an action for all extensions
!macro MacroAllExtensions _action
  !insertmacro ${_action} ".txt"
  !insertmacro ${_action} ".ass"
  !insertmacro ${_action} ".xas"
  !insertmacro ${_action} ".aqt"
  !insertmacro ${_action} ".dat"
  !insertmacro ${_action} ".asc"
  !insertmacro ${_action} ".dks"
  !insertmacro ${_action} ".sub"
  !insertmacro ${_action} ".js"
  !insertmacro ${_action} ".jss"
  !insertmacro ${_action} ".lrc"
  !insertmacro ${_action} ".vkt"
  !insertmacro ${_action} ".scr"
  !insertmacro ${_action} ".mpl"
  !insertmacro ${_action} ".ovr"
  !insertmacro ${_action} ".pan"
  !insertmacro ${_action} ".pjs"
  !insertmacro ${_action} ".psb"
  !insertmacro ${_action} ".rt"
  !insertmacro ${_action} ".smi"
  !insertmacro ${_action} ".sami"
  !insertmacro ${_action} ".s2k"
  !insertmacro ${_action} ".sbt"
  !insertmacro ${_action} ".890"
  !insertmacro ${_action} ".rtf"
  !insertmacro ${_action} ".sst"
  !insertmacro ${_action} ".son"
  !insertmacro ${_action} ".stl"
  !insertmacro ${_action} ".ssts"
  !insertmacro ${_action} ".srt"
  !insertmacro ${_action} ".ssa"
  !insertmacro ${_action} ".xml"
  !insertmacro ${_action} ".tts"
  !insertmacro ${_action} ".vsf"
  !insertmacro ${_action} ".sbv"
  !insertmacro ${_action} ".zeg"
!macroend

; Folder-selection page
InstallDir "$PROGRAMFILES\${PRODUCT}"

; For removing Start Menu shortcut in Windows 7
RequestExecutionLevel user

; -------------------------------- ;
;         Files to install         ;
; -------------------------------- ;

Section $(TITLE_MainFiles) MainFiles
  SectionIn RO

  SetOutPath $INSTDIR
    File "${FILESPATH}\${PRODUCT_EXENAME}"
		SetOverwrite off ; preserve shortcuts
    File "${FILESPATH}\shortcuts.key"
		SetOverwrite on
		File "${FILESPATH}\changelog.txt"
		File "${FILESPATH}\gpl-3.0.txt"
  SetOutPath $INSTDIR\SubtitleAPI
    File "${FILESPATH}\SubtitleAPI\SubtitleAPI.dll"
	SetOutPath $INSTDIR\Help
		File "${FILESPATH}\Help\01-SW-Main-Window-EN.png"
  SetOutPath $INSTDIR\OCRScripts
    File "${FILESPATH}\OCRScripts\*.ocr"
  SetOutPath $INSTDIR\PascalScripts
    File "${FILESPATH}\PascalScripts\*.pas"
  CreateDirectory $INSTDIR\CustomFormats
	

  WriteRegStr HKLM "SOFTWARE\${PRODUCT}" "Install_Dir" "$INSTDIR"
  WriteRegStr HKLM "SOFTWARE\${PRODUCT}" "Installer Language" "$LANGUAGE"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_SHORTNAME}" "DisplayName" "${PRODUCT} ${VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_SHORTNAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteUninstaller "uninstall.exe"

SectionEnd

;--------------------------------------------------------------------

SubSection $(TITLE_Manual) Manual
	
  Section $(TITLE_ManualEnglish) ManualEnglish
    SetOutPath $INSTDIR\Help
    File "${FILESPATH}\Help\Manual.html"
  SectionEnd

  Section $(TITLE_ManualBulgarian) ManualBulgarian
    SetOutPath $INSTDIR\Help
    File "${FILESPATH}\Help\ManualBG.html"
  SectionEnd

  Section $(TITLE_ManualRussian) ManualRussian
    SetOutPath $INSTDIR\Help
    File "${FILESPATH}\Help\ManualRUS.html"
  SectionEnd

SubSectionEnd

;--------------------------------------------------------------------

Section $(TITLE_CustomFormats) CustomFormats
  SetOutPath "$INSTDIR\Custom Formats Examples"
    File "${FILESPATH}\Custom Formats Examples\*.*"
SectionEnd

;--------------------------------------------------------------------

Section $(TITLE_LangFiles) LangFiles
  SetOutPath $INSTDIR\Langs
    File "${FILESPATH}\Langs\*.lng"
    File "${FILESPATH}\Langs\Charsets.txt"
	SetOutPath $INSTDIR\Langs\semi-translated
		File "${FILESPATH}\Langs\semi-translated\*.lng"		
SectionEnd

;--------------------------------------------------------------------

SubSection $(TITLE_ShortCuts) ShortCuts

  Section $(TITLE_StartMenuShortCuts) StartMenuShortCuts
    CreateDirectory "$SMPROGRAMS\${PRODUCT}"

    CreateDirectory "$SMPROGRAMS\${PRODUCT}\Help"

    ${If} ${SectionIsSelected} ${ManualEnglish}
        CreateShortCut "$SMPROGRAMS\${PRODUCT}\Help\Manual (English).lnk" "$INSTDIR\Manual\Manual.html" "" "$INSTDIR\Manual\Manual.html" 0
    ${EndIf}
    ${If} ${SectionIsSelected} ${ManualBulgarian}
      CreateShortCut "$SMPROGRAMS\${PRODUCT}\Help\Manual (Bulgarian).lnk" "$INSTDIR\Manual\ManualBG.html" "" "$INSTDIR\Manual\ManualBG.html" 0
    ${EndIf}
    ${If} ${SectionIsSelected} ${ManualRussian}
      CreateShortCut "$SMPROGRAMS\${PRODUCT}\Help\Manual (Russian).lnk" "$INSTDIR\Manual\ManualRUS.html" "" "$INSTDIR\Manual\ManualRUS.html" 0
    ${EndIf}

    CreateShortCut "$SMPROGRAMS\${PRODUCT}\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT_EXENAME}" "" "$INSTDIR\${PRODUCT_EXENAME}" 0
    CreateShortCut "$SMPROGRAMS\${PRODUCT}\Uninstall ${PRODUCT}.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  SectionEnd

  Section $(TITLE_DesktopShortCuts) DesktopShortCuts
    CreateShortCut "$DESKTOP\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT_EXENAME}" "" "$INSTDIR\${PRODUCT_EXENAME}" 0
  SectionEnd

  Section $(TITLE_QuickLaunchShortCuts) QuickLaunchShortCuts
    CreateShortCut "$QUICKLAUNCH\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT_EXENAME}" "" "$INSTDIR\${PRODUCT_EXENAME}" 0
  SectionEnd

SubSectionEnd

;--------------------------------------------------------------------

; When installer is launched...

Function .onInit
	; Check if installer is not already launched
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${PRODUCT_SHORTNAME}Installer") i .r1 ?e'
	Pop $R0 
	StrCmp $R0 0 +3
		MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running." ; we can't translate this message, as it shows up before the language selection
		Abort
	
	; Check if the program is running
	FindWindow $0 "${PRODUCT_SHORTNAME}"
	StrCmp $0 0 notRunning
    MessageBox MB_OK|MB_ICONEXCLAMATION "${PRODUCT} is running. Please close it and run the installer again." /SD IDOK ; we can't translate this message, as it shows up before the language selection
    Abort
notRunning:

	; Display installer language selection
  !insertmacro MUI_LANGDLL_DISPLAY
	
FunctionEnd

; Descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${MainFiles} $(DESC_MainFiles)
  !insertmacro MUI_DESCRIPTION_TEXT ${Manual} $(DESC_Manual)
  !insertmacro MUI_DESCRIPTION_TEXT ${CustomFormats} $(DESC_CustomFormats)
  !insertmacro MUI_DESCRIPTION_TEXT ${LangFiles} $(DESC_LangFiles)
  !insertmacro MUI_DESCRIPTION_TEXT ${ShortCuts} $(DESC_ShortCuts)
  !insertmacro MUI_DESCRIPTION_TEXT ${StartMenuShortCuts} $(DESC_StartMenuShortCuts)
  !insertmacro MUI_DESCRIPTION_TEXT ${DesktopShortCuts} $(DESC_DesktopShortCuts)
  !insertmacro MUI_DESCRIPTION_TEXT ${QuickLaunchShortCuts} $(DESC_QuickLaunchShortCuts)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; -------------------------------- ;
;        Uninstaller section       ;
; -------------------------------- ;

Section "Uninstall"

  ; remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_SHORTNAME}"
  DeleteRegKey HKLM "Software\${PRODUCT}"	
	
	; Delete registry keys for "Open with Subtitle Workshop" for all extensions
	!insertmacro MacroAllExtensions UnRemoveContextMenu
	
	; Restore file associations for all extensions	
	!insertmacro MacroAllExtensions UnRestoreAssociation
	DeleteRegKey HKCR "${PRODUCT_SHORTNAME}"	

	; Delete all files and folders
  Delete "$INSTDIR\*.*"
  Delete "$INSTDIR\OCRScripts\*.*"
  RMDir  "$INSTDIR\OCRScripts"
  Delete "$INSTDIR\PascalScripts\*.*"
  RMDir  "$INSTDIR\PascalScripts"
  Delete "$INSTDIR\SubtitleAPI\*.*"
  RMDir  "$INSTDIR\SubtitleAPI"
	Delete "$INSTDIR\Langs\semi-translated\*.*"
	RMDir  "$INSTDIR\Langs\semi-translated\"
  Delete "$INSTDIR\Langs\*.*"
	RMDir  "$INSTDIR\Langs\"
  Delete "$INSTDIR\Custom Formats Examples\*.*"
  RMDir  "$INSTDIR\Custom Formats Examples\"
  Delete "$INSTDIR\CustomFormats\*.*"
  RMDir  "$INSTDIR\CustomFormats\"  
  Delete "$INSTDIR\Help\*.*"
  RMDir  "$INSTDIR\Help\"
  Delete "$SMPROGRAMS\${PRODUCT}\*.*"
  Delete "$SMPROGRAMS\${PRODUCT}\Help\*.*"
  RMDir  "$SMPROGRAMS\${PRODUCT}\Help"
  RMDir  "$SMPROGRAMS\${PRODUCT}"
  Delete "$DESKTOP\${PRODUCT}.lnk"
  Delete "$QUICKLAUNCH\${PRODUCT}.lnk"
  RMDir  "$INSTDIR"

SectionEnd

; When uninstaller is launched...
Function un.onInit
	; Check if installer is not already launched
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${PRODUCT_SHORTNAME}Uninstaller") i .r1 ?e'
	Pop $R0 
	StrCmp $R0 0 +3
		MessageBox MB_OK|MB_ICONEXCLAMATION "The uninstaller is already running."
		Abort	
		
	; Check if the program is running
	FindWindow $0 "${PRODUCT_SHORTNAME}"
	StrCmp $0 0 notRunning
    MessageBox MB_OK|MB_ICONEXCLAMATION "${PRODUCT} is currently running. Please close it and run the uninstaller again." /SD IDOK
    Abort
notRunning:

  ; Get language from registry
  ReadRegStr $LANGUAGE HKLM "Software\${PRODUCT}" "Installer Language"		
FunctionEnd
