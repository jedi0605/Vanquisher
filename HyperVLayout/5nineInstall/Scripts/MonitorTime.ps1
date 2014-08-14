Set-VMReplicationServer -MonitoringStartTime 06:30:00 -MonitoringInterval 16:00:00
Get-VMReplicationServer | select monitoringinterval, monitoringstarttime