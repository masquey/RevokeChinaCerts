:: RevokeChinaCerts Update batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off


:: Locate directory and architecture check
cd /D "%~dp0"
set CertMgr="%~dp0Tools\CertMgr.exe"
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (set CertMgr="%~dp0Tools\CertMgr_x86.exe")


:: Choice
echo RevokeChinaCerts Update batch
echo.
echo 1: Update CRL/Certificate Revocation List
echo 2: Update CTL/Certificate Trust List(SST)
echo 3: Update CTL/Certificate Trust List(RootSUPD)
echo 4: Reset all CRL/Certificate Revocation List
echo.
echo To reset all CTL/Certificate Trust List, do not choose any options.
echo Exit batch and use Microsoft Fixit tools in Tools\Fixit folder:
echo * Microsoft_Fixit_20135.diagcab - Windows Vista and later
echo * Microsoft_Fixit_51014.msi - Windows XP/2003 and older
echo.
set /P UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:: Update CRL
:CASE_1
%CertMgr% -add -all -c "%~dp0Certificates\Other\Disallowed.sst" -s -r localMachine Disallowed
goto EXIT


:: Update CTL(SST)
:CASE_2
%CertMgr% -add -all -c "%~dp0Certificates\Other\AuthRoot.sst" -s -r localMachine AuthRoot
goto EXIT


:: Update CTL(RootSUPD)
:CASE_3
"%~dp0Tools\Fixit\RootSUPD.exe"


:: Reset CRL
:CASE_4
%CertMgr% -del -all -s -r currentUser Disallowed
%CertMgr% -del -all -s -r localMachine Disallowed


:: Exit
:EXIT
echo.
echo RevokeChinaCerts Update batch
echo Done, please confirm the messages on screen.
echo.
pause
