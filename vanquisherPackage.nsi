
;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !include "MUI_EXTRAPAGES.nsh"
  !include 'LogicLib.nsh'
  !include "WordFunc.nsh"
  !include 'Registry.nsh'
  !include "FileFunc.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Vanquisher"
  OutFile "Vanquisher.exe"

  ;Default installation folder
  InstallDir "c:\Vanquisher\"

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "License.txt"

  !define MUI_PAGE_CUSTOMFUNCTION_SHOW MyWelcomeShowCallback

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_README "readme.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

  Function MyWelcomeShowCallback
        SendMessage $mui.WelcomePage.Text ${WM_SETTEXT} 0 "STR:$(MUI_TEXT_WELCOME_INFO_TEXT)$\n$\nInstallation takes few minutes. Please ENSURE ALL VALUES in gConnect.ini are correct before you click Next or installation FAILS. "
  FunctionEnd

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

  ;Set up install lang strings for 1st lang
  ${ReadmeLanguage} "${LANG_ENGLISH}" \
          "Read Me" \
          "Please review the following important information." \
          "About $(^name):" \
          "$\n  Click on scrollbar arrows or press Page Down to review the entire text."

;--------------------------------
;Installer Sections

Section "Full" Sec1

  SetOutPath "$INSTDIR"

 ; check whether .Net framework 4.0 is installed
   ${registry::KeyExists} "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" $0

 ; check install
   
    ${if} $0 == "-1"
         MessageBox MB_OK ".Net Framework 4.0 is not installed, please install .NET Framework 4.0 before installation, please press $\"OK$\" to Abort the installation"
         ABORT
   ${EndIf}

   ;${DirState} "$INSTDIR" $R0
   ;${if} $R0 = "1"
   ;      MessageBox MB_OK " path not exist $INSTDIR."
   ;      RMDir /r $INSTDIR
   ;${EndIf}

;Copy Files

   File /r HyperVLayout\bin\Debug\*
   ;File /r GPOTemplates
   ;File /r IniTemplates
   ;File /r LoginScript
   ;File /r MSSQL
   ;File /r Scripts
   ;File /r SSOWebService
   ;File /r VDIPortal

   ;File *.dll
   ;File *.xml
   ;File "DaasInstallWizard.exe"
   ;File *.config
   ;File "MUI_EXTRAPAGES.nsh"
   ;File "SQL.ini"

   Exec $INSTDIR\Vanquisher.exe

    ; check vanquisher install
   ${registry::KeyExists} "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Vanquisher" $0
	
   ${if} $0 == "-1"
         ExecWait "reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /f /v Vanquisher"
         ExecWait "reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /f /v Vanquisher /d $INSTDIR\Vanquisher.exe "
   ${EndIf}
   
   ${if} $0 == "0"
        ExecWait "reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /f /v Vanquisher /d $INSTDIR\Vanquisher.exe "
   ${EndIf}
   
SectionEnd

AutoCloseWindow true
