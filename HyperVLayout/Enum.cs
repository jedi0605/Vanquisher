﻿using System;
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
                    return "Remote Destop service is open.";
                case CheckModule.EnableWinRM:
                    return "WinRM service is open.";
                case CheckModule.IPconfig:
                    return "Gateway of each NIC is pingable.";
                case CheckModule.HyperVFeature:
                    return "All Hyper-V features are install.";
                case CheckModule.ClusterFeature:
                    return "All Cluster features are install.";
                case CheckModule.ISCSiConnection:
                    return "ISCSi storages are reachable and set online.";
                case CheckModule.JoinDomain:
                    return "Host in Domain.";
                case CheckModule.EnableRemoteControle:
                    return "Host allow remote controle.";
                case CheckModule.GPUFeature:
                    return "Host can use virtualization GPU";
                case CheckModule.CreateCluster:
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
        IPconfig,
        HyperVFeature,
        ClusterFeature,
        ISCSiConnection,
        JoinDomain,
        CheckCluster,
        CreateCluster,
        EnableRemoteControle,
        JoinNodeToCluster,
        GPUFeature
    }

    public enum FiveNine
    {
        IsInsatll,
        StartPath
    }
}
