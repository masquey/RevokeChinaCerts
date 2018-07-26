using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using LocalPolicy;
using Microsoft.Win32;

namespace SoftCertPolicyAppender
{
    public class SoftwareRestrictionPolicyController
    {
        /// <remarks>引用组件来自: https://bitbucket.org/MartinEden/local-policy/overview </remarks>
        private static void DeletePolicyKey(string path)
        {
            var gpo = new ComputerGroupPolicyObject();
            using (var machine = gpo.GetRootRegistryKey(GroupPolicySection.Machine))
            {
                machine.DeleteSubKey(path, false);
            }
            gpo.Save();
        }


        /// <remarks>引用组件来自: https://bitbucket.org/MartinEden/local-policy/overview </remarks>
        private static void SetPolicyKey(string path, string name, object value, RegistryValueKind kind)
        {
            var gpo = new ComputerGroupPolicyObject();
            using (var machine = gpo.GetRootRegistryKey(GroupPolicySection.Machine))
            {
                using (var cerKey = machine.CreateSubKey(path))
                {
                    if (cerKey != null) cerKey.SetValue(name, value, kind);
                }
            }
            gpo.Save();
        }


        private static void SetPolicyRegistryKey(string path, string name, object value, RegistryValueKind kind)
        {
            const string keyPath = @"Software\Microsoft\Windows\CurrentVersion\Group Policy Objects";
            using (var rk = RegistryKey.OpenBaseKey(RegistryHive.CurrentUser, RegistryView.Default))
            {
                List<string> certKeys;
                using (var srk = rk.OpenSubKey(keyPath))
                {
                    if (srk == null)
                    {
                        throw new ApplicationException("Unable to open registry key:" + keyPath);
                    }
                    certKeys = srk.GetSubKeyNames().Where(x => x.EndsWith("Machine")).Select(x => string.Format("{0}\\{1}\\{2}", keyPath, x, path))
                        //.Where(x => rk.OpenSubKey(x) == null)
                        .ToList();
                }

                foreach (var key in certKeys)
                {
                    using (var skey = rk.CreateSubKey(key))
                    {
                        if (skey != null) skey.SetValue(name, value, kind);
                    }
                }
            }

        }


        private static void DeletePolicyRegistryKey(string path)
        {
            const string keyPath = @"Software\Microsoft\Windows\CurrentVersion\Group Policy Objects";
            using (var rk = RegistryKey.OpenBaseKey(RegistryHive.CurrentUser, RegistryView.Default))
            {
                List<string> certKeys;
                using (var srk = rk.OpenSubKey(keyPath))
                {
                    if (srk == null)
                    {
                        throw new ApplicationException("Unable to open registry key:" + keyPath);
                    }
                    certKeys = srk.GetSubKeyNames().Where(x => x.EndsWith("Machine")).Select(x => string.Format("{0}\\{1}\\{2}", keyPath, x, path))
                        //.Where(x => rk.OpenSubKey(x) == null)
                        .ToList();
                }

                foreach (var key in certKeys)
                {
                    rk.DeleteSubKey(key, false);
                }
            }

        }


        /// <summary>
        /// 构造写写入注册表的证书数据
        /// </summary>
        /// <returns></returns>
        private static byte[] CalcRegCertData(X509Certificate2 cert)
        {
            var thumbprintData = cert.Thumbprint.HexString2Bytes().ToArray();

            var rtn = new List<byte>();

            //添加数据头,格式是根据注册表的数据推算的,未注释部分为未知
            rtn.AddRange(BitConverter.GetBytes(3));                         //可能为版本号
            rtn.AddRange(BitConverter.GetBytes(1));                         //可能为次版本号
            rtn.AddRange(BitConverter.GetBytes(thumbprintData.Length));     //证书指纹长度
            rtn.AddRange(thumbprintData);                                   //证书指纹数据
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
            rtn.AddRange(BitConverter.GetBytes(cert.RawData.Length));       //证书长度
            //添加证书数据
            rtn.AddRange(cert.RawData);

            return rtn.ToArray();
        }

     
        /// <summary>
        /// 添加证书规则
        /// </summary>
        /// <param name="cert"></param>
        public static void AddCertRule(X509Certificate2 cert)
        {
            var keyPath = string.Format("Software\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\{0}", cert.Thumbprint);
            const string keyName = "Blob";
            const RegistryValueKind kind = RegistryValueKind.Binary;
            var value = CalcRegCertData(cert);
            SetPolicyKey(keyPath, keyName, value, kind);
            SetPolicyRegistryKey(keyPath, keyName, value, kind);
        }


        /// <summary>
        /// 移除证书规则
        /// </summary>
        /// <param name="cert"></param>
        public static void RemoveCertRule(X509Certificate2 cert)
        {
            var keyPath = string.Format("Software\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\{0}", cert.Thumbprint);
            DeletePolicyKey(keyPath);
            DeletePolicyRegistryKey(keyPath);
        }


        /// <summary>
        /// 设置是否启用强制策略
        /// </summary>
        /// <param name="enable"></param>
        public static void SetForcePolicyState(bool enable)
        {
            const string keyPath = "Software\\Policies\\Microsoft\\Windows\\Safer\\CodeIdentifiers";
            const string keyName = "AuthenticodeEnabled";
            const RegistryValueKind kind = RegistryValueKind.DWord;
            var value = enable ? 1 : 0;
            SetPolicyKey(keyPath, keyName, value, kind);
            SetPolicyRegistryKey(keyPath, keyName, value, kind);
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
        /// 转换为16进制字符串
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
