:: AntiChinaCerts Restore batch
:: Anti China Certifications.
:: 
:: Author: Chengr28
:: 

@echo off

cd /d %~dp0
:: Update certifications
RootSUPD_201403_x86

::cls
cd /d %~dp0\Certs

:: Architecture check
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" (goto X86) else goto X64

:X86
:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s Disallowed
::  Fake Google.Com(2014-07-24)
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s Disallowed
::  Fake Google.Com(2014-09-18)
CertMgr_x86 -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s Disallowed
::  Fake Yahoo.Com(2014-09-30)
CertMgr_x86 -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s Disallowed
::  Fake Hotmai.Com(2014-10-02)
CertMgr_x86 -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s Disallowed
::  CNNIC ROOT
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s Disallowed
::  China Internet Network Information Center EV Certificates Root
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s Disallowed
:: Delete certifications(Extended)
::  CFCA GT CA
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s Disallowed
::  CFCA EV ROOT
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s Disallowed
::  UCA Global Root
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s Disallowed
::  UCA Root
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s Disallowed
::  UCA EV Root
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s Disallowed
:: Delete certifications(All)
::  ROOTCA
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s Disallowed
::  SRCA
CertMgr_x86 -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s Disallowed
::  Certification_Authority_Of_WoSign
CertMgr_x86 -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s Disallowed
::  Certification_Authority_Of_WoSign(Chinese)
CertMgr_x86 -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s Disallowed
::  Class_1_Primary_CA
CertMgr_x86 -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s Disallowed
::  China_Trust_Network_1
CertMgr_x86 -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s Disallowed
::  China_Trust_Network_2
CertMgr_x86 -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s Disallowed
::  China_Trust_Network_3
CertMgr_x86 -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s Disallowed

goto Exit

:X64
:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s Disallowed
::  Fake Google.Com(2014-07-24)
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s Disallowed
::  Fake Google.Com(2014-09-18)
CertMgr -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s Disallowed
::  Fake Yahoo.Com(2014-09-30)
CertMgr -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s Disallowed
::  Fake Hotmai.Com(2014-10-02)
CertMgr -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s Disallowed
::  CNNIC ROOT
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s Disallowed
::  China Internet Network Information Center EV Certificates Root
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s Disallowed
:: Delete certifications(Extended)
::  CFCA GT CA
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s Disallowed
::  CFCA EV ROOT
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s Disallowed
::  UCA Global Root
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s Disallowed
::  UCA Root
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s Disallowed
::  UCA EV Root
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s Disallowed
:: Delete certifications(All)
::  ROOTCA
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s Disallowed
::  SRCA
CertMgr -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s Disallowed
::  Certification_Authority_Of_WoSign
CertMgr -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s Disallowed
::  Certification_Authority_Of_WoSign(Chinese)
CertMgr -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s Disallowed
::  Class_1_Primary_CA
CertMgr -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s Disallowed
::  China_Trust_Network_1
CertMgr -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s Disallowed
::  China_Trust_Network_2
CertMgr -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s Disallowed
::  China_Trust_Network_3
CertMgr -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s Disallowed

:Exit
:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
