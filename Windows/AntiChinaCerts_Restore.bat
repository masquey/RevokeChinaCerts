:: RevokeChinaCerts Restore batch
:: Revoke China Certificates.
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
:: Update certificates list of system.
RootSUPD_201403_x86

::cls
cd /d %~dp0\Certs

:: Architecture check
set CertMgr=CertMgr
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" set CertMgr=%CertMgr%_x86

:: Restore certificates(Base part)
::  Fake GitHub.Com(2013-01-25)
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s Disallowed
::  Fake Google.Com(2014-07-24)
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s Disallowed
::  Fake Google.Com(2014-09-18) [YFdyh000]
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s Disallowed
::  Fake Yahoo.Com(2014-09-30)
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s Disallowed
::  Fake Hotmai.Com(2014-10-02)
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s Disallowed
::  Fake Www.Facebook.Com(2014-10-08) [Yiwen Zhang]
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s Disallowed
::  Fake Www.Icound.Com(2014-10-04) [YFdyh000]
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s Disallowed
::  CNNIC ROOT
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s Disallowed
::  China Internet Network Information Center EV Certificates Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s Disallowed
::  CNNIC SSL(Entrust)
%CertMgr% -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s Disallowed
::  Baidu WACC service [SCFWSE]
%CertMgr% -del -c -sha1 561422647B89BE22F203EBCAEF52B5007227510A -s Disallowed

:: Restore certificates(Extended part)
::  CFCA GT CA(2011-06-13)
%CertMgr% -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s Disallowed
::  CFCA GT CA(2012-08-21) [YFdyh000]
%CertMgr% -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s Disallowed
::  CFCA EV ROOT
%CertMgr% -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s Disallowed
::  UCA Global Root
%CertMgr% -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s Disallowed
::  UCA Root(2004-01-01)
%CertMgr% -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s Disallowed
::  UCA Extended Validation Root
%CertMgr% -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s Disallowed
::  UCA ROOT(2001-01-01)
%CertMgr% -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s Disallowed
::  GoAgent CA [lenovo-me]
%CertMgr% -del -c -sha1 AB702CDF18EBE8B438C52869CD4A5DEF48B40E33 -s Disallowed
::  SZCA [yfdyh000]
%CertMgr% -del -c -sha1 B0049D436F27237EE59C746A1EF3C96A8E1B54AC -s Disallowed
::  SZCA(2003-07-22) [yfdyh000]
%CertMgr% -del -c -sha1 90D7A97592F0A3E2165DE5DA23B57701D74A298D -s Disallowed

:: Restore certificates(All part)
::  ROOTCA
%CertMgr% -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s Disallowed
::  SRCA
%CertMgr% -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s Disallowed
::  Certificate_Authority_Of_WoSign
%CertMgr% -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s Disallowed
::  Certificate_Authority_Of_WoSign(Chinese)
%CertMgr% -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s Disallowed
::  Class_1_Primary_CA
%CertMgr% -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s Disallowed
::  Certificate Authority of WoSign(StartCom)
%CertMgr% -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s Disallowed
::  Certificate Authority of WoSign(USERTrust)
%CertMgr% -del -c -sha1 56FAADDC596DCF78D585D83A35BC04B690D12736 -s Disallowed
::  WoSign Premium Server Authority(USERTrust)
%CertMgr% -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s Disallowed
::  WoSign Server Authority(USERTrust)
%CertMgr% -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s Disallowed
::  WoSign SGC Server Authority(USERTrust)
%CertMgr% -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s Disallowed
::  WoTrust Premium Server Authority(USERTrust)
%CertMgr% -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s Disallowed
::  WoTrust Server Authority(USERTrust)
%CertMgr% -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s Disallowed
::  WoTrust SGC Server Authority(USERTrust)
%CertMgr% -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s Disallowed
::  China_Trust_Network_1 [QuantumGhost]
%CertMgr% -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s Disallowed
::  China_Trust_Network_2 [QuantumGhost]
%CertMgr% -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s Disallowed
::  China_Trust_Network_3 [QuantumGhost]
%CertMgr% -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s Disallowed

:Exit
:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
