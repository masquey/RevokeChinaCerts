using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading;

namespace SoftCertPolicyAppender
{
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
        //Print description.
            if (args.Length == 0 || args.Contains("-h") || args.Contains("--help"))
            {
                const string usage = @"Usage: SoftwareRestrictionPolicyController.exe [Parameter]... [CertFile]...
Config software restriction policy by cli.

Options:
    --help            Print help message.
    --set-force       Set force certificate policy.
    --unset-force     Unset force certificate policy.
    --remove          Remove certificate rule by CERTFILEs not add.
    --interval Time   Interval time if get exception. Time is in milliseconds.
    --quiet           Quiet mode, no any asking.

CertFiles:
    Certificate file path that will add certificate rule.
";
                Console.Write(usage);
                return;
            }

        //Remove certificate flag.
            bool isRemove = false;
            if (args.Contains("-r") || args.Contains("--remove"))
                isRemove = true;
        
        //Set quiet mode.
            bool isQuiet = false;
            if (args.Contains("-q") || args.Contains("--quiet"))
                isQuiet = true;

        //Read interval time.
            var interval = 0;
            if (args.Contains("-i") || args.Contains("--interval"))
            {
                for (var i = 0; i < args.Length; i++)
                {
                    if (i + 1 < args.Length && (args[i].Contains("-i") || args[i].Contains("-interval")))
                    {
                        Int32.TryParse(args[i + 1], out interval);
                        break;
                    }
                }
            }

        //Set certificate policy.
            if (args.Contains("--set-force") && args.Contains("--unset-force"))
            {
                Console.WriteLine("Arguments error.");
                return;
            }
            else if (args.Contains("--set-force"))
            {
                try
                {
                    SoftwareRestrictionPolicyController.SetForcePolicyState(true);
                    Console.WriteLine("Apply force certificate policy.");
                }
                catch (Exception e)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(e);
                    Console.ResetColor();

                //Interval time
                    if (interval > 0)
                        Thread.Sleep(interval);

                    return;
                }
            }
        //Set certificate policy.
            else if (args.Contains("--unset-force"))
            {
                try
                {
                    SoftwareRestrictionPolicyController.SetForcePolicyState(false);
                    Console.WriteLine("Cancel force certificate policy.");
                }
                catch (Exception e)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(e);
                    Console.ResetColor();

                //Interval time
                    if (interval > 0)
                        Thread.Sleep(interval);

                    return;
                }
            }

        //Read certificate list.
            var cers = args.Where(x => x.EndsWith(".cer") || x.EndsWith(".crt") || x.EndsWith(".pem")).ToArray();
            bool retry = false, innerRetry = false;
            for (var i = 0; i < cers.Length; i++)
            {
                do
                {
                    retry = false;
                    try
                    {
                    //Initialization
                        var cert = new X509Certificate2(cers[i]);

                    //Print index.
                        Console.ForegroundColor = ConsoleColor.DarkGreen;
                        Console.Write("{0}.", i + 1);
                        Console.ResetColor();

                    //Add or remove certificate.
                        do
                        {
                            innerRetry = false;
                            try
                            {
                            //Remove flag check
                                if (isRemove)
                                {
                                    SoftwareRestrictionPolicyController.AddCertRule(cert);
                                    Console.Write("Add certificate policy for ");
                                }
                                else {
                                    SoftwareRestrictionPolicyController.RemoveCertRule(cert);
                                    Console.Write("Remove certificate policy for ");
                                }

                            //Print operation type.
                                Console.ForegroundColor = ConsoleColor.Yellow;
                                Console.WriteLine("{0}({1})", cert.Subject, cert.Thumbprint);
                                Console.ResetColor();
                            }
                            catch (FileLoadException ex)
                            {
                            //Print exception.
                                Console.ForegroundColor = ConsoleColor.Red;
                                Console.WriteLine(ex);
                                Console.ResetColor();

                            //Selection
                                if (!isQuiet)
                                {
                                    Console.Write(ex.Message + "Please select: Retry, Ignore or Abort (R|I|A)");
                                    var innerSelect = (Console.ReadLine() ?? "").ToLower();
                                    switch (innerSelect)
                                    {
                                        case "i":
                                        {
                                            break;
                                        }
                                        case "a":
                                        {
                                            return;
                                        }
                                        default:
                                        {
                                        //Interval time
                                            if (interval > 0)
                                                Thread.Sleep(interval);

                                        //Set retry flag.
                                            innerRetry = true;
                                            break;
                                        }
                                    }
                                }
                            }
                        } while (innerRetry);
                    }
                    catch (Exception e)
                    {
                    //Print exception.
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.WriteLine(e);
                        Console.ResetColor();

                    //Selection
                        if (!isQuiet)
                        {
                            Console.Write(e.Message + "Please select: Retry, Ignore or Abort (R|I|A)");
                            var select = (Console.ReadLine() ?? "").ToLower();
                            switch (select)
                            {
                                case "i":
                                {
                                    break;
                                }
                                case "a":
                                {
                                    return;
                                }
                                default:
                                {
                                //Interval time
                                    if (interval > 0)
                                        Thread.Sleep(interval);

                                //Set retry flag.
                                    retry = true;
                                    break;
                                }
                            }
                        }
                    }
                } while (retry);
            }

        //Finished.
            Console.WriteLine("Done");
            return;
        }
    }
}
