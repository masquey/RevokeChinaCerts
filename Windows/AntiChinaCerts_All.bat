:: AntiChinaCerts All batch
:: Anti China Certifications.
:: 
:: Author: Chengr28
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
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" (goto X86) else goto X64

:X86
:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser AuthRoot
::  Fake Google.Com(2014-07-24)
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser AuthRoot
::  Fake Google.Com(2014-09-18) [YFdyh000]
CertMgr_x86 -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser AuthRoot
::  Fake Yahoo.Com(2014-09-30)
CertMgr_x86 -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser AuthRoot
::  Fake Hotmai.Com(2014-10-02)
CertMgr_x86 -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser AuthRoot
::  Fake Www.Facebook.Com(2014-10-08)
CertMgr_x86 -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser AuthRoot
::  CNNIC ROOT
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine Root
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser AuthRoot
::  China Internet Network Information Center EV Certificates Root
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine Root
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser AuthRoot
::  CNNIC SSL(Entrust)
CertMgr_x86 -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r localMachine CA
CertMgr_x86 -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r CurrentUser CA
:: Delete certifications(Extended)
::  CFCA GT CA(2011-06-13)
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r CurrentUser AuthRoot
::  CFCA GT CA(2012-08-21) [YFdyh000]
CertMgr_x86 -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r localMachine Root
CertMgr_x86 -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r CurrentUser AuthRoot
::  CFCA EV ROOT
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r CurrentUser AuthRoot
::  UCA Global Root
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine Root
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r CurrentUser AuthRoot
::  UCA Root(2004-01-01)
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r CurrentUser AuthRoot
::  UCA Extended Validation Root
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine Root
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r CurrentUser AuthRoot
::  UCA Root(2001-01-01)
CertMgr_x86 -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r CurrentUser AuthRoot
:: Delete certifications(All)
::  ROOTCA
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine Root
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r CurrentUser AuthRoot
::  SRCA
CertMgr_x86 -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r CurrentUser AuthRoot
::  Certification_Authority_Of_WoSign
CertMgr_x86 -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r localMachine Root
CertMgr_x86 -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r CurrentUser AuthRoot
::  Certification_Authority_Of_WoSign(Chinese)
CertMgr_x86 -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r CurrentUser AuthRoot
::  Class_1_Primary_CA
CertMgr_x86 -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r CurrentUser AuthRoot
::  Certification Authority of WoSign(StartCom)
CertMgr_x86 -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s -r localMachine CA
CertMgr_x86 -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s -r CurrentUser CA
::  WoSign Premium Server Authority(USERTrust)
CertMgr_x86 -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s -r localMachine CA
CertMgr_x86 -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s -r CurrentUser CA
::  WoSign Server Authority(USERTrust)
CertMgr_x86 -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s -r localMachine CA
CertMgr_x86 -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s -r CurrentUser CA
::  WoSign SGC Server Authority(USERTrust)
CertMgr_x86 -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s -r localMachine CA
CertMgr_x86 -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s -r CurrentUser CA
::  WoTrust Premium Server Authority(USERTrust)
CertMgr_x86 -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s -r localMachine CA
CertMgr_x86 -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s -r CurrentUser CA
::  WoTrust Server Authority(USERTrust)
CertMgr_x86 -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s -r localMachine CA
CertMgr_x86 -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s -r CurrentUser CA
::  WoTrust SGC Server Authority(USERTrust)
CertMgr_x86 -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s -r localMachine CA
CertMgr_x86 -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s -r CurrentUser CA
::  China_Trust_Network_1 [QuantumGhost]
CertMgr_x86 -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r CurrentUser AuthRoot
::  China_Trust_Network_2 [QuantumGhost]
CertMgr_x86 -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r localMachine Root
CertMgr_x86 -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r CurrentUser AuthRoot
::  China_Trust_Network_3 [QuantumGhost]
CertMgr_x86 -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r localMachine AuthRoot
CertMgr_x86 -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r CurrentUser Root
CertMgr_x86 -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r CurrentUser AuthRoot

@echo.

