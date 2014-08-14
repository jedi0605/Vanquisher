echo off
rem start c:\windows\explorerapp.exe

color 17
for /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Control Panel\International" /v LocaleName') do set language=%%A
for /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Control Panel\Desktop" /v PreferredUILanguages') do set language=%%A
cls

REM Default language script is en-US
if not exist %windir%\system32\%language%\sconfig.vbs set language=en-US

pushd %~dp0
cd %windir%\system32\%language%
cscript sconfig.vbs
popd
color