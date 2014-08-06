# Variables
$DateStamp = get-date -uformat "%m-%d-%Y"
$computers = $Env:COMPUTERNAME
$VMS = get-vm 
$offcount = $VMS | where {$_.State -eq "Off"}
$runningcount = $VMS | where {$_.State -eq "Running"}
$file = "C:\pshvm30\reports\welcome.txt"
 
# Display a welcome message
echo "Log On Welcome Report" | out-file $file
get-date | out-file $file -append
# get the vhost uptime
Get-CimInstance Win32_OperatingSystem -comp $computers | Select @{Name="VHostName";Expression={$_."csname"}},@{Name="Uptime=D.H:M:S.Millseconds";Expression={(Get-Date) - $_.LastBootUpTime}},LastBootUpTime | format-table -autosize | out-file $file -append 

echo "VHOST Server drive C: Disk Space" | out-file $file -append
# to get D: drive add ,D after C  - E: drive ,E etc.
Get-psdrive C | Select Root,@{N="Total(GB)";E={""+ [math]::round(($_.free+$_.used)/1GB)}},@{N="Used(GB)";E={""+ [math]::round($_.used/1GB)}},@{N="Free(GB)";E={""+ [math]::round($_.free/1GB)}} |format-table -autosize | out-file $file -append

echo "Total number of VM's on server" | out-file $file -append
echo "------------------------------" | out-file $file -append
$VMS.Count | out-file $file -append 
echo " " | out-file $file -append

echo "Number of VM's Running on server" | out-file $file -append
echo "------------------------------" | out-file $file -append
$runningcount.count | out-file $file -append 
echo " " | out-file $file -append

echo "Number of VM's Off on server" | out-file $file -append
echo "------------------------------" | out-file $file -append
$offcount.count | out-file $file -append 
echo " " | out-file $file -append

write-host Current virtual machine status: | out-file $file -append
get-vm | out-file $file -append

notepad.exe "C:\pshvm30\reports\Welcome.txt"
exit
