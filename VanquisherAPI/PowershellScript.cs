using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VanquisherAPI
{
    public class PowershellScript
    {
        public static string CheckRDPfDeny = "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server').fDenyTSConnections";
        public static string RDPAuthentication = "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp').UserAuthentication";
        public static string RDPPort = "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp').PortNumber";

        public static string GetWinRMStatus = "Get-Service -ComputerName localhost -Name winrm | Select Status";
        public static string CheckWinRMIsListening = "Get-ChildItem WSMan:\\localhost\\Listener";

        public static string IsIscsiConnected = "Get-IscsiConnection";
        public static string GetIscsiSession = "Get-IscsiSession";
        public static string GetIscsiInfo = "Get-Disk | Where-Object BusType -eq “iSCSI”";
        public static string InitializeDisk(int diskNumber)
        {
            return "Initialize-Disk –Number " + diskNumber + " –PartitionStyle GPT –PassThru | New-Partition –AssignDriveLetter –UseMaximumSize | Format-Volume";
        }
        
        public static string SetDiskOnline(int diskNumber)
        {
            return "Set-Disk " + diskNumber + " –IsOffline $False";
        }

        public static string GetPartition = "Get-Partition";
        
    }
}
