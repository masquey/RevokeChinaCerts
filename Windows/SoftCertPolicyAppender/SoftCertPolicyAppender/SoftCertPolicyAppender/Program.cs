using System;
using System.Linq;

namespace SoftCertPolicyAppender
{
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            var flag = 0;
            var cers = args.Where(x => x.EndsWith(".cer") || x.EndsWith(".crt") || x.EndsWith(".pem")).ToArray();
            if (args.Contains("-r"))
            {
                flag = 1;
            }

            if (args.Contains("--set-force"))
            {
                var appender = new CertPolicyAppender ();
                appender.SetForceRegistryPolicyStat (true);
                appender.SetForcePolicyStat (true);
                Console.WriteLine("Apply force certificate policy");
            }

            if (args.Contains("--unset-force"))
            {
                var appender = new CertPolicyAppender ();
                appender.SetForceRegistryPolicyStat (false);
                appender.SetForcePolicyStat (false);
                Console.WriteLine("Cancel force certificate policy");
            }

            for (var i=0 ;i<cers.Length;i++)
            {
                try
                {
                    var appdender = new CertPolicyAppender();
                    appdender.Load(cers[i]);
                    Console.ForegroundColor = ConsoleColor.DarkGreen;
                    Console.Write("{0}.",i+1);
                    Console.ResetColor();
                    switch (flag)
                    {
                        case 0:
                            appdender.WriteRegisty();
                            appdender.AddCertPolicy();
                        Console.Write("Add cert policy for ");

                            break;
                        case 1:
                            appdender.RemoveRegisty();
                            appdender.RemoveCertPolicy();
                        Console.Write("Remove cert policy for ");
                            break;                            
                    }
                    Console.ForegroundColor = ConsoleColor.Yellow;
                    Console.WriteLine("{0}({1})",appdender.Certificate.Subject,appdender.Certificate.Thumbprint);
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
