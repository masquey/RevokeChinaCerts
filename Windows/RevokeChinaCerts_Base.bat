:: RevokeChinaCerts Base batch
:: Revoke China Certificates.
:: 
:: Author: JayXon, Chengr28
:: 

@echo off

:: Update certificates list of system.
cd /d %~dp0
"%~dp0\Tools\RootSUPD_201403_x86"

:: Architecture check
set CertMgr="%~dp0\Tools\CertMgr"
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" set CertMgr="%~dp0\Tools\CertMgr_x86"

:: Delete certificates(Base part)
::  Fake github.com(2013-01-25)
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser Root
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser AuthRoot
::  Fake google.com(2014-07-24)
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser AuthRoot
::  Fake google.com(2014-09-18) [YFdyh000]
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine Root
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser AuthRoot
::  Fake yahoo.com(2014-09-30)
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine Root
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser AuthRoot
::  Fake hotmai.com(2014-10-02)
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine Root
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser AuthRoot
::  Fake www.facebook.com(2014-10-08) [Yiwen Zhang]
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine Root
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser AuthRoot
::  Fake www.icound.com(2014-10-04) [YFdyh000]
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r localMachine Root
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r CurrentUser AuthRoot
::  Fake *.hotmail.com(2015-01-17) [YFdyh000]
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r localMachine Root
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r CurrentUser AuthRoot
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
::  Baidu WACC service [SCFWSE]
%CertMgr% -del -c -sha1 561422647B89BE22F203EBCAEF52B5007227510A -s -r localMachine CA
%CertMgr% -del -c -sha1 561422647B89BE22F203EBCAEF52B5007227510A -s -r CurrentUser CA
::  GiantRootCA
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r localMachine Root
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r CurrentUser Root
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r CurrentUser AuthRoot
::  JGZXCA
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r localMachine Root
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r CurrentUser AuthRoot
::  Superfish, Inc. [Septembers/v998]
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r localMachine Root
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r CurrentUser Root
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r CurrentUser AuthRoot

@echo.

:: Add certificates to CRL(Base part)
%CertMgr% -add -c "%~dp0\Certs\[Fake]GitHubCom_201301.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]GoogleCom_201407.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]GoogleCom_201409.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]YahooCom_201409.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]HotmaiCom_201410.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]WwwFacebookCom_201410.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]WwwIcloudCom_201410.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]AnyHotmailCom_201501.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CNNIC_ROOT.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\China_Internet_Network_Information_Center_EV_Certificates_Root.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CNNIC_SSL_Entrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Suspicious]WaccBaiduCom.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\GiantRootCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\JGZXCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Superfish_Inc.crt" -s Disallowed

:: Print to screen.
@echo.
@echo RevokeChinaCerts Base version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
