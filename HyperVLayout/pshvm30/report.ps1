ECHO "RUNNING THE REPORT NOW...takes approximately 2 minutes"

# Variables
$DateStamp = get-date -uformat "%m-%d-%Y"
# path and filename for report file
$file = "C:\PSHVM30\reports\Report_$DATEStamp.txt"
$VMS = get-vm
$offcount = $VMS | where {$_.State -eq "Off"}
$runningcount = $VMS | where {$_.State -eq "Running"} 
$computers = $Env:COMPUTERNAME

# get the vhost uptime
Get-CimInstance Win32_OperatingSystem -comp $computers | Select @{Name="VHostName";Expression={$_."csname"}},@{Name="UPTIME=D.H:M:S.Milliseconds";Expression={(Get-Date) - $_.LastBootUpTime}},LastBootUpTime,@{Name="DATE REPORT WAS CREATED";Expression={(Get-Date)}} | format-table -autosize | out-file $file

# get the vhost name, total virtual CPU count, total RAM, virtualharddiskpath and virtualmachinepath
Get-VMHost | Select @{Name="VHostName";Expression={$_."Name"}},@{N="Total RAM(GB)";E={""+ [math]::round($_.Memorycapacity/1GB)}},logicalprocessorcount,virtualharddiskpath,virtualmachinepath | format-table -autosize | out-file $file -append

echo "VHOST Server IP Addresses and NIC's" | out-file $file -append
Get-WMIObject win32_NetworkAdapterConfiguration |   Where-Object { $_.IPEnabled -eq $true } | Select IPAddress,Description | format-table -autosize | out-file $file -append

echo "VHOST Server drive C: Disk Space" | out-file $file -append
# to get D: drive add ,D after C  - E: drive ,E etc.
Get-psdrive C | Select Root,@{N="Total(GB)";E={""+ [math]::round(($_.free+$_.used)/1GB)}},@{N="Used(GB)";E={""+ [math]::round($_.used/1GB)}},@{N="Free(GB)";E={""+ [math]::round($_.free/1GB)}} |format-table -autosize | out-file $file -append

echo "VHosts virtual switch(s) information" | out-file $file -append
get-vmswitch * | out-file $file -append

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

echo "NOTE: Nothing listed under DVD Media Path = Nothing mounted in DVD" | out-file $file -append
$outputArray = @()
foreach($VM in $VMS)
    {  
      $VMsRAM = [math]::round($VM.Memoryassigned/1GB)
      $VMsCPU = $VM.processorCount
      $VMsState = $VM.State
      $VMsStatus = $VM.Status
      $VMsUptime = $VM.Uptime
      $VMsAutomaticstartaction = $VM.Automaticstartaction
      $VMsIntegrationServicesVersion = $VM.IntegrationServicesVersion
      $VMsReplicationState = $VM.ReplicationState
      $VHDs = Get-VHD -VMId $VM.VMiD
      $VHDsGB = $VHDs | ForEach-Object { [math]::round($_.Size/1GB) }
      $VMDVD = Get-vmdvddrive -VMname $VM.VMname
     
      $output = new-object psobject
      $output | add-member noteproperty "VM Name" $VM.Name
      $output | add-member noteproperty "RAM(GB)" $VMsRAM
      $output | add-member noteproperty "vCPU" $VMsCPU
      $output | add-member noteproperty "State" $VMsState
      $output | add-member noteproperty "Status" $VMsStatus
      $output | add-member noteproperty "Uptime" $VMsUptime
      $output | add-member noteproperty "Start Action" $VMsAutomaticstartaction
      $output | add-member noteproperty "Integration Tools" $VMsIntegrationServicesVersion
      $output | add-member noteproperty "Replication State" $VMsReplicationState
      $output | add-member noteproperty "VHD Path" $VHDs.Path
      $output | add-member noteproperty "Size GB" $VHDsGB
      $output | add-member noteproperty "VHD Type" $VHDs.vhdtype
      $output | add-member noteproperty "VHD Format" $VHDs.vhdformat
      $output | add-member noteproperty "DVD Media Type" $VMDVD.dvdmediatype
      $output | add-member noteproperty "DVD Media Path" $VMDVD.path
      $outputArray += $output
     }
write-output $outputarray | sort "VM Name" | format-table * -autosize | out-string -width 600 | out-file $file -append

function Get-VMOSName
{
    param($VMName)
 
    $kec = get-ciminstance -ClassName msvm_computersystem -namespace root\virtualization\v2 | where elementname -eq $VMName | Get-CimAssociatedInstance -ResultClassName MSVM_KvpExchangeComponent -Namespace root\virtualization\v2
    $xml = [xml]"<root>$($kec.GuestIntrinsicExchangeItems)</root>"
    $nav = $xml.CreateNavigator().SelectSingleNode("root/INSTANCE/PROPERTY[@NAME='Name']/VALUE[child::text() = 'OSName']")
    if ($nav -ne $null)
    {
        $nav.MoveToParent() | Out-Null
        $nav.MoveToParent() | Out-Null

        $nav.SelectSingleNode("PROPERTY[@NAME='Data']/VALUE/child::text()").Value
    }
}
Echo "VM OS - If none is listed it is not powered on or Not MSWindows" | out-file $file -append 
Get-VM | Add-Member -Name "OSName" –MemberType ScriptProperty –Value {
       Get-VMOSName $this.Name
} -PassThru -Force | Select Name,state,OSName | format-table -autosize | out-file $file -append

Echo "VM's BIOS setting" | out-file $file -append
get-vmbios *  | sort "VMName" | Format-Table -autosize | out-file $file -append

echo "VM's Virtual Switch name and IP address" | out-file $file -append
get-vmnetworkadapter * | Select vmname,switchname,ipaddresses | sort "VMName" | format-table -autosize | out-file $file -append

echo "VM's Snapshot and location" | out-file $file -append
echo "If nothing is Listed below, then there are no Snapshots" | sort "VMName" | format-table -autosize | out-file $file -append
get-vmsnapshot -vmname * | out-file $file -append

#load the report in notepad
notepad.exe "C:\PSHVM30\reports\Report_$DATEStamp.txt"
exit
