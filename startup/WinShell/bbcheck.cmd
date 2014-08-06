@Echo Off
taskkill /im "blackbox.exe" /fi "STATUS eq NOT RESPONDING" /f >nul && start "" "C:\winshell\blackbox.exe"
