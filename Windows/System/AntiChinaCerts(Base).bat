:: AntiChinaCerts Base batch
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

@echo.

:: Add certifications to CRL.
::  Base
certmgr /add /c CNNIC_ROOT.cer /s Disallowed
certmgr /add /c China_Internet_Network_Information_Center_EV_Certificates_Root.cer /s Disallowed

:: Print to screen.
@echo.
@echo Done. Please confirm the messages on screen.
@echo.
@pause
