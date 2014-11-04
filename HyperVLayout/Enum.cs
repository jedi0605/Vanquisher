using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Vanquisher
{
    public static class CheckModuleExtensions
    {
        public static string GetCheckModuleDes(this CheckModule moduleDes)
        {
            switch (moduleDes)
            {
                case CheckModule.EnableRDP:
                    return "Enable Remote Destop service.";
                case CheckModule.EnableWinRM:
                    return "Enable WinRM service.";
                case CheckModule.IPconfig:
                    return "Gateway of each NIC is pingable.";
                case CheckModule.HyperVFeature:
                    return "Hyper-V features are install.";
                case CheckModule.ClusterFeature:
                    return "Cluster features are install.";
                case CheckModule.ISCSiConnection:
                    return "ISCSi storages are connection.";
                case CheckModule.JoinDomain:
                    return "Host in Domain.";
                case CheckModule.EnableRemoteControle:
                    return "Host allow remote control.";
                case CheckModule.GPUFeature:
                    return "GPU feature are install.";
                case CheckModule.CreateVM:
                    return "Create VM.";
                case CheckModule.CreateCluster:
                    return "Create Cluster.";
                case CheckModule.CreateVirtualSwitch:
                    return "Virtual switch setting is correct.";
                case CheckModule.CheckCluster:
                case CheckModule.JoinNodeToCluster:
                default:
                    break;
            }
            return "Those features are not ready.";
        }
    }

    public enum CheckModule
    {
        EnableRDP,
        EnableWinRM,
        CreateVirtualSwitch,
        IPconfig,
        HyperVFeature,
        ClusterFeature,
        ISCSiConnection,
        JoinDomain,
        CheckCluster,
        CreateCluster,
        EnableRemoteControle,
        JoinNodeToCluster,
        GPUFeature,
        CreateVM
    }

    public enum FiveNine
    {
        IsInsatll,
        StartPath
    }
}
