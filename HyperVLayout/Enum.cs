using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HyperVLayout
{
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
        JoinNodeToCluster
    }
}
