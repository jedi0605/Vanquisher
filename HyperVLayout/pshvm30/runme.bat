netsh int tcp set global chimney=disabled
netsh advfirewall set allprofiles state off
regedit.exe /s C:\pshvm30\autostart.reg
powershell.exe Set-ExecutionPolicy unrestricted -force
powershell.exe dir c:\pshvm30 -Recurse | Unblock-File
C:\pshvm30\vcredist_x86.exe