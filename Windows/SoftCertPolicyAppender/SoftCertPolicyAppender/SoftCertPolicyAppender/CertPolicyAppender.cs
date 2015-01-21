using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using LocalPolicy;
using Microsoft.Win32;

namespace SoftCertPolicyAppender
{
    public class CertPolicyAppender
    {
        public void Load(string certFile)
        {
            var cert = new X509Certificate2();
            cert.Import(certFile);
            Certificate = cert;

        }

        public X509Certificate2 Certificate { get; private set; }

        /// <summary>
        /// 构造写写入注册表的证书数据
        /// </summary>
        /// <returns></returns>
        private byte[] CalcRegCertData()
        {
            var cert = Certificate;
            var thumbprintData = cert.Thumbprint.HexString2Bytes().ToArray();

            var rtn = new List<byte>();

            //添加数据头,格式是根据注册表的数据推算的,未注释部分为未知
            rtn.AddRange(BitConverter.GetBytes(3)); //可能为版本号
            rtn.AddRange(BitConverter.GetBytes(1)); //可能为次版本号
            rtn.AddRange(BitConverter.GetBytes(thumbprintData.Length)); //证书宅指纹长度
            rtn.AddRange(thumbprintData);           //证书指纹数据
            rtn.AddRange(BitConverter.GetBytes(0x0d));
            rtn.AddRange(BitConverter.GetBytes(1));
            rtn.AddRange(BitConverter.GetBytes((short)2));
            rtn.AddRange(BitConverter.GetBytes(0));
            rtn.AddRange(BitConverter.GetBytes(0x1b));
            rtn.AddRange(BitConverter.GetBytes(1));
            rtn.AddRange(BitConverter.GetBytes(8));
            rtn.AddRange(BitConverter.GetBytes(DateTime.Now.ToFileTime())); //时间戳
            rtn.AddRange(BitConverter.GetBytes(0x20));
            rtn.AddRange(BitConverter.GetBytes(1));
            rtn.AddRange(BitConverter.GetBytes(cert.RawData.Length)); //证书长度
            //添加证书数据
            rtn.AddRange(cert.RawData);

            return rtn.ToArray();
        }

        /// <summary>
        /// 写入注册表项
        /// </summary>
        /// <returns></returns>
        public void WriteRegisty()
        {
            var cer = Certificate;
            const string keyPath = @"Software\Microsoft\Windows\CurrentVersion\Group Policy Objects";
            var rk = RegistryKey.OpenBaseKey(RegistryHive.CurrentUser, RegistryView.Default);
            var srk = rk.OpenSubKey(keyPath);
            if (srk == null)
            {
                throw new ApplicationException("无法打开注册表项:" + keyPath);
            }
            var certKeys = srk.GetSubKeyNames()
                .Where(x => x.EndsWith("Machine"))
                .Select(
                    x =>
                        string.Format(
                            "{0}\\{1}\\Software\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\{2}",
                            keyPath, x, cer.Thumbprint))
                //.Where(x => rk.OpenSubKey(x) == null)
                .ToList();

            foreach (var key in certKeys.Select(rk.CreateSubKey))
            {
                key.SetValue("Blob", CalcRegCertData(), RegistryValueKind.Binary);
            }


        }


        /// <summary>
        /// 写入注册表项
        /// </summary>
        /// <returns></returns>
        public void RemoveRegisty()
        {
            var cer = Certificate;
            const string keyPath = @"Software\Microsoft\Windows\CurrentVersion\Group Policy Objects";
            var rk = RegistryKey.OpenBaseKey(RegistryHive.CurrentUser, RegistryView.Default);
            var srk = rk.OpenSubKey(keyPath);
            if (srk == null)
            {
                throw new ApplicationException("无法打开注册表项:" + keyPath);
            }
            var certKeys = srk.GetSubKeyNames()
                .Where(x => x.EndsWith("Machine"))
                .Select(
                    x =>
                        string.Format(
                            "{0}\\{1}\\Software\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\{2}",
                            keyPath, x, cer.Thumbprint))
                //.Where(x => rk.OpenSubKey(x) == null)
                .ToList();

            foreach (var certKey in certKeys)
            {
                rk.DeleteSubKey(certKey,false);
            }

        }



