:: RevokeChinaCerts Update batch
:: Revoke Chinese certificates.
:: 
:: Contributions: Chengr28
:: 


@CHCP 65001
@ECHO off
CLS


:: Check administrative permission.
net session >nul 2>nul
IF ERRORLEVEL 1 (
	COLOR 4F
	ECHO Please run as Administrator.
	ECHO.
	PAUSE & BREAK
	ECHO.
	CLS
)


:: Locate folder and architecture check.
CD /D "%~dp0"
SET CertMgr="%~dp0Tools\CertMgr.exe"
IF %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (
	SET CertMgr="%~dp0Tools\CertMgr_x86.exe"
)


:: Command
SET Command=%~1
IF NOT "%Command%" == "" (
	GOTO CASE_%Command%
)


:: Choice
ECHO RevokeChinaCerts Update batch
ECHO.
ECHO 1: Update CRL/Certificate Revocation List
ECHO 2: Update CTL/Certificate Trust List(Windows Update)
ECHO 3: Update CTL/Certificate Trust List(RootSUPD, Windows XP/2003 and older)
ECHO 4: ReSET all CRL/Certificate Revocation List
ECHO.
ECHO To reSET all CTL/Certificate Trust List, DO NOT select any options.
ECHO Exit batch and use Microsoft Fixit tools in Tools\Fixit folder:
ECHO * MicrosoftFixit_20135.diagcab - Windows Vista and later
ECHO * MicrosoftFixit_51014.msi - Windows XP/2003 and before
ECHO.
SET /P UserChoice="Choose: "
SET UserChoice=CASE_%UserChoice%
CLS
GOTO %UserChoice%


:: Update CRL.
:CASE_1
MKDIR "%~dp0Certificates\Other\SyncWithWU"
certutil -syncWithWU "%~dp0Certificates\Other\SyncWithWU"
REN "%~dp0Certificates\Other\SyncWithWU\disallowedcert.sst" Disallowed.sst
%CertMgr% -add -all -c "%~dp0Certificates\Other\SyncWithWU\Disallowed.sst" -s -r localMachine Disallowed
RMDIR /S /Q "%~dp0Certificates\Other\SyncWithWU"
GOTO END


:: Update CTL(SST).
:CASE_2
MKDIR "%~dp0Certificates\Other\SyncWithWU"
MKDIR "%~dp0Certificates\Other\GenerateSSTFromWU"
certutil -syncWithWU "%~dp0Certificates\Other\SyncWithWU"
certutil -generateSSTFromWU "%~dp0Certificates\Other\GenerateSSTFromWU\AuthRoot.sst"
REN "%~dp0Certificates\Other\SyncWithWU\pinrules.sst" PinRules.sst
%CertMgr% -add -all -c "%~dp0Certificates\Other\GenerateSSTFromWU\AuthRoot.sst" -s -r localMachine AuthRoot
%CertMgr% -add -all -c "%~dp0Certificates\Other\GenerateSSTFromWU\PinRules.sst" -s -r localMachine AuthRoot
RMDIR /S /Q "%~dp0Certificates\Other\SyncWithWU"
RMDIR /S /Q "%~dp0Certificates\Other\GenerateSSTFromWU"
GOTO END


:: Update CTL(RootSUPD).
:CASE_3
"%~dp0Tools\Fixit\RootSUPD.exe"
GOTO END


:: ReSET CRL.
:CASE_4
%CertMgr% -del -all -s -r localMachine Disallowed
%CertMgr% -del -all -s -r currentUser Disallowed
GOTO END


:: End
:END
COLOR
CD /D "%~dp0"
ECHO.
ECHO RevokeChinaCerts Update batch
ECHO Done, please confirm the messages on screen.
ECHO.
PAUSE
CLS
