:: AntiChinaCerts Extended batch
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
:: Update certifications
RootSUPD_201403_x86

cls
cd /d %~dp0\Certs

:: Architecture check
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" (goto X86) else goto X64

:X86
:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
CertMgr_x86 -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
::  Fake Google.Com(2014-07-24)
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
CertMgr_x86 -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
::  CNNIC ROOT
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine Root
CertMgr_x86 -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine AuthRoot
::  China Internet Network Information Center EV Certificates Root
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine Root
CertMgr_x86 -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine AuthRoot
:: Delete certifications(Extended)
::  ROOTCA
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine Root
CertMgr_x86 -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine AuthRoot
::  CFCA GT CA
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine AuthRoot
::  CFCA EV ROOT
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine AuthRoot
::  UCA Global Root
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine Root
CertMgr_x86 -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine AuthRoot
::  UCA Root
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine Root
CertMgr_x86 -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine AuthRoot
::  UCA EV Root
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine Root
CertMgr_x86 -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine AuthRoot

@echo.

:: Add certifications to CRL(Base)
CertMgr_x86 -add -c FakeGitHubCom_201301.crt -s Disallowed
CertMgr_x86 -add -c FakeGoogleCom_201407.crt -s Disallowed
CertMgr_x86 -add -c CNNIC_ROOT.crt -s Disallowed
CertMgr_x86 -add -c China_Internet_Network_Information_Center_EV_Certificates_Root.crt -s Disallowed
:: Add certifications to CRL(Extended)
CertMgr_x86 -add -c ROOTCA.crt -s Disallowed
CertMgr_x86 -add -c CFCA_GT_CA.crt -s Disallowed
CertMgr_x86 -add -c CFCA_EV_ROOT.crt -s Disallowed
CertMgr_x86 -add -c UCA_Global_Root.crt -s Disallowed
CertMgr_x86 -add -c UCA_Root.crt -s Disallowed
CertMgr_x86 -add -c UCA_EV_Root.crt -s Disallowed
goto Exit

:X64
:: Delete certifications(Base)
::  Fake GitHub.Com(2013-01-25)
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
CertMgr -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
::  Fake Google.Com(2014-07-24)
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
CertMgr -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
::  CNNIC ROOT
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine Root
CertMgr -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine AuthRoot
::  China Internet Network Information Center EV Certificates Root
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine Root
CertMgr -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine AuthRoot
:: Delete certifications(Extended)
::  ROOTCA
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine Root
CertMgr -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine AuthRoot
::  CFCA GT CA
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine Root
CertMgr -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine AuthRoot
::  CFCA EV ROOT
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine Root
CertMgr -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine AuthRoot
::  UCA Global Root
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine Root
CertMgr -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine AuthRoot
::  UCA Root
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine Root
CertMgr -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine AuthRoot
::  UCA EV Root
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine Root
CertMgr -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine AuthRoot

@echo.

:: Add certifications to CRL(Base)
CertMgr -add -c FakeGitHubCom_2013_01.crt -s Disallowed
CertMgr -add -c FakeGoogleCom_2014_07.crt -s Disallowed
CertMgr -add -c CNNIC_ROOT.crt -s Disallowed
CertMgr -add -c China_Internet_Network_Information_Center_EV_Certificates_Root.crt -s Disallowed
:: Add certifications to CRL(Extended)
CertMgr -add -c ROOTCA.crt -s Disallowed
CertMgr -add -c CFCA_GT_CA.crt -s Disallowed
CertMgr -add -c CFCA_EV_ROOT.crt -s Disallowed
CertMgr -add -c UCA_Global_Root.crt -s Disallowed
CertMgr -add -c UCA_Root.crt -s Disallowed
CertMgr -add -c UCA_EV_Root.crt -s Disallowed

:Exit
:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