        /// <summary>
        /// 添加证书组策略
        /// </summary>
        /// <remarks>引用组件来自:https://bitbucket.org/MartinEden/local-policy/overview </remarks>
        public void AddCertPolicy()
        {
            var cert = Certificate;

            var gpo = new ComputerGroupPolicyObject();
            var keyPath = string.Format("Software\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\{0}", cert.Thumbprint);
            using (var machine = gpo.GetRootRegistryKey(GroupPolicySection.Machine))
            {
                using (var cerKey = machine.CreateSubKey(keyPath))
                {
                    cerKey.SetValue("Blob", CalcRegCertData(), RegistryValueKind.Binary);
                }
            }
            gpo.Save();

        }


        public void RemoveCertPolicy()
        {
            var cert = Certificate;

            var gpo = new ComputerGroupPolicyObject();
            var keyPath = string.Format("Software\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\{0}", cert.Thumbprint);
            using (var machine = gpo.GetRootRegistryKey(GroupPolicySection.Machine))
            {
                machine.DeleteSubKey(keyPath,false);
            }
            gpo.Save();

        }

        public void SetForcePolicyStat(bool enable)
        {
            var gpo = new ComputerGroupPolicyObject();
            var keyPath = "Software\\Policies\\Microsoft\\Windows\\Safer\\CodeIdentifiers";
            using (var machine = gpo.GetRootRegistryKey(GroupPolicySection.Machine))
            {
                using (var cerKey = machine.CreateSubKey(keyPath))
                {
                    cerKey.SetValue("AuthenticodeEnabled", enable ? 1 : 0, RegistryValueKind.DWord);
                }
            }
            gpo.Save();
        }

        public void SetForceRegistryPolicyStat(bool enable)
        {
            const string keyPath = @"Software\Microsoft\Windows\CurrentVersion\Group Policy Objects";
            var rk = RegistryKey.OpenBaseKey(RegistryHive.CurrentUser, RegistryView.Default);
            var srk = rk.OpenSubKey(keyPath);
            if (srk == null)
            {
                throw new ApplicationException("无法打开注册表项:" + keyPath);
            }
            var certKeys = srk.GetSubKeyNames()
                .Where(x => x.EndsWith("Machine"))
                .Select(
                    x =>
                    string.Format(
                        "{0}\\{1}\\Software\\Policies\\Microsoft\\Windows\\Safer\\CodeIdentifiers",
                        keyPath, x))
                //.Where(x => rk.OpenSubKey(x) == null)
                .ToList();

            foreach (var key in certKeys.Select(rk.CreateSubKey))
            {
                key.SetValue("AuthenticodeEnabled", enable ? 1 : 0, RegistryValueKind.DWord);
            }
        }
    }


    /// <summary>
    /// 工具类
    /// </summary>
    public static class Helper
    {

        /// <summary>
        /// 解析16进制字符串为byte数组
        /// </summary>
        /// <param name="hexstring"></param>
        /// <returns></returns>
        public static IEnumerable<byte> HexString2Bytes(this string hexstring)
        {
            for (int i = 0; i < hexstring.Length; i += 2)
            {
                var hex = hexstring.Substring(i, 2);
                yield return Convert.ToByte(hex, 16);
            }
        }

        /// <summary>
        ///     转换为16进制字符串
        /// </summary>
        /// <param name="bs"></param>
        /// <param name="isLowcase"></param>
        /// <param name="split"></param>
        /// <returns></returns>
        public static string ToHexString(this IEnumerable<byte> bs, bool isLowcase = false, string split = "")
        {
            var rtn = "";
            foreach (var item in bs)
            {
                var fmtstr = isLowcase ? "x2" : "X2";
                rtn += item.ToString(fmtstr) + split;
            }
            return rtn.TrimEnd(split.ToCharArray());
        }
    }

}