:: RevokeChinaCerts Update batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 


@echo off


:: Check administrative permission.
net session >NUL 2>NUL
if ERRORLEVEL 1 (
	color 4F
	echo Please run as Administrator.
	echo.
	pause & break
	echo.
	cls
)


:: Locate folder and architecture check.
cd /D "%~dp0"
set CertMgr="%~dp0Tools\CertMgr.exe"
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (
	set CertMgr="%~dp0Tools\CertMgr_x86.exe"
)


:: Command
set Command=%~1
if not "%Command%" == "" (
	goto CASE_%Command%
)


:: Choice
echo RevokeChinaCerts Update batch
echo.
echo 1: Update CRL/Certificate Revocation List
echo 2: Update CTL/Certificate Trust List(Windows Update)
echo 3: Update CTL/Certificate Trust List(RootSUPD, Windows XP/2003 and older)
echo 4: Reset all CRL/Certificate Revocation List
echo.
echo To reset all CTL/Certificate Trust List, do NOT select any options.
echo Exit batch and use Microsoft Fixit tools in Tools\Fixit folder:
echo * MicrosoftFixit_20135.diagcab - Windows Vista and later
echo * MicrosoftFixit_51014.msi - Windows XP/2003 and before
echo.
set /P UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:: Update CRL.
:CASE_1
mkdir "%~dp0Certificates\Other\SyncWithWU"
certutil -syncWithWU "%~dp0Certificates\Other\SyncWithWU"
ren "%~dp0Certificates\Other\SyncWithWU\disallowedcert.sst" Disallowed.sst
%CertMgr% -add -all -c "%~dp0Certificates\Other\SyncWithWU\Disallowed.sst" -s -r localMachine Disallowed
rmdir /S /Q "%~dp0Certificates\Other\SyncWithWU"
goto EXIT


:: Update CTL(SST).
:CASE_2
mkdir "%~dp0Certificates\Other\SyncWithWU"
mkdir "%~dp0Certificates\Other\GenerateSSTFromWU"
certutil -syncWithWU "%~dp0Certificates\Other\SyncWithWU"
certutil -generateSSTFromWU "%~dp0Certificates\Other\GenerateSSTFromWU\AuthRoot.sst"
ren "%~dp0Certificates\Other\SyncWithWU\pinrules.sst" PinRules.sst
%CertMgr% -add -all -c "%~dp0Certificates\Other\GenerateSSTFromWU\AuthRoot.sst" -s -r localMachine AuthRoot
%CertMgr% -add -all -c "%~dp0Certificates\Other\GenerateSSTFromWU\PinRules.sst" -s -r localMachine AuthRoot
rmdir /S /Q "%~dp0Certificates\Other\SyncWithWU"
rmdir /S /Q "%~dp0Certificates\Other\GenerateSSTFromWU"
goto EXIT


:: Update CTL(RootSUPD).
:CASE_3
"%~dp0Tools\Fixit\RootSUPD.exe"
goto EXIT


:: Reset CRL.
:CASE_4
%CertMgr% -del -all -s -r localMachine Disallowed
%CertMgr% -del -all -s -r currentUser Disallowed
goto EXIT


:: Exit
:EXIT
color
cd /D "%~dp0"
echo.
echo RevokeChinaCerts Update batch
echo Done, please confirm the messages on screen.
echo.
pause
cls