:: Add certifications to CRL(Base)
CertMgr_x86 -add -c Fake_GitHubCom_201301.crt -s Disallowed
CertMgr_x86 -add -c Fake_GoogleCom_201407.crt -s Disallowed
CertMgr_x86 -add -c Fake_GoogleCom_201409.crt -s Disallowed
CertMgr_x86 -add -c Fake_YahooCom_201409.crt -s Disallowed
CertMgr_x86 -add -c Fake_HotmaiCom_201410.crt -s Disallowed
CertMgr_x86 -add -c Fake_WwwFacebookCom_201410.crt -s Disallowed
CertMgr_x86 -add -c CNNIC_ROOT.crt -s Disallowed
CertMgr_x86 -add -c China_Internet_Network_Information_Center_EV_Certificates_Root.crt -s Disallowed
CertMgr_x86 -add -c CNNIC_SSL_Entrust.crt -s Disallowed
:: Add certifications to CRL(Extended)
CertMgr_x86 -add -c CFCA_GT_CA_201106.crt -s Disallowed
CertMgr_x86 -add -c CFCA_GT_CA_201208.crt -s Disallowed
CertMgr_x86 -add -c CFCA_EV_ROOT.crt -s Disallowed
CertMgr_x86 -add -c UCA_Global_Root.crt -s Disallowed
CertMgr_x86 -add -c UCA_Root_200401.crt -s Disallowed
CertMgr_x86 -add -c UCA_Extended_Validation_Root.crt -s Disallowed
CertMgr_x86 -add -c UCA_Root_200101.crt -s Disallowed
:: Add certifications to CRL(All)
CertMgr_x86 -add -c ROOTCA_OSCCA.crt -s Disallowed
CertMgr_x86 -add -c SRCA.crt -s Disallowed
CertMgr_x86 -add -c Certification_Authority_Of_WoSign.crt -s Disallowed
CertMgr_x86 -add -c Certification_Authority_Of_WoSign_Chinese.crt -s Disallowed
CertMgr_x86 -add -c Class_1_Primary_CA.crt -s Disallowed
CertMgr_x86 -add -c Certification_Authority_Of_WoSign_StartCom.crt -s Disallowed
CertMgr_x86 -add -c WoSign_Premium_Server_Authority_USERTrust.crt -s Disallowed
CertMgr_x86 -add -c WoSign_Server_Authority_USERTrust.crt -s Disallowed
CertMgr_x86 -add -c WoSign_SGC_Server_Authority_USERTrust.crt -s Disallowed
CertMgr_x86 -add -c WoTrust_Premium_Server_Authority_USERTrust.crt -s Disallowed
CertMgr_x86 -add -c WoTrust_Server_Authority_USERTrust.crt -s Disallowed
CertMgr_x86 -add -c WoTrust_SGC_Server_Authority_USERTrust.crt -s Disallowed
CertMgr_x86 -add -c China_Trust_Network_1.crt -s Disallowed
CertMgr_x86 -add -c China_Trust_Network_2.crt -s Disallowed
CertMgr_x86 -add -c China_Trust_Network_3.crt -s Disallowed

goto Exit

:X64
:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser Root
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser AuthRoot
::  Fake Google.Com(2014-07-24)
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser Root
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser AuthRoot
::  Fake Google.Com(2014-09-18) [YFdyh000]
CertMgr -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine Root
CertMgr -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser Root
CertMgr -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser AuthRoot
::  Fake Yahoo.Com(2014-09-30)
CertMgr -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine Root
CertMgr -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser Root
CertMgr -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser AuthRoot
::  Fake Hotmai.Com(2014-10-02)
CertMgr -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine Root
CertMgr -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser Root
CertMgr -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser AuthRoot
::  Fake Www.Facebook.Com(2014-10-08)
CertMgr -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine Root
CertMgr -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser Root
CertMgr -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser AuthRoot
::  CNNIC ROOT
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine Root
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine AuthRoot
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser Root
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser AuthRoot
::  China Internet Network Information Center EV Certificates Root
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine Root
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine AuthRoot
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser Root
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser AuthRoot
::  CNNIC SSL(Entrust)
CertMgr -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r localMachine CA
CertMgr -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r CurrentUser CA
:: Delete certifications(Extended)
::  CFCA GT CA(2011-06-13)
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine Root
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r CurrentUser Root
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r CurrentUser AuthRoot
::  CFCA GT CA(2012-08-21) [YFdyh000]
CertMgr -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r localMachine Root
CertMgr -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r localMachine AuthRoot
CertMgr -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r CurrentUser Root
CertMgr -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r CurrentUser AuthRoot
::  CFCA EV ROOT
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine Root
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r CurrentUser Root
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r CurrentUser AuthRoot
::  UCA Global Root
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine Root
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine AuthRoot
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r CurrentUser Root
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r CurrentUser AuthRoot
::  UCA Root(2004-01-01)
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine Root
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r CurrentUser Root
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r CurrentUser AuthRoot
::  UCA Extended Validation Root
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine Root
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine AuthRoot
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r CurrentUser Root
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r CurrentUser AuthRoot
::  UCA Root(2001-01-01)
CertMgr -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r localMachine Root
CertMgr -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r CurrentUser Root
CertMgr -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r CurrentUser AuthRoot
:: Delete certifications(All)
::  ROOTCA
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine Root
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine AuthRoot
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r CurrentUser Root
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r CurrentUser AuthRoot
::  SRCA
CertMgr -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r localMachine Root
CertMgr -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r CurrentUser Root
CertMgr -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r CurrentUser AuthRoot
::  Certification_Authority_Of_WoSign
CertMgr -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r localMachine Root
CertMgr -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r localMachine AuthRoot
CertMgr -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r CurrentUser Root
CertMgr -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r CurrentUser AuthRoot
::  Certification_Authority_Of_WoSign(Chinese)
CertMgr -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r localMachine Root
CertMgr -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r CurrentUser Root
CertMgr -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r CurrentUser AuthRoot
::  Class_1_Primary_CA
CertMgr -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r localMachine Root
CertMgr -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r CurrentUser Root
CertMgr -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r CurrentUser AuthRoot
::  Certification Authority of WoSign(StartCom)
CertMgr -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s -r localMachine CA
CertMgr -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s -r CurrentUser CA
::  WoSign Premium Server Authority(USERTrust)
CertMgr -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s -r localMachine CA
CertMgr -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s -r CurrentUser CA
::  WoSign Server Authority(USERTrust)
CertMgr -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s -r localMachine CA
CertMgr -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s -r CurrentUser CA
::  WoSign SGC Server Authority(USERTrust)
CertMgr -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s -r localMachine CA
CertMgr -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s -r CurrentUser CA
::  WoTrust Premium Server Authority(USERTrust)
CertMgr -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s -r localMachine CA
CertMgr -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s -r CurrentUser CA
::  WoTrust Server Authority(USERTrust)
CertMgr -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s -r localMachine CA
CertMgr -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s -r CurrentUser CA
::  WoTrust SGC Server Authority(USERTrust)
CertMgr -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s -r localMachine CA
CertMgr -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s -r CurrentUser CA
::  China_Trust_Network_1 [QuantumGhost]
CertMgr -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r localMachine Root
CertMgr -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r CurrentUser Root
CertMgr -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r CurrentUser AuthRoot
::  China_Trust_Network_2 [QuantumGhost]
CertMgr -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r localMachine Root
CertMgr -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r localMachine AuthRoot
CertMgr -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r CurrentUser Root
CertMgr -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r CurrentUser AuthRoot
::  China_Trust_Network_3 [QuantumGhost]
CertMgr -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r localMachine Root
CertMgr -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r localMachine AuthRoot
CertMgr -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r CurrentUser Root
CertMgr -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r CurrentUser AuthRoot

