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

        public static string GetIscsiConnection = "Get-IscsiConnection";
        public static string GetIscsiSession = "Get-IscsiSession";
    }
}
