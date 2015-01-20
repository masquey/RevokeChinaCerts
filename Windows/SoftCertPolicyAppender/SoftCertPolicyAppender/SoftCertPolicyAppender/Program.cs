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
            var cers = args.Where(x => x.EndsWith(".cer") || x.EndsWith(".crt") || x.EndsWith(".pem"));
            if (args.Contains("-r"))
            {
                flag = 1;
            }
            foreach (var s in cers)
            {
                try
                {
                    var appdender = new CertPolicyAppender();
                    appdender.Load(s);
                    switch (flag)
                    {
                        case 0:
                            appdender.WriteRegisty();
                            appdender.AddCertPolicy();
                            Console.WriteLine("Add cert policy for {0}",appdender.Certificate.Thumbprint);
                            break;
                        case 1:
                            appdender.RemoveRegisty();
                            appdender.RemoveCertPolicy();
                            Console.WriteLine("Remove cert policy for {0}", appdender.Certificate.Thumbprint);
                            break;                            
                    }
                    
                }
                catch (Exception e)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(e);
                    Console.ResetColor();
                }
            }
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("All Success!");
            Console.ResetColor();
        }
    }
}
