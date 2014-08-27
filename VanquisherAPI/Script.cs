using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VanquisherAPI
{
    public class VanScript
    {
        public static string CheckRDPfDeny = "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server').fDenyTSConnections";
        public static string RDPAuthentication = "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp').UserAuthentication";
        public static string RDPPort = "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp').PortNumber";
        public static string GetWinRMStatus = "Get-Service -ComputerName localhost -Name winrm | Select Status";
        public static string CheckWinRMIsListening = "Get-ChildItem WSMan:\\localhost\\Listener";
        public static string IsIscsiConnected = "Get-IscsiConnection";
        public static string GetIscsiSession = "Get-IscsiSession";
        public static string GetIscsiInfo = "Get-Disk | Where-Object BusType -eq \"iSCSI\"";
        public static string InitializeDisk(int diskNumber)
        {
            return "Initialize-Disk -Number " + diskNumber + " -PartitionStyle GPT -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume -force -Confirm:$false";
        }
        public static string SetDiskOnline(int diskNumber)
        {
            return "Set-Disk " + diskNumber + " -IsOffline $False";
        }
        public static string SetDiskOffline(int diskNumber)
        {
            return "Set-Disk " + diskNumber + " -IsOffline $True";
        }

        public static string CreateClusterNoIgnore(string clusterName, string clusterComputer, string clusterIP)
        {
            return "New-Cluster -Name " + clusterName + " -Node " + clusterComputer + " -StaticAddress " + clusterIP;
        }

        public static string CreateCluster(string clusterName, string clusterComputer, string clusterIP, string ignoreIP)
        {
            return "New-Cluster -Name " + clusterName + " -Node " + clusterComputer + " -StaticAddress " + clusterIP + " -IgnoreNetwork " + ignoreIP;
        }

        public static string GetPartition = "Get-Partition";
        public static string GetDomain = "(gwmi WIN32_ComputerSystem).Domain";

        public static string CMD = "Start-Process cmd";
        public static string pshvm30 = "\\MyEventViewer.exe";
        public static string FiveNineInstall = "\\59Manager.exe";
        public static string ExplorePlus = "\\Explorer++";
        public static string Corefig = "\\Corefig.ps1";
        public static string Computer = "\\Computer.ps1";
        public static string Firewallsettings = "\\Firewallsettings.ps1";
        public static string RemoteDesktop = "\\RemoteDesktop.ps1";
        public static string WINRM = "\\WINRM.ps1";
        public static string IpSettings = "\\IpSettings.ps1";
        public static string Roles = "\\Roles.ps1";
        public static string JoinDomainAndRename = "\\JoinDomainandRename.ps1";
        public static string IscsiUI = "iSCSIcpl.exe";
        public static string TaskManager = "taskmgr.exe";
        public static string Powershell = "Start-Process powershell";
        public static string Reboot = "shutdown -r -t 1";
        public static string Shutdown = "shutdown -s -t 1";
        public static string CheckPsRemote = "ls";
        public static string EnablePsRemoting = " Enable-PSRemoting -force";

        // firewall
        public static string FirewallRemoteDisk = "netsh advfirewall firewall set rule group=\"@firewallAPI.dll,-34501\" new enable=yes";
        public static string FirewallRemoteManagement = "netsh advfirewall firewall set rule group=\"@firewallAPI.dll,-30002\" new enable=yes";

        // GPU
        public static string InstallRDSFeature = "Install-WindowsFeature RDS-Virtualization";
        public static string InstallRemoteDesktopServices = "Install-WindowsFeature Remote-Desktop-Services";

        // Network Type
        public static string ChangeNetworkToPrivate = "[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]\"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}\"))"
                                                    +".GetNetworkConnections()|%{$_.GetNetwork().SetCategory(1)}";
        public static string GetNetworkType = "[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]\"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}\"))"
                                                    + ".GetNetworkConnections()|%{$_.GetNetwork().GetCategory()}";

    }
}
