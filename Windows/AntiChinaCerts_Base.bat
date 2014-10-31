:: AntiChinaCerts Base batch
:: Anti China Certifications.
:: 
:: Author: JayXon, Chengr28
:: 

@echo off

:: Permission check
:: Administrator permissions are not necessary(2014-09-21)
::if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (set SystemPath = %SystemRoot%\SysWOW64) else (set SystemPath = %SystemRoot%\system32)
::rd "%SystemPath%\Test_Permissions" > nul 2 > nul
::md "%SystemPath%\Test_Permissions" 2 > nul || (echo Require Administrator Permission. && pause > nul && Exit)
::rd "%SystemPath%\Test_Permissions" > nul 2 > nul
::del /f /q %SystemPath%\TestPermission.log
::echo "Permission check." >> %SystemPath%\TestPermission.log
::if not exist %SystemPath%\TestPermission.log (echo Require Administrator Permission. && pause > nul && Exit)
::del /f /q %SystemPath%\TestPermission.log

cd /d %~dp0
:: Update certifications list of system.
RootSUPD_201403_x86

::cls
cd /d %~dp0\Certs

:: Architecture check
set CertMgr=CertMgr
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" set CertMgr=%CertMgr%_x86

:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser Root
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser AuthRoot
::  Fake Google.Com(2014-07-24)
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser AuthRoot
::  Fake Google.Com(2014-09-18) [YFdyh000]
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine Root
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser AuthRoot
::  Fake Yahoo.Com(2014-09-30)
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine Root
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser AuthRoot
::  Fake Hotmai.Com(2014-10-02)
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine Root
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser AuthRoot
::  Fake Www.Facebook.Com(2014-10-08) [Yiwen Zhang]
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine Root
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser AuthRoot
::  Fake Www.Icound.Com(2014-10-04) [YFdyh000]
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r localMachine Root
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r CurrentUser AuthRoot
::  CNNIC ROOT
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine Root
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser Root
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser AuthRoot
::  China Internet Network Information Center EV Certificates Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser AuthRoot
::  CNNIC SSL(Entrust)
%CertMgr% -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r localMachine CA
%CertMgr% -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r CurrentUser CA

@echo.

:: Add certifications to CRL(Base)
%CertMgr% -add -c Fake_GitHubCom_201301.crt -s Disallowed
%CertMgr% -add -c Fake_GoogleCom_201407.crt -s Disallowed
%CertMgr% -add -c Fake_GoogleCom_201409.crt -s Disallowed
%CertMgr% -add -c Fake_YahooCom_201409.crt -s Disallowed
%CertMgr% -add -c Fake_HotmaiCom_201410.crt -s Disallowed
%CertMgr% -add -c Fake_WwwFacebookCom_201410.crt -s Disallowed
%CertMgr% -add -c Fake_WwwIcloudCom_201410.crt -s Disallowed
%CertMgr% -add -c CNNIC_ROOT.crt -s Disallowed
%CertMgr% -add -c China_Internet_Network_Information_Center_EV_Certificates_Root.crt -s Disallowed
%CertMgr% -add -c CNNIC_SSL_Entrust.crt -s Disallowed

:Exit
:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
