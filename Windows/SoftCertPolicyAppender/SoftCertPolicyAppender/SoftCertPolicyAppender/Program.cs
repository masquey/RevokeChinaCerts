using System;
using System.Linq;
using System.Security.Cryptography.X509Certificates;

namespace SoftCertPolicyAppender
{
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            var flag = 0;
            var cers = args.Where(x => x.EndsWith(".cer") || x.EndsWith(".crt") || x.EndsWith(".pem")).ToArray();

            if (args.Contains("-h") || args.Contains("--help")||args.Length==0)
            {
                const string usage = @"Usage:SoftwareRestrictionPolicyController.exe [OPTOION]... [CERTFILE]...
config software restriction policy by cli

OPTIONs
  --set-force      set force certificate policy
  --unset-force    unset force certificate policy
  -r               remove certificate rule by CERTFILEs not add
CERTFILEs
  certificate file path that will add certificate rule
";
                Console.Write(usage);
                return;
            }

            if (args.Contains("-r"))
            {
                flag = 1;
            }

            if (args.Contains("--set-force"))
            {
                SoftwareRestrictionPolicyController.SetForcePolicyState(true);
                Console.WriteLine("Apply force certificate policy");
            }

            if (args.Contains("--unset-force"))
            {
                SoftwareRestrictionPolicyController.SetForcePolicyState(false);
                Console.WriteLine("Cancel force certificate policy");
            }

            for (var i = 0; i < cers.Length; i++)
            {
                try
                {
                    var cert = new X509Certificate2(cers[i]);

                    Console.ForegroundColor = ConsoleColor.DarkGreen;
                    Console.Write("{0}.", i + 1);
                    Console.ResetColor();

                    switch (flag)
                    {
                        case 0:
                            SoftwareRestrictionPolicyController.AddCertRule(cert);
                            Console.Write("Add cert policy for ");
                            break;
                        case 1:
                            SoftwareRestrictionPolicyController.RemoveCertRule(cert);
                            Console.Write("Remove cert policy for ");
                            break;
                    }

                    Console.ForegroundColor = ConsoleColor.Yellow;
                    Console.WriteLine("{0}({1})", cert.Subject, cert.Thumbprint);
                    Console.ResetColor();
                }
                catch (Exception e)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(e);
                    Console.ResetColor();
                }
            }
            Console.WriteLine("Done");
        }
    }
}
