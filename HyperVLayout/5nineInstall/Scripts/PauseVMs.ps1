Unregister-ScheduledJob StopRepl
Unregister-ScheduledJob StopRepl03
Unregister-ScheduledJob StartRepl
Unregister-ScheduledJob StartRepl03

$cred = Get-Credential

$dailystop = New-JobTrigger -Daily -At 01:00
Register-ScheduledJob -Name StopRepl -ScriptBlock { Suspend-VMReplication -VMName AF21 -ComputerName AIS-SOLUTIONS } -Trigger $dailystop -Credential $cred
$dailystop03 = New-JobTrigger -Daily -At 01:00
Register-ScheduledJob -Name StopRepl03 -ScriptBlock { Suspend-VMReplication -VMName AF24 -ComputerName AIS-SOLUTIONS } -Trigger $dailystop03 -Credential $cred

$dailystart = New-JobTrigger -Daily -At 06:00
Register-ScheduledJob -Name StartRepl -ScriptBlock { Resume-VMReplication -VMName AF21 -ComputerName AIS-SOLUTIONS } -Trigger $dailystart -Credential $cred
$dailystart03 = New-JobTrigger -Daily -At 06:00
Register-ScheduledJob -Name StartRepl03 -ScriptBlock { Resume-VMReplication -VMName AF24 -ComputerName AIS-SOLUTIONS } -Trigger $dailystart03 -Credential $cred

Get-JobTrigger -Name StopRepl
Get-JobTrigger -Name StopRepl03
Get-JobTrigger -Name StartRepl
Get-JobTrigger -Name StartRepl03