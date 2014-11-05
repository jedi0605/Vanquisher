using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.NetworkInformation;
using System.Net;
using NLog;
using System.Net.Sockets;

namespace VanquisherAPI
{
    public class NetworkCheker
    {
        public struct NetworkAdapter
        {
            public string adapterName;
            public IPAddress gateway;
            public IPAddress ipaddress;
            public bool isUseful;

        };
        static Logger logger = LogManager.GetCurrentClassLogger();
        public static APIResponse CheckNetwork()
        {
            List<NetworkAdapter> adapterInfo = GetAdapterInfo();
            adapterInfo = CheckAdapterAvailable(adapterInfo);
            APIResponse result = new APIResponse() { Result = false };
            int falseCount = 0;
            string outputMessage = "Some adapter error: ";
            foreach (NetworkAdapter item in adapterInfo)
            {
                if (item.isUseful == false)
                {
                    falseCount++;
                    outputMessage += item.adapterName + ". ";
                }
            }

            if (falseCount == 0)
            {
                result.Result = true;
                result.ObjectPayload = "All adapters are work.";
            }
            else
            {
                result.ObjectPayload = outputMessage;
            }

            return result;
        }

        public static List<NetworkAdapter> GetAdapterInfo()
        {
            List<NetworkAdapter> adapterInfo = new List<NetworkAdapter>();
            NetworkInterface[] card = NetworkInterface.GetAllNetworkInterfaces();
            List<NetworkInterface> networkAdapter = new List<NetworkInterface>();

            for (int i = 0; i < card.Count(); i++)
            {
                if (card[i].NetworkInterfaceType == NetworkInterfaceType.Ethernet)
                    networkAdapter.Add(card[i]);
            }

            if (networkAdapter == null)
                return null;
            foreach (NetworkInterface item in networkAdapter)
            {

                IPAddress gatewayAddress = item.GetIPProperties().GatewayAddresses.FirstOrDefault() == null ? null : item.GetIPProperties().GatewayAddresses.FirstOrDefault().Address;
                // IPAddress ipAddress = item.GetIPProperties().UnicastAddresses[0].Address;
                string[] ipTest = item.GetIPProperties().UnicastAddresses.Where(nip => nip.IPv4Mask != null && nip.Address.AddressFamily == AddressFamily.InterNetwork)
                .Select(ip => ip.Address.ToString()).ToArray();
                logger.Debug("ipTest[0]:" + ipTest[0]);
                //foreach (var item2 in item.GetIPProperties().UnicastAddresses)
                //{

                //    logger.Debug("UnicastAddress :" + item2.Address);
                //}

                logger.Debug("gatewayAddress : " + gatewayAddress + ". ip address : " + ipTest[0].ToString());
                adapterInfo.Add(new NetworkAdapter { gateway = gatewayAddress, ipaddress = IPAddress.Parse(ipTest[0]), isUseful = false, adapterName = item.Name });
            }
            //var ipv4 = NetworkInterface.GetAllNetworkInterfaces()
            //    .SelectMany(ni => ni.GetIPProperties().UnicastAddresses.Where(nip => nip.IPv4Mask != null && nip.Address.AddressFamily == AddressFamily.InterNetwork)
            //    .Select(ip => ip.Address.ToString())).ToArray();
            //foreach (var item in ipv4)
            //{
            //    logger.Debug("IPv4 info:" + item.ToString());
            //}

            return adapterInfo;
        }

        private static List<NetworkAdapter> CheckAdapterAvailable(List<NetworkAdapter> adapterInfo)
        {
            NetworkAdapter[] adapter = adapterInfo.ToArray();
            for (int i = 0; i < adapter.Count(); i++)
            {
                if (adapter[i].gateway != null)
                {
                    adapter[i].isUseful = IsIPPingable(adapter[i].gateway);
                }
            }
            return adapter.ToList();
        }

        public static bool IsIPPingable(IPAddress ip)
        {
            Ping x = new Ping();
            PingReply reply;

            reply = x.Send(ip);

            if (reply.Status == IPStatus.Success)
            {
                return true;
            }
            else return false;
        }

    }
}
