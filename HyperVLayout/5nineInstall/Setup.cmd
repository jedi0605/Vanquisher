@Echo Off
set drive=%cd:~0,2%
set path=%cd:~2%
c:
cd\
c:
md CoreFig
cd CoreFig
md en-US
cd ..
md Scripts
Md WinShell
md 59Manager

cd\windows
cd system32

%drive%
cd %path%
copy .\CoreFig\*.* C:\CoreFig\*.* 
copy .\CoreFig\en-US\*.* C:\CoreFig\en-US\*.*
copy .\scripts\*.* C:\Scripts\*.*
copy .\ExplorerApp.exe C:\Windows\*.*
copy .\proc*.exe C:\Windows\*.*
copy .\NetworkI*.exe C:\Windows\*.*
copy .\Explorer++.exe C:\Windows\*.*
copy .\DevManView.exe C:\Windows\*.*
copy .\System32\*.* C:\Windows\System32\*.*
copy .\hypervconsole.* %appdata%\*.*
copy .\log.txt C:\Windows\*.*
copy config.xml C:\Windows\*.*

assoc .rc=txtfile
c:\windows\system32\xcopy .\59Manager\*.* C:\59Manager\*.* /s/e/y

c:\windows\system32\xcopy .\winshell\*.* C:\Winshell\*.* /s/e/y

c:\windows\system32\schtasks /create /tn "Load WinShell" /TR C:\WinShell\bbcheck.cmd /sc onlogon

c:\windows\regedit.exe /s c:\winshell\autostart.reg
c:\windows\system32\attrib +r c:\winshell\plugins\boxbar\boxbar.rc

call .\chrome.exe
call .\winrar.exe
call .\lanmon.exe
call c:\59manager\59manager.exe
call .\2XClient-x64.msi
call c:\winshell\bbstart.cmd
taskkill /im "blackbox.exe" /fi "STATUS eq NOT RESPONDING" /f >nul && start "" "C:\winshell\blackbox.exe"