@echo.

:: Add certifications to CRL(Base)
CertMgr -add -c Fake_GitHubCom_201301.crt -s Disallowed
CertMgr -add -c Fake_GoogleCom_201407.crt -s Disallowed
CertMgr -add -c Fake_GoogleCom_201409.crt -s Disallowed
CertMgr -add -c Fake_YahooCom_201409.crt -s Disallowed
CertMgr -add -c Fake_HotmaiCom_201410.crt -s Disallowed
CertMgr -add -c Fake_WwwFacebookCom_201410.crt -s Disallowed
CertMgr -add -c CNNIC_ROOT.crt -s Disallowed
CertMgr -add -c China_Internet_Network_Information_Center_EV_Certificates_Root.crt -s Disallowed
CertMgr -add -c CNNIC_SSL_Entrust.crt -s Disallowed
:: Add certifications to CRL(Extended)
CertMgr -add -c CFCA_GT_CA_201106.crt -s Disallowed
CertMgr -add -c CFCA_GT_CA_201208.crt -s Disallowed
CertMgr -add -c CFCA_EV_ROOT.crt -s Disallowed
CertMgr -add -c UCA_Global_Root.crt -s Disallowed
CertMgr -add -c UCA_Root_200401.crt -s Disallowed
CertMgr -add -c UCA_Extended_Validation_Root.crt -s Disallowed
CertMgr -add -c UCA_Root_200101.crt -s Disallowed
:: Add certifications to CRL(All)
CertMgr -add -c ROOTCA_OSCCA.crt -s Disallowed
CertMgr -add -c SRCA.crt -s Disallowed
CertMgr -add -c Certification_Authority_Of_WoSign.crt -s Disallowed
CertMgr -add -c Certification_Authority_Of_WoSign_Chinese.crt -s Disallowed
CertMgr -add -c Class_1_Primary_CA.crt -s Disallowed
CertMgr -add -c Certification_Authority_Of_WoSign_StartCom.crt -s Disallowed
CertMgr -add -c WoSign_Premium_Server_Authority_USERTrust.crt -s Disallowed
CertMgr -add -c WoSign_Server_Authority_USERTrust.crt -s Disallowed
CertMgr -add -c WoSign_SGC_Server_Authority_USERTrust.crt -s Disallowed
CertMgr -add -c WoTrust_Premium_Server_Authority_USERTrust.crt -s Disallowed
CertMgr -add -c WoTrust_Server_Authority_USERTrust.crt -s Disallowed
CertMgr -add -c WoTrust_SGC_Server_Authority_USERTrust.crt -s Disallowed
CertMgr -add -c China_Trust_Network_1.crt -s Disallowed
CertMgr -add -c China_Trust_Network_2.crt -s Disallowed
CertMgr -add -c China_Trust_Network_3.crt -s Disallowed

:Exit
:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
