:: AntiChinaCerts Extended batch
:: Anti China Certifications.
:: 
:: Author: Chengr28
:: 

@echo off

:: Permission check
if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (set SystemPath = %SystemRoot%\SysWOW64) else (set SystemPath = %SystemRoot%\system32)
rd "%SystemPath%\test_permissions" > nul 2 > nul
md "%SystemPath%\test_permissions" 2 > nul || (echo Require Administrator Permission. && pause > nul && Exit)
rd "%SystemPath%\test_permissions" > nul 2 > nul
cls

:: Delete certifications(Base)
cd /d %~dp0/Certs
::  CNNIC ROOT
certmgr /del /c /sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F /s Root
::  China Internet Network Information Center EV Certificates Root
certmgr /del /c /sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E /s Root
:: Delete certs(Extended)
::  ROOTCA
certmgr /del /c /sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB /s Root
::  CFCA GT CA
certmgr /del /c /sha1 EABDA240440ABBD694930A01D09764C6C2D77966 /s Root
::  CFCA EV ROOT
certmgr /del /c /sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 /s Root
::  UCA Global Root
certmgr /del /c /sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF /s Root
::  UCA Root
certmgr /del /c /sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 /s Root
::  UCA EV Root
certmgr /del /c /sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E /s Root

@echo.

:: Add certifications to CRL.
::  Base
certmgr /add /c CNNIC_ROOT.cer /s Disallowed
certmgr /add /c China_Internet_Network_Information_Center_EV_Certificates_Root.cer /s Disallowed
::  Extended
certmgr /add /c ROOTCA.cer /s Disallowed
certmgr /add /c CFCA_GT_CA.cer /s Disallowed
certmgr /add /c CFCA_EV_ROOT.cer /s Disallowed
certmgr /add /c UCA_Global_Root.cer /s Disallowed
certmgr /add /c UCA_Root.cer /s Disallowed
certmgr /add /c UCA_EV_Root.cer /s Disallowed

:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
